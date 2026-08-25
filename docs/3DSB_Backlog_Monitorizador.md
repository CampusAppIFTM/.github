# Backlog Inicial — Monitorizador

> **Equipe:** Miguel Antonio Alves Gontijo (e equipe)
> **Problema:** Falta de facilidade para saber quando e como ocorrem as monitorias. Monitores não sabem quem virá; estudantes não sabem quando a monitoria acontece.
> **Usuários:** Monitores e Estudantes.

---

## ⚠️ Nota do professor — ajuste de escopo

O MoSCoW da equipe é enxuto (bom!), mas deixou **implícita** a funcionalidade mais valiosa do Canvas: *"monitores não sabem quem vai vir à sua monitoria"*. Isso significa que a **confirmação de presença (RSVP)** é o coração do app — sem ela, o Monitorizador é só um calendário estático. O backlog abaixo a promove a Must Have (MON-07 e MON-08).

Outro ponto: o calendário foi listado como M genérico. Ele foi quebrado em três issues (visualizar, cadastrar, detalhar) para a equipe paralelizar o trabalho.

---

## Épicos

| Épico | Issues | Sprint |
|---|---|---|
| 🔐 Identidade e Login (padrão) | MON-01, MON-02, MON-03, MON-04 | Sprint 1 |
| 📅 Calendário de Monitorias (núcleo) | MON-05, MON-06 | Sprint 2 |
| ✋ Confirmação de Presença | MON-07, MON-08, MON-09 | Sprint 2 |
| ✨ Experiência | MON-10, MON-11 | Sprint 3 |

---

## Issues — Sprint 1 · Identidade e Login

> **Sprint 1 padronizado — idêntico para as 12 equipes.** Baseado no codelab *Autenticação Firebase/Google*.
> Login com Google (`@react-native-google-signin/google-signin`) + Firebase, build nativo (`expo prebuild` + `run:android`), rotas protegidas e sessão persistente. **Papéis de usuário entram no Sprint 2.**

### [M] MON-01 · Configurar Firebase e ativar login com Google
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`, `setup`

**História de usuário**
Como equipe, queremos o Firebase configurado com autenticação Google ativada, para que o app possa autenticar usuários.

**Critérios de aceite**
- [ ] Projeto criado no console do Firebase
- [ ] Provedor de login **Google** ativado na aba Authentication
- [ ] App Android registrado no Firebase com o nome de pacote definido
- [ ] `google-services.json` baixado e colocado na raiz do projeto
- [ ] Certificado **SHA-1** gerado (`gradlew signingReport`) e cadastrado no Firebase

### [M] MON-02 · Criar o app React Native e integrar as bibliotecas
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`, `setup`

**História de usuário**
Como equipe, queremos o projeto React Native criado e as bibliotecas de autenticação instaladas, para começar a programar o login.

**Critérios de aceite**
- [ ] Projeto Expo criado e aberto no VS Code
- [ ] Biblioteca instalada: `npx expo install @react-native-google-signin/google-signin`
- [ ] `app.json` configurado com `googleServicesFile` e o plugin do google-signin
- [ ] `npx expo prebuild` executado sem erro (pasta `android` criada)
- [ ] App roda no dispositivo com `npx expo run:android`

