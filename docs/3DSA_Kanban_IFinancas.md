# Atividades Kanban — IFinanças

> Cada linha vira um *draft item* no GitHub Project. Fluxo: A Fazer → Fazendo → Em Review → Feito.
> **ID:** `IFI-NN.T` · Estimativa em **aulas** (1 aula ≈ 50 min). Nenhuma tarefa acima de 2 aulas.

## 🟣 Sprint 1 — Identidade e Login

### IFI-01 · Cadastro, login e sessão persistente
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFI-01.1 | Criar projeto Firebase e ativar Auth | Config em `firebaseConfig.js` | 0,5 |
| IFI-01.2 | UI das telas de Login e Cadastro | Campos controlados; validação local | 1,5 |
| IFI-01.3 | Integrar cadastro/login com Firebase Auth | Conta no console; erros tratados | 1 |
| IFI-01.4 | AuthContext + persistência + regras por UID | Cada usuário só vê os próprios dados | 1,5 |

## 🔵 Sprint 2 — Lógica de Negócio

### IFI-02 · Registrar gasto
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFI-02.1 | Modelar coleção transacoes/{uid} | Schema no README | 0,5 |
| IFI-02.2 | UI do formulário de gasto (valor, descrição, data) | Máscara monetária; DateTimePicker | 1,5 |
| IFI-02.3 | Gravar gasto no Firestore | Aparece na lista imediatamente | 1 |

### IFI-03 · Classificar gasto (escola/fora)
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFI-03.1 | Adicionar contexto (escola/fora) + categoria ao formulário | Campos salvos na transação | 1 |
| IFI-03.2 | Dashboard separa totais por contexto | Total escola vs. fora correto | 1 |

### IFI-04 · Listar e remover transações
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFI-04.1 | FlatList ordenada por data | Valor, descrição, categoria e contexto visíveis | 1 |
| IFI-04.2 | Remover transação com confirmação | Remoção atualiza lista e dashboard | 1 |

### IFI-05 · Dashboard com resumo financeiro
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFI-05.1 | Calcular totais do mês (gasto, por contexto) | Cálculo correto a partir das transações | 1 |
| IFI-05.2 | Cartões informativos no painel inicial | Saldo/receitas/despesas claros | 1 |
| IFI-05.3 | Atualização automática ao mudar transações | Recalcula sem recarregar manual | 0,5 |

### IFI-06 · Gráfico por categoria
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFI-06.1 | Avaliar e decidir lib de gráfico para RN | PoC + decisão no README | 1 |
| IFI-06.2 | Gráfico de gastos por categoria com legenda | Reflete dados reais do mês | 1,5 |

## 🟢 Sprint 3 — Polimento

### IFI-07 · Alertas de gastos
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFI-07.1 | Definir limite mensal no perfil | Limite persiste por usuário | 1 |
| IFI-07.2 | Aviso visual no dashboard ao ultrapassar | Alerta aparece ao exceder | 0,5 |

### IFI-08 · Metas financeiras
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFI-08.1 | Cadastro de meta (valor + prazo) | Meta salva no Firestore | 1 |
| IFI-08.2 | Barra de progresso da meta no dashboard | Progresso reflete os gastos/economia | 1 |

### IFI-09 · Relatório mensal e histórico
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFI-09.1 | Seletor de mês/ano | Troca o período exibido | 1 |
| IFI-09.2 | Resumo do mês selecionado | Mesmos cartões do dashboard, dados do período | 1 |

### Encerramento
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFI-QA.1 | Teste cruzado + registro de bugs | Sessão de 30 min; bugs reproduzíveis | 1 |
| IFI-QA.2 | Corrigir bugs priorizados | Issues críticas fechadas | 2 |

## 📌 Definição de Pronto geral
- [ ] Código em branch + PR aberto · [ ] PR revisado por 1 colega · [ ] Testado em dispositivo físico · [ ] Sem `console.log` esquecido
