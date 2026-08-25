# Atividades Kanban — Monitorizador

> **Como usar:** cada linha da coluna "Card" vira um *draft item* no GitHub Project (coluna **A Fazer** do sprint correspondente). Fluxo: A Fazer → Fazendo → Em Review → Feito.
> **Convenção de ID:** `MON-NN.T` (issue NN, tarefa T). Estimativa em **aulas** (1 aula ≈ 50 min).
> **Atenção desta equipe:** o coração do app é o **RSVP** (MON-07/06) — é ele que resolve a dor do Canvas ("monitores não sabem quem vai vir"). Se o tempo apertar no Sprint 2, cortar de baixo para cima, nunca o RSVP.

---

## 🟣 Sprint 1 — Identidade e Login (PADRÃO — igual para as 12 equipes)

> Baseado no codelab *Autenticação Firebase/Google*. Build nativo (`expo prebuild` + `run:android`), não Expo Go. Papéis de usuário só no Sprint 2.

### MON-01 · Configurar Firebase e ativar login com Google
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MON-01.1 | Criar projeto no console do Firebase | Projeto criado; painel acessível | 0,5 |
| MON-01.2 | Ativar provedor de login Google (Authentication) | Google ativado com nome e e-mail de suporte | 0,5 |
| MON-01.3 | Registrar app Android + baixar google-services.json | Arquivo na raiz do projeto | 1 |
| MON-01.4 | Gerar SHA-1 (gradlew signingReport) e cadastrar no Firebase | Impressão digital salva no Firebase | 1 |

### MON-02 · Criar o app React Native e integrar as bibliotecas
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MON-02.1 | Criar projeto Expo e abrir no VS Code | Projeto roda localmente | 0,5 |
| MON-02.2 | Instalar @react-native-google-signin/google-signin | Biblioteca no package.json | 0,5 |
| MON-02.3 | Configurar app.json (googleServicesFile + plugin) | Config correta conforme codelab | 1 |
| MON-02.4 | Rodar expo prebuild + expo run:android | App abre no dispositivo (build nativo) | 1,5 |

### MON-03 · Implementar login e logout com Google
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MON-03.1 | Configurar GoogleSignin com webClientId | webClientId correto do google-services.json | 0,5 |
| MON-03.2 | Botão Entrar chamando GoogleSignin.signIn() | Retorna o objeto user do Google | 1 |
| MON-03.3 | ActivityIndicator durante o login | Indicador aparece enquanto autentica | 0,5 |
| MON-03.4 | Botão Sair com GoogleSignin.signOut() | Logout volta à tela de login | 0,5 |

### MON-04 · Rotas protegidas + Home + sessão persistente
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MON-04.1 | Renderização condicional (user ? Home : Login) | Telas protegidas conforme o login | 1 |
| MON-04.2 | Home exibe nome e foto do usuário | Dados do objeto user na Home | 1 |
| MON-04.3 | Estado global do usuário (Context) | user acessível em qualquer tela | 1 |
| MON-04.4 | Persistir sessão (mantém login ao reabrir) | Fechar e reabrir mantém logado | 1 |

## 🔵 Sprint 2 — Lógica de Negócio (Semanas 7–8)

### MON-05 · Calendário de monitorias

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MON-05.1 | Modelar coleção `monitorias` e documentar o schema | `{ disciplina, monitorUid, monitorNome, data, horaInicio, horaFim, sala, descricao }` no README | 0,5 |
| MON-05.2 | Decidir: `react-native-calendars` ou lista agrupada por dia | Prova de conceito + decisão registrada no README | 1 |
| MON-05.3 | Construir o componente `CardMonitoria` | Disciplina, monitor, horário e sala visíveis; toque abre o detalhe | 1 |
| MON-05.4 | Implementar a listagem de monitorias futuras agrupadas por dia | SectionList (ou calendário) carregando do Firestore, ordenada por data | 1,5 |
| MON-05.5 | Marcar visualmente os dias com monitoria | Marcador no calendário ou cabeçalho de seção destacado | 0,5 |

### MON-06 · Cadastrar monitoria (monitor)

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MON-06.1 | Construir UI do formulário (disciplina, data, hora início/fim, sala, descrição) | Conforme wireframe; campos controlados | 1 |
| MON-06.2 | Integrar DateTimePicker para data e horários | Seleção nativa funcionando; hora fim > hora início validada | 1 |
| MON-06.3 | Implementar validações e gravação no Firestore | Campos obrigatórios; data futura; monitoria aparece no calendário na hora | 1 |
| MON-06.4 | Implementar edição e cancelamento (só o próprio monitor) | Botões visíveis apenas para o criador; cancelar pede confirmação | 1 |

### MON-07 · Confirmar presença (estudante) ⭐ coração do app

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MON-07.1 | Construir a tela de detalhe da monitoria | Todos os dados + contador de confirmados + botão de ação | 1 |
| MON-07.2 | Decidir e documentar o modelo de participantes (subcoleção vs. array) | Decisão no README com justificativa | 0,5 |
| MON-07.3 | Implementar `confirmar(monitoriaId)` e `desistir(monitoriaId)` | Dupla confirmação impossível; estado do botão muda ("Vou participar" ↔ "Confirmado ✓") | 1 |
| MON-07.4 | Atualizar o contador de confirmados em tempo real | `onSnapshot` reflete confirmações de outros celulares sem recarregar | 1 |

### MON-08 · Lista de confirmados (monitor)

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MON-08.1 | Exibir a lista de nomes confirmados no detalhe (visão do monitor) | Nomes em tempo real; estudante não vê a lista completa (só o contador) | 1 |
| MON-08.2 | Tratar o estado "nenhuma confirmação ainda" | Mensagem amigável no lugar da lista vazia | 0,5 |
| MON-08.3 | Teste integrado com 2 celulares (estudante confirma → monitor vê) | Vídeo do teste anexado à issue | 0,5 |

### MON-09 · Minhas Monitorias

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MON-09.1 | Implementar a visão do estudante (monitorias confirmadas) | Query por participação; futuras e passadas separadas | 1 |
| MON-09.2 | Implementar a visão do monitor (monitorias criadas + contador) | Query por `monitorUid`; cada card mostra o nº de confirmados | 1 |

---

## 🟢 Sprint 3 — Polimento (Semanas 9–10)

### MON-10 · Filtrar monitorias por disciplina

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MON-10.1 | Gerar a lista de disciplinas a partir das monitorias existentes | Chips/dropdown montados dinamicamente (sem lista fixa no código) | 1 |
| MON-10.2 | Aplicar o filtro sem recarregar a tela | Estado local filtra os dados; "Todas" limpa | 0,5 |

### MON-11 · Notificação de lembrete

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MON-11.1 | Configurar `expo-notifications` com pedido de permissão | Recusa não quebra a confirmação de presença | 0,5 |
| MON-11.2 | Agendar notificação 1h antes ao confirmar presença | ID do agendamento salvo junto à participação | 1 |
| MON-11.3 | Cancelar a notificação ao desistir | Nenhuma notificação órfã (testar desistindo antes do horário) | 0,5 |

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