### [M] MON-03 · Implementar login e logout com Google
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`

**História de usuário**
Como usuário, quero entrar com minha conta Google e poder sair, para acessar o app com minha identidade.

**Critérios de aceite**
- [ ] `GoogleSignin.configure()` com o `webClientId` correto (do `google-services.json`)
- [ ] Botão "Entrar" chama `GoogleSignin.signIn()` e obtém o objeto `user`
- [ ] Indicador de carregamento (`ActivityIndicator`) durante o login
- [ ] Botão "Sair" chama `GoogleSignin.signOut()` e volta à tela de login

### [M] MON-04 · Rotas protegidas + Home com usuário logado + sessão persistente
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

### [M] MON-05 · Calendário de monitorias
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como estudante, quero ver todas as monitorias da semana em um calendário, para descobrir quando posso tirar minhas dúvidas.

**Critérios de aceite**
- [ ] Calendário/agenda exibe monitorias futuras com disciplina, monitor, data, hora e sala
- [ ] Dias com monitoria têm marcador visual
- [ ] Tocar na monitoria abre a tela de detalhe
- [ ] Dados carregam do Firestore

**Tarefas técnicas**
- [ ] Coleção `monitorias`: `{ disciplina, monitorUid, monitorNome, data, horaInicio, horaFim, sala, descricao }`
- [ ] Avaliar `react-native-calendars` vs. lista agrupada por dia (decidir e registrar)

---

### [M] MON-06 · Cadastrar monitoria (monitor)
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como monitor, quero cadastrar minhas sessões de monitoria, para que os estudantes saibam quando e onde me encontrar.

**Critérios de aceite**
- [ ] Formulário: disciplina, data, horário de início/fim, sala, descrição opcional
- [ ] Validação: campos obrigatórios preenchidos; data futura
- [ ] Monitoria criada aparece no calendário imediatamente
- [ ] Monitor pode editar e cancelar suas próprias monitorias

**Tarefas técnicas**
- [ ] `CriarMonitoriaScreen` (acesso restrito ao papel monitor)
- [ ] DateTimePicker para data e hora
- [ ] Funções `editar` e `cancelar` com confirmação

---

### [M] MON-07 · Confirmar presença (estudante)
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como estudante, quero confirmar que vou a uma monitoria, para que o monitor saiba me esperar.

**Critérios de aceite**
- [ ] Botão "Vou participar" na tela de detalhe da monitoria
- [ ] Confirmação registra o estudante na lista de participantes
- [ ] Botão vira "Confirmado ✓" e permite desistir
- [ ] Contador de confirmados visível na tela de detalhe

**Tarefas técnicas**
- [ ] Subcoleção `monitorias/{id}/participantes` ou array de UIDs
- [ ] Funções `confirmar(monitoriaId)` e `desistir(monitoriaId)`

> 💡 **Este é o coração do app** — resolve a dor do monitor descrita no Canvas: "monitores não sabem quem vai vir".

---

### [M] MON-08 · Lista de confirmados (monitor)
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como monitor, quero ver quem confirmou presença na minha monitoria, para preparar o conteúdo e decidir se a sessão vale a pena.

**Critérios de aceite**
- [ ] Detalhe da monitoria (visão do monitor) lista nomes dos confirmados
- [ ] Contagem atualiza em tempo real (`onSnapshot`)
- [ ] Monitoria sem confirmados exibe aviso "Nenhuma confirmação ainda"

---

### [M] MON-09 · Minhas Monitorias
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como usuário, quero uma aba com as minhas monitorias — as que confirmei (estudante) ou as que criei (monitor) — para acompanhar meus compromissos.

**Critérios de aceite**
- [ ] Estudante vê as monitorias que confirmou
- [ ] Monitor vê as monitorias que criou (com contagem de confirmados)
- [ ] Separação entre futuras e passadas

---

## Issues — Sprint 3 · Polimento

### [S] MON-10 · Filtrar monitorias por disciplina
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como estudante, quero filtrar o calendário por disciplina, para ver apenas as monitorias que me interessam.

**Critérios de aceite**
- [ ] Chips/dropdown de disciplinas no topo do calendário
- [ ] Filtro aplicado sem recarregar a tela

---

### [S] MON-11 · Notificação de lembrete
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como estudante confirmado, quero receber um lembrete antes da monitoria, para não esquecer de comparecer.

**Critérios de aceite**
- [ ] Notificação local 1 hora antes da monitoria confirmada
- [ ] Cancelada automaticamente se o estudante desistir

**Tarefas técnicas**
- [ ] `expo-notifications` com agendamento no momento da confirmação

---

## Icebox (Could Have — sem milestone)

| ID | Item | Condição para entrar |
|---|---|---|
| MON-C1 | Animações de transição refinadas | Tudo entregue — é estética, não função |

## Fora do Escopo (Won't Have — registrado, não vira issue)

| Item | Motivo (da própria equipe) |
|---|---|
| Versão Web | Fora do alcance das 12 semanas |
