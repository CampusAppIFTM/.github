# Atividades Kanban — iHelp

> Cada linha vira um *draft item* no GitHub Project. Fluxo: A Fazer → Fazendo → Em Review → Feito.
> **ID:** `IHP-NN.T` · Estimativa em **aulas** (1 aula ≈ 50 min). Nenhuma tarefa acima de 2 aulas.

## 🟣 Sprint 1 — Identidade e Login (PADRÃO — igual para as 12 equipes)

> Baseado no codelab *Autenticação Firebase/Google*. Build nativo (`expo prebuild` + `run:android`), não Expo Go. Papéis de usuário só no Sprint 2.

### IHP-01 · Configurar Firebase e ativar login com Google
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IHP-01.1 | Criar projeto no console do Firebase | Projeto criado; painel acessível | 0,5 |
| IHP-01.2 | Ativar provedor de login Google (Authentication) | Google ativado com nome e e-mail de suporte | 0,5 |
| IHP-01.3 | Registrar app Android + baixar google-services.json | Arquivo na raiz do projeto | 1 |
| IHP-01.4 | Gerar SHA-1 (gradlew signingReport) e cadastrar no Firebase | Impressão digital salva no Firebase | 1 |

### IHP-02 · Criar o app React Native e integrar as bibliotecas
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IHP-02.1 | Criar projeto Expo e abrir no VS Code | Projeto roda localmente | 0,5 |
| IHP-02.2 | Instalar @react-native-google-signin/google-signin | Biblioteca no package.json | 0,5 |
| IHP-02.3 | Configurar app.json (googleServicesFile + plugin) | Config correta conforme codelab | 1 |
| IHP-02.4 | Rodar expo prebuild + expo run:android | App abre no dispositivo (build nativo) | 1,5 |

### IHP-03 · Implementar login e logout com Google
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IHP-03.1 | Configurar GoogleSignin com webClientId | webClientId correto do google-services.json | 0,5 |
| IHP-03.2 | Botão Entrar chamando GoogleSignin.signIn() | Retorna o objeto user do Google | 1 |
| IHP-03.3 | ActivityIndicator durante o login | Indicador aparece enquanto autentica | 0,5 |
| IHP-03.4 | Botão Sair com GoogleSignin.signOut() | Logout volta à tela de login | 0,5 |

### IHP-04 · Rotas protegidas + Home + sessão persistente
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IHP-04.1 | Renderização condicional (user ? Home : Login) | Telas protegidas conforme o login | 1 |
| IHP-04.2 | Home exibe nome e foto do usuário | Dados do objeto user na Home | 1 |
| IHP-04.3 | Estado global do usuário (Context) | user acessível em qualquer tela | 1 |
| IHP-04.4 | Persistir sessão (mantém login ao reabrir) | Fechar e reabrir mantém logado | 1 |

## 🔵 Sprint 2 — Lógica de Negócio

### IHP-05 · Listar prestadores
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IHP-05.1 | Componente CardPrestador | Nome, categoria e região visíveis | 1 |
| IHP-05.2 | FlatList carregando do Firestore | Estados de carregamento e lista vazia | 1 |

### IHP-06 · Detalhe do prestador
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IHP-06.1 | UI da tela de detalhe | Todos os dados do prestador | 1 |
| IHP-06.2 | Botão de contato via deep link (WhatsApp/telefone) | Abre o app de contato corretamente | 1 |

### IHP-07 · Categorias de serviço
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IHP-07.1 | Definir e documentar lista de categorias | Conjunto fixo no MVP | 0,5 |
| IHP-07.2 | Tela inicial com categorias principais | Toque lista prestadores da categoria | 1,5 |

### IHP-08 · Perfil profissional editável
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IHP-08.1 | Tela de edição do perfil do prestador | Alterações refletem na listagem | 1 |

## 🟢 Sprint 3 — Polimento

### IHP-09 · Avaliação por estrelas
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IHP-09.1 | Cliente dá nota de 1–5 a um prestador | Uma avaliação por cliente (atualizável) | 1,5 |
| IHP-09.2 | Média exibida no card e no detalhe | Cálculo correto da média | 1 |

### IHP-10 · Barra de pesquisa
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IHP-10.1 | Campo de busca por nome/serviço | Filtra a lista em tempo real | 1 |

### IHP-11 · Filtro por categoria
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IHP-11.1 | Chips de categoria na listagem | Filtro sem recarregar; "Todos" limpa | 1 |

### Encerramento
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IHP-QA.1 | Teste cruzado + registro de bugs | Sessão de 30 min; bugs reproduzíveis | 1 |
| IHP-QA.2 | Corrigir bugs priorizados | Issues críticas fechadas | 2 |

## 📌 Definição de Pronto geral
- [ ] Código em branch + PR aberto · [ ] PR revisado por 1 colega · [ ] Testado em dispositivo físico · [ ] Sem `console.log` esquecido
