# Atividades Kanban — Avisa IF

> Cada linha vira um *draft item* no GitHub Project. Fluxo: A Fazer → Fazendo → Em Review → Feito.
> **ID:** `AVI-NN.T` · Estimativa em **aulas** (1 aula ≈ 50 min). Nenhuma tarefa acima de 2 aulas.

## 🟣 Sprint 1 — Identidade e Login

### AVI-01 · Cadastro e login
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| AVI-01.1 | Criar projeto Firebase e ativar Auth (e-mail/senha) | Config em `firebaseConfig.js`; app inicializa | 0,5 |
| AVI-01.2 | UI das telas de Login e Cadastro | Campos controlados; validação local | 1,5 |
| AVI-01.3 | Integrar cadastro/login com Firebase Auth | Conta no console; erros tratados | 1 |
| AVI-01.4 | AuthContext + navegação condicional + persistência | Sessão sobrevive ao restart; logout funcional | 1,5 |

### AVI-02 · Papel "grêmio" para avisos globais
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| AVI-02.1 | Coleção usuarios com campo papel (aluno/gremio) | Documento criado no cadastro | 0,5 |
| AVI-02.2 | Expor papel no AuthContext | `usuario.papel` acessível em qualquer tela | 0,5 |
| AVI-02.3 | Header da Home com "aviso da semana" editável só pelo grêmio | Aluno vê, grêmio edita; aluno não consegue editar | 1 |

## 🔵 Sprint 2 — Lógica de Negócio

### AVI-03 · Criar e entrar em grupos
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| AVI-03.1 | Modelar coleção grupos (nome, cor, codigo, membros) | Schema no README | 0,5 |
| AVI-03.2 | UI de criar grupo (nome + cor + geração de código) | Grupo criado com código de convite único | 1,5 |
| AVI-03.3 | UI de entrar via código | Código válido adiciona o usuário; inválido avisa | 1 |
| AVI-03.4 | Componente CardGrupo colorido | Card exibe nome com a cor do grupo | 1 |

### AVI-04 · Listar grupos na Home
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| AVI-04.1 | FlatList dos grupos do usuário | Lista carrega do Firestore; toque abre os avisos | 1 |
| AVI-04.2 | Botão "+" com opções criar/entrar | Abre as duas ações conforme o Canvas | 0,5 |

### AVI-05 · Publicar aviso em um grupo
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| AVI-05.1 | UI do formulário de aviso (título, descrição, data, tipo) | DateTimePicker; validação de obrigatórios | 1 |
| AVI-05.2 | Gravar aviso na subcoleção do grupo | Aviso aparece para todos os membros | 1 |

### AVI-06 · Agenda ordenada por data
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| AVI-06.1 | Query dos avisos de todos os grupos do usuário | Retorna avisos de todos os grupos | 1 |
| AVI-06.2 | Tela de agenda agrupada por dia, com cor do grupo | SectionList ordenada; cor de origem visível | 1,5 |
| AVI-06.3 | Separar avisos futuros e passados | Seções distintas | 0,5 |

### AVI-07 · Status do aviso (pendente/concluído)
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| AVI-07.1 | Marcar aviso como concluído (pessoal por usuário) | Conclusão não afeta outros membros | 1 |
| AVI-07.2 | Estilo atenuado para avisos concluídos | Visual claro de pendente vs. concluído | 0,5 |

## 🟢 Sprint 3 — Polimento

### AVI-08 · Filtrar avisos por grupo
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| AVI-08.1 | Chips dos grupos do usuário na agenda | Filtro sem recarregar; "Todos" limpa | 1 |

### AVI-09 · Notificação de aviso próximo
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| AVI-09.1 | Configurar expo-notifications + permissão | Recusa não quebra o app | 0,5 |
| AVI-09.2 | Agendar notificação 1 dia antes do aviso | Dispara em dispositivo físico; cancela se aviso removido | 1,5 |

### AVI-10 · Animações de transição (icebox)
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| AVI-10.1 | Transições suaves entre telas | Sem perda de performance | 1 |

### Encerramento
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| AVI-QA.1 | Teste cruzado + registro de bugs | Sessão de 30 min; bugs reproduzíveis | 1 |
| AVI-QA.2 | Corrigir bugs priorizados | Issues críticas fechadas | 2 |

## 📌 Definição de Pronto geral
- [ ] Código em branch + PR aberto · [ ] PR revisado por 1 colega · [ ] Testado em dispositivo físico · [ ] Sem `console.log` esquecido
