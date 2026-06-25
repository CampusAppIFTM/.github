# Backlog Inicial — StudyDev

> **Equipe:** Iago Oliveira, Nicolas Bruno, Felipe Peixoto, Felipe Marques, Heitor Moreira
> **Problema:** Falta de acesso gratuito e organizado a conteúdos de programação para iniciantes de baixa renda — hoje aprendem por vídeos soltos e material desorganizado.
> **Usuários:** Iniciantes em programação que querem trilhas organizadas e gratuitas.

---

## ✅ Nota do professor

MoSCoW claro e bem priorizado. O maior risco, como no "E Agora, Adulto?" da outra turma, é o **conteúdo das trilhas**: organizar boas trilhas de programação dá trabalho e precisa começar cedo. Por isso o conteúdo é issue formal de Sprint 1 (STD-03), em paralelo ao código. A "motivação diária" (S) combina bem com uma sequência de dias estudados (streak) — sugestão registrada em STD-07.

---

## Épicos

| Épico | Issues | Sprint |
|---|---|---|
| 🔐 Autenticação | STD-01 | Sprint 1 |
| 📚 Conteúdo das Trilhas | STD-02, STD-03 | Sprint 1–2 |
| 🛤️ Navegação de Trilhas (núcleo) | STD-04, STD-05, STD-06 | Sprint 2 |
| ✨ Engajamento | STD-07, STD-08, STD-09 | Sprint 3 |

---

## Issues — Sprint 1 · Identidade e Login

### [M] STD-01 · Cadastro, login e sessão persistente
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`

**História de usuário**
Como aluno, quero criar conta e permanecer logado, para acessar minhas trilhas e salvar meu progresso.

**Critérios de aceite**
- [ ] Cadastro/login com e-mail/senha (Firebase Auth)
- [ ] Sessão persiste entre aberturas (AsyncStorage)
- [ ] Logout no perfil

**Tarefas técnicas**
- [ ] Firebase Auth + `AuthContext` + persistência

---

### [M] STD-02 · Modelo de progresso do aluno
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`, `setup`

**História de usuário**
Como aluno, quero que minhas aulas concluídas fiquem salvas, para retomar de onde parei.

**Critérios de aceite**
- [ ] Documento `progresso/{uid}` criado no primeiro login
- [ ] Registra aulas concluídas por trilha
- [ ] Carrega ao abrir o app

**Tarefas técnicas**
- [ ] Schema documentado no README
- [ ] Hook `useProgresso()`

---

### [M] STD-03 · Conteúdo das trilhas
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`, `setup`

**História de usuário**
Como aluno iniciante, quero trilhas organizadas por linguagem com conteúdos objetivos, para aprender de forma estruturada.

**Critérios de aceite**
- [ ] Mínimo de 2 trilhas (ex.: Lógica/Python e Web/HTML-CSS), 3 módulos cada, 3 aulas por módulo
- [ ] Cada aula tem título + conteúdo em texto (e link de vídeo opcional)
- [ ] Conteúdo revisado pela equipe antes do Sprint 2
- [ ] Estrutura em JSON pronta para consumo

**Tarefas técnicas**
- [ ] Schema da aula: `{ id, trilha, modulo, titulo, conteudo, videoUrl? }`
- [ ] Dividir a escrita entre os 5 membros
- [ ] Carregar no Firestore (coleção `trilhas`)

> ⚠️ Maior risco do projeto — começar a produzir conteúdo já no Sprint 1.

---

## Issues — Sprint 2 · Lógica de Negócio

### [M] STD-04 · Tela de trilhas (Home)
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como aluno, quero ver as trilhas disponíveis separadas por linguagem/tema, para escolher o que estudar.

**Critérios de aceite**
- [ ] FlatList/grid de trilhas com título, ícone e progresso resumido
- [ ] Tocar numa trilha abre seus módulos e aulas
- [ ] Dados carregam do Firestore

**Tarefas técnicas**
- [ ] Componente `CardTrilha`
- [ ] Progresso por trilha vindo do `useProgresso()`

---

### [M] STD-05 · Lista de aulas da trilha
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como aluno, quero ver as aulas de uma trilha em ordem, sabendo quais já concluí, para seguir a sequência.

**Critérios de aceite**
- [ ] Aulas agrupadas por módulo, em ordem
- [ ] Indicador de concluída/não concluída por aula
- [ ] Tocar abre o conteúdo da aula

---

### [M] STD-06 · Tela de aula (conteúdo)
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como aluno, quero ler o conteúdo da aula e marcá-la como concluída, para registrar meu avanço.

**Critérios de aceite**
- [ ] Conteúdo formatado e legível; link de vídeo abre quando existe
- [ ] Botão "Marcar como concluída" atualiza o progresso
- [ ] Voltar para a trilha reflete a aula concluída

**Tarefas técnicas**
- [ ] Atualização do progresso via `useProgresso()`

---

## Issues — Sprint 3 · Polimento

### [S] STD-07 · Motivação diária (streak)
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como aluno, quero ver minha sequência de dias estudando e uma mensagem motivacional, para manter o hábito.

**Critérios de aceite**
- [ ] Contador de dias consecutivos com pelo menos 1 aula
- [ ] Mensagem motivacional diária (mínimo 5 textos)

---

### [S] STD-08 · Notificações de estudo
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como aluno, quero um lembrete diário, para não esquecer de estudar.

**Critérios de aceite**
- [ ] Notificação local em horário definido pelo usuário
- [ ] Ativável/desativável no perfil

**Tarefas técnicas**
- [ ] `expo-notifications` (agendamento local)

---

### [C] STD-09 · Modo escuro
**Milestone:** — (icebox) · **Labels:** `could-have`

**História de usuário**
Como aluno, quero modo escuro, para estudar com conforto visual à noite.

**Critérios de aceite**
- [ ] Alternância no perfil, persistida no AsyncStorage

---

## Icebox (Could Have — sem milestone)

| ID | Item | Condição para entrar |
|---|---|---|
| STD-09 | Modo escuro | Sprints concluídos com folga |

## Fora do Escopo (Won't Have — registrado, não vira issue)

| Item | Motivo (da própria equipe) |
|---|---|
| IA avançada | Muito complexo para a primeira versão |
| Sistema de pagamento | Contraria a proposta gratuita do StudyDev |
