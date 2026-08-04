param(
    [string]$Organization = "CampusAppIFTM",
    [int]$RepoLimit = 1000
)

$ErrorActionPreference = "Stop"
[void](cmd /c chcp 65001 > $null)
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new()
$OutputEncoding = [Console]::OutputEncoding

function UText {
    param([int[]]$CodePoints)

    return -join ($CodePoints | ForEach-Object { [char]$_ })
}

$MiddleDot = UText 183
$EmDash = UText 8212
$UAcute = UText 250
$OAcute = UText 243
$IAcute = UText 237
$Cedilha = UText 231
$Atilde = UText 227
$Atildeo = $Atilde + "o"
$Cao = $Cedilha + $Atilde + "o"

function Get-BacklogFilePath {
    param(
        [string]$RepoName
    )

    $docsPath = Join-Path (Split-Path $PSScriptRoot -Parent) "docs"

    $map = @{
        "Avisa-IF" = "3DSA_Backlog_AvisaIF.md"
        "IFala" = "3DSA_Backlog_IFala.md"
        "IFinancas" = "3DSA_Backlog_IFinancas.md"
        "iHelp" = "3DSA_Backlog_iHelp.md"
        "MonitoraIF" = "3DSA_Backlog_MonitoraIF.md"
        "StudyDev" = "3DSA_Backlog_StudyDev.md"
        "Anbylize" = "3DSB_Backlog_Anbylize.md"
        "E-Agora-Adulto-" = "3DSB_Backlog_EAgoraAdulto.md"
        "FlowUp" = "3DSB_Backlog_FlowUp.md"
        "Monitorizador" = "3DSB_Backlog_Monitorizador.md"
        "Radar-Neuro-Divergente" = "3DSB_Backlog_RadarNeuro.md"
        "Sincronize" = "3DSB_Backlog_Sincronize.md"
    }

    if ($map.ContainsKey($RepoName)) {
        return Join-Path $docsPath $map[$RepoName]
    }

    return $null
}

function Get-KanbanFilePath {
    param(
        [string]$RepoName
    )

    $docsPath = Join-Path (Split-Path $PSScriptRoot -Parent) "docs"

    $map = @{
        "Avisa-IF" = "3DSA_Kanban_AvisaIF.md"
        "IFala" = "3DSA_Kanban_IFala.md"
        "IFinancas" = "3DSA_Kanban_IFinancas.md"
        "iHelp" = "3DSA_Kanban_iHelp.md"
        "MonitoraIF" = "3DSA_Kanban_MonitoraIF.md"
        "StudyDev" = "3DSA_Kanban_StudyDev.md"
        "Anbylize" = "3DSB_Kanban_Anbylize.md"
        "E-Agora-Adulto-" = "3DSB_Kanban_EAgoraAdulto.md"
        "FlowUp" = "3DSB_Kanban_FlowUp.md"
        "Monitorizador" = "3DSB_Kanban_Monitorizador.md"
        "Radar-Neuro-Divergente" = "3DSB_Kanban_RadarNeuro.md"
        "Sincronize" = "3DSB_Kanban_Sincronize.md"
    }

    if ($map.ContainsKey($RepoName)) {
        return Join-Path $docsPath $map[$RepoName]
    }

    return $null
}

$labels = @(
    @{ Name = "must-have"; Color = "D73A4A"; Description = "Prioridade M - n" + $UAcute + "cleo do MVP" },
    @{ Name = "should-have"; Color = "FBCA04"; Description = "Prioridade S" },
    @{ Name = "could-have"; Color = "C5DEF5"; Description = "Prioridade C - icebox" },
    @{ Name = "sprint-1"; Color = "7C3AED"; Description = "Semanas 5-6 - Identidade e Login" },
    @{ Name = "sprint-2"; Color = "0891B2"; Description = "Semanas 7-8 - L" + $OAcute + "gica de Neg" + $OAcute + "cio" },
    @{ Name = "sprint-3"; Color = "059669"; Description = "Semanas 9-10 - Polimento" },
    @{ Name = "setup"; Color = "BFD4F2"; Description = "Configura" + $Cao + " de projeto/ambiente" },
    @{ Name = "bug"; Color = "B60205"; Description = "Defeitos encontrados nos testes cruzados" }
)

$milestones = @(
    @{ Title = "Sprint 1 " + $EmDash + " Identidade e Login"; Description = "Login funcionando + sess" + $Atildeo + " persistente"; Aliases = @("Sprint 1 - Identidade e Login") },
    @{ Title = "Sprint 2 " + $EmDash + " L" + $OAcute + "gica de Neg" + $OAcute + "cio"; Description = "Funcionalidade principal completa"; Aliases = @("Sprint 2 - L" + $OAcute + "gica de Neg" + $OAcute + "cio") },
    @{ Title = "Sprint 3 " + $EmDash + " Polimento"; Description = "App estilizado + bugs corrigidos"; Aliases = @("Sprint 3 - Polimento") }
)

