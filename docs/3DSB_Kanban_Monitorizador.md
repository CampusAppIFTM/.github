# Atividades Kanban — Monitorizador

> **Como usar:** cada linha da coluna "Card" vira um *draft item* no GitHub Project (coluna **A Fazer** do sprint correspondente). Fluxo: A Fazer → Fazendo → Em Review → Feito.
> **Convenção de ID:** `MON-NN.T` (issue NN, tarefa T). Estimativa em **aulas** (1 aula ≈ 50 min).
> **Atenção desta equipe:** o coração do app é o **RSVP** (MON-05/06) — é ele que resolve a dor do Canvas ("monitores não sabem quem vai vir"). Se o tempo apertar no Sprint 2, cortar de baixo para cima, nunca o RSVP.

---

## 🟣 Sprint 1 — Identidade e Login (Semanas 5–6)

### MON-01 · Login com perfis de Monitor e Estudante

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MON-01.1 | Criar projeto no Firebase Console e ativar Authentication (e-mail/senha) | Config em `firebaseConfig.js`; app inicializa sem erro | 0,5 |
| MON-01.2 | Construir UI das telas de Login e Cadastro com seleção de papel | Cadastro tem escolha Monitor/Estudante (radio ou toggle); campos validados | 1,5 |
| MON-01.3 | Integrar cadastro/login com Firebase Auth + coleção `usuarios` | Documento `{ nome, email, papel }` criado no cadastro; erros tratados | 1 |
| MON-01.4 | Criar `AuthContext` expondo usuário e papel + persistência | Sessão sobrevive ao restart; `usuario.papel` acessível em qualquer tela | 1 |
| MON-01.5 | Implementar navegação condicional por papel | Monitor vê "Criar Monitoria"; estudante não vê (nem por rota direta) | 1 |

### MON-02 · Tela inicial com identidade do usuário

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MON-02.1 | Configurar `BottomTabNavigator` com 4 abas (Início · Minhas Monitorias · Calendário · Conta) | Todas as abas navegam; ícones e rótulos definidos | 1 |
| MON-02.2 | Construir o header da Home com nome e foto/avatar | Componente `Avatar` exibe foto ou iniciais coloridas | 1 |
| MON-02.3 | Construir o esqueleto das 4 telas (estado vazio amigável) | Cada aba mostra título + mensagem de "em construção" estilizada | 0,5 |

---

## 🔵 Sprint 2 — Lógica de Negócio (Semanas 7–8)

### MON-03 · Calendário de monitorias

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MON-03.1 | Modelar coleção `monitorias` e documentar o schema | `{ disciplina, monitorUid, monitorNome, data, horaInicio, horaFim, sala, descricao }` no README | 0,5 |
| MON-03.2 | Decidir: `react-native-calendars` ou lista agrupada por dia | Prova de conceito + decisão registrada no README | 1 |
| MON-03.3 | Construir o componente `CardMonitoria` | Disciplina, monitor, horário e sala visíveis; toque abre o detalhe | 1 |
| MON-03.4 | Implementar a listagem de monitorias futuras agrupadas por dia | SectionList (ou calendário) carregando do Firestore, ordenada por data | 1,5 |
| MON-03.5 | Marcar visualmente os dias com monitoria | Marcador no calendário ou cabeçalho de seção destacado | 0,5 |

### MON-04 · Cadastrar monitoria (monitor)

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MON-04.1 | Construir UI do formulário (disciplina, data, hora início/fim, sala, descrição) | Conforme wireframe; campos controlados | 1 |
| MON-04.2 | Integrar DateTimePicker para data e horários | Seleção nativa funcionando; hora fim > hora início validada | 1 |
| MON-04.3 | Implementar validações e gravação no Firestore | Campos obrigatórios; data futura; monitoria aparece no calendário na hora | 1 |
| MON-04.4 | Implementar edição e cancelamento (só o próprio monitor) | Botões visíveis apenas para o criador; cancelar pede confirmação | 1 |

### MON-05 · Confirmar presença (estudante) ⭐ coração do app

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MON-05.1 | Construir a tela de detalhe da monitoria | Todos os dados + contador de confirmados + botão de ação | 1 |
| MON-05.2 | Decidir e documentar o modelo de participantes (subcoleção vs. array) | Decisão no README com justificativa | 0,5 |
| MON-05.3 | Implementar `confirmar(monitoriaId)` e `desistir(monitoriaId)` | Dupla confirmação impossível; estado do botão muda ("Vou participar" ↔ "Confirmado ✓") | 1 |
| MON-05.4 | Atualizar o contador de confirmados em tempo real | `onSnapshot` reflete confirmações de outros celulares sem recarregar | 1 |

### MON-06 · Lista de confirmados (monitor)

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MON-06.1 | Exibir a lista de nomes confirmados no detalhe (visão do monitor) | Nomes em tempo real; estudante não vê a lista completa (só o contador) | 1 |
| MON-06.2 | Tratar o estado "nenhuma confirmação ainda" | Mensagem amigável no lugar da lista vazia | 0,5 |
| MON-06.3 | Teste integrado com 2 celulares (estudante confirma → monitor vê) | Vídeo do teste anexado à issue | 0,5 |

### MON-07 · Minhas Monitorias

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MON-07.1 | Implementar a visão do estudante (monitorias confirmadas) | Query por participação; futuras e passadas separadas | 1 |
| MON-07.2 | Implementar a visão do monitor (monitorias criadas + contador) | Query por `monitorUid`; cada card mostra o nº de confirmados | 1 |

---

## 🟢 Sprint 3 — Polimento (Semanas 9–10)

### MON-08 · Filtrar monitorias por disciplina

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MON-08.1 | Gerar a lista de disciplinas a partir das monitorias existentes | Chips/dropdown montados dinamicamente (sem lista fixa no código) | 1 |
| MON-08.2 | Aplicar o filtro sem recarregar a tela | Estado local filtra os dados; "Todas" limpa | 0,5 |

### MON-09 · Notificação de lembrete

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MON-09.1 | Configurar `expo-notifications` com pedido de permissão | Recusa não quebra a confirmação de presença | 0,5 |
| MON-09.2 | Agendar notificação 1h antes ao confirmar presença | ID do agendamento salvo junto à participação | 1 |
| MON-09.3 | Cancelar a notificação ao desistir | Nenhuma notificação órfã (testar desistindo antes do horário) | 0,5 |

### Encerramento do Sprint 3

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MON-QA.1 | Teste cruzado com outra equipe + registro de bugs como issues `bug` | Sessão de 30 min; bugs com passos para reproduzir | 1 |
| MON-QA.2 | Corrigir bugs priorizados | Issues críticas fechadas com commit referenciado | 2 |
| MON-QA.3 | Polimento visual das 4 abas (consistência de cores, espaçamentos, ícones) | Checklist de consistência preenchido na issue | 1 |

---

## 📌 Definição de Pronto geral (vale para todo card)

- [ ] Código commitado em branch + Pull Request aberto
- [ ] PR revisado por pelo menos 1 colega (não o autor)
- [ ] Testado em dispositivo físico via Expo Go
- [ ] Sem `console.log` de depuração esquecido
- [ ] Card movido com comentário do que foi feito
