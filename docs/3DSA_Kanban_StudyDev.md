# Atividades Kanban — StudyDev

> Cada linha vira um *draft item* no GitHub Project. Fluxo: A Fazer → Fazendo → Em Review → Feito.
> **ID:** `STD-NN.T` · Estimativa em **aulas** (1 aula ≈ 50 min). Nenhuma tarefa acima de 2 aulas.
> **Atenção:** o conteúdo das trilhas (STD-03) corre em paralelo ao código desde a primeira semana, dividido entre os 5 membros.

## 🟣 Sprint 1 — Identidade e Login (PADRÃO — igual para as 12 equipes)

> Baseado no codelab *Autenticação Firebase/Google*. Build nativo (`expo prebuild` + `run:android`), não Expo Go. Papéis de usuário só no Sprint 2.

### STD-01 · Configurar Firebase e ativar login com Google
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| STD-01.1 | Criar projeto no console do Firebase | Projeto criado; painel acessível | 0,5 |
| STD-01.2 | Ativar provedor de login Google (Authentication) | Google ativado com nome e e-mail de suporte | 0,5 |
| STD-01.3 | Registrar app Android + baixar google-services.json | Arquivo na raiz do projeto | 1 |
| STD-01.4 | Gerar SHA-1 (gradlew signingReport) e cadastrar no Firebase | Impressão digital salva no Firebase | 1 |

### STD-02 · Criar o app React Native e integrar as bibliotecas
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| STD-02.1 | Criar projeto Expo e abrir no VS Code | Projeto roda localmente | 0,5 |
| STD-02.2 | Instalar @react-native-google-signin/google-signin | Biblioteca no package.json | 0,5 |
| STD-02.3 | Configurar app.json (googleServicesFile + plugin) | Config correta conforme codelab | 1 |
| STD-02.4 | Rodar expo prebuild + expo run:android | App abre no dispositivo (build nativo) | 1,5 |

### STD-03 · Implementar login e logout com Google
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| STD-03.1 | Configurar GoogleSignin com webClientId | webClientId correto do google-services.json | 0,5 |
| STD-03.2 | Botão Entrar chamando GoogleSignin.signIn() | Retorna o objeto user do Google | 1 |
| STD-03.3 | ActivityIndicator durante o login | Indicador aparece enquanto autentica | 0,5 |
| STD-03.4 | Botão Sair com GoogleSignin.signOut() | Logout volta à tela de login | 0,5 |

### STD-04 · Rotas protegidas + Home + sessão persistente
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| STD-04.1 | Renderização condicional (user ? Home : Login) | Telas protegidas conforme o login | 1 |
| STD-04.2 | Home exibe nome e foto do usuário | Dados do objeto user na Home | 1 |
| STD-04.3 | Estado global do usuário (Context) | user acessível em qualquer tela | 1 |
| STD-04.4 | Persistir sessão (mantém login ao reabrir) | Fechar e reabrir mantém logado | 1 |

## 🔵 Sprint 2 — Lógica de Negócio

### STD-05 · Modelo de progresso do aluno
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| STD-05.1 | Documentar schema de progresso | Estrutura no README | 0,5 |
| STD-05.2 | Criar progresso/{uid} + hook useProgresso() | Hook lê/atualiza; carrega ao abrir | 1,5 |

### STD-06 · Conteúdo das trilhas (paralelo)
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| STD-06.1 | Schema da aula + 1 aula-modelo | Estrutura aprovada de referência | 1 |
| STD-06.2 | Escrever trilha 1 (3 mód × 3 aulas) | Conteúdo objetivo; revisão em dupla | 2 |
| STD-06.3 | Escrever trilha 2 (3 mód × 3 aulas) | Mesmo padrão | 2 |
| STD-06.4 | Carregar trilhas no Firestore | Conteúdo consultável; script commitado | 1 |

### STD-07 · Tela de trilhas (Home)
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| STD-07.1 | Componente CardTrilha com progresso | Título, ícone e progresso resumido | 1 |
| STD-07.2 | Grid/lista de trilhas carregando do Firestore | Toque abre os módulos/aulas | 1 |

### STD-08 · Lista de aulas da trilha
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| STD-08.1 | Aulas agrupadas por módulo, em ordem | Indicador concluída/não concluída | 1,5 |
| STD-08.2 | Navegação aula → tela de conteúdo | Abre a aula correta | 0,5 |

### STD-09 · Tela de aula (conteúdo)
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| STD-09.1 | UI do conteúdo (texto + link de vídeo opcional) | Legível; vídeo abre quando existe | 1 |
| STD-09.2 | Botão "Marcar como concluída" atualiza progresso | Reflete na lista de aulas ao voltar | 1 |

## 🟢 Sprint 3 — Polimento

### STD-10 · Motivação diária (streak)
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| STD-10.1 | Contador de dias consecutivos de estudo | Streak calculado a partir do progresso | 1,5 |
| STD-10.2 | Mensagem motivacional diária (mín. 5 textos) | Texto varia por dia | 0,5 |

### STD-11 · Notificações de estudo
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| STD-11.1 | expo-notifications + permissão | Recusa não quebra o app | 0,5 |
| STD-11.2 | Lembrete diário em horário escolhido pelo usuário | Dispara no horário; ativável/desativável | 1 |

### STD-12 · Modo escuro (icebox)
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| STD-12.1 | ThemeContext claro/escuro persistido | Alternância no perfil; sobrevive ao restart | 1,5 |

### Encerramento
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| STD-QA.1 | Teste cruzado + registro de bugs | Sessão de 30 min; bugs reproduzíveis | 1 |
| STD-QA.2 | Corrigir bugs priorizados | Issues críticas fechadas | 2 |
| STD-QA.3 | Revisão de conteúdo: percorrer todas as trilhas | Erros de texto/links corrigidos | 1 |

## 📌 Definição de Pronto geral
- [ ] Código em branch + PR aberto · [ ] PR revisado por 1 colega · [ ] Testado em dispositivo físico · [ ] Sem `console.log` esquecido