function Get-OrganizationRepos {
    param(
        [string]$Org,
        [int]$Limit
    )

    $output = gh repo list $Org --limit $Limit --json name | ConvertFrom-Json
    return $output | ForEach-Object { $_.name }
}

function Get-RepositoryLabels {
    param(
        [string]$Repo
    )

    $output = gh label list --repo $Repo --limit 1000 --json name | ConvertFrom-Json
    return @($output | ForEach-Object { $_.name })
}

function Get-RepositoryMilestones {
    param(
        [string]$Repo
    )

    $output = gh api "repos/$Repo/milestones?state=all&per_page=100" | ConvertFrom-Json
    return @($output)
}

function Get-RepositoryIssues {
    param(
        [string]$Repo
    )

    $output = gh issue list --repo $Repo --state all --limit 1000 --json number,title,id,milestone | ConvertFrom-Json
    return @($output)
}

function Get-IssueSpecsFromBacklog {
    param(
        [string]$BacklogFilePath
    )

    if (-not (Test-Path $BacklogFilePath)) {
        return @()
    }

    $content = Get-Content -Path $BacklogFilePath -Raw -Encoding utf8
    $pattern = '(?ms)^### \[(?<priority>M|S|C)\] (?<code>[A-Z]{3}-\d{2}) (?<title>.+?)\r?\n(?<body>.*?)(?=^### \[|\z)'
    $matches = [regex]::Matches($content, $pattern)
    $issues = @()

    foreach ($match in $matches) {
        $rawBody = $match.Groups['body'].Value.Trim()
        $milestone = $null
        $labels = @()

        $bodyLines = @($rawBody -split '\r?\n')
        $metadataLine = $bodyLines | Where-Object { $_ -like '**Milestone:*' } | Select-Object -First 1

        if ($metadataLine) {
            $metadataParts = $metadataLine -split '\*\*Labels:\*\*', 2
            $milestonePart = $metadataParts[0] -replace '^\*\*Milestone:\*\* ', ''
            $milestone = $milestonePart.Trim().TrimEnd([char]183, ' ')

            if ($milestone -like '*icebox*') {
                $milestone = $null
            }

            if ($metadataParts.Count -gt 1) {
                $labelsText = $metadataParts[1].Trim()
                $labels = [regex]::Matches($labelsText, '`([^`]+)`') | ForEach-Object { $_.Groups[1].Value }
            }

            $bodyLines = @($bodyLines | Where-Object { $_ -ne $metadataLine })
            $rawBody = ($bodyLines -join [Environment]::NewLine).Trim()
        }

        $issues += [pscustomobject]@{
            Code = $match.Groups['code'].Value.Trim()
            Title = $match.Groups['title'].Value.Trim().TrimStart([char]183, ' ')
            Priority = $match.Groups['priority'].Value.Trim()
            Body = $rawBody
            Labels = @($labels)
            Milestone = $milestone
        }
    }

    return @($issues)
}

function Get-SubIssueSpecsFromKanban {
    param(
        [string]$KanbanFilePath
    )

    if (-not (Test-Path $KanbanFilePath)) {
        return @()
    }

    $content = Get-Content -Path $KanbanFilePath -Raw -Encoding utf8
    $parentPattern = '(?ms)^### (?<code>[A-Z]{3}-\d{2}) (?<title>.+?)\r?\n(?<body>.*?)(?=^### |\z)'
    $parentMatches = [regex]::Matches($content, $parentPattern)
    $subIssues = @()

    foreach ($parentMatch in $parentMatches) {
        $parentCode = $parentMatch.Groups['code'].Value.Trim()
        $parentTitle = $parentMatch.Groups['title'].Value.Trim().TrimStart([char]183, ' ')
        $parentBody = $parentMatch.Groups['body'].Value.Trim()
        $tableRows = [regex]::Matches($parentBody, '^\| (?<code>[A-Z]{3}-\d{2}\.\d+) \| (?<card>.*?) \| (?<done>.*?) \| (?<est>.*?) \|$', [System.Text.RegularExpressions.RegexOptions]::Multiline)

        foreach ($row in $tableRows) {
            $subIssues += [pscustomobject]@{
                ParentCode = $parentCode
                ParentTitle = $parentTitle
                Code = $row.Groups['code'].Value.Trim()
                Title = $row.Groups['card'].Value.Trim()
                Done = $row.Groups['done'].Value.Trim()
                Estimate = $row.Groups['est'].Value.Trim()
            }
        }
    }

    return @($subIssues)
}

