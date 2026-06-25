# Backlog Inicial — Avisa IF

> **Equipe:** Rebeca, Adan, Alejandro, Enzo Eduardo, Enzo Leonardo
> **Problema:** Avisos pessoais e de grupo (eventos, avaliações) se perdem — não há um espaço dedicado que lembre e mostre o status de cada aviso.
> **Usuários:** Alunos do IFTM (de aluno para aluno), com apoio do grêmio estudantil.

---

## ⚠️ Nota do professor — ajuste de escopo

Dois ajustes no MoSCoW da equipe:

1. **"Cadastro de usuários do grêmio" estava com a justificativa de listagem** (copiada do exemplo). O que o app realmente precisa é de **autenticação comum + um papel "grêmio"** que pode publicar avisos globais. Reescrevi nesse sentido (AVI-01 e AVI-02).
2. O **conceito central do Canvas são os grupos** ("Grupo do 3DS A" com cor própria) + a **agenda que ordena os avisos por data**. Isso virou o núcleo M (AVI-03 a AVI-06), mais importante que o filtro por turma que a equipe deixou como S.

---

## Épicos

| Épico | Issues | Sprint |
|---|---|---|
| 🔐 Autenticação e Papéis | AVI-01, AVI-02 | Sprint 1 |
| 👥 Grupos de Aviso (núcleo) | AVI-03, AVI-04 | Sprint 2 |
| 📢 Avisos e Agenda | AVI-05, AVI-06, AVI-07 | Sprint 2 |
| ✨ Experiência | AVI-08, AVI-09, AVI-10 | Sprint 3 |

---

## Issues — Sprint 1 · Identidade e Login

### [M] AVI-01 · Cadastro e login
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`

**História de usuário**
Como aluno, quero criar uma conta e fazer login, para acessar meus grupos de aviso de forma pessoal.

**Critérios de aceite**
- [ ] Cadastro e login com e-mail/senha via Firebase Authentication
- [ ] Sessão persiste ao fechar e reabrir o app (AsyncStorage)
- [ ] Logout disponível no perfil

**Tarefas técnicas**
- [ ] Configurar Firebase Auth
- [ ] `AuthContext` + persistência
- [ ] Navegação condicional logado ↔ não logado

---

### [M] AVI-02 · Papel "grêmio" para avisos globais
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`

**História de usuário**
Como membro do grêmio, quero um papel diferenciado, para publicar o "aviso da semana" visível a todos.

**Critérios de aceite**
- [ ] Campo `papel` (aluno | gremio) no documento do usuário
- [ ] Apenas papel grêmio pode criar aviso global (header da Home)
- [ ] Aluno comum vê o aviso global mas não pode editá-lo

**Tarefas técnicas**
- [ ] Coleção `usuarios` com `papel`; grêmio promovido manualmente pelo professor no console
- [ ] Expor o papel no `AuthContext`

---

## Issues — Sprint 2 · Lógica de Negócio

### [M] AVI-03 · Criar e entrar em grupos de aviso
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como aluno, quero criar um grupo (ex.: "3DS A") ou entrar em um existente, para receber os avisos específicos daquele grupo.

**Critérios de aceite**
- [ ] Botão "+" abre opções: criar grupo ou entrar via código
- [ ] Criar grupo define nome e cor; gera um código de convite
- [ ] Entrar com código válido adiciona o usuário ao grupo
- [ ] Home lista os grupos do usuário, cada um com sua cor

**Tarefas técnicas**
- [ ] Coleção `grupos`: `{ nome, cor, codigo, criadoPor, membros: [] }`
- [ ] Funções `criarGrupo()` e `entrarComCodigo()`
- [ ] Componente `CardGrupo` colorido

---

### [M] AVI-04 · Listar grupos na Home
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como aluno, quero ver na Home todos os grupos a que pertenço, para acessar rapidamente os avisos de cada um.

**Critérios de aceite**
- [ ] FlatList dos grupos do usuário, cada card com nome e cor
- [ ] Header exibe o "aviso da semana" do grêmio
- [ ] Tocar em um grupo abre seus avisos

---

### [M] AVI-05 · Publicar aviso em um grupo
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como aluno, quero publicar um aviso (evento ou avaliação) em um grupo, com data e descrição, para que todos do grupo fiquem sabendo.

**Critérios de aceite**
- [ ] Formulário: título, descrição, data, tipo (evento | avaliação)
- [ ] Aviso aparece para todos os membros do grupo
- [ ] Validação: título e data obrigatórios; data não passada

**Tarefas técnicas**
- [ ] Subcoleção `grupos/{id}/avisos`: `{ titulo, descricao, data, tipo, autor }`
- [ ] DateTimePicker para a data

---

### [M] AVI-06 · Agenda ordenada por data
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como aluno, quero ver todos os avisos dos meus grupos em uma agenda ordenada por data, com a cor de cada grupo, para me organizar.

**Critérios de aceite**
- [ ] Ícone de agenda leva à tela consolidada
- [ ] Avisos de todos os grupos do usuário, ordenados por data
- [ ] Cada aviso exibe a cor do grupo de origem
- [ ] Avisos passados separados dos futuros

**Tarefas técnicas**
- [ ] Query dos avisos de todos os grupos do usuário
- [ ] Agrupamento por dia (SectionList)

---

### [M] AVI-07 · Status do aviso (pendente / concluído)
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como aluno, quero marcar um aviso como concluído, para acompanhar o que já resolvi (o Canvas destaca "deixar claro o status").

**Critérios de aceite**
- [ ] Cada aviso tem estado visual: pendente / concluído
- [ ] Marcar como concluído é pessoal (não afeta outros membros)
- [ ] Avisos concluídos ficam visualmente atenuados

**Tarefas técnicas**
- [ ] Registro de conclusão por usuário (subcoleção ou mapa por UID)

---

## Issues — Sprint 3 · Polimento

### [S] AVI-08 · Filtrar avisos por turma/grupo
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como aluno de vários grupos, quero filtrar a agenda por grupo, para focar em um de cada vez.

**Critérios de aceite**
- [ ] Chips com os grupos do usuário no topo da agenda
- [ ] Filtro aplica sem recarregar; "Todos" limpa

---

### [S] AVI-09 · Notificação de aviso próximo
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como aluno, quero ser lembrado quando um evento/avaliação se aproxima, para não esquecer.

**Critérios de aceite**
- [ ] Notificação local 1 dia antes da data do aviso
- [ ] Ativável/desativável no perfil

**Tarefas técnicas**
- [ ] `expo-notifications` com agendamento local

---

### [C] AVI-10 · Animações de transição
**Milestone:** — (icebox) · **Labels:** `could-have`

**História de usuário**
Como usuário, quero transições suaves entre telas, para uma experiência mais agradável.

**Critérios de aceite**
- [ ] Transições aplicadas sem prejudicar a performance

---

## Icebox (Could Have — sem milestone)

| ID | Item | Condição para entrar |
|---|---|---|
| AVI-10 | Animações de transição | Tudo entregue |
| AVI-C2 | Seção de achados e perdidos | Fora do foco — só se sobrar muito tempo |

## Fora do Escopo (Won't Have — registrado, não vira issue)

| Item | Motivo (da própria equipe) |
|---|---|
| Chat de texto | Infraestrutura complexa |
| Verificação automática de conteúdo inadequado | Complexa — exigiria moderação/IA |
