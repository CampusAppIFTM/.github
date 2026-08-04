# Backlog Inicial — FlowUp

> **Equipe:** Rafael Costa Fernandes (e equipe)
> **Problema:** Excesso de atividades escolares no mesmo dia — estudantes dependem da memória e professores não se comunicam entre si para distribuir as avaliações.
> **Usuários:** Estudantes e Professores.

---

## ✅ Nota do professor

O diferencial deste app está claríssimo no Canvas: **professores enxergarem a carga de atividades da turma inteira para não marcar provas no mesmo dia**. Isso é mais que uma agenda — é uma ferramenta de coordenação docente. O backlog destaca esse diferencial em duas issues (FLW-05 e FLW-06), porque é o que a banca vai querer ver funcionando no Shark Tank.

Atenção: a equipe marcou 6 itens como M — é o maior conjunto de Must Have da turma. O backlog organiza a ordem de implementação para que, se o tempo apertar, os cortes aconteçam de baixo para cima sem quebrar o fluxo principal.

---

## Épicos

| Épico | Issues | Sprint |
|---|---|---|
| 🔐 Contas e Papéis | FLW-01, FLW-02 | Sprint 1 |
| 📝 Gestão de Atividades (núcleo) | FLW-03, FLW-04 | Sprint 2 |
| 👨‍🏫 Visão do Professor (diferencial) | FLW-05, FLW-06 | Sprint 2 |
| ✨ Experiência | FLW-07, FLW-08 | Sprint 3 |

---

## Issues — Sprint 1 · Identidade e Login

### [M] FLW-01 · Cadastro e login com papéis (Aluno / Professor)
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`

**História de usuário**
Como usuário, quero me cadastrar como aluno ou professor, para acessar as funcionalidades do meu papel.

**Critérios de aceite**
- [ ] Cadastro com e-mail/senha (Firebase Auth) e seleção de papel
- [ ] Login redireciona para a agenda principal
- [ ] Professor vê o botão "Nova Atividade"; aluno não vê
- [ ] Sessão persiste entre aberturas do app

**Tarefas técnicas**
- [ ] Firebase Auth + coleção `usuarios` com campo `papel`
- [ ] `AuthContext` + AsyncStorage
- [ ] Navegação condicional por papel

---

### [M] FLW-02 · Vínculo com turma
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`, `setup`

**História de usuário**
Como aluno, quero pertencer à minha turma, para ver apenas as atividades que dizem respeito a mim; como professor, quero selecionar a turma ao criar uma atividade.

**Critérios de aceite**
- [ ] No cadastro, aluno seleciona sua turma (lista pré-definida)
- [ ] Professor pode estar associado a várias turmas
- [ ] As consultas de atividades filtram pela turma do usuário

**Tarefas técnicas**
- [ ] Coleção `turmas` (pode ser fixa no MVP: ex. "3º Info A", "3º Info B")
- [ ] Campo `turmaId` no usuário (aluno) e `turmas: []` (professor)

> 💡 Sem o conceito de turma, a visão do professor (FLW-05) não funciona. Por isso esta issue está no Sprint 1, antes do CRUD de atividades.

---

## Issues — Sprint 2 · Lógica de Negócio

### [M] FLW-03 · Cadastrar atividade (professor)
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como professor, quero cadastrar uma atividade avaliativa com disciplina, turma e data de entrega, para que os alunos a vejam na agenda.

**Critérios de aceite**
- [ ] Formulário: título, disciplina, turma, tipo (prova / trabalho / tarefa), data, descrição opcional
- [ ] Validação: campos obrigatórios; data não pode ser passada
- [ ] **Aviso de sobrecarga no momento do cadastro:** se a turma já tem 2+ atividades na mesma data, exibir alerta "Esta turma já possui N atividades neste dia" antes de confirmar
- [ ] Atividade aparece na agenda dos alunos da turma imediatamente

