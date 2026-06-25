# Atividades Kanban — StudyDev

> Cada linha vira um *draft item* no GitHub Project. Fluxo: A Fazer → Fazendo → Em Review → Feito.
> **ID:** `STD-NN.T` · Estimativa em **aulas** (1 aula ≈ 50 min). Nenhuma tarefa acima de 2 aulas.
> **Atenção:** o conteúdo das trilhas (STD-03) corre em paralelo ao código desde a primeira semana, dividido entre os 5 membros.

## 🟣 Sprint 1 — Identidade e Login

### STD-01 · Cadastro, login e sessão persistente
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| STD-01.1 | Criar projeto Firebase e ativar Auth | Config em `firebaseConfig.js` | 0,5 |
| STD-01.2 | UI das telas de Login e Cadastro | Campos controlados; validação local | 1,5 |
| STD-01.3 | Integrar Auth + AuthContext + persistência | Sessão sobrevive ao restart; logout | 1,5 |

### STD-02 · Modelo de progresso
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| STD-02.1 | Documentar schema de progresso | `{ trilhas: { ... }, aulasConcluidas }` no README | 0,5 |
| STD-02.2 | Criar progresso/{uid} no 1º login + hook useProgresso() | Hook lê e atualiza; carrega ao abrir | 1,5 |

### STD-03 · Conteúdo das trilhas (paralelo)
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| STD-03.1 | Schema da aula + 1 aula-modelo | Estrutura aprovada serve de referência | 1 |
| STD-03.2 | Escrever trilha 1 (ex.: Lógica/Python) — 3 módulos × 3 aulas | Conteúdo objetivo; revisão em dupla | 2 |
| STD-03.3 | Escrever trilha 2 (ex.: Web/HTML-CSS) — 3 módulos × 3 aulas | Mesmo padrão | 2 |
| STD-03.4 | Carregar trilhas no Firestore | Conteúdo consultável; script commitado | 1 |

## 🔵 Sprint 2 — Lógica de Negócio

### STD-04 · Tela de trilhas (Home)
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| STD-04.1 | Componente CardTrilha com progresso | Título, ícone e progresso resumido | 1 |
| STD-04.2 | Grid/lista de trilhas carregando do Firestore | Toque abre os módulos/aulas | 1 |

### STD-05 · Lista de aulas da trilha
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| STD-05.1 | Aulas agrupadas por módulo, em ordem | Indicador concluída/não concluída | 1,5 |
| STD-05.2 | Navegação aula → tela de conteúdo | Abre a aula correta | 0,5 |

### STD-06 · Tela de aula (conteúdo)
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| STD-06.1 | UI do conteúdo (texto + link de vídeo opcional) | Legível; vídeo abre quando existe | 1 |
| STD-06.2 | Botão "Marcar como concluída" atualiza progresso | Reflete na lista de aulas ao voltar | 1 |

## 🟢 Sprint 3 — Polimento

### STD-07 · Motivação diária (streak)
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| STD-07.1 | Contador de dias consecutivos de estudo | Streak calculado a partir do progresso | 1,5 |
| STD-07.2 | Mensagem motivacional diária (mín. 5 textos) | Texto varia por dia | 0,5 |

### STD-08 · Notificações de estudo
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| STD-08.1 | expo-notifications + permissão | Recusa não quebra o app | 0,5 |
| STD-08.2 | Lembrete diário em horário escolhido pelo usuário | Dispara no horário; ativável/desativável | 1 |

### STD-09 · Modo escuro (icebox)
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| STD-09.1 | ThemeContext claro/escuro persistido | Alternância no perfil; sobrevive ao restart | 1,5 |

### Encerramento
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| STD-QA.1 | Teste cruzado + registro de bugs | Sessão de 30 min; bugs reproduzíveis | 1 |
| STD-QA.2 | Corrigir bugs priorizados | Issues críticas fechadas | 2 |
| STD-QA.3 | Revisão de conteúdo: percorrer todas as trilhas | Erros de texto/links corrigidos | 1 |

## 📌 Definição de Pronto geral
- [ ] Código em branch + PR aberto · [ ] PR revisado por 1 colega · [ ] Testado em dispositivo físico · [ ] Sem `console.log` esquecido
