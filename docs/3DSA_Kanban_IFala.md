# Atividades Kanban — IFala

> Cada linha vira um *draft item* no GitHub Project. Fluxo: A Fazer → Fazendo → Em Review → Feito.
> **ID:** `IFA-NN.T` · Estimativa em **aulas** (1 aula ≈ 50 min). Nenhuma tarefa acima de 2 aulas.
> **Tema sensível:** ver o checklist do backlog antes do Sprint 2 (compromisso da coordenação + texto de privacidade).

## 🟣 Sprint 1 — Identidade e Login (PADRÃO — igual para as 12 equipes)

> Baseado no codelab *Autenticação Firebase/Google*. Build nativo (`expo prebuild` + `run:android`), não Expo Go. Papéis de usuário só no Sprint 2.

### IFA-01 · Configurar Firebase e ativar login com Google
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFA-01.1 | Criar projeto no console do Firebase | Projeto criado; painel acessível | 0,5 |
| IFA-01.2 | Ativar provedor de login Google (Authentication) | Google ativado com nome e e-mail de suporte | 0,5 |
| IFA-01.3 | Registrar app Android + baixar google-services.json | Arquivo na raiz do projeto | 1 |
| IFA-01.4 | Gerar SHA-1 (gradlew signingReport) e cadastrar no Firebase | Impressão digital salva no Firebase | 1 |

### IFA-02 · Criar o app React Native e integrar as bibliotecas
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFA-02.1 | Criar projeto Expo e abrir no VS Code | Projeto roda localmente | 0,5 |
| IFA-02.2 | Instalar @react-native-google-signin/google-signin | Biblioteca no package.json | 0,5 |
| IFA-02.3 | Configurar app.json (googleServicesFile + plugin) | Config correta conforme codelab | 1 |
| IFA-02.4 | Rodar expo prebuild + expo run:android | App abre no dispositivo (build nativo) | 1,5 |

### IFA-03 · Implementar login e logout com Google
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFA-03.1 | Configurar GoogleSignin com webClientId | webClientId correto do google-services.json | 0,5 |
| IFA-03.2 | Botão Entrar chamando GoogleSignin.signIn() | Retorna o objeto user do Google | 1 |
| IFA-03.3 | ActivityIndicator durante o login | Indicador aparece enquanto autentica | 0,5 |
| IFA-03.4 | Botão Sair com GoogleSignin.signOut() | Logout volta à tela de login | 0,5 |

### IFA-04 · Rotas protegidas + Home + sessão persistente
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFA-04.1 | Renderização condicional (user ? Home : Login) | Telas protegidas conforme o login | 1 |
| IFA-04.2 | Home exibe nome e foto do usuário | Dados do objeto user na Home | 1 |
| IFA-04.3 | Estado global do usuário (Context) | user acessível em qualquer tela | 1 |
| IFA-04.4 | Persistir sessão (mantém login ao reabrir) | Fechar e reabrir mantém logado | 1 |

## 🔵 Sprint 2 — Lógica de Negócio

### IFA-05 · Enviar reclamação
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFA-05.1 | Modelar coleção reclamacoes | Schema no README; `autorUid` guardado mas protegido | 0,5 |
| IFA-05.2 | UI do formulário (categoria + texto) | Validação de obrigatórios | 1 |
| IFA-05.3 | Gravar reclamação com status "aberta" + confirmação | Aluno recebe confirmação de envio | 1 |

### IFA-06 · Exibição sem identificação à coordenação
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFA-06.1 | Regras do Firestore que ocultam autorUid da coordenação | Coordenação não consegue ler o autor (testar) | 1,5 |
| IFA-06.2 | Texto de transparência na tela de envio (revisado pelo professor) | Mensagem honesta sobre o nível de privacidade | 0,5 |

### IFA-07 · Minhas reclamações (aluno)
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFA-07.1 | Lista das reclamações do próprio usuário com status | Só as do autor aparecem | 1 |
| IFA-07.2 | Detalhe com a resposta da coordenação | Resposta visível quando existir | 1 |

### IFA-08 · Painel de reclamações (coordenação)
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFA-08.1 | FlatList sem identificação do autor | Ordenada por recentes; status visível | 1 |
| IFA-08.2 | Abrir detalhe para análise | Texto completo e categoria visíveis | 1 |

### IFA-09 · Responder reclamação (coordenação)
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFA-09.1 | Campo de resposta + mudança de status | aberta → em análise → respondida | 1 |
| IFA-09.2 | Resposta reflete em "Minhas reclamações" via onSnapshot | Aluno vê a atualização sem recarregar | 1 |

## 🟢 Sprint 3 — Polimento

### IFA-10 · Filtrar por categoria
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFA-10.1 | Chips de categoria no painel da coordenação | Filtro sem recarregar | 1 |

### IFA-11 · Anexar evidência (foto)
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFA-11.1 | Anexo opcional de imagem (galeria/câmera) | expo-image-picker + Firebase Storage | 1,5 |
| IFA-11.2 | Imagem visível no detalhe sem expor o autor | Coordenação vê a foto, não o autor | 1 |

### Encerramento
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFA-QA.1 | Teste cruzado + registro de bugs | Sessão de 30 min; bugs reproduzíveis | 1 |
| IFA-QA.2 | Corrigir bugs priorizados | Issues críticas fechadas | 2 |
| IFA-QA.3 | Revisar a proteção do autor com cenário real | Confirmar que coordenação nunca vê quem enviou | 1 |

## 📌 Definição de Pronto geral
- [ ] Código em branch + PR aberto · [ ] PR revisado por 1 colega · [ ] Testado em dispositivo físico · [ ] Sem `console.log` esquecido
