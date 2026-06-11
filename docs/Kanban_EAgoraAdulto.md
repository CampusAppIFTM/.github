# Atividades Kanban — E Agora, Adulto?

> **Como usar:** cada linha da coluna "Card" vira um *draft item* no GitHub Project (coluna **A Fazer** do sprint correspondente). Fluxo: A Fazer → Fazendo → Em Review → Feito.
> **Convenção de ID:** `EAA-NN.T` (issue NN, tarefa T). Estimativa em **aulas** (1 aula ≈ 50 min).
> **Atenção especial desta equipe:** o conteúdo das 27 lições (EAA-03) corre em **paralelo** ao código desde a primeira semana — distribuir os cards de escrita entre os 5 membros imediatamente.

---

## 🟣 Sprint 1 — Identidade e Login (Semanas 5–6)

### EAA-01 · Cadastro, login e sessão persistente

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| EAA-01.1 | Criar projeto no Firebase Console e ativar Authentication (e-mail/senha) | Config copiada para `firebaseConfig.js`; app inicializa sem erro | 0,5 |
| EAA-01.2 | Construir UI das telas de Login e Cadastro | Telas conforme wireframe; campos controlados; validação local (e-mail válido, senha ≥ 6) | 1,5 |
| EAA-01.3 | Integrar cadastro e login com Firebase Auth | Conta aparece no console; erros comuns tratados com mensagem amigável | 1 |
| EAA-01.4 | Criar `AuthContext` com navegação condicional | Login leva à trilha; logout volta ao login; estado acessível em todas as telas | 1 |
| EAA-01.5 | Persistir sessão (`onAuthStateChanged` + AsyncStorage) | Fechar e reabrir mantém logado; tela de loading durante a verificação | 1 |

### EAA-02 · Modelo de progresso do usuário

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| EAA-02.1 | Definir e documentar o schema de progresso no README | `{ xp, trilhas: { emprego: [], faculdade: [], financeiro: [] }, licaoAtual }` revisado pela equipe | 0,5 |
| EAA-02.2 | Criar documento `progresso/{uid}` no primeiro login | Documento criado automaticamente com valores zerados | 1 |
| EAA-02.3 | Implementar hook `useProgresso()` (ler + atualizar) | Hook retorna progresso atual e funções `concluirLicao()` e `adicionarXP()` | 1,5 |
| EAA-02.4 | Testar sincronização: concluir lição em um celular, conferir em outro | Progresso idêntico nos dois aparelhos após relogin | 0,5 |

### EAA-03 · Conteúdo das trilhas (27 lições) — *paralelo ao código*

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| EAA-03.1 | Definir o schema JSON da lição e criar 1 lição-modelo completa | `{ id, trilha, fase, titulo, texto, quiz[3] }` aprovado pela equipe; modelo serve de referência | 1 |
| EAA-03.2 | Escrever as 9 lições da trilha **Emprego** (3 fases × 3 lições) | Textos ≤ 200 palavras; 3 perguntas de quiz cada; revisão em dupla | 2 |
| EAA-03.3 | Escrever as 9 lições da trilha **Faculdade** | Mesmo padrão da EAA-03.2 | 2 |
| EAA-03.4 | Escrever as 9 lições da trilha **Financeiro** | Mesmo padrão da EAA-03.2 | 2 |
| EAA-03.5 | Submeter o conteúdo à revisão de 1 professor e aplicar ajustes | Feedback registrado na issue; versão final commitada | 1 |
| EAA-03.6 | Carregar as lições no Firestore (coleção `trilhas`) | Todas as 27 lições consultáveis; script de carga commitado | 1 |

---

## 🔵 Sprint 2 — Lógica de Negócio (Semanas 7–8)

### EAA-04 · Tela de trilha estilo Duolingo

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| EAA-04.1 | Construir o seletor de trilhas na Home (Emprego · Faculdade · Financeiro) | 3 cards com progresso resumido de cada trilha | 1 |
| EAA-04.2 | Construir o componente `MapaTrilha` (caminho vertical de fases) | Nós de fase em zigue-zague com ScrollView; visual conforme wireframe | 1,5 |
| EAA-04.3 | Implementar os 3 estados visuais da fase (concluída · atual · bloqueada) | Estado derivado do `useProgresso()`; bloqueada não responde ao toque | 1 |
| EAA-04.4 | Conectar navegação da fase atual para a `LicaoScreen` | Toque na fase atual abre a primeira lição pendente com parâmetros corretos | 0,5 |

