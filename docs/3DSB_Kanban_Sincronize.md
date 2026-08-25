# Atividades Kanban — Sincronize

> **Como usar:** cada linha da coluna "Card" vira um *draft item* no GitHub Project (coluna **A Fazer** do sprint correspondente). Fluxo: A Fazer → Fazendo → Em Review → Feito.
> **Convenção de ID:** `SIN-NN.T` (issue NN, tarefa T). Estimativa em **aulas** (1 aula ≈ 50 min).
> **Atenção desta equipe (6 membros):** maior grupo da turma — paralelizar bem. Sugestão de frentes no Sprint 2: dupla A (feed/detalhe), dupla B (inscrição/meus eventos), dupla C (calendário/cadastro do organizador).

---

## 🟣 Sprint 1 — Identidade e Login (PADRÃO — igual para as 12 equipes)

> Baseado no codelab *Autenticação Firebase/Google*. Build nativo (`expo prebuild` + `run:android`), não Expo Go. Papéis de usuário só no Sprint 2.

### SIN-01 · Configurar Firebase e ativar login com Google
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| SIN-01.1 | Criar projeto no console do Firebase | Projeto criado; painel acessível | 0,5 |
| SIN-01.2 | Ativar provedor de login Google (Authentication) | Google ativado com nome e e-mail de suporte | 0,5 |
| SIN-01.3 | Registrar app Android + baixar google-services.json | Arquivo na raiz do projeto | 1 |
| SIN-01.4 | Gerar SHA-1 (gradlew signingReport) e cadastrar no Firebase | Impressão digital salva no Firebase | 1 |

### SIN-02 · Criar o app React Native e integrar as bibliotecas
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| SIN-02.1 | Criar projeto Expo e abrir no VS Code | Projeto roda localmente | 0,5 |
| SIN-02.2 | Instalar @react-native-google-signin/google-signin | Biblioteca no package.json | 0,5 |
| SIN-02.3 | Configurar app.json (googleServicesFile + plugin) | Config correta conforme codelab | 1 |
| SIN-02.4 | Rodar expo prebuild + expo run:android | App abre no dispositivo (build nativo) | 1,5 |

### SIN-03 · Implementar login e logout com Google
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| SIN-03.1 | Configurar GoogleSignin com webClientId | webClientId correto do google-services.json | 0,5 |
| SIN-03.2 | Botão Entrar chamando GoogleSignin.signIn() | Retorna o objeto user do Google | 1 |
| SIN-03.3 | ActivityIndicator durante o login | Indicador aparece enquanto autentica | 0,5 |
| SIN-03.4 | Botão Sair com GoogleSignin.signOut() | Logout volta à tela de login | 0,5 |

### SIN-04 · Rotas protegidas + Home + sessão persistente
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| SIN-04.1 | Renderização condicional (user ? Home : Login) | Telas protegidas conforme o login | 1 |
| SIN-04.2 | Home exibe nome e foto do usuário | Dados do objeto user na Home | 1 |
| SIN-04.3 | Estado global do usuário (Context) | user acessível em qualquer tela | 1 |
| SIN-04.4 | Persistir sessão (mantém login ao reabrir) | Fechar e reabrir mantém logado | 1 |

## 🔵 Sprint 2 — Lógica de Negócio (Semanas 7–8)

### SIN-05 · Feed de eventos

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| SIN-05.1 | Modelar coleção `eventos` e documentar o schema no README | `{ titulo, descricao, data, horario, local, categoria, criadoPor }` revisado pela equipe | 0,5 |
| SIN-05.2 | Popular 6 eventos de teste no Firestore | Dados realistas (palestras, esportes, cultura) para desenvolvimento | 0,5 |
| SIN-05.3 | Construir o componente `CardEvento` | Card com nome, data, horário, local e badge de categoria | 1 |
| SIN-05.4 | Implementar FlatList com query ordenada por data (`data >= hoje`) | Eventos futuros em ordem cronológica; passados não aparecem | 1 |
| SIN-05.5 | Adicionar estados de carregamento e lista vazia | Spinner durante o fetch; mensagem amigável se não houver eventos | 0,5 |

