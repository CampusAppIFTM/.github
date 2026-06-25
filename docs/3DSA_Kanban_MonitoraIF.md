# Atividades Kanban — MonitoraIF

> Cada linha vira um *draft item* no GitHub Project. Fluxo: A Fazer → Fazendo → Em Review → Feito.
> **ID:** `MIF-NN.T` · Estimativa em **aulas** (1 aula ≈ 50 min). Nenhuma tarefa acima de 2 aulas.

## 🟣 Sprint 1 — Identidade e Login

### MIF-01 · Cadastro e login
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MIF-01.1 | Criar projeto Firebase e ativar Auth | Config em `firebaseConfig.js` | 0,5 |
| MIF-01.2 | UI das telas de Login e Cadastro | Campos controlados; validação local | 1,5 |
| MIF-01.3 | Integrar Auth + AuthContext + persistência | Sessão sobrevive ao restart; logout | 1,5 |

### MIF-02 · Papéis de Aluno e Monitor
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MIF-02.1 | Coleção usuarios com papel + seleção no cadastro | Documento criado com papel | 0,5 |
| MIF-02.2 | Expor papel no AuthContext + permissões | Monitor responde; aluno posta | 1 |

## 🔵 Sprint 2 — Lógica de Negócio

### MIF-03 · Postar dúvida no mural
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MIF-03.1 | Modelar coleção duvidas | Schema no README | 0,5 |
| MIF-03.2 | UI do formulário (matéria, título, descrição) | Validação de obrigatórios | 1 |
| MIF-03.3 | Gravar dúvida com status "aberta" | Aparece no mural imediatamente | 1 |

### MIF-04 · Mural de dúvidas (listagem)
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MIF-04.1 | Componente CardDuvida | Matéria, título, autor e status visíveis | 1 |
| MIF-04.2 | FlatList com onSnapshot (tempo real) | Nova dúvida aparece sem recarregar | 1 |

### MIF-05 · Detalhe da dúvida
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MIF-05.1 | UI do detalhe (dúvida completa + respostas) | Status visível | 1 |

### MIF-06 · Responder dúvida (monitor)
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MIF-06.1 | Subcoleção de respostas + campo de resposta (só monitor) | Resposta gravada na publicação | 1 |
| MIF-06.2 | Respostas em tempo real (onSnapshot) + status "respondida" | Aparece sem recarregar; status muda | 1 |

### MIF-07 · Marcar como resolvida (aluno)
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MIF-07.1 | Botão "Resolvida" só para o autor | Status muda; destaque no mural | 1 |

## 🟢 Sprint 3 — Polimento

### MIF-08 · Calendário de horários de atendimento
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MIF-08.1 | Monitor cadastra horários disponíveis | Coleção atendimentos gravada | 1,5 |
| MIF-08.2 | Aluno visualiza horários por monitor/disciplina | Lista clara dos horários | 1 |

### MIF-09 · Filtrar dúvidas por matéria
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MIF-09.1 | Chips de matéria no mural | Filtro sem recarregar | 1 |

### Encerramento
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| MIF-QA.1 | Teste cruzado + registro de bugs | Sessão de 30 min; bugs reproduzíveis | 1 |
| MIF-QA.2 | Corrigir bugs priorizados | Issues críticas fechadas | 2 |

## 📌 Definição de Pronto geral
- [ ] Código em branch + PR aberto · [ ] PR revisado por 1 colega · [ ] Testado em dispositivo físico · [ ] Sem `console.log` esquecido
