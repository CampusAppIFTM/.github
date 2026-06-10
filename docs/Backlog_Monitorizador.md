# Backlog Inicial — Monitorizador

> **Equipe:** Miguel Antonio Alves Gontijo (e equipe)
> **Problema:** Falta de facilidade para saber quando e como ocorrem as monitorias. Monitores não sabem quem virá; estudantes não sabem quando a monitoria acontece.
> **Usuários:** Monitores e Estudantes.

---

## ⚠️ Nota do professor — ajuste de escopo

O MoSCoW da equipe é enxuto (bom!), mas deixou **implícita** a funcionalidade mais valiosa do Canvas: *"monitores não sabem quem vai vir à sua monitoria"*. Isso significa que a **confirmação de presença (RSVP)** é o coração do app — sem ela, o Monitorizador é só um calendário estático. O backlog abaixo a promove a Must Have (MON-05 e MON-06).

Outro ponto: o calendário foi listado como M genérico. Ele foi quebrado em três issues (visualizar, cadastrar, detalhar) para a equipe paralelizar o trabalho.

---

## Épicos

| Épico | Issues | Sprint |
|---|---|---|
| 🔐 Contas e Papéis | MON-01, MON-02 | Sprint 1 |
| 📅 Calendário de Monitorias (núcleo) | MON-03, MON-04 | Sprint 2 |
| ✋ Confirmação de Presença | MON-05, MON-06, MON-07 | Sprint 2 |
| ✨ Experiência | MON-08, MON-09 | Sprint 3 |

---

## Issues — Sprint 1 · Identidade e Login

### [M] MON-01 · Login com perfis de Monitor e Estudante
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`

**História de usuário**
Como usuário, quero me cadastrar como monitor ou estudante, para que o app me mostre as funções certas para o meu papel.

**Critérios de aceite**
- [ ] Cadastro com e-mail/senha (Firebase Auth) e seleção de papel
- [ ] Monitor vê o botão "Criar Monitoria"; estudante não vê
- [ ] Sessão persiste entre aberturas (AsyncStorage)

**Tarefas técnicas**
- [ ] Firebase Auth + coleção `usuarios` com campo `papel`
- [ ] `AuthContext` expondo usuário e papel
- [ ] Navegação condicional por papel

---

### [M] MON-02 · Tela inicial com identidade do usuário
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`

**História de usuário**
Como usuário logado, quero ver meu nome e foto na tela inicial com a navegação principal, para me orientar dentro do app.

**Critérios de aceite**
- [ ] Header da Home exibe nome e foto (ou avatar com iniciais)
- [ ] Navbar inferior com: Início · Minhas Monitorias · Calendário · Conta
- [ ] Todas as abas navegam corretamente (telas podem estar vazias no Sprint 1)

**Tarefas técnicas**
- [ ] `BottomTabNavigator` do React Navigation com 4 abas
- [ ] Componente `Avatar` (foto ou iniciais coloridas)

---

## Issues — Sprint 2 · Lógica de Negócio

### [M] MON-03 · Calendário de monitorias
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como estudante, quero ver todas as monitorias da semana em um calendário, para descobrir quando posso tirar minhas dúvidas.

**Critérios de aceite**
- [ ] Calendário/agenda exibe monitorias futuras com disciplina, monitor, data, hora e sala
- [ ] Dias com monitoria têm marcador visual
- [ ] Tocar na monitoria abre a tela de detalhe
- [ ] Dados carregam do Firestore

**Tarefas técnicas**
- [ ] Coleção `monitorias`: `{ disciplina, monitorUid, monitorNome, data, horaInicio, horaFim, sala, descricao }`
- [ ] Avaliar `react-native-calendars` vs. lista agrupada por dia (decidir e registrar)

---

### [M] MON-04 · Cadastrar monitoria (monitor)
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como monitor, quero cadastrar minhas sessões de monitoria, para que os estudantes saibam quando e onde me encontrar.

**Critérios de aceite**
- [ ] Formulário: disciplina, data, horário de início/fim, sala, descrição opcional
- [ ] Validação: campos obrigatórios preenchidos; data futura
- [ ] Monitoria criada aparece no calendário imediatamente
- [ ] Monitor pode editar e cancelar suas próprias monitorias

**Tarefas técnicas**
- [ ] `CriarMonitoriaScreen` (acesso restrito ao papel monitor)
- [ ] DateTimePicker para data e hora
- [ ] Funções `editar` e `cancelar` com confirmação

---

### [M] MON-05 · Confirmar presença (estudante)
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como estudante, quero confirmar que vou a uma monitoria, para que o monitor saiba me esperar.

**Critérios de aceite**
- [ ] Botão "Vou participar" na tela de detalhe da monitoria
- [ ] Confirmação registra o estudante na lista de participantes
- [ ] Botão vira "Confirmado ✓" e permite desistir
- [ ] Contador de confirmados visível na tela de detalhe

**Tarefas técnicas**
- [ ] Subcoleção `monitorias/{id}/participantes` ou array de UIDs
- [ ] Funções `confirmar(monitoriaId)` e `desistir(monitoriaId)`

> 💡 **Este é o coração do app** — resolve a dor do monitor descrita no Canvas: "monitores não sabem quem vai vir".

---

### [M] MON-06 · Lista de confirmados (monitor)
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como monitor, quero ver quem confirmou presença na minha monitoria, para preparar o conteúdo e decidir se a sessão vale a pena.

**Critérios de aceite**
- [ ] Detalhe da monitoria (visão do monitor) lista nomes dos confirmados
- [ ] Contagem atualiza em tempo real (`onSnapshot`)
- [ ] Monitoria sem confirmados exibe aviso "Nenhuma confirmação ainda"

---

### [M] MON-07 · Minhas Monitorias
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como usuário, quero uma aba com as minhas monitorias — as que confirmei (estudante) ou as que criei (monitor) — para acompanhar meus compromissos.

**Critérios de aceite**
- [ ] Estudante vê as monitorias que confirmou
- [ ] Monitor vê as monitorias que criou (com contagem de confirmados)
- [ ] Separação entre futuras e passadas

---

## Issues — Sprint 3 · Polimento

### [S] MON-08 · Filtrar monitorias por disciplina
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como estudante, quero filtrar o calendário por disciplina, para ver apenas as monitorias que me interessam.

**Critérios de aceite**
- [ ] Chips/dropdown de disciplinas no topo do calendário
- [ ] Filtro aplicado sem recarregar a tela

---

### [S] MON-09 · Notificação de lembrete
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como estudante confirmado, quero receber um lembrete antes da monitoria, para não esquecer de comparecer.

**Critérios de aceite**
- [ ] Notificação local 1 hora antes da monitoria confirmada
- [ ] Cancelada automaticamente se o estudante desistir

**Tarefas técnicas**
- [ ] `expo-notifications` com agendamento no momento da confirmação

---

## Icebox (Could Have — sem milestone)

| ID | Item | Condição para entrar |
|---|---|---|
| MON-C1 | Animações de transição refinadas | Tudo entregue — é estética, não função |

## Fora do Escopo (Won't Have — registrado, não vira issue)

| Item | Motivo (da própria equipe) |
|---|---|
| Versão Web | Fora do alcance das 12 semanas |
