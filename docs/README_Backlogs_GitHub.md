# Campus App 2025 — Backlogs Iniciais para GitHub Projects

> Disciplina: Desenvolvimento de Dispositivos Móveis · Prof. Edson Angoti Júnior · IFTM Campus Uberlândia

Este pacote contém o backlog inicial de **6 equipes**, pronto para ser transferido para o GitHub Projects. Cada arquivo corresponde a um projeto:

| Arquivo | Projeto | Equipe (referência) |
|---|---|---|
| `Backlog_RadarNeuro.md` | Radar Neurodivergente | Ana Beatriz Ramos Del Padre |
| `Backlog_EAgoraAdulto.md` | E Agora, Adulto? | Felipe Augusto de Oliveira |
| `Backlog_Sincronize.md` | Sincronize | Lara Campos Goveia |
| `Backlog_Anbylize.md` | Anbylize | Luiza Brandão Nunes |
| `Backlog_Monitorizador.md` | Monitorizador | Miguel Antonio Alves Gontijo |
| `Backlog_FlowUp.md` | FlowUp | Rafael Costa Fernandes |

---

## 1. Configuração padrão do GitHub Project (igual para todas as equipes)

### 1.1 Criar o Project

1. No repositório da equipe → aba **Projects** → **New project**
2. Template: **Board**
3. Nome: `Campus App — [Nome do App]`

### 1.2 Colunas do quadro (Kanban)

| Coluna | Significado |
|---|---|
| **Backlog** | Issues criadas, ainda sem sprint ativo |
| **A Fazer** | Issues do sprint atual, não iniciadas |
| **Fazendo** | Em desenvolvimento (máx. 1–2 por pessoa) |
| **Em Review** | Aguardando revisão de outro membro da equipe |
| **Feito** | Critérios de aceite verificados ✓ |

### 1.3 Labels a criar no repositório

| Label | Cor sugerida | Uso |
|---|---|---|
| `must-have` | `#D73A4A` (vermelho) | Prioridade M — núcleo do MVP |
| `should-have` | `#FBCA04` (amarelo) | Prioridade S |
| `could-have` | `#C5DEF5` (azul claro) | Prioridade C — icebox |
| `sprint-1` | `#7C3AED` (roxo) | Semanas 5–6 · Identidade e Login |
| `sprint-2` | `#0891B2` (azul) | Semanas 7–8 · Lógica de Negócio |
| `sprint-3` | `#059669` (verde) | Semanas 9–10 · Polimento |
| `setup` | `#BFD4F2` | Configuração de projeto/ambiente |
| `bug` | `#B60205` | Defeitos encontrados nos testes cruzados |

### 1.4 Milestones a criar

| Milestone | Período | Entregável |
|---|---|---|
| `Sprint 1 — Identidade e Login` | Semanas 5–6 | Login funcionando + sessão persistente |
| `Sprint 2 — Lógica de Negócio` | Semanas 7–8 | Funcionalidade principal completa |
| `Sprint 3 — Polimento` | Semanas 9–10 | App estilizado + bugs corrigidos |

---

## 2. Como transferir as issues para o GitHub

### Opção A — Manual (recomendada para a primeira vez)

Cada bloco `### [M] XXX-NN · Título` dos arquivos de backlog vira **uma issue**:

1. **Title** da issue = o título do bloco (ex.: `RND-01 · Login com e-mail e senha`)
2. **Description** = copiar História de usuário + Critérios de aceite + Tarefas técnicas (os checkboxes `- [ ]` funcionam nativamente no GitHub)
3. Aplicar as **labels** e o **milestone** indicados no bloco
4. Adicionar a issue ao **Project** (painel lateral direito)

### Opção B — GitHub CLI (para equipes que já usam terminal)

```bash
gh issue create \
  --title "RND-01 · Login com e-mail e senha" \
  --body-file issue-rnd-01.md \
  --label "must-have,sprint-1" \
  --milestone "Sprint 1 — Identidade e Login"
```

---

## 3. Regras de uso do backlog durante o trimestre

1. **Nenhuma issue entra em "Fazendo" sem critérios de aceite** — se estiver vago, refinar antes.
2. **Issues C (icebox) ficam na coluna Backlog** sem milestone — só entram se sobrar tempo no Sprint 3.
3. **Itens W não viram issue** — estão documentados na seção "Fora do Escopo" de cada arquivo apenas como registro da decisão.
4. **A Daily Meeting referencia IDs** — "ontem terminei a RND-03, hoje começo a RND-04, estou travado na configuração do Firebase".
5. **Bug encontrado nos testes cruzados** vira issue com label `bug` + referência à issue original.

---

## 4. Critério de sucesso por sprint (para o professor)

| Sprint | A equipe está no caminho se... |
|---|---|
| Sprint 1 | Todas as issues `must-have` + `sprint-1` em **Feito** |
| Sprint 2 | Todas as issues `must-have` em **Feito** — o MVP funciona de ponta a ponta |
| Sprint 3 | Issues `should-have` priorizadas + bugs dos testes cruzados corrigidos |
