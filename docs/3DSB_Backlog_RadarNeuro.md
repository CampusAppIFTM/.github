# Backlog Inicial — Radar Neurodivergente

> **Equipe:** Ana Beatriz Ramos Del Padre (e equipe)
> **Problema:** A falta de uma rede de apoio estruturada dificulta que estudantes neurodivergentes recebam suporte adequado durante crises e momentos de desregulação emocional.
> **Usuários:** Alunos neurodivergentes + membros do CAPNE e do CAE.

---

## ⚠️ Nota do professor — ajuste de escopo

O MoSCoW da equipe classificou **"chat em tempo real" como Must Have**. Chat completo é a armadilha clássica de escopo. O ajuste abaixo preserva a essência do app com complexidade viável:

- O **núcleo real do MVP é o Botão de Emergência**: ao acioná-lo, um alerta é registrado no Firestore e fica visível imediatamente no painel do CAPNE/CAE. Isso entrega o valor central (rede de apoio em crises) sem chat.
- O **chat foi reescopado** para mensagens simples via Firestore (`onSnapshot` já dá atualização quase em tempo real) entre aluno e CAPNE — sem indicador de digitação, sem confirmação de leitura, sem mídia. Assim ele se torna viável como M no Sprint 2.
- **"Procurar amizade"** foi classificado como Should Have — depende do chat estar estável.

---

## Épicos

| Épico | Issues | Sprint |
|---|---|---|
| 🔐 Autenticação e Perfil | RND-01, RND-02, RND-03 | Sprint 1 |
| 🚨 Emergência (núcleo) | RND-04, RND-05, RND-06 | Sprint 2 |
| 💬 Mensagens | RND-07, RND-08 | Sprint 2 |
| ✨ Experiência | RND-09, RND-10 | Sprint 3 |

---

## Issues — Sprint 1 · Identidade e Login

### [M] RND-01 · Cadastro e login com e-mail e senha
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`

**História de usuário**
Como aluno neurodivergente, quero criar uma conta e fazer login com e-mail e senha, para acessar a plataforma de forma pessoal e segura.

**Critérios de aceite**
- [ ] Tela de login exibe logo, campo de e-mail e campo de senha
- [ ] Botão "Criar conta" leva ao formulário de cadastro
- [ ] Cadastro cria usuário no Firebase Authentication
- [ ] Login com credenciais válidas redireciona para a Home
- [ ] Credenciais inválidas exibem mensagem de erro clara (sem jargão técnico)

**Tarefas técnicas**
- [ ] Configurar projeto Firebase + Firebase Auth (e-mail/senha)
- [ ] Criar telas `LoginScreen` e `CadastroScreen`
- [ ] Implementar navegação condicional (logado ↔ não logado)
- [ ] Validar formato de e-mail e senha mínima de 6 caracteres

---

### [M] RND-02 · Sessão global com Context API + persistência
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`

**História de usuário**
Como usuário, quero que o app lembre que estou logado ao fechar e reabrir, para não digitar minhas credenciais toda vez.

**Critérios de aceite**
- [ ] Usuário logado disponível em qualquer tela via Context
- [ ] Fechar e reabrir o app mantém a sessão (AsyncStorage)
- [ ] Logout limpa a sessão e volta para a tela de login

**Tarefas técnicas**
- [ ] Criar `AuthContext` com `useState` + `useEffect`
- [ ] Persistir token/UID no AsyncStorage
- [ ] Implementar função `logout()`

---