function Ensure-Issue {
    param(
        [string]$Repo,
        [pscustomobject]$Issue
    )

    $issueTitle = $Issue.Code + " " + $MiddleDot + " " + $Issue.Title
    $existingIssues = Get-RepositoryIssues -Repo $Repo
    $existingIssue = $existingIssues | Where-Object { $_.title -eq $issueTitle } | Select-Object -First 1

    if ($existingIssue) {
        $editArgs = @("issue", "edit", $existingIssue.number, "--repo", $Repo)

        if ($Issue.Labels.Count -gt 0) {
            $editArgs += @("--add-label", ($Issue.Labels -join ","))
        }

        if ($Issue.Milestone) {
            $editArgs += @("--milestone", $Issue.Milestone)
        }

        gh @editArgs | Out-Null
        Write-Host ("[$Repo] Issue $issueTitle atualizada.")
        return
    }

    $bodyFile = Join-Path $env:TEMP ("gh-issue-" + [guid]::NewGuid().ToString("N") + ".md")
    Set-Content -Path $bodyFile -Value $Issue.Body -Encoding utf8

    try {
        $createArgs = @("issue", "create", "--repo", $Repo, "--title", $issueTitle, "--body-file", $bodyFile)

        if ($Issue.Labels.Count -gt 0) {
            $createArgs += @("--label", ($Issue.Labels -join ","))
        }

        if ($Issue.Milestone) {
            $createArgs += @("--milestone", $Issue.Milestone)
        }

        gh @createArgs | Out-Null
        Write-Host ("[$Repo] Issue $issueTitle criada.")
    }
    finally {
        if (Test-Path $bodyFile) {
            Remove-Item $bodyFile -Force
        }
    }
}

function Add-SubIssueRelation {
    param(
        [string]$Repo,
        [string]$ParentIssueId,
        [string]$SubIssueId,
        [bool]$ReplaceParent = $false
    )

    $query = 'mutation($issueId: ID!, $subIssueId: ID!, $replaceParent: Boolean) { addSubIssue(input: { issueId: $issueId, subIssueId: $subIssueId, replaceParent: $replaceParent }) { subIssue { id number title } } }'
    gh api graphql -f query=$query -f issueId=$ParentIssueId -f subIssueId=$SubIssueId -f replaceParent=$ReplaceParent | Out-Null
}

function Get-IssueParentNumber {
    param(
        [string]$Repo,
        [int]$IssueNumber
    )

    $owner, $name = $Repo -split '/', 2
    $query = 'query($owner: String!, $name: String!, $number: Int!) { repository(owner: $owner, name: $name) { issue(number: $number) { parent { number } } } }'
    $response = gh api graphql -f query=$query -f owner=$owner -f name=$name -F number=$IssueNumber | ConvertFrom-Json

    if ($response.data.repository.issue.parent) {
        return $response.data.repository.issue.parent.number
    }

    return $null
}

function Ensure-SubIssue {
    param(
        [string]$Repo,
        [pscustomobject]$SubIssue,
        [array]$RepositoryIssues
    )

    $parentIssue = $RepositoryIssues | Where-Object { $_.title -like ($SubIssue.ParentCode + ' *') } | Select-Object -First 1

    if (-not $parentIssue) {
        Write-Host ("[$Repo] Pai $($SubIssue.ParentCode) nao encontrado; subissue $($SubIssue.Code) ignorada.")
        return
    }

    $subIssueTitle = $SubIssue.Code + " " + $MiddleDot + " " + $SubIssue.Title
    $existingSubIssue = $RepositoryIssues | Where-Object { $_.title -eq $subIssueTitle } | Select-Object -First 1
    $bodyText = @(
        "**Defini" + $Cao + " de Pronto**"
        $SubIssue.Done
        ""
        "**Estimativa**: $($SubIssue.Estimate)"
        ""
        "Subissue vinculada ao issue pai $($parentIssue.title)."
    ) -join [Environment]::NewLine

    if (-not $existingSubIssue) {
        & gh issue create --repo $Repo --title "$subIssueTitle" --body $bodyText | Out-Null

        Write-Host ("[$Repo] Subissue $subIssueTitle criada.")

        $RepositoryIssues = Get-RepositoryIssues -Repo $Repo
        $existingSubIssue = $RepositoryIssues | Where-Object { $_.title -eq $subIssueTitle } | Select-Object -First 1
    }

    if ($existingSubIssue) {
        gh issue edit $existingSubIssue.number --repo $Repo --body $bodyText | Out-Null

        $currentParentNumber = Get-IssueParentNumber -Repo $Repo -IssueNumber $existingSubIssue.number

        if ($currentParentNumber -eq $parentIssue.number) {
            Write-Host ("[$Repo] Subissue $subIssueTitle já estava vinculada ao pai $($parentIssue.title).")
            return
        }

        try {
            Add-SubIssueRelation -Repo $Repo -ParentIssueId $parentIssue.id -SubIssueId $existingSubIssue.id -ReplaceParent ([bool]$currentParentNumber)
            Write-Host ("[$Repo] Subissue $subIssueTitle vinculada ao pai $($parentIssue.title).")
        }
        catch {
            Write-Host ("[$Repo] Subissue $subIssueTitle já estava vinculada ou não pôde ser vinculada agora.")
        }

        if ($parentIssue.milestone -and $parentIssue.milestone.title) {
            gh issue edit $existingSubIssue.number --repo $Repo --milestone "$($parentIssue.milestone.title)" | Out-Null
        }
    }
}

