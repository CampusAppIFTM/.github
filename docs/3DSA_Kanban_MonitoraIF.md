# Atividades Kanban — MonitoraIF

> Cada linha vira um *draft item* no GitHub Project. Fluxo: A Fazer → Fazendo → Em Review → Feito.
> **ID:** `MIF-NN.T` · Estimativa em **aulas** (1 aula ≈ 50 min). Nenhuma tarefa acima de 2 aulas.

## 🟣 Sprint 1 — Identidade e Login (PADRÃO — igual para as 12 equipes)

> Baseado no codelab *Autenticação Firebase/Google*. Build nativo (`expo prebuild` + `run:android`), não Expo Go. Papéis de usuário só no Sprint 2.

### MIF-01 · Configurar Firebase e ativar login com Google
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MIF-01.1 | Criar projeto no console do Firebase | Projeto criado; painel acessível | 0,5 |
| MIF-01.2 | Ativar provedor de login Google (Authentication) | Google ativado com nome e e-mail de suporte | 0,5 |
| MIF-01.3 | Registrar app Android + baixar google-services.json | Arquivo na raiz do projeto | 1 |
| MIF-01.4 | Gerar SHA-1 (gradlew signingReport) e cadastrar no Firebase | Impressão digital salva no Firebase | 1 |

### MIF-02 · Criar o app React Native e integrar as bibliotecas
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MIF-02.1 | Criar projeto Expo e abrir no VS Code | Projeto roda localmente | 0,5 |
| MIF-02.2 | Instalar @react-native-google-signin/google-signin | Biblioteca no package.json | 0,5 |
| MIF-02.3 | Configurar app.json (googleServicesFile + plugin) | Config correta conforme codelab | 1 |
| MIF-02.4 | Rodar expo prebuild + expo run:android | App abre no dispositivo (build nativo) | 1,5 |

### MIF-03 · Implementar login e logout com Google
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MIF-03.1 | Configurar GoogleSignin com webClientId | webClientId correto do google-services.json | 0,5 |
| MIF-03.2 | Botão Entrar chamando GoogleSignin.signIn() | Retorna o objeto user do Google | 1 |
| MIF-03.3 | ActivityIndicator durante o login | Indicador aparece enquanto autentica | 0,5 |
| MIF-03.4 | Botão Sair com GoogleSignin.signOut() | Logout volta à tela de login | 0,5 |

### MIF-04 · Rotas protegidas + Home + sessão persistente
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MIF-04.1 | Renderização condicional (user ? Home : Login) | Telas protegidas conforme o login | 1 |
| MIF-04.2 | Home exibe nome e foto do usuário | Dados do objeto user na Home | 1 |
| MIF-04.3 | Estado global do usuário (Context) | user acessível em qualquer tela | 1 |
| MIF-04.4 | Persistir sessão (mantém login ao reabrir) | Fechar e reabrir mantém logado | 1 |

## 🔵 Sprint 2 — Lógica de Negócio

### MIF-05 · Postar dúvida no mural
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MIF-05.1 | Modelar coleção duvidas | Schema no README | 0,5 |
| MIF-05.2 | UI do formulário (matéria, título, descrição) | Validação de obrigatórios | 1 |
| MIF-05.3 | Gravar dúvida com status "aberta" | Aparece no mural imediatamente | 1 |

### MIF-06 · Mural de dúvidas (listagem)
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MIF-06.1 | Componente CardDuvida | Matéria, título, autor e status visíveis | 1 |
| MIF-06.2 | FlatList com onSnapshot (tempo real) | Nova dúvida aparece sem recarregar | 1 |

### MIF-07 · Detalhe da dúvida
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MIF-07.1 | UI do detalhe (dúvida completa + respostas) | Status visível | 1 |

### MIF-08 · Responder dúvida (monitor)
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MIF-08.1 | Subcoleção de respostas + campo de resposta (só monitor) | Resposta gravada na publicação | 1 |
| MIF-08.2 | Respostas em tempo real (onSnapshot) + status "respondida" | Aparece sem recarregar; status muda | 1 |

### MIF-09 · Marcar como resolvida (aluno)
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MIF-09.1 | Botão "Resolvida" só para o autor | Status muda; destaque no mural | 1 |

## 🟢 Sprint 3 — Polimento

### MIF-10 · Calendário de horários de atendimento
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MIF-10.1 | Monitor cadastra horários disponíveis | Coleção atendimentos gravada | 1,5 |
| MIF-10.2 | Aluno visualiza horários por monitor/disciplina | Lista clara dos horários | 1 |

### MIF-11 · Filtrar dúvidas por matéria
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MIF-11.1 | Chips de matéria no mural | Filtro sem recarregar | 1 |

### Encerramento
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MIF-QA.1 | Teste cruzado + registro de bugs | Sessão de 30 min; bugs reproduzíveis | 1 |
| MIF-QA.2 | Corrigir bugs priorizados | Issues críticas fechadas | 2 |

## 📌 Definição de Pronto geral
- [ ] Código em branch + PR aberto · [ ] PR revisado por 1 colega · [ ] Testado em dispositivo físico · [ ] Sem `console.log` esquecido