### SIN-06 · Detalhe do evento

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| SIN-06.1 | Construir UI da tela de detalhe | Título, descrição completa, data, horário, local, organizador | 1 |
| SIN-06.2 | Conectar navegação feed → detalhe com `eventoId` por parâmetro | Documento individual buscado no Firestore; voltar preserva a posição do feed | 1 |

### SIN-07 · Inscrição em evento

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| SIN-07.1 | Decidir e documentar o modelo de inscrição (subcoleção vs. array de UIDs) | Decisão registrada no README com justificativa | 0,5 |
| SIN-07.2 | Implementar `inscrever(eventoId)` e `cancelarInscricao(eventoId)` | Dupla inscrição impossível; funções tratam erro de rede | 1 |
| SIN-07.3 | Conectar botão Inscrever-se com os 3 estados (disponível · inscrito · cancelando) | Botão muda para "Inscrito ✓"; tocar de novo oferece cancelamento com confirmação | 1 |

### SIN-08 · Meus Eventos

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| SIN-08.1 | Implementar query de eventos por UID inscrito | Apenas eventos do usuário logado retornam | 1 |
| SIN-08.2 | Construir tela com seções "Próximos" e "Já aconteceram" | SectionList com as duas seções; reutiliza `CardEvento` | 1 |

### SIN-09 · Calendário mensal

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| SIN-09.1 | Avaliar e decidir: `react-native-calendars` ou calendário próprio | Prova de conceito das duas opções; decisão registrada no README | 1 |
| SIN-09.2 | Construir o mini-calendário da Home com marcadores | Dias com evento marcados; mês atual por padrão | 1 |
| SIN-09.3 | Construir o calendário completo (tela própria) | Navegação entre meses; marcadores consistentes com o mini | 1 |
| SIN-09.4 | Listar eventos do dia ao tocar em uma data | Lista abaixo do calendário; toque no evento abre o detalhe | 1 |

### SIN-10 · Cadastro de evento (organizador)

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| SIN-10.1 | Construir UI do formulário (título, descrição, data, horário, local, categoria) | Conforme wireframe; campos controlados | 1 |
| SIN-10.2 | Integrar DateTimePicker para data e horário | Seleção nativa funcionando em Android | 1 |
| SIN-10.3 | Implementar validações (obrigatórios + data futura) | Mensagens de erro campo a campo; botão salvar desabilitado se inválido | 1 |
| SIN-10.4 | Gravar evento no Firestore com `criadoPor: uid` | Evento aparece no feed imediatamente após salvar | 0,5 |
| SIN-10.5 | Restringir o acesso à tela ao perfil organizador | Participante não navega até a tela nem por rota direta | 0,5 |

---

## 🟢 Sprint 3 — Polimento (Semanas 9–10)

### SIN-11 · Filtro por categoria

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| SIN-11.1 | Construir a linha de chips de categoria no topo do feed | Chips horizontais com scroll; "Todos" selecionado por padrão | 1 |
| SIN-11.2 | Aplicar o filtro à lista sem recarregar a tela | Estado local filtra os dados já carregados; troca instantânea | 0,5 |

### SIN-12 · Notificação de proximidade do evento

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| SIN-12.1 | Configurar `expo-notifications` com pedido de permissão | Recusa de permissão não quebra o fluxo de inscrição | 1 |
| SIN-12.2 | Agendar notificações na inscrição (1 dia antes + 1 hora antes) | IDs dos agendamentos salvos junto à inscrição | 1 |
| SIN-12.3 | Cancelar notificações ao cancelar a inscrição | Nenhuma notificação órfã após o cancelamento (testar) | 0,5 |

### SIN-13 · Favoritar eventos

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| SIN-13.1 | Implementar alternância de favorito (ícone de coração no card e no detalhe) | Estado persiste no Firestore por usuário | 1 |
| SIN-13.2 | Construir a lista de favoritos no menu | Reutiliza `CardEvento`; desfavoritar remove da lista na hora | 0,5 |

### SIN-14 · Acessibilidade básica

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| SIN-14.1 | Implementar opção de fonte maior (2 níveis) no perfil | Escala aplicada via contexto; persiste no AsyncStorage | 1 |
| SIN-14.2 | Auditar contraste e áreas de toque (mín. 44×44) em todas as telas | Checklist tela a tela na issue; correções aplicadas | 1 |

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
