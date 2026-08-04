# Atividades Kanban — Sincronize

> **Como usar:** cada linha da coluna "Card" vira um *draft item* no GitHub Project (coluna **A Fazer** do sprint correspondente). Fluxo: A Fazer → Fazendo → Em Review → Feito.
> **Convenção de ID:** `SIN-NN.T` (issue NN, tarefa T). Estimativa em **aulas** (1 aula ≈ 50 min).
> **Atenção desta equipe (6 membros):** maior grupo da turma — paralelizar bem. Sugestão de frentes no Sprint 2: dupla A (feed/detalhe), dupla B (inscrição/meus eventos), dupla C (calendário/cadastro do organizador).

---

## 🟣 Sprint 1 — Identidade e Login (Semanas 5–6)

### SIN-01 · Login e perfis (participante / organizador)

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| SIN-01.1 | Criar projeto no Firebase Console e ativar Authentication | Config em `firebaseConfig.js`; app inicializa sem erro | 0,5 |
| SIN-01.2 | Construir UI das telas de Login e Cadastro | Conforme wireframe; campos controlados; validação local | 1,5 |
| SIN-01.3 | Integrar cadastro/login com Firebase Auth | Contas no console; erros tratados com mensagens amigáveis | 1 |
| SIN-01.4 | Criar coleção `usuarios` com campo `tipo` (participante padrão) | Documento criado no cadastro; organizadores promovidos manualmente pelo professor no console | 1 |
| SIN-01.5 | Criar `AuthContext` + navegação condicional + persistência | Sessão sobrevive ao restart; logout funcional | 1,5 |
| SIN-01.6 | Exibir/ocultar botão "Criar Evento" pelo tipo de perfil | Participante não vê o botão; organizador vê | 0,5 |

---

## 🔵 Sprint 2 — Lógica de Negócio (Semanas 7–8)

### SIN-02 · Feed de eventos

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| SIN-02.1 | Modelar coleção `eventos` e documentar o schema no README | `{ titulo, descricao, data, horario, local, categoria, criadoPor }` revisado pela equipe | 0,5 |
| SIN-02.2 | Popular 6 eventos de teste no Firestore | Dados realistas (palestras, esportes, cultura) para desenvolvimento | 0,5 |
| SIN-02.3 | Construir o componente `CardEvento` | Card com nome, data, horário, local e badge de categoria | 1 |
| SIN-02.4 | Implementar FlatList com query ordenada por data (`data >= hoje`) | Eventos futuros em ordem cronológica; passados não aparecem | 1 |
| SIN-02.5 | Adicionar estados de carregamento e lista vazia | Spinner durante o fetch; mensagem amigável se não houver eventos | 0,5 |

### SIN-03 · Detalhe do evento

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| SIN-03.1 | Construir UI da tela de detalhe | Título, descrição completa, data, horário, local, organizador | 1 |
| SIN-03.2 | Conectar navegação feed → detalhe com `eventoId` por parâmetro | Documento individual buscado no Firestore; voltar preserva a posição do feed | 1 |

### SIN-04 · Inscrição em evento

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| SIN-04.1 | Decidir e documentar o modelo de inscrição (subcoleção vs. array de UIDs) | Decisão registrada no README com justificativa | 0,5 |
| SIN-04.2 | Implementar `inscrever(eventoId)` e `cancelarInscricao(eventoId)` | Dupla inscrição impossível; funções tratam erro de rede | 1 |
| SIN-04.3 | Conectar botão Inscrever-se com os 3 estados (disponível · inscrito · cancelando) | Botão muda para "Inscrito ✓"; tocar de novo oferece cancelamento com confirmação | 1 |

### SIN-05 · Meus Eventos

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| SIN-05.1 | Implementar query de eventos por UID inscrito | Apenas eventos do usuário logado retornam | 1 |
| SIN-05.2 | Construir tela com seções "Próximos" e "Já aconteceram" | SectionList com as duas seções; reutiliza `CardEvento` | 1 |

### SIN-06 · Calendário mensal

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| SIN-06.1 | Avaliar e decidir: `react-native-calendars` ou calendário próprio | Prova de conceito das duas opções; decisão registrada no README | 1 |
| SIN-06.2 | Construir o mini-calendário da Home com marcadores | Dias com evento marcados; mês atual por padrão | 1 |
| SIN-06.3 | Construir o calendário completo (tela própria) | Navegação entre meses; marcadores consistentes com o mini | 1 |
| SIN-06.4 | Listar eventos do dia ao tocar em uma data | Lista abaixo do calendário; toque no evento abre o detalhe | 1 |

### SIN-07 · Cadastro de evento (organizador)

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| SIN-07.1 | Construir UI do formulário (título, descrição, data, horário, local, categoria) | Conforme wireframe; campos controlados | 1 |
| SIN-07.2 | Integrar DateTimePicker para data e horário | Seleção nativa funcionando em Android | 1 |
| SIN-07.3 | Implementar validações (obrigatórios + data futura) | Mensagens de erro campo a campo; botão salvar desabilitado se inválido | 1 |
| SIN-07.4 | Gravar evento no Firestore com `criadoPor: uid` | Evento aparece no feed imediatamente após salvar | 0,5 |
| SIN-07.5 | Restringir o acesso à tela ao perfil organizador | Participante não navega até a tela nem por rota direta | 0,5 |

---

## 🟢 Sprint 3 — Polimento (Semanas 9–10)

### SIN-08 · Filtro por categoria

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| SIN-08.1 | Construir a linha de chips de categoria no topo do feed | Chips horizontais com scroll; "Todos" selecionado por padrão | 1 |
| SIN-08.2 | Aplicar o filtro à lista sem recarregar a tela | Estado local filtra os dados já carregados; troca instantânea | 0,5 |

### SIN-09 · Notificação de proximidade do evento

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| SIN-09.1 | Configurar `expo-notifications` com pedido de permissão | Recusa de permissão não quebra o fluxo de inscrição | 1 |
| SIN-09.2 | Agendar notificações na inscrição (1 dia antes + 1 hora antes) | IDs dos agendamentos salvos junto à inscrição | 1 |
| SIN-09.3 | Cancelar notificações ao cancelar a inscrição | Nenhuma notificação órfã após o cancelamento (testar) | 0,5 |

### SIN-10 · Favoritar eventos

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| SIN-10.1 | Implementar alternância de favorito (ícone de coração no card e no detalhe) | Estado persiste no Firestore por usuário | 1 |
| SIN-10.2 | Construir a lista de favoritos no menu | Reutiliza `CardEvento`; desfavoritar remove da lista na hora | 0,5 |

### SIN-11 · Acessibilidade básica

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| SIN-11.1 | Implementar opção de fonte maior (2 níveis) no perfil | Escala aplicada via contexto; persiste no AsyncStorage | 1 |
| SIN-11.2 | Auditar contraste e áreas de toque (mín. 44×44) em todas as telas | Checklist tela a tela na issue; correções aplicadas | 1 |

### Encerramento do Sprint 3

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| SIN-QA.1 | Teste cruzado com outra equipe + registro de bugs como issues `bug` | Sessão de 30 min; bugs com passos para reproduzir | 1 |
| SIN-QA.2 | Corrigir bugs priorizados | Issues críticas fechadas com commit referenciado | 2 |

---

## 📌 Definição de Pronto geral (vale para todo card)

- [ ] Código commitado em branch + Pull Request aberto
- [ ] PR revisado por pelo menos 1 colega (não o autor)
- [ ] Testado em dispositivo físico via Expo Go
- [ ] Sem `console.log` de depuração esquecido
- [ ] Card movido com comentário do que foi feito
