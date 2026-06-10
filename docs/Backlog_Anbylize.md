# Backlog Inicial — Anbylize

> **Equipe:** Luiza Brandão Nunes (e equipe)
> **Problema:** Alunos e responsáveis têm dificuldade para organizar e consultar os horários da quadra esportiva, gerando conflitos e falta de controle nos agendamentos.
> **Usuários:** Alunos, professores e administradores da quadra.

---

## ✅ Nota do professor

MoSCoW bem equilibrado — os M formam um fluxo coerente (login → ver horários → filtrar → agendar) e o W ("negociar horários") mostra maturidade ao cortar comunicação livre entre usuários. Dois pontos de atenção:

1. **Conflito de agendamento é o coração técnico do app**: dois usuários tentando reservar o mesmo horário ao mesmo tempo. A issue ANB-05 trata isso explicitamente — é o que diferencia este app de uma lista comum.
2. A **confirmação do administrador (S)** muda o fluxo do agendamento (reserva nasce "pendente"). A decisão de incluí-la ou não deve ser tomada **antes** do Sprint 2, pois afeta o modelo de dados. Recomendação: incluir o campo `status` desde o início, mesmo que a tela de aprovação só venha no Sprint 3.

---

## Épicos

| Épico | Issues | Sprint |
|---|---|---|
| 🔐 Autenticação Institucional | ANB-01 | Sprint 1 |
| 📅 Visualização de Horários (núcleo) | ANB-02, ANB-03, ANB-04 | Sprint 2 |
| ✍️ Agendamento | ANB-05, ANB-06 | Sprint 2 |
| 🛡️ Administração | ANB-07 | Sprint 3 |
| ✨ Experiência | ANB-08, ANB-09 | Sprint 3 |

---

## Issues — Sprint 1 · Identidade e Login