### EAA-05 · Tela de lição

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| EAA-05.1 | Construir UI da lição (título, texto formatado, progresso da fase) | Tipografia legível; testada com a lição mais longa | 1 |
| EAA-05.2 | Habilitar "Fazer Quiz" apenas ao final da rolagem | Botão desabilitado até o `onScroll` detectar o fim do conteúdo | 0,5 |
| EAA-05.3 | Garantir que voltar sem concluir não marca a lição | Estado de conclusão só muda via aprovação no quiz | 0,5 |

### EAA-06 · Quiz com correção imediata

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| EAA-06.1 | Construir UI do quiz (pergunta + 4 opções + barra de questões) | Uma pergunta por vez; opções como botões grandes | 1 |
| EAA-06.2 | Implementar feedback imediato (acertou/errou + resposta correta) | Cores e mensagem por questão; bloqueio de mudança após responder | 1 |
| EAA-06.3 | Implementar regra de aprovação (≥ 2/3) e tela de resultado | Aprovado → conclui lição e atualiza progresso; reprovado → botão "Tentar novamente" | 1 |
| EAA-06.4 | Atualizar Firestore na conclusão (lição + fase quando completa) | `useProgresso().concluirLicao()` reflete no mapa da trilha ao voltar | 0,5 |

### EAA-07 · XP e barra de progresso

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| EAA-07.1 | Implementar regra de XP (10 por lição + 5 de bônus por quiz perfeito) | XP somado no Firestore na conclusão; regra documentada no README | 0,5 |
| EAA-07.2 | Construir header com XP total + componente `BarraProgresso` | Header visível na Home e na trilha; barra reutilizável por trilha | 1 |
| EAA-07.3 | Animar o ganho de XP na tela de resultado do quiz | Contagem crescente simples (sem libs pesadas) | 0,5 |

---

## 🟢 Sprint 3 — Polimento (Semanas 9–10)

### EAA-08 · Conquistas e medalhas

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| EAA-08.1 | Definir as 6 conquistas (2 por trilha) com nome, ícone e condição | Lista aprovada pela equipe; condições verificáveis pelo progresso | 0,5 |
| EAA-08.2 | Implementar verificação de conquistas após cada lição concluída | Função pura `verificarConquistas(progresso)` com casos de teste manuais | 1 |
| EAA-08.3 | Construir tela de conquistas (desbloqueadas + silhuetas) | Grid 2 colunas; bloqueadas em cinza com cadeado | 1 |
| EAA-08.4 | Exibir modal de comemoração no desbloqueio | Modal aparece uma única vez por conquista | 0,5 |

### EAA-09 · Notificação diária de lembrete

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| EAA-09.1 | Configurar `expo-notifications` e pedir permissão no primeiro uso | Permissão solicitada com explicação; recusa não quebra o app | 1 |
| EAA-09.2 | Agendar notificação local diária (19h) com 3 textos rotativos | Notificação chega no horário em dispositivo físico | 1 |
| EAA-09.3 | Criar alternância ativar/desativar no perfil (persistida) | Desativar cancela os agendamentos; preferência sobrevive ao restart | 0,5 |

### Encerramento do Sprint 3

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| EAA-QA.1 | Teste cruzado com outra equipe + registro de bugs como issues `bug` | Sessão de 30 min; bugs com passos para reproduzir | 1 |
| EAA-QA.2 | Corrigir bugs priorizados | Issues críticas fechadas com commit referenciado | 2 |
| EAA-QA.3 | Revisão de conteúdo: jogar as 27 lições do início ao fim | Erros de português/quiz corrigidos; checklist por trilha na issue | 1,5 |

---

## 📌 Definição de Pronto geral (vale para todo card)

- [ ] Código commitado em branch + Pull Request aberto
- [ ] PR revisado por pelo menos 1 colega (não o autor)
- [ ] Testado em dispositivo físico via Expo Go
- [ ] Sem `console.log` de depuração esquecido
- [ ] Card movido com comentário do que foi feito
