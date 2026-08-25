# Atividades Kanban — Avisa IF

> Cada linha vira um *draft item* no GitHub Project. Fluxo: A Fazer → Fazendo → Em Review → Feito.
> **ID:** `AVI-NN.T` · Estimativa em **aulas** (1 aula ≈ 50 min). Nenhuma tarefa acima de 2 aulas.

## 🟣 Sprint 1 — Identidade e Login (PADRÃO — igual para as 12 equipes)

> Baseado no codelab *Autenticação Firebase/Google*. Build nativo (`expo prebuild` + `run:android`), não Expo Go. Papéis de usuário só no Sprint 2.

### AVI-01 · Configurar Firebase e ativar login com Google
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| AVI-01.1 | Criar projeto no console do Firebase | Projeto criado; painel acessível | 0,5 |
| AVI-01.2 | Ativar provedor de login Google (Authentication) | Google ativado com nome e e-mail de suporte | 0,5 |
| AVI-01.3 | Registrar app Android + baixar google-services.json | Arquivo na raiz do projeto | 1 |
| AVI-01.4 | Gerar SHA-1 (gradlew signingReport) e cadastrar no Firebase | Impressão digital salva no Firebase | 1 |

### AVI-02 · Criar o app React Native e integrar as bibliotecas
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| AVI-02.1 | Criar projeto Expo e abrir no VS Code | Projeto roda localmente | 0,5 |
| AVI-02.2 | Instalar @react-native-google-signin/google-signin | Biblioteca no package.json | 0,5 |
| AVI-02.3 | Configurar app.json (googleServicesFile + plugin) | Config correta conforme codelab | 1 |
| AVI-02.4 | Rodar expo prebuild + expo run:android | App abre no dispositivo (build nativo) | 1,5 |

### AVI-03 · Implementar login e logout com Google
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| AVI-03.1 | Configurar GoogleSignin com webClientId | webClientId correto do google-services.json | 0,5 |
| AVI-03.2 | Botão Entrar chamando GoogleSignin.signIn() | Retorna o objeto user do Google | 1 |
| AVI-03.3 | ActivityIndicator durante o login | Indicador aparece enquanto autentica | 0,5 |
| AVI-03.4 | Botão Sair com GoogleSignin.signOut() | Logout volta à tela de login | 0,5 |

### AVI-04 · Rotas protegidas + Home + sessão persistente
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| AVI-04.1 | Renderização condicional (user ? Home : Login) | Telas protegidas conforme o login | 1 |
| AVI-04.2 | Home exibe nome e foto do usuário | Dados do objeto user na Home | 1 |
| AVI-04.3 | Estado global do usuário (Context) | user acessível em qualquer tela | 1 |
| AVI-04.4 | Persistir sessão (mantém login ao reabrir) | Fechar e reabrir mantém logado | 1 |

## 🔵 Sprint 2 — Lógica de Negócio

### AVI-05 · Criar e entrar em grupos
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| AVI-05.1 | Modelar coleção grupos (nome, cor, codigo, membros) | Schema no README | 0,5 |
| AVI-05.2 | UI de criar grupo (nome + cor + geração de código) | Grupo criado com código de convite único | 1,5 |
| AVI-05.3 | UI de entrar via código | Código válido adiciona o usuário; inválido avisa | 1 |
| AVI-05.4 | Componente CardGrupo colorido | Card exibe nome com a cor do grupo | 1 |

### AVI-06 · Listar grupos na Home
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| AVI-06.1 | FlatList dos grupos do usuário | Lista carrega do Firestore; toque abre os avisos | 1 |
| AVI-06.2 | Botão "+" com opções criar/entrar | Abre as duas ações conforme o Canvas | 0,5 |

### AVI-07 · Publicar aviso em um grupo
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| AVI-07.1 | UI do formulário de aviso (título, descrição, data, tipo) | DateTimePicker; validação de obrigatórios | 1 |
| AVI-07.2 | Gravar aviso na subcoleção do grupo | Aviso aparece para todos os membros | 1 |

### AVI-08 · Agenda ordenada por data
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| AVI-08.1 | Query dos avisos de todos os grupos do usuário | Retorna avisos de todos os grupos | 1 |
| AVI-08.2 | Tela de agenda agrupada por dia, com cor do grupo | SectionList ordenada; cor de origem visível | 1,5 |
| AVI-08.3 | Separar avisos futuros e passados | Seções distintas | 0,5 |

### AVI-09 · Status do aviso (pendente/concluído)
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| AVI-09.1 | Marcar aviso como concluído (pessoal por usuário) | Conclusão não afeta outros membros | 1 |
| AVI-09.2 | Estilo atenuado para avisos concluídos | Visual claro de pendente vs. concluído | 0,5 |

## 🟢 Sprint 3 — Polimento

### AVI-10 · Filtrar avisos por grupo
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| AVI-10.1 | Chips dos grupos do usuário na agenda | Filtro sem recarregar; "Todos" limpa | 1 |

### AVI-11 · Notificação de aviso próximo
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| AVI-11.1 | Configurar expo-notifications + permissão | Recusa não quebra o app | 0,5 |
| AVI-11.2 | Agendar notificação 1 dia antes do aviso | Dispara em dispositivo físico; cancela se aviso removido | 1,5 |

### AVI-12 · Animações de transição (icebox)
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| AVI-12.1 | Transições suaves entre telas | Sem perda de performance | 1 |

### Encerramento
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| AVI-QA.1 | Teste cruzado + registro de bugs | Sessão de 30 min; bugs reproduzíveis | 1 |
| AVI-QA.2 | Corrigir bugs priorizados | Issues críticas fechadas | 2 |

## 📌 Definição de Pronto geral
- [ ] Código em branch + PR aberto · [ ] PR revisado por 1 colega · [ ] Testado em dispositivo físico · [ ] Sem `console.log` esquecido