**Tarefas técnicas**
- [ ] Coleção `atividades`: `{ titulo, disciplina, turmaId, tipo, data, descricao, professorUid }`
- [ ] Query de contagem por turma+data antes de salvar
- [ ] `CriarAtividadeScreen` restrita ao papel professor

> 💡 O alerta de sobrecarga no cadastro é o momento em que o app **resolve o problema do Canvas** — não deixar passar batido.

---

### [M] FLW-04 · Agenda de atividades (aluno e professor)
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como aluno, quero ver as atividades próximas em formato de agenda, para me organizar e não perder nenhuma entrega.

**Critérios de aceite**
- [ ] Lista agrupada por dia, ordenada da data mais próxima para a mais distante
- [ ] Cada item mostra: título, disciplina, tipo e badge de cor por tipo
- [ ] Atividades passadas em seção separada (ou aba "Histórico")
- [ ] Aluno vê só as atividades da sua turma

**Tarefas técnicas**
- [ ] FlatList com `SectionList` agrupada por data
- [ ] Query filtrada por `turmaId` e ordenada por `data`
- [ ] Componente `CardAtividade` com cor por tipo

---

### [M] FLW-05 · Painel do professor — todas as atividades da turma
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como professor, quero visualizar todas as atividades de todas as disciplinas das minhas turmas, para evitar marcar avaliações em dias já sobrecarregados.

**Critérios de aceite**
- [ ] Professor seleciona a turma e vê as atividades de **todos** os professores dela
- [ ] Visualização por semana com contagem de atividades por dia
- [ ] Dias com 3+ atividades destacados em vermelho; 2 em amarelo
- [ ] Tocar no dia lista as atividades daquele dia

**Tarefas técnicas**
- [ ] Query por `turmaId` sem filtro de professor
- [ ] Componente `SemanaHeatmap` (grade seg–sex com contagem colorida)

> 💡 **Diferencial do app para o Shark Tank** — nenhuma agenda comum oferece a visão de coordenação entre professores.

---

### [M] FLW-06 · Indicador de carga do dia (aluno)
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como aluno, quero ver quantas atividades tenho em cada dia, para planejar meus estudos da semana com antecedência.

**Critérios de aceite**
- [ ] Topo da agenda mostra a semana com contagem de atividades por dia
- [ ] Mesmo código de cores do painel do professor (verde/amarelo/vermelho)
- [ ] Tocar no dia rola a agenda até aquele dia

**Tarefas técnicas**
- [ ] Reutilizar o componente `SemanaHeatmap` da FLW-05 (visão do aluno = sua turma)

---

## Issues — Sprint 3 · Polimento

### [S] FLW-07 · Filtrar atividades por disciplina
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como aluno, quero filtrar a agenda por disciplina, para focar em uma matéria específica quando estiver estudando.

**Critérios de aceite**
- [ ] Chips de disciplina acima da agenda
- [ ] Filtro aplica sem recarregar; "Todas" limpa
- [ ] Indicador de carga (FLW-06) respeita o filtro ativo

---

### [C] FLW-08 · Notificação de atividade próxima
**Milestone:** — (icebox) · **Labels:** `could-have`

**História de usuário**
Como aluno, quero ser notificado quando uma atividade estiver próxima, para não perder a entrega.

**Critérios de aceite**
- [ ] Notificação local 1 dia antes da data da atividade
- [ ] Pode ser desativada no perfil

**Tarefas técnicas**
- [ ] `expo-notifications` com agendamento local

> Entra apenas se FLW-01 a FLW-07 estiverem concluídas e os bugs dos testes cruzados corrigidos.

---

## Icebox (Could Have — sem milestone)

| ID | Item | Condição para entrar |
|---|---|---|
| FLW-08 | Notificação de atividade próxima | Sprint 3 concluído com folga |

## Fora do Escopo (Won't Have — registrado, não vira issue)

| Item | Motivo (da própria equipe) |
|---|---|
| Chat particular com o professor | Ajudaria na comunicação, mas está fora do escopo do trimestre |
