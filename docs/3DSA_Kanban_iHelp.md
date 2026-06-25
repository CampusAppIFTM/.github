# Atividades Kanban — iHelp

> Cada linha vira um *draft item* no GitHub Project. Fluxo: A Fazer → Fazendo → Em Review → Feito.
> **ID:** `IHP-NN.T` · Estimativa em **aulas** (1 aula ≈ 50 min). Nenhuma tarefa acima de 2 aulas.

## 🟣 Sprint 1 — Identidade e Login

### IHP-01 · Cadastro e login (cliente/prestador)
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IHP-01.1 | Criar projeto Firebase e ativar Auth | Config em `firebaseConfig.js` | 0,5 |
| IHP-01.2 | UI Login/Cadastro com seleção de tipo | Escolha cliente/prestador no cadastro | 1,5 |
| IHP-01.3 | Integrar Auth + coleção usuarios com tipo | Documento criado; erros tratados | 1 |
| IHP-01.4 | AuthContext + navegação condicional + persistência | Cliente vê busca; prestador vê perfil profissional | 1,5 |

### IHP-02 · Cadastro do serviço do prestador
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IHP-02.1 | Modelar coleção prestadores | Schema no README | 0,5 |
| IHP-02.2 | UI do formulário de perfil profissional | Nome, categorias, descrição, contato, região | 1,5 |
| IHP-02.3 | Gravar/editar perfil no Firestore | Perfil salvo e editável pelo próprio prestador | 1 |

## 🔵 Sprint 2 — Lógica de Negócio

### IHP-03 · Listar prestadores
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IHP-03.1 | Componente CardPrestador | Nome, categoria e região visíveis | 1 |
| IHP-03.2 | FlatList carregando do Firestore | Estados de carregamento e lista vazia | 1 |

### IHP-04 · Detalhe do prestador
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IHP-04.1 | UI da tela de detalhe | Todos os dados do prestador | 1 |
| IHP-04.2 | Botão de contato via deep link (WhatsApp/telefone) | Abre o app de contato corretamente | 1 |

### IHP-05 · Categorias de serviço
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IHP-05.1 | Definir e documentar lista de categorias | Conjunto fixo no MVP | 0,5 |
| IHP-05.2 | Tela inicial com categorias principais | Toque lista prestadores da categoria | 1,5 |

### IHP-06 · Perfil profissional editável
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IHP-06.1 | Tela de edição do perfil do prestador | Alterações refletem na listagem | 1 |

## 🟢 Sprint 3 — Polimento

### IHP-07 · Avaliação por estrelas
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IHP-07.1 | Cliente dá nota de 1–5 a um prestador | Uma avaliação por cliente (atualizável) | 1,5 |
| IHP-07.2 | Média exibida no card e no detalhe | Cálculo correto da média | 1 |

### IHP-08 · Barra de pesquisa
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IHP-08.1 | Campo de busca por nome/serviço | Filtra a lista em tempo real | 1 |

### IHP-09 · Filtro por categoria
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IHP-09.1 | Chips de categoria na listagem | Filtro sem recarregar; "Todos" limpa | 1 |

### Encerramento
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IHP-QA.1 | Teste cruzado + registro de bugs | Sessão de 30 min; bugs reproduzíveis | 1 |
| IHP-QA.2 | Corrigir bugs priorizados | Issues críticas fechadas | 2 |

## 📌 Definição de Pronto geral
- [ ] Código em branch + PR aberto · [ ] PR revisado por 1 colega · [ ] Testado em dispositivo físico · [ ] Sem `console.log` esquecido
