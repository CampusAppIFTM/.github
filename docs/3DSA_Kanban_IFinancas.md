# Atividades Kanban — IFinanças

> Cada linha vira um *draft item* no GitHub Project. Fluxo: A Fazer → Fazendo → Em Review → Feito.
> **ID:** `IFI-NN.T` · Estimativa em **aulas** (1 aula ≈ 50 min). Nenhuma tarefa acima de 2 aulas.

## 🟣 Sprint 1 — Identidade e Login (PADRÃO — igual para as 12 equipes)

> Baseado no codelab *Autenticação Firebase/Google*. Build nativo (`expo prebuild` + `run:android`), não Expo Go. Papéis de usuário só no Sprint 2.

### IFI-01 · Configurar Firebase e ativar login com Google
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFI-01.1 | Criar projeto no console do Firebase | Projeto criado; painel acessível | 0,5 |
| IFI-01.2 | Ativar provedor de login Google (Authentication) | Google ativado com nome e e-mail de suporte | 0,5 |
| IFI-01.3 | Registrar app Android + baixar google-services.json | Arquivo na raiz do projeto | 1 |
| IFI-01.4 | Gerar SHA-1 (gradlew signingReport) e cadastrar no Firebase | Impressão digital salva no Firebase | 1 |

### IFI-02 · Criar o app React Native e integrar as bibliotecas
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFI-02.1 | Criar projeto Expo e abrir no VS Code | Projeto roda localmente | 0,5 |
| IFI-02.2 | Instalar @react-native-google-signin/google-signin | Biblioteca no package.json | 0,5 |
| IFI-02.3 | Configurar app.json (googleServicesFile + plugin) | Config correta conforme codelab | 1 |
| IFI-02.4 | Rodar expo prebuild + expo run:android | App abre no dispositivo (build nativo) | 1,5 |

### IFI-03 · Implementar login e logout com Google
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFI-03.1 | Configurar GoogleSignin com webClientId | webClientId correto do google-services.json | 0,5 |
| IFI-03.2 | Botão Entrar chamando GoogleSignin.signIn() | Retorna o objeto user do Google | 1 |
| IFI-03.3 | ActivityIndicator durante o login | Indicador aparece enquanto autentica | 0,5 |
| IFI-03.4 | Botão Sair com GoogleSignin.signOut() | Logout volta à tela de login | 0,5 |

### IFI-04 · Rotas protegidas + Home + sessão persistente
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFI-04.1 | Renderização condicional (user ? Home : Login) | Telas protegidas conforme o login | 1 |
| IFI-04.2 | Home exibe nome e foto do usuário | Dados do objeto user na Home | 1 |
| IFI-04.3 | Estado global do usuário (Context) | user acessível em qualquer tela | 1 |
| IFI-04.4 | Persistir sessão (mantém login ao reabrir) | Fechar e reabrir mantém logado | 1 |

## 🔵 Sprint 2 — Lógica de Negócio

### IFI-05 · Registrar gasto
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFI-05.1 | Modelar coleção transacoes/{uid} | Schema no README | 0,5 |
| IFI-05.2 | UI do formulário de gasto (valor, descrição, data) | Máscara monetária; DateTimePicker | 1,5 |
| IFI-05.3 | Gravar gasto no Firestore | Aparece na lista imediatamente | 1 |

### IFI-06 · Classificar gasto (escola/fora)
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFI-06.1 | Adicionar contexto (escola/fora) + categoria ao formulário | Campos salvos na transação | 1 |
| IFI-06.2 | Dashboard separa totais por contexto | Total escola vs. fora correto | 1 |

### IFI-07 · Listar e remover transações
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFI-07.1 | FlatList ordenada por data | Valor, descrição, categoria e contexto visíveis | 1 |
| IFI-07.2 | Remover transação com confirmação | Remoção atualiza lista e dashboard | 1 |

### IFI-08 · Dashboard com resumo financeiro
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFI-08.1 | Calcular totais do mês (gasto, por contexto) | Cálculo correto a partir das transações | 1 |
| IFI-08.2 | Cartões informativos no painel inicial | Saldo/receitas/despesas claros | 1 |
| IFI-08.3 | Atualização automática ao mudar transações | Recalcula sem recarregar manual | 0,5 |

### IFI-09 · Gráfico por categoria
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFI-09.1 | Avaliar e decidir lib de gráfico para RN | PoC + decisão no README | 1 |
| IFI-09.2 | Gráfico de gastos por categoria com legenda | Reflete dados reais do mês | 1,5 |

## 🟢 Sprint 3 — Polimento

### IFI-10 · Alertas de gastos
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFI-10.1 | Definir limite mensal no perfil | Limite persiste por usuário | 1 |
| IFI-10.2 | Aviso visual no dashboard ao ultrapassar | Alerta aparece ao exceder | 0,5 |

### IFI-11 · Metas financeiras
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFI-11.1 | Cadastro de meta (valor + prazo) | Meta salva no Firestore | 1 |
| IFI-11.2 | Barra de progresso da meta no dashboard | Progresso reflete os gastos/economia | 1 |

### IFI-12 · Relatório mensal e histórico
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFI-12.1 | Seletor de mês/ano | Troca o período exibido | 1 |
| IFI-12.2 | Resumo do mês selecionado | Mesmos cartões do dashboard, dados do período | 1 |

### Encerramento
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFI-QA.1 | Teste cruzado + registro de bugs | Sessão de 30 min; bugs reproduzíveis | 1 |
| IFI-QA.2 | Corrigir bugs priorizados | Issues críticas fechadas | 2 |

## 📌 Definição de Pronto geral
- [ ] Código em branch + PR aberto · [ ] PR revisado por 1 colega · [ ] Testado em dispositivo físico · [ ] Sem `console.log` esquecido
