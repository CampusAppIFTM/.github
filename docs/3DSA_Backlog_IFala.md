# Backlog Inicial — IFala

> **Equipe:** Clara Lindemann, Davi Rodovalho, Enzo Ribeiro (Candido), Lucas Mercado
> **Problema:** Estudantes não se sentem "ouvidos" — não há um canal eficaz para registrar reclamações/denúncias e receber resposta da coordenação.
> **Usuários:** Estudantes do IFTM + coordenação/CAE (quem responde).

---

## ⚠️ Nota do professor — tema sensível + ajuste de escopo

Este app lida com **denúncias e anonimato** — exige cuidado:

1. **Contradição a resolver:** o Canvas fala em "denúncias 100% anônimas", mas o MVP pede "login com e-mail institucional". Anonimato total e login identificado são incompatíveis. O backlog adota um meio-termo viável e honesto: **login institucional para garantir que é aluno, mas a queixa é exibida à coordenação sem identificação** (anonimato funcional, não criptográfico). **Isso precisa ser explicado com clareza ao usuário** (IFA-06) — não prometa anonimato que o sistema não garante.
2. Antes do Sprint 2, **alinhar com a coordenação/CAE real** se eles se comprometem a responder. Sem esse compromisso, o app não cumpre o propósito.
3. O "chat em tempo real" foi corretamente colocado como C pela equipe — mantido fora do núcleo.

---

## Épicos

| Épico | Issues | Sprint |
|---|---|---|
| 🔐 Identidade e Login (padrão) | IFA-01, IFA-02, IFA-03, IFA-04 | Sprint 1 |
| 📨 Reclamações (núcleo) | IFA-05, IFA-06, IFA-07 | Sprint 2 |
| 🏛️ Resposta da Coordenação | IFA-08, IFA-09 | Sprint 2 |
| ✨ Experiência | IFA-10, IFA-11 | Sprint 3 |

---

## Issues — Sprint 1 · Identidade e Login

> **Sprint 1 padronizado — idêntico para as 12 equipes.** Baseado no codelab *Autenticação Firebase/Google*.
> Login com Google (`@react-native-google-signin/google-signin`) + Firebase, build nativo (`expo prebuild` + `run:android`), rotas protegidas e sessão persistente. **Papéis de usuário entram no Sprint 2.**

### [M] IFA-01 · Configurar Firebase e ativar login com Google
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`, `setup`

**História de usuário**
Como equipe, queremos o Firebase configurado com autenticação Google ativada, para que o app possa autenticar usuários.

**Critérios de aceite**
- [ ] Projeto criado no console do Firebase
- [ ] Provedor de login **Google** ativado na aba Authentication
- [ ] App Android registrado no Firebase com o nome de pacote definido
- [ ] `google-services.json` baixado e colocado na raiz do projeto
- [ ] Certificado **SHA-1** gerado (`gradlew signingReport`) e cadastrado no Firebase

### [M] IFA-02 · Criar o app React Native e integrar as bibliotecas
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`, `setup`

**História de usuário**
Como equipe, queremos o projeto React Native criado e as bibliotecas de autenticação instaladas, para começar a programar o login.

**Critérios de aceite**
- [ ] Projeto Expo criado e aberto no VS Code
- [ ] Biblioteca instalada: `npx expo install @react-native-google-signin/google-signin`
- [ ] `app.json` configurado com `googleServicesFile` e o plugin do google-signin
- [ ] `npx expo prebuild` executado sem erro (pasta `android` criada)
- [ ] App roda no dispositivo com `npx expo run:android`