### [M] ANB-01 · Login com Google restrito ao e-mail estudantil
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`

**História de usuário**
Como aluno, quero entrar com minha conta Google institucional, para que apenas a comunidade estudantil acesse os agendamentos.

**Critérios de aceite**
- [ ] Login via conta Google (expo-auth-session ou Firebase Auth)
- [ ] Apenas e-mails do domínio institucional são aceitos
- [ ] E-mail de outro domínio exibe mensagem clara e não entra
- [ ] Sessão persiste entre aberturas do app
- [ ] Perfis: `aluno` e `admin` (campo no Firestore)

**Tarefas técnicas**
- [ ] Configurar Google OAuth (lembrar: requer Expo local + dispositivo físico, não funciona no Snack)
- [ ] Validação do domínio do e-mail após o login
- [ ] `AuthContext` + AsyncStorage
- [ ] Coleção `usuarios` com campo `tipo`

---

## Issues — Sprint 2 · Lógica de Negócio

### [M] ANB-02 · Calendário de horários (verde/vermelho)
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como aluno, quero ver o calendário da quadra com horários livres em verde e ocupados em vermelho, para saber de relance quando posso jogar.

**Critérios de aceite**
- [ ] Tela principal exibe a data selecionada e a grade de horários do dia
- [ ] Horário livre = verde; ocupado = vermelho; pendente de aprovação = amarelo
- [ ] Navegação entre dias (anterior/próximo ou seletor de data)
- [ ] Estados refletem o Firestore em tempo real (`onSnapshot`)

**Tarefas técnicas**
- [ ] Coleção `agendamentos`: `{ data, horaInicio, horaFim, uid, nome, modalidade, status }`
- [ ] Gerar a grade de slots fixos do dia (ex.: 7h–22h, blocos de 1h)
- [ ] Cruzar slots com agendamentos para definir a cor
- [ ] Componente `SlotHorario` reutilizável

---

### [M] ANB-03 · Cronograma semanal das modalidades
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como aluno, quero ver o cronograma fixo semanal (treinos e aulas curriculares), para saber quais horários nunca estarão disponíveis.

**Critérios de aceite**
- [ ] Horários fixos (treinos/aulas) aparecem como ocupados em todas as semanas
- [ ] Visual diferenciado entre ocupação fixa (aula/treino) e reserva de aluno
- [ ] Tela de cronograma semanal lista as modalidades por dia da semana

**Tarefas técnicas**
- [ ] Coleção `cronogramaFixo`: `{ diaSemana, horaInicio, horaFim, modalidade }`
- [ ] Mesclar cronograma fixo + agendamentos na grade do dia (prioridade do fixo)

---

### [M] ANB-04 · Filtrar horários disponíveis
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como aluno, quero filtrar apenas os horários livres, para escolher rapidamente sem percorrer a grade inteira.

**Critérios de aceite**
- [ ] Alternância "Mostrar só disponíveis" na tela principal
- [ ] Lista filtrada mostra dia + horário de cada slot livre
- [ ] Tocar em um slot livre leva direto ao agendamento (ANB-05)

---

### [M] ANB-05 · Agendar horário (com tratamento de conflito)
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como aluno, quero reservar um horário livre informando a modalidade, para garantir meu uso da quadra sem conflitos.

**Critérios de aceite**
- [ ] Botão "Agendar Horário" abre a confirmação com data, hora e campo de modalidade
- [ ] Reserva criada com `status: "pendente"` (ou `"confirmado"` se a equipe decidir não usar aprovação)
- [ ] **Se dois usuários tentarem o mesmo slot, apenas o primeiro consegue** — o segundo recebe aviso de conflito
- [ ] Slot muda de cor imediatamente após a reserva

**Tarefas técnicas**
- [ ] ID determinístico do documento (`data_horaInicio`) para impedir duplicidade no Firestore
- [ ] Tratar erro de escrita duplicada com mensagem amigável
- [ ] Regra de limite: máximo de N reservas ativas por aluno (definir N com o professor)

> 💡 **Este é o item tecnicamente mais valioso do projeto** — vale destacar no pitch como a equipe resolveu concorrência.

---

### [M] ANB-06 · Meus agendamentos
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como aluno, quero consultar minhas reservas futuras, para lembrar quando agendei e poder cancelar se necessário.

**Critérios de aceite**
- [ ] Lista das reservas do usuário logado com data, hora, modalidade e status
- [ ] Cancelar reserva libera o slot (volta a verde para todos)
- [ ] Reservas passadas separadas das futuras

---

## Issues — Sprint 3 · Polimento

### [S] ANB-07 · Painel de aprovação do administrador
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como administrador da quadra, quero aprovar ou recusar agendamentos pendentes, para manter a prioridade de treinos e atividades curriculares.

**Critérios de aceite**
- [ ] Painel lista reservas com `status: "pendente"` (só para perfil admin)
- [ ] Aprovar → `confirmado` (slot vermelho); recusar → slot volta a livre
- [ ] Aluno vê o status atualizado em "Meus agendamentos"

---

### [S] ANB-08 · Notificação semanal do cronograma
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como aluno, quero receber um resumo semanal do cronograma de esportes, para me programar com antecedência.

**Critérios de aceite**
- [ ] Notificação local toda segunda-feira de manhã
- [ ] Pode ser desativada no perfil

**Tarefas técnicas**
- [ ] `expo-notifications` com gatilho semanal local

---

### [S] ANB-09 · Modo escuro
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como usuário, quero alternar para o modo escuro, para usar o app à noite com conforto.

**Critérios de aceite**
- [ ] Alternância no perfil, persistida no AsyncStorage
- [ ] Verde/vermelho/amarelo dos slots continuam distinguíveis no tema escuro

---

## Icebox (Could Have — sem milestone)

| ID | Item | Condição para entrar |
|---|---|---|
| ANB-C1 | Lembrete via WhatsApp para quem agendou | Sprint 3 com folga — avaliar deep link `wa.me` (simples) em vez de API oficial (complexa) |

## Fora do Escopo (Won't Have — registrado, não vira issue)

| Item | Motivo (da própria equipe) |
|---|---|
| Negociar horários entre usuários | A interface só recebe informações estruturadas de agendamento — sem textos livres/conversa |
