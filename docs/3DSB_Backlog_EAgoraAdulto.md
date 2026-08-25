# Backlog Inicial — E Agora, Adulto?

> **Equipe:** Felipe Augusto, Gabriel Vieira, Heitor Calegari, Philipe Medeiros, Vitor Hugo
> **Problema:** A transição da adolescência para a vida adulta — alunos do 3º ano não sabem por onde começar (emprego, faculdade, finanças).
> **Conceito:** Trilha gamificada estilo Duolingo com fases, lições, quiz e XP.

---

## ✅ Nota do professor

O MoSCoW desta equipe está **muito bem construído** — justificativas claras e W corajosos (IA e loja de prêmios cortados com argumentos certos). O risco do projeto não está no escopo técnico, e sim no **conteúdo das lições**: escrever boas lições de Emprego, Faculdade e Financeiro dá trabalho. A issue EAA-03 trata o conteúdo como entregável formal por isso.

---

## Épicos

| Épico | Issues | Sprint |
|---|---|---|
| 🔐 Identidade e Login (padrão) | EAA-01, EAA-02, EAA-03, EAA-04 | Sprint 1 |
| 📦 Setup de Dados e Conteúdo | EAA-05, EAA-06 | Sprint 2 |
| 🎮 Trilha Gamificada (núcleo) | EAA-07, EAA-08, EAA-09, EAA-10 | Sprint 2 |
| 🏆 Engajamento | EAA-11, EAA-12 | Sprint 3 |

---

## Issues — Sprint 1 · Identidade e Login

> **Sprint 1 padronizado — idêntico para as 12 equipes.** Baseado no codelab *Autenticação Firebase/Google*.
> Login com Google (`@react-native-google-signin/google-signin`) + Firebase, build nativo (`expo prebuild` + `run:android`), rotas protegidas e sessão persistente. **Papéis de usuário entram no Sprint 2.**

### [M] EAA-01 · Configurar Firebase e ativar login com Google
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`, `setup`

**História de usuário**
Como equipe, queremos o Firebase configurado com autenticação Google ativada, para que o app possa autenticar usuários.

**Critérios de aceite**
- [ ] Projeto criado no console do Firebase
- [ ] Provedor de login **Google** ativado na aba Authentication
- [ ] App Android registrado no Firebase com o nome de pacote definido
- [ ] `google-services.json` baixado e colocado na raiz do projeto
- [ ] Certificado **SHA-1** gerado (`gradlew signingReport`) e cadastrado no Firebase

### [M] EAA-02 · Criar o app React Native e integrar as bibliotecas
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`, `setup`

**História de usuário**
Como equipe, queremos o projeto React Native criado e as bibliotecas de autenticação instaladas, para começar a programar o login.

**Critérios de aceite**
- [ ] Projeto Expo criado e aberto no VS Code
- [ ] Biblioteca instalada: `npx expo install @react-native-google-signin/google-signin`
- [ ] `app.json` configurado com `googleServicesFile` e o plugin do google-signin
- [ ] `npx expo prebuild` executado sem erro (pasta `android` criada)
- [ ] App roda no dispositivo com `npx expo run:android`

### [M] EAA-03 · Implementar login e logout com Google
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`

**História de usuário**
Como usuário, quero entrar com minha conta Google e poder sair, para acessar o app com minha identidade.

**Critérios de aceite**
- [ ] `GoogleSignin.configure()` com o `webClientId` correto (do `google-services.json`)
- [ ] Botão "Entrar" chama `GoogleSignin.signIn()` e obtém o objeto `user`
- [ ] Indicador de carregamento (`ActivityIndicator`) durante o login
- [ ] Botão "Sair" chama `GoogleSignin.signOut()` e volta à tela de login

### [M] EAA-04 · Rotas protegidas + Home com usuário logado + sessão persistente
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

### [M] EAA-05 · Modelo de progresso do usuário
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`, `setup`

**História de usuário**
Como aluno, quero que meu progresso (fases concluídas, XP) fique salvo na nuvem, para não perder nada se trocar de celular.

**Critérios de aceite**
- [ ] Documento de progresso criado no Firestore no primeiro login
- [ ] Estrutura registra: XP total, fases concluídas por trilha, lição atual
- [ ] Progresso carrega automaticamente ao abrir o app

**Tarefas técnicas**
- [ ] Coleção `progresso/{uid}` no Firestore
- [ ] Definir o schema: `{ xp: number, trilhas: { emprego: [...], faculdade: [...], financeiro: [...] } }`
- [ ] Hook `useProgresso()` para ler/atualizar

---

