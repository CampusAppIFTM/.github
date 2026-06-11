# Atividades Kanban — Anbylize

> **Como usar:** cada linha da coluna "Card" vira um *draft item* no GitHub Project (coluna **A Fazer** do sprint correspondente). Fluxo: A Fazer → Fazendo → Em Review → Feito.
> **Convenção de ID:** `ANB-NN.T` (issue NN, tarefa T). Estimativa em **aulas** (1 aula ≈ 50 min).
> **Atenção desta equipe:** o login Google exige **Expo CLI local + dispositivo físico** (não funciona no Snack). Reservar a primeira aula do Sprint 1 só para o ambiente. A decisão sobre aprovação do admin (ANB-07) afeta o modelo de dados — o campo `status` entra desde o primeiro agendamento.

---

## 🟣 Sprint 1 — Identidade e Login (Semanas 5–6)

### ANB-01 · Login com Google restrito ao e-mail estudantil

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| ANB-01.1 | Preparar ambiente local (Expo CLI + dispositivo físico + Expo Go) | Projeto roda no celular de cada membro via QR code | 1 |
| ANB-01.2 | Configurar projeto no Firebase + credenciais OAuth do Google | Client IDs criados; redirect URI configurado conforme documentação do expo-auth-session | 1 |
| ANB-01.3 | Implementar o fluxo de login com Google (`expo-auth-session`) | Tela do Google abre, retorna o usuário e o app recebe nome/e-mail/foto | 1,5 |
| ANB-01.4 | Validar o domínio do e-mail após o login | E-mail fora do domínio institucional é deslogado com mensagem clara | 1 |
| ANB-01.5 | Criar coleção `usuarios` com campo `tipo` (aluno padrão / admin manual) | Documento criado no primeiro login; admins promovidos pelo professor no console | 0,5 |
| ANB-01.6 | Criar `AuthContext` + persistência de sessão (AsyncStorage) | Fechar e reabrir mantém logado; logout funcional | 1 |

---

## 🔵 Sprint 2 — Lógica de Negócio (Semanas 7–8)

### ANB-02 · Calendário de horários (verde/vermelho)

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| ANB-02.1 | Definir a grade de slots do dia (ex.: 7h–22h, blocos de 1h) e documentar | Constante `SLOTS` no código + decisão registrada no README | 0,5 |
| ANB-02.2 | Modelar coleção `agendamentos` no Firestore | `{ data, horaInicio, horaFim, uid, nome, modalidade, status }`; schema no README | 0,5 |
| ANB-02.3 | Construir o componente `SlotHorario` com os 3 estados de cor | Verde (livre), vermelho (confirmado), amarelo (pendente); legenda visível na tela | 1 |
| ANB-02.4 | Construir a tela principal: data selecionada + grade do dia | Grade renderiza os slots da data atual; navegação dia anterior/próximo | 1,5 |
| ANB-02.5 | Cruzar slots com agendamentos via `onSnapshot` | Reserva feita em um celular muda a cor no outro sem recarregar | 1 |
| ANB-02.6 | Adicionar seletor de data (calendário ou date picker) | Qualquer data futura consultável | 1 |

### ANB-03 · Cronograma semanal das modalidades

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| ANB-03.1 | Modelar coleção `cronogramaFixo` e popular com os horários reais da quadra | `{ diaSemana, horaInicio, horaFim, modalidade }`; dados levantados com o responsável pela quadra | 1 |
| ANB-03.2 | Mesclar cronograma fixo + agendamentos na grade (prioridade do fixo) | Slot de treino aparece ocupado toda semana com visual distinto da reserva comum | 1 |
| ANB-03.3 | Construir a tela de cronograma semanal por modalidade | Lista seg–dom com as modalidades de cada dia | 1 |

