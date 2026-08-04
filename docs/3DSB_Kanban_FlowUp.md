# Atividades Kanban — FlowUp

> **Como usar:** cada linha da coluna "Card" vira um *draft item* no GitHub Project (coluna **A Fazer** do sprint correspondente). Fluxo: A Fazer → Fazendo → Em Review → Feito.
> **Convenção de ID:** `FLW-NN.T` (issue NN, tarefa T). Estimativa em **aulas** (1 aula ≈ 50 min).
> **Atenção desta equipe:** o diferencial do app é o **alerta de sobrecarga** (FLW-03.4) e o **heatmap do professor** (FLW-05) — são as duas coisas que a banca vai querer ver funcionando. O componente `SemanaHeatmap` é construído uma vez e reutilizado nas duas visões.

---

## 🟣 Sprint 1 — Identidade e Login (Semanas 5–6)

### FLW-01 · Cadastro e login com papéis (Aluno / Professor)

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| FLW-01.1 | Criar projeto no Firebase Console e ativar Authentication (e-mail/senha) | Config em `firebaseConfig.js`; app inicializa sem erro | 0,5 |
| FLW-01.2 | Construir UI das telas de Login e Cadastro com seleção de papel | Cadastro com escolha Aluno/Professor; campos validados | 1,5 |
| FLW-01.3 | Integrar cadastro/login com Firebase Auth + coleção `usuarios` | Documento `{ nome, email, papel }` criado; erros tratados com mensagens amigáveis | 1 |
| FLW-01.4 | Criar `AuthContext` + navegação condicional + persistência | Sessão sobrevive ao restart; professor vê "Nova Atividade", aluno não | 1,5 |

### FLW-02 · Vínculo com turma

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| FLW-02.1 | Criar coleção `turmas` com as turmas fixas do MVP | Ex.: "3º Info A", "3º Info B" cadastradas; decisão registrada no README | 0,5 |
| FLW-02.2 | Adicionar seleção de turma no cadastro do aluno | Dropdown carregado do Firestore; `turmaId` gravado no usuário | 1 |
| FLW-02.3 | Implementar associação do professor a múltiplas turmas | Campo `turmas: []` no usuário; seleção múltipla no cadastro ou perfil | 1 |
| FLW-02.4 | Expor `turmaId`/`turmas` no `AuthContext` | Qualquer tela consulta a(s) turma(s) do usuário sem nova query | 0,5 |

---

## 🔵 Sprint 2 — Lógica de Negócio (Semanas 7–8)

### FLW-03 · Cadastrar atividade (professor) ⭐ contém o alerta de sobrecarga

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| FLW-03.1 | Modelar coleção `atividades` e documentar o schema | `{ titulo, disciplina, turmaId, tipo, data, descricao, professorUid }` no README | 0,5 |
| FLW-03.2 | Construir UI do formulário (título, disciplina, turma, tipo, data, descrição) | Tipo como seleção (prova/trabalho/tarefa); turma vinda das turmas do professor | 1 |
| FLW-03.3 | Integrar DateTimePicker e validações | Campos obrigatórios; data futura; mensagens campo a campo | 1 |
| FLW-03.4 | Implementar o **alerta de sobrecarga** antes de salvar | Query conta atividades da turma na mesma data; 2+ exibe "Esta turma já possui N atividades neste dia — deseja continuar?" | 1,5 |
| FLW-03.5 | Gravar a atividade e refletir na agenda dos alunos | Atividade aparece na agenda da turma imediatamente | 0,5 |
| FLW-03.6 | Implementar edição e exclusão (só o professor criador) | Botões visíveis apenas para o autor; excluir pede confirmação | 1 |