### [M] IFA-03 · Implementar login e logout com Google
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`

**História de usuário**
Como usuário, quero entrar com minha conta Google e poder sair, para acessar o app com minha identidade.

**Critérios de aceite**
- [ ] `GoogleSignin.configure()` com o `webClientId` correto (do `google-services.json`)
- [ ] Botão "Entrar" chama `GoogleSignin.signIn()` e obtém o objeto `user`
- [ ] Indicador de carregamento (`ActivityIndicator`) durante o login
- [ ] Botão "Sair" chama `GoogleSignin.signOut()` e volta à tela de login

### [M] IFA-04 · Rotas protegidas + Home com usuário logado + sessão persistente
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

### [M] IFA-05 · Enviar reclamação
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como aluno, quero registrar uma reclamação com categoria e descrição, para comunicar um problema à coordenação.

**Critérios de aceite**
- [ ] Formulário: categoria (professor | infraestrutura | colegas | outros) + texto
- [ ] Reclamação salva no Firestore com status "aberta"
- [ ] Confirmação de envio ao aluno

**Tarefas técnicas**
- [ ] Coleção `reclamacoes`: `{ categoria, texto, status, criadaEm, autorUid }`
- [ ] O `autorUid` é guardado para o aluno ver suas próprias queixas, mas **não exibido à coordenação** (ver IFA-06)

---

### [M] IFA-06 · Exibição sem identificação à coordenação
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como aluno, quero que minha reclamação chegue à coordenação sem meu nome, para me sentir seguro ao relatar.

**Critérios de aceite**
- [ ] Painel da coordenação **não exibe** autor da reclamação
- [ ] Tela de envio explica claramente o nível de privacidade (texto honesto: "sua identidade não é mostrada à coordenação")
- [ ] O vínculo autor↔reclamação existe só para o aluno acompanhar a própria queixa

**Tarefas técnicas**
- [ ] Regras do Firestore que impedem a coordenação de ler o campo `autorUid`
- [ ] Texto de transparência revisado com o professor

---

### [M] IFA-07 · Minhas reclamações (aluno)
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como aluno, quero acompanhar as reclamações que enviei e suas respostas, para saber se foram resolvidas.

**Critérios de aceite**
- [ ] Lista das reclamações do próprio usuário com status
- [ ] Abre o detalhe com a resposta da coordenação (se houver)

---

### [M] IFA-08 · Painel de reclamações (coordenação)
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como coordenação, quero ver as reclamações abertas, para analisá-las e responder.

**Critérios de aceite**
- [ ] FlatList das reclamações sem identificação do autor
- [ ] Ordenação por mais recentes; status visível
- [ ] Tocar abre o detalhe para responder

---

### [M] IFA-09 · Responder reclamação (coordenação)
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como coordenação, quero responder a uma reclamação e mudar seu status, para dar retorno ao aluno.

**Critérios de aceite**
- [ ] Campo de resposta + mudança de status (aberta → em análise → respondida)
- [ ] Resposta aparece em "Minhas reclamações" do aluno
- [ ] Aluno vê a atualização sem recarregar (`onSnapshot`)

---

## Issues — Sprint 3 · Polimento

### [S] IFA-10 · Filtrar por categoria
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como coordenação, quero filtrar reclamações por categoria, para priorizar a análise.

**Critérios de aceite**
- [ ] Chips de categoria no painel
- [ ] Filtro aplica sem recarregar

---

### [S] IFA-11 · Anexar evidência (foto)
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como aluno, quero anexar uma foto à reclamação, para registrar provas concretas (citado no Canvas).

**Critérios de aceite**
- [ ] Anexo opcional de imagem via galeria/câmera
- [ ] Imagem visível no detalhe (para a coordenação) sem revelar metadados do autor

**Tarefas técnicas**
- [ ] `expo-image-picker` + Firebase Storage

---

## Icebox (Could Have — sem milestone)

| ID | Item | Condição para entrar |
|---|---|---|
| IFA-C1 | Chat em tempo real aluno↔coordenação | Resposta imediata não é necessária |

## Fora do Escopo (Won't Have — registrado, não vira issue)

| Item | Motivo (da própria equipe) |
|---|---|
| Garantia de resolução de toda queixa | O instituto não é responsável por resolver tudo — o app registra e dá retorno, não promete solução |

---

## ⚠️ Checklist antes do Sprint 2 (tema sensível)

1. Confirmar com a coordenação/CAE o compromisso de ler e responder.
2. Validar o texto de transparência sobre privacidade com o professor.
3. Definir o que acontece com reclamações sobre pessoas nominadas (professores/colegas) — política de moderação combinada com a coordenação.
