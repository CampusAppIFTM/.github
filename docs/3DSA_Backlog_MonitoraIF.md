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
| 🔐 Identidade e Login (padrão) | MIF-01, MIF-02, MIF-03, MIF-04 | Sprint 1 |
| 📋 Mural de Dúvidas (núcleo) | MIF-05, MIF-06, MIF-07 | Sprint 2 |
| 💬 Respostas | MIF-08, MIF-09 | Sprint 2 |
| ✨ Experiência | MIF-10, MIF-11 | Sprint 3 |

---

## Issues — Sprint 1 · Identidade e Login

> **Sprint 1 padronizado — idêntico para as 12 equipes.** Baseado no codelab *Autenticação Firebase/Google*.
> Login com Google (`@react-native-google-signin/google-signin`) + Firebase, build nativo (`expo prebuild` + `run:android`), rotas protegidas e sessão persistente. **Papéis de usuário entram no Sprint 2.**

### [M] MIF-01 · Configurar Firebase e ativar login com Google
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`, `setup`

**História de usuário**
Como equipe, queremos o Firebase configurado com autenticação Google ativada, para que o app possa autenticar usuários.

**Critérios de aceite**
- [ ] Projeto criado no console do Firebase
- [ ] Provedor de login **Google** ativado na aba Authentication
- [ ] App Android registrado no Firebase com o nome de pacote definido
- [ ] `google-services.json` baixado e colocado na raiz do projeto
- [ ] Certificado **SHA-1** gerado (`gradlew signingReport`) e cadastrado no Firebase

### [M] MIF-02 · Criar o app React Native e integrar as bibliotecas
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`, `setup`

**História de usuário**
Como equipe, queremos o projeto React Native criado e as bibliotecas de autenticação instaladas, para começar a programar o login.

**Critérios de aceite**
- [ ] Projeto Expo criado e aberto no VS Code
- [ ] Biblioteca instalada: `npx expo install @react-native-google-signin/google-signin`
- [ ] `app.json` configurado com `googleServicesFile` e o plugin do google-signin
- [ ] `npx expo prebuild` executado sem erro (pasta `android` criada)
- [ ] App roda no dispositivo com `npx expo run:android`

### [M] MIF-03 · Implementar login e logout com Google
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`

**História de usuário**
Como usuário, quero entrar com minha conta Google e poder sair, para acessar o app com minha identidade.

**Critérios de aceite**
- [ ] `GoogleSignin.configure()` com o `webClientId` correto (do `google-services.json`)
- [ ] Botão "Entrar" chama `GoogleSignin.signIn()` e obtém o objeto `user`
- [ ] Indicador de carregamento (`ActivityIndicator`) durante o login
- [ ] Botão "Sair" chama `GoogleSignin.signOut()` e volta à tela de login

### [M] MIF-04 · Rotas protegidas + Home com usuário logado + sessão persistente
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`

**História de usuário**
Como usuário, quero que o app me leve à Home ao logar, mostre meu nome e foto, e lembre que estou logado ao reabrir o app.

**Critérios de aceite**
- [ ] Renderização condicional: sem usuário → Login; com usuário → Home
- [ ] Home exibe nome e foto do objeto `user` do Google
- [ ] Objeto `user` em estado global (Context) acessível a todas as telas
- [ ] Sessão persiste: fechar e reabrir o app mantém o login
- [ ] Logout limpa a sessão e retorna ao Login

## Issues — Sprint 2 · Lógica de Negócio

### [M] MIF-05 · Postar dúvida no mural
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

### [M] MIF-06 · Mural de dúvidas (listagem)
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

### [M] MIF-07 · Detalhe da dúvida
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como usuário, quero abrir uma dúvida e ver a descrição completa e as respostas, para acompanhar a discussão.

**Critérios de aceite**
- [ ] Tela exibe a dúvida completa e a lista de respostas
- [ ] Mostra status (aberta | respondida | resolvida)

---

### [M] MIF-08 · Responder dúvida (monitor)
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

### [M] MIF-09 · Marcar dúvida como resolvida (aluno)
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como aluno autor, quero marcar minha dúvida como resolvida, para indicar que a resposta ajudou.

**Critérios de aceite**
- [ ] Botão "Resolvida" visível só para o autor
- [ ] Status muda e a dúvida fica destacada como resolvida no mural

---

## Issues — Sprint 3 · Polimento

### [S] MIF-10 · Calendário de horários de atendimento
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como aluno, quero ver os horários de atendimento dos monitores, para procurá-los presencialmente ou agendar.

**Critérios de aceite**
- [ ] Monitor cadastra seus horários disponíveis
- [ ] Aluno visualiza os horários por monitor/disciplina

**Tarefas técnicas**
- [ ] Coleção `atendimentos`: `{ monitorUid, diaSemana, horaInicio, horaFim, disciplina }`

---

### [S] MIF-11 · Filtrar dúvidas por matéria
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
