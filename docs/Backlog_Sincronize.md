# Backlog Inicial — Sincronize

> **Equipe:** Alexandre Hiratsuka, Giovana Cunha, Lara Campos, Maria Eduarda Santos, Matheus Cardoso, Rian Cristian Rezende
> **Problema:** Os eventos do campus não são divulgados de maneira eficaz e não há agenda para o participante se organizar.
> **Usuários:** Estudantes interessados em eventos + organizadores.

---

## ⚠️ Nota do professor — ajuste de escopo

Dois ajustes no MoSCoW original:

1. **"Integrar com agenda pessoal" estava como M, mas a justificativa escrita dizia "não é necessário para o aplicativo funcionar"** — contradição clássica. Resolução: a agenda **interna** do app ("Meus Eventos" + calendário) é M; a integração com a agenda **do sistema** (Google Calendar) desceu para Could Have.
2. A equipe tem 6 membros — o maior grupo da turma. Issues foram desenhadas para paralelizar bem: 2 pessoas em telas, 2 em Firestore, 2 em conteúdo/design.

---

## Épicos

| Épico | Issues | Sprint |
|---|---|---|
| 🔐 Autenticação | SIN-01 | Sprint 1 |
| 📅 Catálogo de Eventos (núcleo) | SIN-02, SIN-03, SIN-04 | Sprint 2 |
| 🗓️ Agenda do Participante | SIN-05, SIN-06 | Sprint 2 |
| 🛠️ Organizador | SIN-07 | Sprint 2 |
| ✨ Experiência | SIN-08, SIN-09, SIN-10, SIN-11 | Sprint 3 |

---

## Issues — Sprint 1 · Identidade e Login