### FLW-04 · Agenda de atividades (aluno e professor)

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| FLW-04.1 | Construir o componente `CardAtividade` com badge de cor por tipo | Prova/trabalho/tarefa com cores distintas; título, disciplina e data visíveis | 1 |
| FLW-04.2 | Implementar a SectionList agrupada por dia (ordenada da mais próxima) | Query filtrada por `turmaId`, ordenada por `data`; cabeçalho por dia ("Hoje", "Amanhã", data) | 1,5 |
| FLW-04.3 | Separar atividades passadas em aba/seção "Histórico" | Lista principal só mostra futuras; histórico acessível | 1 |
| FLW-04.4 | Construir a tela de detalhe da atividade | Todos os campos + nome do professor; acessível pelo card | 1 |
| FLW-04.5 | Adicionar estados de carregamento e agenda vazia | Spinner no fetch; mensagem "Nenhuma atividade — aproveite!" quando vazio | 0,5 |

### FLW-05 · Painel do professor — heatmap da turma ⭐ diferencial

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| FLW-05.1 | Construir o componente `SemanaHeatmap` (grade seg–sex com contagem) | Verde (0–1), amarelo (2), vermelho (3+); componente isolado e reutilizável | 1,5 |
| FLW-05.2 | Implementar o seletor de turma para o professor | Dropdown com as turmas do professor; troca atualiza o heatmap | 0,5 |
| FLW-05.3 | Conectar o heatmap à query da turma inteira (todos os professores) | Contagem por dia bate com as atividades reais (testar com dados de 2 professores) | 1 |
| FLW-05.4 | Implementar navegação entre semanas (anterior/próxima) | Setas mudam a semana; semana atual destacada | 1 |
| FLW-05.5 | Listar as atividades do dia ao tocar em uma célula | Lista abaixo do heatmap com as atividades daquele dia | 1 |

### FLW-06 · Indicador de carga do dia (aluno)

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| FLW-06.1 | Reutilizar o `SemanaHeatmap` no topo da agenda do aluno | Mesma escala de cores; dados da turma do aluno | 1 |
| FLW-06.2 | Conectar o toque na célula à rolagem da agenda até o dia | Toque rola a SectionList até a seção correspondente | 1 |

---

## 🟢 Sprint 3 — Polimento (Semanas 9–10)

### FLW-07 · Filtrar atividades por disciplina

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| FLW-07.1 | Gerar chips de disciplina dinamicamente a partir das atividades | Sem lista fixa no código; "Todas" por padrão | 1 |
| FLW-07.2 | Aplicar o filtro à agenda e ao heatmap simultaneamente | Indicador de carga respeita o filtro ativo; troca sem recarregar | 1 |

### FLW-08 · Notificação de atividade próxima (icebox — só se sobrar tempo)

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| FLW-08.1 | Configurar `expo-notifications` com pedido de permissão | Recusa não quebra o app | 0,5 |
| FLW-08.2 | Agendar notificação local 1 dia antes de cada atividade da turma | Agendamento criado quando a agenda carrega; sem duplicatas | 1,5 |
| FLW-08.3 | Criar alternância ativar/desativar no perfil | Preferência persiste; desativar cancela os agendamentos | 0,5 |

### Encerramento do Sprint 3

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| FLW-QA.1 | Teste cruzado com outra equipe + registro de bugs como issues `bug` | Sessão de 30 min; bugs com passos para reproduzir | 1 |
| FLW-QA.2 | Corrigir bugs priorizados | Issues críticas fechadas com commit referenciado | 2 |
| FLW-QA.3 | Cenário de demonstração para o Shark Tank (2 professores + 1 aluno, dados realistas) | Roteiro de demo documentado: professor A marca prova → professor B vê o alerta → aluno vê a carga | 1 |

---

## 📌 Definição de Pronto geral (vale para todo card)

- [ ] Código commitado em branch + Pull Request aberto
- [ ] PR revisado por pelo menos 1 colega (não o autor)
- [ ] Testado em dispositivo físico via Expo Go
- [ ] Sem `console.log` de depuração esquecido
- [ ] Card movido com comentário do que foi feito
