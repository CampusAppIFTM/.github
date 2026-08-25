# Campus App 2026 — Backlogs para GitHub Projects

> Disciplina: Desenvolvimento de Dispositivos Móveis · Prof. Edson Angoti Júnior · IFTM Campus Uberlândia

Este pacote contém o **backlog** e as **atividades de kanban** das **12 equipes** (turmas 3DS-A e 3DS-B), prontos para o GitHub Projects. Cada projeto tem dois arquivos: `Backlog_*` (issues) e `Kanban_*` (cards granulares).

## Turma 3DS-B

| Backlog | Kanban | Projeto |
|---|---|---|
| `Backlog_RadarNeuro.md` | `Kanban_RadarNeuro.md` | Radar Neurodivergente |
| `Backlog_EAgoraAdulto.md` | `Kanban_EAgoraAdulto.md` | E Agora, Adulto? |
| `Backlog_Sincronize.md` | `Kanban_Sincronize.md` | Sincronize |
| `Backlog_Anbylize.md` | `Kanban_Anbylize.md` | Anbylize |
| `Backlog_Monitorizador.md` | `Kanban_Monitorizador.md` | Monitorizador |
| `Backlog_FlowUp.md` | `Kanban_FlowUp.md` | FlowUp |

## Turma 3DS-A

| Backlog | Kanban | Projeto |
|---|---|---|
| `3DSA_Backlog_AvisaIF.md` | `3DSA_Kanban_AvisaIF.md` | Avisa IF |
| `3DSA_Backlog_IFinancas.md` | `3DSA_Kanban_IFinancas.md` | IFinanças |
| `3DSA_Backlog_iHelp.md` | `3DSA_Kanban_iHelp.md` | iHelp |
| `3DSA_Backlog_IFala.md` | `3DSA_Kanban_IFala.md` | IFala |
| `3DSA_Backlog_StudyDev.md` | `3DSA_Kanban_StudyDev.md` | StudyDev |
| `3DSA_Backlog_MonitoraIF.md` | `3DSA_Kanban_MonitoraIF.md` | MonitoraIF |

---

## ⭐ Sprint 1 é padronizado para as 12 equipes

Todas as equipes fazem **o mesmo Sprint 1** (login com Google), descrito em `Sprint1_Padrao_Login.md` e baseado no codelab de autenticação. São sempre as 4 mesmas issues:

| Issue | Título | Labels |
|---|---|---|
| `XXX-01` | Configurar Firebase e ativar login com Google | `must-have` `sprint-1` `setup` |
| `XXX-02` | Criar o app React Native e integrar as bibliotecas | `must-have` `sprint-1` `setup` |
| `XXX-03` | Implementar login e logout com Google | `must-have` `sprint-1` |
| `XXX-04` | Rotas protegidas + Home com usuário logado + sessão persistente | `must-have` `sprint-1` |

> `XXX` = prefixo do projeto (RND, EAA, SIN, ANB, MON, FLW, AVI, IFI, IHP, IFA, STD, MIF).
> **Ambiente:** build nativo (`expo prebuild` + `expo run:android`), não Expo Go.
> **Papéis de usuário** (aluno/monitor, cliente/prestador etc.) começam no **Sprint 2** — no Sprint 1 todos fazem o mesmo login.
> A partir de `XXX-05` começam as issues específicas de cada app.

Para criar as 4 issues de uma vez, use o template `.github/ISSUE_TEMPLATE/sprint-1.md` (incluído neste pacote).

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
| `Sprint 1 — Identidade e Login` | Semanas 5–6 | Login com Google funcionando + sessão persistente (igual p/ todos) |
| `Sprint 2 — Lógica de Negócio` | Semanas 7–8 | Funcionalidade principal completa |
| `Sprint 3 — Polimento` | Semanas 9–10 | App estilizado + bugs corrigidos |

---

## 2. Como transferir as issues para o GitHub

### Opção A — Manual (recomendada para a primeira vez)

Cada bloco `### [M] XXX-NN · Título` dos arquivos de backlog vira **uma issue**:

1. **Title** da issue = o título do bloco (ex.: `RND-05 · Botão de Emergência`)
2. **Description** = copiar História de usuário + Critérios de aceite + Tarefas técnicas (os checkboxes `- [ ]` funcionam nativamente no GitHub)
3. Aplicar as **labels** e o **milestone** indicados no bloco
4. Adicionar a issue ao **Project** (painel lateral direito)

> Para o Sprint 1, use o template pronto em vez de digitar: abra **Issues → New issue → Sprint 1 — Identidade e Login**.

### Opção B — GitHub CLI (para equipes que já usam terminal)

```bash
gh issue create \
  --title "RND-05 · Botão de Emergência" \
  --body-file issue-rnd-05.md \
  --label "must-have,sprint-2" \
  --milestone "Sprint 2 — Lógica de Negócio"
```

---

## 3. Regras de uso do backlog durante o trimestre

1. **Nenhuma issue entra em "Fazendo" sem critérios de aceite** — se estiver vago, refinar antes.
2. **Issues C (icebox) ficam na coluna Backlog** sem milestone — só entram se sobrar tempo no Sprint 3.
3. **Itens W não viram issue** — estão documentados na seção "Fora do Escopo" de cada arquivo apenas como registro da decisão.
4. **A Daily Meeting referencia IDs** — "ontem terminei a RND-05, hoje começo a RND-06, estou travado na configuração do Firebase".
5. **Bug encontrado nos testes cruzados** vira issue com label `bug` + referência à issue original.

---

## 4. Critério de sucesso por sprint (para o professor)

| Sprint | A equipe está no caminho se... |
|---|---|
| Sprint 1 | As 4 issues padrão (`XXX-01` a `XXX-04`) em **Feito** — login com Google funcionando |
| Sprint 2 | Todas as issues `must-have` em **Feito** — o MVP funciona de ponta a ponta |
| Sprint 3 | Issues `should-have` priorizadas + bugs dos testes cruzados corrigidos |

> **Definição de Pronto do Sprint 1** (checar no celular): abre o app → tela de Login → entra com Google → cai na Home com nome e foto → sai → entra de novo → fecha e reabre o app → continua logado.