### [M] SIN-01 · Login e perfis (participante / organizador)
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`

**História de usuário**
Como estudante, quero fazer login no app, para me inscrever em eventos com minha identidade; como organizador, quero um perfil que me permita cadastrar eventos.

**Critérios de aceite**
- [ ] Login com Firebase Authentication (e-mail/senha ou Google)
- [ ] Campo `tipo` (participante | organizador) no documento do usuário
- [ ] Sessão persiste entre aberturas do app (AsyncStorage)
- [ ] Organizador vê o botão "Criar Evento"; participante não vê

**Tarefas técnicas**
- [ ] Configurar Firebase Auth + coleção `usuarios`
- [ ] `AuthContext` com tipo de perfil
- [ ] Navegação condicional por perfil

---

## Issues — Sprint 2 · Lógica de Negócio

### [M] SIN-02 · Feed de eventos
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como estudante, quero ver todos os eventos do campus em uma lista, para descobrir o que está acontecendo sem depender de cartaz ou WhatsApp.

**Critérios de aceite**
- [ ] FlatList exibe eventos futuros ordenados por data
- [ ] Cada card mostra: nome, data, horário, local e categoria
- [ ] Eventos passados não aparecem no feed principal
- [ ] Lista carrega do Firestore e exibe indicador de carregamento

**Tarefas técnicas**
- [ ] Coleção `eventos` no Firestore: `{ titulo, descricao, data, horario, local, categoria, criadoPor }`
- [ ] Query ordenada por data com filtro `data >= hoje`
- [ ] Componente `CardEvento` reutilizável

---

### [M] SIN-03 · Detalhe do evento
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como estudante, quero ver as informações completas de um evento, para decidir se vou participar.

**Critérios de aceite**
- [ ] Tela exibe: título, descrição completa, data, horário, local, organizador
- [ ] Botão "Inscrever-se" visível (estado muda se já inscrito)
- [ ] Navegação de volta para o feed preserva a posição da lista

**Tarefas técnicas**
- [ ] `EventoDetalheScreen` recebendo `eventoId` por parâmetro de rota
- [ ] Buscar documento individual no Firestore

---

### [M] SIN-04 · Inscrição em evento
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como estudante, quero me inscrever em um evento com um toque, para garantir minha participação e recebê-lo na minha agenda.

**Critérios de aceite**
- [ ] Botão "Inscrever-se" registra a inscrição no Firestore
- [ ] Botão muda para "Inscrito ✓" e permite cancelar inscrição
- [ ] Evento inscrito passa a aparecer em "Meus Eventos"
- [ ] Não é possível se inscrever duas vezes no mesmo evento

**Tarefas técnicas**
- [ ] Subcoleção `eventos/{id}/inscritos` ou array de UIDs — decidir e registrar
- [ ] Função `inscrever(eventoId)` e `cancelarInscricao(eventoId)`

---

### [M] SIN-05 · Meus Eventos
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como estudante inscrito, quero ver apenas os eventos em que me inscrevi, para organizar meu horário.

**Critérios de aceite**
- [ ] Tela lista somente eventos com inscrição do usuário logado
- [ ] Separação visual entre "Próximos" e "Já aconteceram"
- [ ] Tocar no evento abre o detalhe (reutiliza SIN-03)

**Tarefas técnicas**
- [ ] Query de eventos por UID inscrito
- [ ] Componente de seção (Próximos / Passados)

---

### [M] SIN-06 · Calendário mensal
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como estudante, quero ver os eventos em um calendário mensal, para visualizar a distribuição deles no mês.

**Critérios de aceite**
- [ ] Mini-calendário na Home com marcadores nos dias com eventos
- [ ] Tocar no mini-calendário abre o calendário completo
- [ ] Tocar em um dia exibe a lista de eventos daquele dia

**Tarefas técnicas**
- [ ] Avaliar `react-native-calendars` (decidir antes de codar; registrar no repo)
- [ ] Marcar datas a partir da coleção `eventos`

---

### [M] SIN-07 · Cadastro de evento (organizador)
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como organizador, quero cadastrar um evento com todas as informações, para divulgá-lo à comunidade do campus.

**Critérios de aceite**
- [ ] Formulário: título, descrição, data, horário, local, categoria
- [ ] Validação: nenhum campo obrigatório vazio; data não pode ser passada
- [ ] Evento criado aparece imediatamente no feed
- [ ] Apenas perfis "organizador" acessam esta tela

**Tarefas técnicas**
- [ ] `CriarEventoScreen` com formulário controlado (`useState`)
- [ ] DateTimePicker para data/horário
- [ ] Gravação no Firestore com `criadoPor: uid`

---

## Issues — Sprint 3 · Polimento

### [S] SIN-08 · Filtro por categoria
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como estudante, quero filtrar eventos por categoria (palestra, esporte, cultura...), para achar mais rápido o que me interessa.

**Critérios de aceite**
- [ ] Chips de categoria no topo do feed
- [ ] Seleção filtra a lista sem recarregar a tela
- [ ] "Todos" limpa o filtro

---

### [S] SIN-09 · Notificação de proximidade do evento
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como inscrito, quero ser avisado quando um evento estiver próximo, para não perdê-lo.

**Critérios de aceite**
- [ ] Notificação local agendada para 1 dia antes e 1 hora antes do evento
- [ ] Agendada no momento da inscrição; cancelada se a inscrição for cancelada

**Tarefas técnicas**
- [ ] `expo-notifications` com agendamento local por data do evento

---

### [S] SIN-10 · Favoritar eventos
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como estudante, quero favoritar eventos que me interessam mas ainda não decidi, para acompanhá-los sem me inscrever.

**Critérios de aceite**
- [ ] Ícone de coração no card e no detalhe
- [ ] Lista de favoritos acessível pelo menu

---

### [S] SIN-11 · Acessibilidade básica
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como usuário com baixa visão, quero opção de fonte maior e alto contraste, para usar o app confortavelmente.

**Critérios de aceite**
- [ ] Opção de aumentar fonte (2 tamanhos) no perfil
- [ ] Contraste verificado em todas as telas (texto legível)
- [ ] Áreas de toque com no mínimo 44×44

---

## Icebox (Could Have — sem milestone)

| ID | Item | Condição para entrar |
|---|---|---|
| SIN-C1 | Histórico de inscrições | Sprint 3 com folga |
| SIN-C2 | Mapa ilustrando o local do evento | Sprint 3 com folga |
| SIN-C3 | Exportar para Google Calendar | Reclassificado de M — ver nota do professor |

## Fora do Escopo (Won't Have — registrado, não vira issue)

| Item | Motivo |
|---|---|
| Integração com o site de eventos do IFTM | Infraestrutura externa complexa |
| Emissão de certificados | Fora do escopo do trimestre |
| Controle de vagas e lista de espera | Logística complexa para o MVP |
| Pagamento de ingressos | Envolve transações financeiras — fora do escopo |
