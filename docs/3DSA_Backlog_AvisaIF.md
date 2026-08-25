# Backlog Inicial — Avisa IF

> **Equipe:** Rebeca, Adan, Alejandro, Enzo Eduardo, Enzo Leonardo
> **Problema:** Avisos pessoais e de grupo (eventos, avaliações) se perdem — não há um espaço dedicado que lembre e mostre o status de cada aviso.
> **Usuários:** Alunos do IFTM (de aluno para aluno), com apoio do grêmio estudantil.

---

## ⚠️ Nota do professor — ajuste de escopo

Dois ajustes no MoSCoW da equipe:

1. **"Cadastro de usuários do grêmio" estava com a justificativa de listagem** (copiada do exemplo). O que o app realmente precisa é de **autenticação comum + um papel "grêmio"** que pode publicar avisos globais. Reescrevi nesse sentido (AVI-01 e AVI-02).
2. O **conceito central do Canvas são os grupos** ("Grupo do 3DS A" com cor própria) + a **agenda que ordena os avisos por data**. Isso virou o núcleo M (AVI-05 a AVI-08), mais importante que o filtro por turma que a equipe deixou como S.

---

## Épicos

| Épico | Issues | Sprint |
|---|---|---|
| 🔐 Identidade e Login (padrão) | AVI-01, AVI-02, AVI-03, AVI-04 | Sprint 1 |
| 👥 Grupos de Aviso (núcleo) | AVI-05, AVI-06 | Sprint 2 |
| 📢 Avisos e Agenda | AVI-07, AVI-08, AVI-09 | Sprint 2 |
| ✨ Experiência | AVI-10, AVI-11, AVI-12 | Sprint 3 |

---

## Issues — Sprint 1 · Identidade e Login

> **Sprint 1 padronizado — idêntico para as 12 equipes.** Baseado no codelab *Autenticação Firebase/Google*.
> Login com Google (`@react-native-google-signin/google-signin`) + Firebase, build nativo (`expo prebuild` + `run:android`), rotas protegidas e sessão persistente. **Papéis de usuário entram no Sprint 2.**

### [M] AVI-01 · Configurar Firebase e ativar login com Google
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`, `setup`

**História de usuário**
Como equipe, queremos o Firebase configurado com autenticação Google ativada, para que o app possa autenticar usuários.

**Critérios de aceite**
- [ ] Projeto criado no console do Firebase
- [ ] Provedor de login **Google** ativado na aba Authentication
- [ ] App Android registrado no Firebase com o nome de pacote definido
- [ ] `google-services.json` baixado e colocado na raiz do projeto
- [ ] Certificado **SHA-1** gerado (`gradlew signingReport`) e cadastrado no Firebase

### [M] AVI-02 · Criar o app React Native e integrar as bibliotecas
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`, `setup`

**História de usuário**
Como equipe, queremos o projeto React Native criado e as bibliotecas de autenticação instaladas, para começar a programar o login.

**Critérios de aceite**
- [ ] Projeto Expo criado e aberto no VS Code
- [ ] Biblioteca instalada: `npx expo install @react-native-google-signin/google-signin`
- [ ] `app.json` configurado com `googleServicesFile` e o plugin do google-signin
- [ ] `npx expo prebuild` executado sem erro (pasta `android` criada)
- [ ] App roda no dispositivo com `npx expo run:android`

### [M] AVI-03 · Implementar login e logout com Google
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`

**História de usuário**
Como usuário, quero entrar com minha conta Google e poder sair, para acessar o app com minha identidade.

**Critérios de aceite**
- [ ] `GoogleSignin.configure()` com o `webClientId` correto (do `google-services.json`)
- [ ] Botão "Entrar" chama `GoogleSignin.signIn()` e obtém o objeto `user`
- [ ] Indicador de carregamento (`ActivityIndicator`) durante o login
- [ ] Botão "Sair" chama `GoogleSignin.signOut()` e volta à tela de login

### [M] AVI-04 · Rotas protegidas + Home com usuário logado + sessão persistente
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

### [M] AVI-05 · Criar e entrar em grupos de aviso
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

### [M] AVI-06 · Listar grupos na Home
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como aluno, quero ver na Home todos os grupos a que pertenço, para acessar rapidamente os avisos de cada um.

**Critérios de aceite**
- [ ] FlatList dos grupos do usuário, cada card com nome e cor
- [ ] Header exibe o "aviso da semana" do grêmio
- [ ] Tocar em um grupo abre seus avisos

---

### [M] AVI-07 · Publicar aviso em um grupo
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

### [M] AVI-08 · Agenda ordenada por data
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

### [M] AVI-09 · Status do aviso (pendente / concluído)
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

### [S] AVI-10 · Filtrar avisos por turma/grupo
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como aluno de vários grupos, quero filtrar a agenda por grupo, para focar em um de cada vez.

**Critérios de aceite**
- [ ] Chips com os grupos do usuário no topo da agenda
- [ ] Filtro aplica sem recarregar; "Todos" limpa

---

### [S] AVI-11 · Notificação de aviso próximo
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como aluno, quero ser lembrado quando um evento/avaliação se aproxima, para não esquecer.

**Critérios de aceite**
- [ ] Notificação local 1 dia antes da data do aviso
- [ ] Ativável/desativável no perfil

**Tarefas técnicas**
- [ ] `expo-notifications` com agendamento local

---

### [C] AVI-12 · Animações de transição
**Milestone:** — (icebox) · **Labels:** `could-have`

**História de usuário**
Como usuário, quero transições suaves entre telas, para uma experiência mais agradável.

**Critérios de aceite**
- [ ] Transições aplicadas sem prejudicar a performance

---

## Icebox (Could Have — sem milestone)

| ID | Item | Condição para entrar |
|---|---|---|
| AVI-12 | Animações de transição | Tudo entregue |
| AVI-C2 | Seção de achados e perdidos | Fora do foco — só se sobrar muito tempo |

## Fora do Escopo (Won't Have — registrado, não vira issue)

| Item | Motivo (da própria equipe) |
|---|---|
| Chat de texto | Infraestrutura complexa |
| Verificação automática de conteúdo inadequado | Complexa — exigiria moderação/IA |
