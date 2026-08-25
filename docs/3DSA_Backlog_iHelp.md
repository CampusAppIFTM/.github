# Backlog Inicial — iHelp

> **Equipe:** Caio Gabriel, Vitória Sophia, Camille, Iago Borges, Daniel
> **Problema:** Dificuldade em encontrar profissionais confiáveis e disponíveis para serviços domésticos, reparos e manutenção.
> **Usuários:** Moradores, estudantes, idosos, famílias e pequenos comerciantes; também os profissionais autônomos que querem divulgar serviços.

---

## ✅ Nota do professor

MoSCoW coerente — a equipe acertou em cortar chat e IA. Atenção a dois pontos:

1. O app tem **dois lados** (quem busca serviço e quem oferece). O cadastro do prestador com seus serviços é tão essencial quanto a listagem — por isso virou issue M própria (IHP-02).
2. **Avaliação/reputação** não estava no MoSCoW, mas o Canvas fala em "profissionais confiáveis". Sem nenhum sinal de confiança, a listagem perde o sentido. Incluí uma versão mínima (estrelas) como Should Have (IHP-09) — vale a equipe discutir se sobe para M.

---

## Épicos

| Épico | Issues | Sprint |
|---|---|---|
| 🔐 Identidade e Login (padrão) | IHP-01, IHP-02, IHP-03, IHP-04 | Sprint 1 |
| 🛠️ Catálogo de Prestadores (núcleo) | IHP-05, IHP-06, IHP-07 | Sprint 2 |
| 📇 Perfil do Prestador | IHP-08 | Sprint 2 |
| ✨ Confiança e Busca | IHP-09, IHP-10, IHP-11 | Sprint 3 |

---

## Issues — Sprint 1 · Identidade e Login

> **Sprint 1 padronizado — idêntico para as 12 equipes.** Baseado no codelab *Autenticação Firebase/Google*.
> Login com Google (`@react-native-google-signin/google-signin`) + Firebase, build nativo (`expo prebuild` + `run:android`), rotas protegidas e sessão persistente. **Papéis de usuário entram no Sprint 2.**

### [M] IHP-01 · Configurar Firebase e ativar login com Google
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`, `setup`

**História de usuário**
Como equipe, queremos o Firebase configurado com autenticação Google ativada, para que o app possa autenticar usuários.

**Critérios de aceite**
- [ ] Projeto criado no console do Firebase
- [ ] Provedor de login **Google** ativado na aba Authentication
- [ ] App Android registrado no Firebase com o nome de pacote definido
- [ ] `google-services.json` baixado e colocado na raiz do projeto
- [ ] Certificado **SHA-1** gerado (`gradlew signingReport`) e cadastrado no Firebase

### [M] IHP-02 · Criar o app React Native e integrar as bibliotecas
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`, `setup`

**História de usuário**
Como equipe, queremos o projeto React Native criado e as bibliotecas de autenticação instaladas, para começar a programar o login.

**Critérios de aceite**
- [ ] Projeto Expo criado e aberto no VS Code
- [ ] Biblioteca instalada: `npx expo install @react-native-google-signin/google-signin`
- [ ] `app.json` configurado com `googleServicesFile` e o plugin do google-signin
- [ ] `npx expo prebuild` executado sem erro (pasta `android` criada)
- [ ] App roda no dispositivo com `npx expo run:android`

### [M] IHP-03 · Implementar login e logout com Google
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`

**História de usuário**
Como usuário, quero entrar com minha conta Google e poder sair, para acessar o app com minha identidade.

**Critérios de aceite**
- [ ] `GoogleSignin.configure()` com o `webClientId` correto (do `google-services.json`)
- [ ] Botão "Entrar" chama `GoogleSignin.signIn()` e obtém o objeto `user`
- [ ] Indicador de carregamento (`ActivityIndicator`) durante o login
- [ ] Botão "Sair" chama `GoogleSignin.signOut()` e volta à tela de login

### [M] IHP-04 · Rotas protegidas + Home com usuário logado + sessão persistente
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

### [M] IHP-05 · Listar prestadores
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como cliente, quero ver a lista de prestadores disponíveis, para escolher quem pode resolver meu problema.

**Critérios de aceite**
- [ ] FlatList com nome, categoria principal e região de cada prestador
- [ ] Dados carregam do Firestore com indicador de carregamento
- [ ] Lista vazia exibe mensagem amigável

**Tarefas técnicas**
- [ ] Componente `CardPrestador`
- [ ] Query da coleção `prestadores`

---

### [M] IHP-06 · Detalhe do prestador
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como cliente, quero ver o perfil completo de um prestador, para decidir se vou contratá-lo e como contatá-lo.

**Critérios de aceite**
- [ ] Tela exibe nome, categorias, descrição, região e contato
- [ ] Botão para acionar contato (telefone/WhatsApp via deep link)
- [ ] Voltar preserva a posição da lista

---

### [M] IHP-07 · Categorias de serviço
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como cliente, quero navegar pelas categorias mais solicitadas (elétrica, encanamento, pintura...), para chegar rápido ao tipo de serviço que preciso.

**Critérios de aceite**
- [ ] Tela inicial mostra as categorias principais
- [ ] Tocar numa categoria lista os prestadores dela
- [ ] Conjunto de categorias definido e documentado

**Tarefas técnicas**
- [ ] Lista fixa de categorias no MVP
- [ ] Filtro da listagem por categoria selecionada

---

### [M] IHP-08 · Perfil profissional editável
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como prestador, quero manter meu perfil atualizado, para refletir os serviços e contatos corretos.

**Critérios de aceite**
- [ ] Prestador edita nome, categorias, descrição, contato e região
- [ ] Alterações refletem imediatamente na listagem

---

## Issues — Sprint 3 · Polimento

### [S] IHP-09 · Avaliação por estrelas
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como cliente, quero avaliar um prestador com estrelas, para ajudar outros a escolherem profissionais confiáveis.

**Critérios de aceite**
- [ ] Cliente dá nota de 1 a 5 estrelas a um prestador
- [ ] Média de avaliações exibida no card e no detalhe
- [ ] Um cliente avalia cada prestador uma vez (pode atualizar)

---

### [S] IHP-10 · Barra de pesquisa
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como cliente, quero buscar prestadores por nome ou serviço, para chegar mais rápido ao que procuro.

**Critérios de aceite**
- [ ] Campo de busca filtra a lista em tempo real
- [ ] Busca por nome e por categoria

---

### [S] IHP-11 · Filtro por categoria na listagem
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como cliente, quero filtrar a lista por tipo de serviço, para ver só os profissionais relevantes.

**Critérios de aceite**
- [ ] Chips de categoria acima da lista
- [ ] Filtro aplica sem recarregar; "Todos" limpa

---

## Icebox (Could Have — sem milestone)

| ID | Item | Condição para entrar |
|---|---|---|
| IHP-C1 | Integração com redes sociais | Planejamento futuro |
| IHP-C2 | Chat em tempo real | Infraestrutura complexa |

## Fora do Escopo (Won't Have — registrado, não vira issue)

| Item | Motivo (da própria equipe) |
|---|---|
| Assistente de IA | Sem necessidade de implementação neste trimestre |