### ANB-04 · Filtrar horários disponíveis

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| ANB-04.1 | Implementar a alternância "Mostrar só disponíveis" | Grade exibe apenas slots verdes quando ativa | 0,5 |
| ANB-04.2 | Construir a lista de próximos slots livres (dia + hora) | Lista dos próximos 7 dias; toque leva ao agendamento (ANB-05) | 1 |

### ANB-05 · Agendar horário (com tratamento de conflito) ⭐ núcleo técnico

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| ANB-05.1 | Construir a tela de confirmação do agendamento | Exibe data, hora e campo de modalidade; botão Confirmar | 1 |
| ANB-05.2 | Implementar ID determinístico do documento (`data_horaInicio`) | Tentativa de criar documento já existente falha — base da prevenção de conflito | 1 |
| ANB-05.3 | Tratar o conflito com mensagem amigável | Segundo usuário no mesmo slot recebe "Este horário acabou de ser reservado" e a grade atualiza | 1 |
| ANB-05.4 | Implementar o limite de reservas ativas por aluno (definir N com o professor) | Tentativa acima do limite é bloqueada com explicação | 1 |
| ANB-05.5 | Teste de conflito com 2 celulares disputando o mesmo slot | Apenas um consegue; vídeo do teste anexado à issue | 0,5 |

### ANB-06 · Meus agendamentos

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| ANB-06.1 | Construir a tela com reservas futuras e passadas do usuário | Data, hora, modalidade e status visíveis; seções separadas | 1 |
| ANB-06.2 | Implementar o cancelamento com confirmação | Cancelar libera o slot (volta a verde para todos) na hora | 1 |

---

## 🟢 Sprint 3 — Polimento (Semanas 9–10)

### ANB-07 · Painel de aprovação do administrador

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| ANB-07.1 | Construir o painel com a lista de reservas pendentes (perfil admin) | Lista em tempo real (`onSnapshot`); só admin acessa | 1 |
| ANB-07.2 | Implementar Aprovar (→ confirmado) e Recusar (→ libera o slot) | Cores da grade refletem a decisão; aluno vê o status em "Meus agendamentos" | 1 |
| ANB-07.3 | Teste integrado do ciclo completo: reservar → aprovar → cancelar | Fluxo gravado em vídeo com 2 perfis (aluno + admin) | 0,5 |

### ANB-08 · Notificação semanal do cronograma

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| ANB-08.1 | Configurar `expo-notifications` com pedido de permissão | Recusa não quebra o app | 0,5 |
| ANB-08.2 | Agendar notificação local semanal (segunda de manhã) | Notificação dispara no horário em dispositivo físico | 1 |
| ANB-08.3 | Criar alternância ativar/desativar no perfil | Preferência persiste; desativar cancela o agendamento | 0,5 |

### ANB-09 · Modo escuro

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| ANB-09.1 | Criar `ThemeContext` com paletas clara e escura | Alternância no perfil troca todas as telas | 1 |
| ANB-09.2 | Garantir distinção verde/vermelho/amarelo no tema escuro | Cores ajustadas para contraste; teste com brilho mínimo da tela | 0,5 |
| ANB-09.3 | Persistir a preferência no AsyncStorage | App reabre no último tema | 0,5 |

### Encerramento do Sprint 3

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| ANB-QA.1 | Teste cruzado com outra equipe + registro de bugs como issues `bug` | Sessão de 30 min; bugs com passos para reproduzir | 1 |
| ANB-QA.2 | Corrigir bugs priorizados | Issues críticas fechadas com commit referenciado | 2 |
| ANB-QA.3 | Teste de estresse do conflito: 4+ pessoas disputando slots na mesma aula | Nenhuma reserva duplicada no Firestore após a sessão | 0,5 |

---

## 📌 Definição de Pronto geral (vale para todo card)

- [ ] Código commitado em branch + Pull Request aberto
- [ ] PR revisado por pelo menos 1 colega (não o autor)
- [ ] Testado em dispositivo físico via Expo Go
- [ ] Sem `console.log` de depuração esquecido
- [ ] Card movido com comentário do que foi feito
