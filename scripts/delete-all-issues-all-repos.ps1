param(
  [string]$Organization = "CampusAppIFTM",
  [int]$RepoLimit = 1000,
  [switch]$Force
)

$ErrorActionPreference = "Stop"

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

function Get-OrganizationRepos {
  param(
    [string]$Org,
    [int]$Limit
  )

  $output = gh repo list $Org --limit $Limit --json name | ConvertFrom-Json
  return @($output | ForEach-Object { $_.name })
}

function Get-AllIssuesFromRepository {
  param(
    [string]$Repo
  )

  $allIssues = @()
  $page = 1

  while ($true) {
    $response = gh api "repos/$Repo/issues?state=all&per_page=100&page=$page" | ConvertFrom-Json

    if (-not $response -or $response.Count -eq 0) {
      break
    }

    foreach ($item in $response) {
      if (-not $item.pull_request) {
        $allIssues += [pscustomobject]@{
          number = $item.number
          title  = $item.title
          url    = $item.html_url
        }
      }
    }

    if ($response.Count -lt 100) {
      break
    }

    $page++
  }

  return @($allIssues)
}

function Delete-IssueFromRepository {
  param(
    [string]$Repo,
    [int]$IssueNumber,
    [string]$IssueTitle
  )

  gh issue delete $IssueNumber --repo $Repo --yes | Out-Null
  Write-Host "[$Repo] Issue $IssueNumber - $IssueTitle apagada."
}

$repos = Get-OrganizationRepos -Org $Organization -Limit $RepoLimit

if (-not $repos -or $repos.Count -eq 0) {
  throw "Nenhum repositório encontrado na organiza" + $Cao + " .";
}

Write-Host "Organiza"+$Cao+": $Organization"
Write-Host "Modo destrutivo: " + $(if ($Force) { "ligado" } else { "desligado" })

foreach ($repoName in $repos) {
  $repoFullName = "$Organization/$repoName"
  $issues = Get-AllIssuesFromRepository -Repo $repoFullName

  if (-not $issues -or $issues.Count -eq 0) {
    Write-Host "[$repoFullName] Nenhuma issue encontrada."
    continue
  }

  Write-Host "[$repoFullName] $($issues.Count) issues encontradas."

  foreach ($issue in $issues) {
    if ($Force) {
      Delete-IssueFromRepository -Repo $repoFullName -IssueNumber $issue.number -IssueTitle $issue.title
    }
    else {
      Write-Host "[$repoFullName] DRY-RUN: apagaria a issue $($issue.number) - $($issue.title)."
    }
  }
}

if (-not $Force) {
  Write-Host "Simulação concluída. Execute novamente com -Force para apagar as issues."
}
