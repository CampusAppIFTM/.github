# Atividades Kanban — IFala

> Cada linha vira um *draft item* no GitHub Project. Fluxo: A Fazer → Fazendo → Em Review → Feito.
> **ID:** `IFA-NN.T` · Estimativa em **aulas** (1 aula ≈ 50 min). Nenhuma tarefa acima de 2 aulas.
> **Tema sensível:** ver o checklist do backlog antes do Sprint 2 (compromisso da coordenação + texto de privacidade).

## 🟣 Sprint 1 — Identidade e Login

### IFA-01 · Login com e-mail institucional
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFA-01.1 | Criar projeto Firebase e ativar Auth | Config em `firebaseConfig.js` | 0,5 |
| IFA-01.2 | UI das telas de Login e Cadastro | Campos controlados; validação local | 1,5 |
| IFA-01.3 | Integrar Auth + validação de domínio institucional | E-mail externo recusado com mensagem clara | 1 |
| IFA-01.4 | AuthContext + persistência | Sessão sobrevive ao restart; logout | 1 |

### IFA-02 · Papel de coordenação
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFA-02.1 | Coleção usuarios com papel (aluno/coordenacao) | Documento criado; coordenação promovida no console | 0,5 |
| IFA-02.2 | Navegação condicional por papel | Coordenação → painel; aluno → envio | 1 |

## 🔵 Sprint 2 — Lógica de Negócio

### IFA-03 · Enviar reclamação
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFA-03.1 | Modelar coleção reclamacoes | Schema no README; `autorUid` guardado mas protegido | 0,5 |
| IFA-03.2 | UI do formulário (categoria + texto) | Validação de obrigatórios | 1 |
| IFA-03.3 | Gravar reclamação com status "aberta" + confirmação | Aluno recebe confirmação de envio | 1 |

### IFA-04 · Exibição sem identificação à coordenação
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFA-04.1 | Regras do Firestore que ocultam autorUid da coordenação | Coordenação não consegue ler o autor (testar) | 1,5 |
| IFA-04.2 | Texto de transparência na tela de envio (revisado pelo professor) | Mensagem honesta sobre o nível de privacidade | 0,5 |

### IFA-05 · Minhas reclamações (aluno)
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFA-05.1 | Lista das reclamações do próprio usuário com status | Só as do autor aparecem | 1 |
| IFA-05.2 | Detalhe com a resposta da coordenação | Resposta visível quando existir | 1 |

### IFA-06 · Painel de reclamações (coordenação)
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFA-06.1 | FlatList sem identificação do autor | Ordenada por recentes; status visível | 1 |
| IFA-06.2 | Abrir detalhe para análise | Texto completo e categoria visíveis | 1 |

### IFA-07 · Responder reclamação (coordenação)
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFA-07.1 | Campo de resposta + mudança de status | aberta → em análise → respondida | 1 |
| IFA-07.2 | Resposta reflete em "Minhas reclamações" via onSnapshot | Aluno vê a atualização sem recarregar | 1 |

## 🟢 Sprint 3 — Polimento

### IFA-08 · Filtrar por categoria
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFA-08.1 | Chips de categoria no painel da coordenação | Filtro sem recarregar | 1 |

### IFA-09 · Anexar evidência (foto)
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFA-09.1 | Anexo opcional de imagem (galeria/câmera) | expo-image-picker + Firebase Storage | 1,5 |
| IFA-09.2 | Imagem visível no detalhe sem expor o autor | Coordenação vê a foto, não o autor | 1 |

### Encerramento
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| IFA-QA.1 | Teste cruzado + registro de bugs | Sessão de 30 min; bugs reproduzíveis | 1 |
| IFA-QA.2 | Corrigir bugs priorizados | Issues críticas fechadas | 2 |
| IFA-QA.3 | Revisar a proteção do autor com cenário real | Confirmar que coordenação nunca vê quem enviou | 1 |

## 📌 Definição de Pronto geral
- [ ] Código em branch + PR aberto · [ ] PR revisado por 1 colega · [ ] Testado em dispositivo físico · [ ] Sem `console.log` esquecido