### [M] EAA-06 · Conteúdo das trilhas (Emprego, Faculdade, Financeiro)
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`, `setup`

**História de usuário**
Como aluno, quero lições curtas e práticas sobre a vida adulta, para aprender o que a escola não ensina formalmente.

**Critérios de aceite**
- [ ] Mínimo de 3 fases por trilha, com 3 lições cada (27 lições no total)
- [ ] Cada lição tem: texto curto (máx. 200 palavras) + quiz de 3 perguntas
- [ ] Conteúdo revisado por pelo menos 1 professor
- [ ] Estrutura em JSON pronta para consumo pelo app

**Tarefas técnicas**
- [ ] Definir schema da lição: `{ id, titulo, texto, quiz: [{ pergunta, opcoes[], correta }] }`
- [ ] Dividir a escrita entre os 5 membros (cada um ~5 lições)
- [ ] Armazenar no Firestore (coleção `trilhas`) ou JSON local — decidir e registrar

> ⚠️ **Maior risco do projeto** — começar a escrever o conteúdo já no início do Sprint 2, em paralelo ao código.

---

### [M] EAA-07 · Tela de trilha estilo Duolingo
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como aluno, quero ver minha trilha como um caminho de fases, para entender visualmente onde estou e o que vem a seguir.

**Critérios de aceite**
- [ ] Home exibe as 3 trilhas (Emprego, Faculdade, Financeiro)
- [ ] Cada trilha mostra as fases em sequência vertical (caminho)
- [ ] Fases concluídas, atual e bloqueadas têm visual distinto
- [ ] Tocar na fase atual abre a lição; fases bloqueadas não abrem

**Tarefas técnicas**
- [ ] Componente `MapaTrilha` com ScrollView e nós de fase
- [ ] Estado da fase derivado do documento de progresso (EAA-02)
- [ ] Navegação para `LicaoScreen` com parâmetro da lição

---

### [M] EAA-08 · Tela de lição (texto)
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como aluno, quero ler uma lição curta antes do quiz, para aprender o conteúdo da fase.

**Critérios de aceite**
- [ ] Lição exibe título e texto formatado de modo legível
- [ ] Botão "Fazer Quiz" só ao final da rolagem
- [ ] Voltar sem terminar não marca a lição como concluída

**Tarefas técnicas**
- [ ] `LicaoScreen` consumindo o conteúdo de EAA-03
- [ ] ScrollView com detecção de fim de rolagem

---

### [M] EAA-09 · Quiz com correção imediata
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como aluno, quero responder um quiz após a lição e ver na hora o que acertei, para fixar o que aprendi.

**Critérios de aceite**
- [ ] 3 perguntas de múltipla escolha por lição
- [ ] Feedback imediato por pergunta (acertou/errou + resposta correta)
- [ ] Lição é concluída com 2 ou mais acertos; senão, refazer
- [ ] Conclusão atualiza o progresso no Firestore

**Tarefas técnicas**
- [ ] Componente `Quiz` com estado de resposta por pergunta
- [ ] Lógica de aprovação (≥ 2/3) e atualização via `useProgresso()`
- [ ] Animação simples de acerto/erro (cores, sem bibliotecas pesadas)

---

### [M] EAA-10 · XP e barra de progresso
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como aluno, quero ganhar XP ao concluir lições e ver minha barra crescer, para sentir que estou avançando rumo à vida adulta.

**Critérios de aceite**
- [ ] Cada lição concluída soma XP (ex.: 10 XP + 5 de bônus por quiz perfeito)
- [ ] Header da Home exibe XP total e barra de progresso da trilha atual
- [ ] XP persiste no Firestore e sincroniza entre sessões

**Tarefas técnicas**
- [ ] Função `adicionarXP(valor)` no hook de progresso
- [ ] Componente `BarraProgresso` reutilizável (por trilha e geral)

---

## Issues — Sprint 3 · Polimento

### [S] EAA-11 · Conquistas e medalhas
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como aluno, quero desbloquear medalhas como "Mestre do Imposto de Renda", para ser recompensado pelo esforço.

**Critérios de aceite**
- [ ] Mínimo de 6 conquistas definidas (2 por trilha)
- [ ] Tela de conquistas mostra desbloqueadas e bloqueadas (silhueta)
- [ ] Toast/modal comemora o desbloqueio no momento em que acontece

**Tarefas técnicas**
- [ ] Array de conquistas com condição de desbloqueio
- [ ] Verificação de conquistas após cada lição concluída

---

### [S] EAA-12 · Notificação diária de lembrete
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como aluno, quero receber um lembrete diário, para manter o hábito de estudar um pouco por dia.

**Critérios de aceite**
- [ ] Notificação local agendada para horário fixo (ex.: 19h)
- [ ] Usuário pode ativar/desativar no perfil
- [ ] Mensagem varia (mínimo 3 textos diferentes)

**Tarefas técnicas**
- [ ] `expo-notifications` com agendamento local (sem servidor push)
- [ ] Persistir preferência no AsyncStorage

---

## Icebox (Could Have — sem milestone)

| ID | Item | Condição para entrar |
|---|---|---|
| EAA-C1 | Modo escuro | Sprints concluídos com folga |
| EAA-C2 | Fórum/comunidade interna | Não entra neste trimestre — exigiria moderação |

## Fora do Escopo (Won't Have — registrado, não vira issue)

| Item | Motivo (da própria equipe) |
|---|---|
| IA para dúvidas financeiras/jurídicas | Complexo + risco de respostas erradas em temas sensíveis |
| Loja de pontos por prêmios reais | Exige parcerias comerciais — inviável em 12 semanas |