function Ensure-Label {
    param(
        [string]$Repo,
        [hashtable]$Label
    )

    $labelName = $Label.Name
    $existingLabels = Get-RepositoryLabels -Repo $Repo

    if ($existingLabels -contains $labelName) {
        gh label edit $labelName `
            --repo $Repo `
            --color $Label.Color `
            --description $Label.Description | Out-Null
        Write-Host ("[$Repo] R" + $OAcute + "tulo $labelName atualizado.")
        return
    }

    gh label create $labelName `
        --repo $Repo `
        --color $Label.Color `
        --description $Label.Description | Out-Null

    Write-Host ("[$Repo] R" + $OAcute + "tulo $labelName criado.")
}

function Ensure-Milestone {
    param(
        [string]$Repo,
        [hashtable]$Milestone
    )

    $milestoneTitle = $Milestone.Title
    $existingMilestones = Get-RepositoryMilestones -Repo $Repo
    $existingMilestone = $existingMilestones | Where-Object { $_.title -eq $milestoneTitle } | Select-Object -First 1

    if (-not $existingMilestone -and $Milestone.ContainsKey('Aliases')) {
        foreach ($aliasTitle in $Milestone.Aliases) {
            $existingMilestone = $existingMilestones | Where-Object { $_.title -eq $aliasTitle } | Select-Object -First 1

            if ($existingMilestone) {
                break
            }
        }
    }

    if ($existingMilestone) {
        gh api "repos/$Repo/milestones/$($existingMilestone.number)" `
            -X PATCH `
            -f title="$milestoneTitle" `
            -f description="$($Milestone.Description)" | Out-Null
        Write-Host ("[$Repo] Marco $milestoneTitle atualizado.")
        return
    }

    gh api "repos/$Repo/milestones" `
        -X POST `
        -f title="$milestoneTitle" `
        -f description="$($Milestone.Description)" | Out-Null

    Write-Host ("[$Repo] Marco $milestoneTitle criado.")
}

$repos = Get-OrganizationRepos -Org $Organization -Limit $RepoLimit

if (-not $repos -or $repos.Count -eq 0) {
    throw ("Nenhum reposit" + $OAcute + "rio encontrado na organiza" + $Cedilha + $Atilde + "o $Organization.")
}

foreach ($repoName in $repos) {
    $repoFullName = "$Organization/$repoName"
    $backlogFilePath = Get-BacklogFilePath -RepoName $repoName
    $kanbanFilePath = Get-KanbanFilePath -RepoName $repoName

    Write-Host ("Processando reposit" + $OAcute + "rio $repoFullName.")

    foreach ($label in $labels) {
        Ensure-Label -Repo $repoFullName -Label $label
    }

    foreach ($milestone in $milestones) {
        Ensure-Milestone -Repo $repoFullName -Milestone $milestone
    }

    if ($backlogFilePath) {
        $issueSpecs = Get-IssueSpecsFromBacklog -BacklogFilePath $backlogFilePath

        Write-Host ("[$repoFullName] " + $issueSpecs.Count + " issues encontradas no backlog.")

        foreach ($issueSpec in $issueSpecs) {
            Ensure-Issue -Repo $repoFullName -Issue $issueSpec
        }
    }
    else {
        Write-Host ("[$repoFullName] Sem backlog mapeado; issues ignoradas.")
    }

    $repositoryIssues = Get-RepositoryIssues -Repo $repoFullName

    if ($kanbanFilePath) {
        $subIssueSpecs = Get-SubIssueSpecsFromKanban -KanbanFilePath $kanbanFilePath

        Write-Host ("[$repoFullName] " + $subIssueSpecs.Count + " subissues encontradas no kanban.")

        foreach ($subIssueSpec in $subIssueSpecs) {
            Ensure-SubIssue -Repo $repoFullName -SubIssue $subIssueSpec -RepositoryIssues $repositoryIssues
        }
    }
    else {
        Write-Host ("[$repoFullName] Sem kanban mapeado; subissues ignoradas.")
    }
}

Write-Host ("Processo conclu" + $IAcute + "do.")