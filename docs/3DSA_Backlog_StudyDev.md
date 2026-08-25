# Backlog Inicial — StudyDev

> **Equipe:** Iago Oliveira, Nicolas Bruno, Felipe Peixoto, Felipe Marques, Heitor Moreira
> **Problema:** Falta de acesso gratuito e organizado a conteúdos de programação para iniciantes de baixa renda — hoje aprendem por vídeos soltos e material desorganizado.
> **Usuários:** Iniciantes em programação que querem trilhas organizadas e gratuitas.

---

## ✅ Nota do professor

MoSCoW claro e bem priorizado. O maior risco, como no "E Agora, Adulto?" da outra turma, é o **conteúdo das trilhas**: organizar boas trilhas de programação dá trabalho e precisa começar cedo. Por isso o conteúdo é issue formal de Sprint 1 (STD-03), em paralelo ao código. A "motivação diária" (S) combina bem com uma sequência de dias estudados (streak) — sugestão registrada em STD-10.

---

## Épicos

| Épico | Issues | Sprint |
|---|---|---|
| 🔐 Identidade e Login (padrão) | STD-01, STD-02, STD-03, STD-04 | Sprint 1 |
| 📦 Setup de Dados e Conteúdo | STD-05, STD-06 | Sprint 2 |
| 🛤️ Navegação de Trilhas (núcleo) | STD-07, STD-08, STD-09 | Sprint 2 |
| ✨ Engajamento | STD-10, STD-11, STD-12 | Sprint 3 |

---

## Issues — Sprint 1 · Identidade e Login

> **Sprint 1 padronizado — idêntico para as 12 equipes.** Baseado no codelab *Autenticação Firebase/Google*.
> Login com Google (`@react-native-google-signin/google-signin`) + Firebase, build nativo (`expo prebuild` + `run:android`), rotas protegidas e sessão persistente. **Papéis de usuário entram no Sprint 2.**

### [M] STD-01 · Configurar Firebase e ativar login com Google
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`, `setup`

**História de usuário**
Como equipe, queremos o Firebase configurado com autenticação Google ativada, para que o app possa autenticar usuários.

**Critérios de aceite**
- [ ] Projeto criado no console do Firebase
- [ ] Provedor de login **Google** ativado na aba Authentication
- [ ] App Android registrado no Firebase com o nome de pacote definido
- [ ] `google-services.json` baixado e colocado na raiz do projeto
- [ ] Certificado **SHA-1** gerado (`gradlew signingReport`) e cadastrado no Firebase

### [M] STD-02 · Criar o app React Native e integrar as bibliotecas
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`, `setup`

**História de usuário**
Como equipe, queremos o projeto React Native criado e as bibliotecas de autenticação instaladas, para começar a programar o login.

**Critérios de aceite**
- [ ] Projeto Expo criado e aberto no VS Code
- [ ] Biblioteca instalada: `npx expo install @react-native-google-signin/google-signin`
- [ ] `app.json` configurado com `googleServicesFile` e o plugin do google-signin
- [ ] `npx expo prebuild` executado sem erro (pasta `android` criada)
- [ ] App roda no dispositivo com `npx expo run:android`

### [M] STD-03 · Implementar login e logout com Google
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`

**História de usuário**
Como usuário, quero entrar com minha conta Google e poder sair, para acessar o app com minha identidade.

**Critérios de aceite**
- [ ] `GoogleSignin.configure()` com o `webClientId` correto (do `google-services.json`)
- [ ] Botão "Entrar" chama `GoogleSignin.signIn()` e obtém o objeto `user`
- [ ] Indicador de carregamento (`ActivityIndicator`) durante o login
- [ ] Botão "Sair" chama `GoogleSignin.signOut()` e volta à tela de login

### [M] STD-04 · Rotas protegidas + Home com usuário logado + sessão persistente
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

### [M] STD-05 · Modelo de progresso do aluno
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`, `setup`

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

### [M] STD-06 · Conteúdo das trilhas
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`, `setup`

**História de usuário**
Como aluno iniciante, quero trilhas organizadas por linguagem com conteúdos objetivos, para aprender de forma estruturada.

**Critérios de aceite**
- [ ] Mínimo de 2 trilhas (ex.: Lógica/Python e Web/HTML-CSS), 3 módulos cada, 3 aulas por módulo
- [ ] Cada aula tem título + conteúdo em texto (e link de vídeo opcional)
- [ ] Conteúdo revisado pela equipe
- [ ] Estrutura em JSON pronta para consumo

**Tarefas técnicas**
- [ ] Schema da aula: `{ id, trilha, modulo, titulo, conteudo, videoUrl? }`
- [ ] Dividir a escrita entre os 5 membros
- [ ] Carregar no Firestore (coleção `trilhas`)

> ⚠️ Maior risco do projeto — começar a produzir conteúdo já no início do Sprint 2.

---

### [M] STD-07 · Tela de trilhas (Home)
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

### [M] STD-08 · Lista de aulas da trilha
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como aluno, quero ver as aulas de uma trilha em ordem, sabendo quais já concluí, para seguir a sequência.

**Critérios de aceite**
- [ ] Aulas agrupadas por módulo, em ordem
- [ ] Indicador de concluída/não concluída por aula
- [ ] Tocar abre o conteúdo da aula

---

### [M] STD-09 · Tela de aula (conteúdo)
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

### [S] STD-10 · Motivação diária (streak)
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como aluno, quero ver minha sequência de dias estudando e uma mensagem motivacional, para manter o hábito.

**Critérios de aceite**
- [ ] Contador de dias consecutivos com pelo menos 1 aula
- [ ] Mensagem motivacional diária (mínimo 5 textos)

---

### [S] STD-11 · Notificações de estudo
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como aluno, quero um lembrete diário, para não esquecer de estudar.

**Critérios de aceite**
- [ ] Notificação local em horário definido pelo usuário
- [ ] Ativável/desativável no perfil

**Tarefas técnicas**
- [ ] `expo-notifications` (agendamento local)

---

### [C] STD-12 · Modo escuro
**Milestone:** — (icebox) · **Labels:** `could-have`

**História de usuário**
Como aluno, quero modo escuro, para estudar com conforto visual à noite.

**Critérios de aceite**
- [ ] Alternância no perfil, persistida no AsyncStorage

---

## Icebox (Could Have — sem milestone)

| ID | Item | Condição para entrar |
|---|---|---|
| STD-12 | Modo escuro | Sprints concluídos com folga |

## Fora do Escopo (Won't Have — registrado, não vira issue)

| Item | Motivo (da própria equipe) |
|---|---|
| IA avançada | Muito complexo para a primeira versão |
| Sistema de pagamento | Contraria a proposta gratuita do StudyDev |
