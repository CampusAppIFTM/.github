# Sprint 1 — Identidade e Login (PADRÃO para todos os projetos)

> **Semanas 5–6 do Campus App.** Este Sprint 1 é **idêntico para as 12 equipes** (turmas 3DS-A e 3DS-B).
> Baseado no codelab *Autenticação Firebase/Google* (Prof. Edson Angoti Júnior).
> Ao final, todo app tem: login com Google, tela Home exibindo o usuário logado, logout e sessão que persiste ao reabrir o app.

---

## Por que o Sprint 1 é igual para todos

Todo aplicativo do Campus App precisa de autenticação. Em vez de cada equipe resolver isso de um jeito, **todas seguem o mesmo caminho** — o do codelab de autenticação. Isso traz três vantagens:

1. **O professor ensina uma vez** e vale para as 12 equipes.
2. **As equipes se ajudam** — o erro de uma é o mesmo erro da outra.
3. **A base fica sólida** — o Sprint 2 (a lógica de cada app) começa sobre um login que já funciona.

> **Papéis de usuário** (aluno/monitor, cliente/prestador, aluno/coordenação etc.) **não entram no Sprint 1**. Todos fazem o mesmo login. A diferenciação de papéis é a primeira tarefa do Sprint 2 de cada projeto.

---

## Stack e ambiente (padrão)

| Item | Definição |
|---|---|
| Autenticação | Login com Google via `@react-native-google-signin/google-signin` |
| Backend | Firebase (Authentication) |
| Ambiente de execução | **Build nativo** — `npx expo prebuild` + `npx expo run:android` (não é Expo Go) |
| Proteção de telas | Renderização condicional (rotas protegidas): `user ? <Home/> : <Login/>` |
| Sessão | Estado global do usuário + persistência para manter o login ao reabrir |
| Regra de código | Importar hooks direto de `'react'` (ex.: `import { useState } from 'react'`) — **nunca** `import React from 'react'` |

---

## As 4 issues do Sprint 1 (iguais para todos)

Substitua `XXX` pelo prefixo do seu projeto (ex.: `RND`, `AVI`, `IFI`, `MIF`...).

### [M] XXX-01 · Configurar Firebase e ativar login com Google
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`, `setup`

**História de usuário**
Como equipe, queremos o Firebase configurado com autenticação Google ativada, para que o app possa autenticar usuários.

**Critérios de aceite**
- [ ] Projeto criado no console do Firebase
- [ ] Provedor de login **Google** ativado na aba Authentication
- [ ] App Android registrado no Firebase com o nome de pacote definido
- [ ] Arquivo `google-services.json` baixado e colocado na raiz do projeto
- [ ] Certificado **SHA-1** gerado (`gradlew signingReport`) e cadastrado no Firebase

---

### [M] XXX-02 · Criar o app React Native e integrar as bibliotecas
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`, `setup`

**História de usuário**
Como equipe, queremos o projeto React Native criado e as bibliotecas de autenticação instaladas, para começar a programar o login.

**Critérios de aceite**
- [ ] Projeto Expo criado e aberto no VS Code
- [ ] Biblioteca instalada: `npx expo install @react-native-google-signin/google-signin`
- [ ] `app.json` configurado com `googleServicesFile` e o plugin do google-signin
- [ ] `npx expo prebuild` executado sem erro (pasta `android` criada)
- [ ] App roda no dispositivo com `npx expo run:android`

---

### [M] XXX-03 · Implementar login e logout com Google
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`

**História de usuário**
Como usuário, quero entrar com minha conta Google e poder sair, para acessar o app com minha identidade.

**Critérios de aceite**
- [ ] `GoogleSignin.configure()` com o `webClientId` correto (obtido do `google-services.json`)
- [ ] Botão "Entrar" chama `GoogleSignin.signIn()` e obtém o objeto `user`
- [ ] Indicador de carregamento (`ActivityIndicator`) enquanto o login acontece
- [ ] Botão "Sair" chama `GoogleSignin.signOut()` e volta à tela de login
- [ ] Valida domínio `iftm.edu.br` do usuário logado. Em caso de outro domínio, retornar à tela de login e informe a restrição de acesso aos usuários Google no domínio iftm.edu.br

---

### [M] XXX-04 · Rotas protegidas + Home com o usuário logado + sessão persistente
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`

**História de usuário**
Como usuário, quero que o app me leve à Home ao logar, mostre meu nome e foto, e lembre que estou logado ao reabrir o app.

**Critérios de aceite**
- [ ] Renderização condicional: sem usuário → tela de Login; com usuário → Home
- [ ] Home exibe nome e foto do usuário vindos do objeto `user` do Google
- [ ] O objeto `user` fica guardado em estado global (Context) acessível a todas as telas
- [ ] A sessão persiste: fechar e reabrir o app mantém o usuário logado
- [ ] Logout limpa a sessão e retorna à tela de login

---

## Definição de Pronto do Sprint 1 (para todas as equipes)

A equipe concluiu o Sprint 1 quando, no celular:

1. Abre o app → vê a tela de Login.
2. Toca em "Entrar" → escolhe a conta Google → cai na Home.
3. A Home mostra o nome e a foto corretos.
4. Toca em "Sair" → volta ao Login.
5. Faz login de novo, **fecha o app pelo gerenciador de tarefas e reabre** → continua logado.

> Só depois que esses 5 passos funcionam a equipe avança para o Sprint 2 (a lógica específica do seu app).