### [M] RND-03 · Tipos de perfil: Aluno e Apoio (CAPNE/CAE)
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`

**História de usuário**
Como membro do CAPNE/CAE, quero ter um perfil diferente do aluno, para acessar o painel de alertas em vez da tela de emergência.

**Critérios de aceite**
- [ ] Campo `tipo` (aluno | apoio) salvo no Firestore no cadastro
- [ ] Após login, aluno vê a Home do aluno; apoio vê o painel de alertas
- [ ] Não é possível um aluno acessar o painel de apoio

**Tarefas técnicas**
- [ ] Coleção `usuarios` no Firestore com campo `tipo`
- [ ] Navegação condicional por tipo de perfil no `AuthContext`

---

## Issues — Sprint 2 · Lógica de Negócio

### [M] RND-04 · Botão de Emergência
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como aluno em crise, quero acionar um botão de emergência bem visível, para que o CAPNE e o CAE saibam imediatamente que preciso de ajuda.

**Critérios de aceite**
- [ ] Botão "Emergência" em destaque na Home (grande, alto contraste, acessível)
- [ ] Ao acionar, um alerta é criado no Firestore com UID, nome e horário
- [ ] Tela de confirmação acolhedora aparece após o acionamento ("Ajuda a caminho")
- [ ] Acionamento funciona em no máximo 2 toques a partir da Home

**Tarefas técnicas**
- [ ] Coleção `alertas` no Firestore (uid, nome, timestamp, status: aberto/atendido)
- [ ] Componente `BotaoEmergencia` com feedback visual imediato
- [ ] Tela `EmergenciaConfirmada` com mensagens de regulação (respiração guiada simples)

---

### [M] RND-05 · Painel de alertas (CAPNE/CAE)
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como membro do CAPNE/CAE, quero ver os alertas de emergência em tempo real, para agir rapidamente quando um aluno estiver em crise.

**Critérios de aceite**
- [ ] FlatList exibe alertas abertos em ordem do mais recente
- [ ] Novo alerta aparece sem precisar recarregar (Firestore `onSnapshot`)
- [ ] Cada alerta mostra nome do aluno e horário do acionamento
- [ ] Botão "Marcar como atendido" muda o status e tira da lista de abertos

**Tarefas técnicas**
- [ ] Listener `onSnapshot` na coleção `alertas` filtrando `status == "aberto"`
- [ ] Função `marcarAtendido(alertaId)`
- [ ] Diferenciar visualmente alertas com mais de 5 minutos sem atendimento

---

### [M] RND-06 · Chatbot de acolhimento na emergência
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como aluno em crise, quero receber orientações simples enquanto o apoio não chega, para conseguir me regular nos primeiros minutos.

**Critérios de aceite**
- [ ] Após acionar a emergência, abre uma tela de conversa guiada
- [ ] O "chatbot" segue um roteiro fixo de mensagens (sem IA): acolhimento → respiração → perguntas de sim/não
- [ ] As respostas do aluno ficam registradas no alerta para o CAPNE ver o contexto

**Tarefas técnicas**
- [ ] Roteiro de mensagens em array local (decisões simples por botões, não texto livre)
- [ ] Salvar respostas no documento do alerta no Firestore
- [ ] Validar o roteiro de acolhimento com o CAPNE antes de implementar

---

### [M] RND-07 · Mensagens entre aluno e CAPNE (chat simplificado)
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como aluno, quero trocar mensagens com o CAPNE, para pedir orientação também fora de momentos de crise.

**Critérios de aceite**
- [ ] Conversa 1:1 entre aluno e o canal do CAPNE
- [ ] Mensagens novas aparecem sem recarregar (`onSnapshot`)
- [ ] Apenas texto — sem fotos, áudio ou anexos (decisão de escopo registrada)
- [ ] Mensagens persistem entre sessões

**Tarefas técnicas**
- [ ] Coleção `conversas/{conversaId}/mensagens` no Firestore
- [ ] FlatList invertida para exibir o histórico
- [ ] `TextInput` + botão enviar com limpeza do campo após envio

---

### [S] RND-08 · Procurar amizade
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como aluno, quero encontrar outros alunos com interesses parecidos, para construir minha rede de apoio entre pares.

**Critérios de aceite**
- [ ] Lista de alunos que optaram por aparecer na busca (campo opt-in no perfil)
- [ ] Perfil exibe nome e interesses/hiperfocos declarados
- [ ] Solicitar conexão abre uma conversa (reutiliza RND-07)

**Tarefas técnicas**
- [ ] Campo `visivelNaBusca: boolean` e `interesses: string[]` no perfil
- [ ] Tela de listagem com filtro por interesse

---

## Issues — Sprint 3 · Polimento

### [S] RND-09 · Modo escuro
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como usuário com sensibilidade à luz, quero usar o app em modo escuro, para reduzir desconforto visual.

**Critérios de aceite**
- [ ] Alternância clara/escura na tela de perfil
- [ ] Preferência persiste no AsyncStorage
- [ ] Todas as telas respeitam o tema (sem texto ilegível)

**Tarefas técnicas**
- [ ] `ThemeContext` com paleta clara e escura
- [ ] Auditar contraste de todas as telas no tema escuro

---

### [M] RND-10 · Edição de perfil
**Milestone:** Sprint 3 — Polimento · **Labels:** `must-have`, `sprint-3`

**História de usuário**
Como usuário, quero editar meu nome, interesses e visibilidade, para manter minhas informações atualizadas.

**Critérios de aceite**
- [ ] Tela de perfil exibe dados atuais e permite editar
- [ ] Alterações salvam no Firestore e refletem no app imediatamente

---

## Icebox (Could Have — sem milestone)

| ID | Item | Condição para entrar |
|---|---|---|
| RND-C1 | Sugestões de conteúdo sobre hiperfocos (sem IA — curadoria manual) | Sprint 3 concluído com folga |

## Fora do Escopo (Won't Have — registrado, não vira issue)

| Item | Motivo |
|---|---|
| Versão Web | Decisão da equipe — app exclusivamente mobile |
| IA para pesquisar hiperfocos | Complexidade + risco de conteúdo inadequado em tema sensível |
| Chat com mídia (foto/áudio) | Reescopado — apenas texto no trimestre |

---

## ⚠️ Atenção especial — tema sensível

Este app lida com saúde mental e crises. Recomendações obrigatórias antes do Sprint 2:
1. **Validar o fluxo de emergência com o CAPNE e o CAE reais** — eles precisam concordar em monitorar o painel.
2. Definir com o CAPNE **o que acontece se ninguém atender o alerta** (plano B institucional, não técnico).
3. O chatbot de acolhimento deve usar **roteiro revisado por profissional** do CAPNE — a equipe não inventa as mensagens.
