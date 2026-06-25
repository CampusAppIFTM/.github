# Backlog Inicial — MonitoraIF

> **Equipe:** Heitor Leal, Gabriel Zumba, Otávio Rodrigues, João Lucas Sivieri
> **Problema:** Falta de comunicação entre monitores e estudantes — hoje resolve-se de forma oral ou por e-mail.
> **Usuários:** Alunos (que postam dúvidas) e monitores (que respondem).

---

## ⚠️ Nota do professor — ajuste de escopo

O MoSCoW da equipe classificou **"mural com chat" como M e "chat em tempo real" como W** — há sobreposição. Resolução clara:

- O **núcleo é o mural de dúvidas**: aluno posta uma dúvida, monitor responde **na própria publicação** (estilo fórum, com `onSnapshot` para atualização quase imediata). Isso é M e cobre o valor do app.
- O **chat em tempo real privado** (conversa 1:1 para marcar reunião) fica como W, como a própria equipe definiu — não é necessário para o mural funcionar.
- O **calendário de atendimento** (S no MoSCoW) entra no Sprint 3.

---

## Épicos

| Épico | Issues | Sprint |
|---|---|---|
| 🔐 Contas (aluno / monitor) | MIF-01, MIF-02 | Sprint 1 |
| 📋 Mural de Dúvidas (núcleo) | MIF-03, MIF-04, MIF-05 | Sprint 2 |
| 💬 Respostas | MIF-06, MIF-07 | Sprint 2 |
| ✨ Experiência | MIF-08, MIF-09 | Sprint 3 |

---

## Issues — Sprint 1 · Identidade e Login

### [M] MIF-01 · Cadastro e login
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`

**História de usuário**
Como usuário, quero criar conta e fazer login, para participar do mural de dúvidas.

**Critérios de aceite**
- [ ] Cadastro/login com e-mail/senha (Firebase Auth)
- [ ] Sessão persiste; logout no perfil

**Tarefas técnicas**
- [ ] Firebase Auth + `AuthContext` + persistência

---

### [M] MIF-02 · Papéis de Aluno e Monitor
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`

**História de usuário**
Como usuário, quero me identificar como aluno ou monitor, para que o app saiba quem pode responder dúvidas.

**Critérios de aceite**
- [ ] Campo `papel` (aluno | monitor) no cadastro
- [ ] Monitor pode responder dúvidas; aluno pode postar
- [ ] Papel exposto no `AuthContext`

**Tarefas técnicas**
- [ ] Coleção `usuarios` com `papel`

---

## Issues — Sprint 2 · Lógica de Negócio

### [M] MIF-03 · Postar dúvida no mural
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como aluno, quero postar uma dúvida com matéria e descrição, para que um monitor possa me ajudar.

**Critérios de aceite**
- [ ] Formulário: matéria/disciplina, título, descrição
- [ ] Dúvida salva no Firestore com status "aberta"
- [ ] Aparece no mural imediatamente

**Tarefas técnicas**
- [ ] Coleção `duvidas`: `{ materia, titulo, descricao, status, autorUid, autorNome, criadaEm }`

---

### [M] MIF-04 · Mural de dúvidas (listagem)
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como monitor, quero ver as dúvidas postadas, para escolher quais responder.

**Critérios de aceite**
- [ ] FlatList das dúvidas com matéria, título, autor e status
- [ ] Ordenação por mais recentes
- [ ] Atualização em tempo real (`onSnapshot`)

**Tarefas técnicas**
- [ ] Componente `CardDuvida`
- [ ] Listener `onSnapshot` na coleção `duvidas`

---

### [M] MIF-05 · Detalhe da dúvida
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como usuário, quero abrir uma dúvida e ver a descrição completa e as respostas, para acompanhar a discussão.

**Critérios de aceite**
- [ ] Tela exibe a dúvida completa e a lista de respostas
- [ ] Mostra status (aberta | respondida | resolvida)

---

### [M] MIF-06 · Responder dúvida (monitor)
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como monitor, quero responder uma dúvida na própria publicação, para ajudar o aluno e deixar registrado para outros.

**Critérios de aceite**
- [ ] Campo de resposta no detalhe (apenas monitores)
- [ ] Resposta aparece em tempo real para quem está vendo a dúvida
- [ ] Dúvida muda para status "respondida"

**Tarefas técnicas**
- [ ] Subcoleção `duvidas/{id}/respostas`
- [ ] `onSnapshot` nas respostas

---

### [M] MIF-07 · Marcar dúvida como resolvida (aluno)
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como aluno autor, quero marcar minha dúvida como resolvida, para indicar que a resposta ajudou.

**Critérios de aceite**
- [ ] Botão "Resolvida" visível só para o autor
- [ ] Status muda e a dúvida fica destacada como resolvida no mural

---

## Issues — Sprint 3 · Polimento

### [S] MIF-08 · Calendário de horários de atendimento
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como aluno, quero ver os horários de atendimento dos monitores, para procurá-los presencialmente ou agendar.

**Critérios de aceite**
- [ ] Monitor cadastra seus horários disponíveis
- [ ] Aluno visualiza os horários por monitor/disciplina

**Tarefas técnicas**
- [ ] Coleção `atendimentos`: `{ monitorUid, diaSemana, horaInicio, horaFim, disciplina }`

---

### [S] MIF-09 · Filtrar dúvidas por matéria
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como monitor, quero filtrar o mural por matéria, para focar nas dúvidas da minha área.

**Critérios de aceite**
- [ ] Chips de matéria no topo do mural
- [ ] Filtro aplica sem recarregar

---

## Icebox (Could Have — sem milestone)

| ID | Item | Condição para entrar |
|---|---|---|
| MIF-C1 | Notificação ao receber resposta | Sprint 3 com folga |

## Fora do Escopo (Won't Have — registrado, não vira issue)

| Item | Motivo (da própria equipe) |
|---|---|
| Chat em tempo real privado (1:1) | O mural com respostas já cumpre o papel; conversa privada não é vital |
