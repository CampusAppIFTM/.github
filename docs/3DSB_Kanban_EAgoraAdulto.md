# Atividades Kanban — E Agora, Adulto?

> **Como usar:** cada linha da coluna "Card" vira um *draft item* no GitHub Project (coluna **A Fazer** do sprint correspondente). Fluxo: A Fazer → Fazendo → Em Review → Feito.
> **Convenção de ID:** `EAA-NN.T` (issue NN, tarefa T). Estimativa em **aulas** (1 aula ≈ 50 min).
> **Atenção especial desta equipe:** o conteúdo das 27 lições (EAA-03) corre em **paralelo** ao código desde a primeira semana — distribuir os cards de escrita entre os 5 membros imediatamente.

---

## 🟣 Sprint 1 — Identidade e Login (PADRÃO — igual para as 12 equipes)

> Baseado no codelab *Autenticação Firebase/Google*. Build nativo (`expo prebuild` + `run:android`), não Expo Go. Papéis de usuário só no Sprint 2.

### EAA-01 · Configurar Firebase e ativar login com Google
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| EAA-01.1 | Criar projeto no console do Firebase | Projeto criado; painel acessível | 0,5 |
| EAA-01.2 | Ativar provedor de login Google (Authentication) | Google ativado com nome e e-mail de suporte | 0,5 |
| EAA-01.3 | Registrar app Android + baixar google-services.json | Arquivo na raiz do projeto | 1 |
| EAA-01.4 | Gerar SHA-1 (gradlew signingReport) e cadastrar no Firebase | Impressão digital salva no Firebase | 1 |

### EAA-02 · Criar o app React Native e integrar as bibliotecas
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| EAA-02.1 | Criar projeto Expo e abrir no VS Code | Projeto roda localmente | 0,5 |
| EAA-02.2 | Instalar @react-native-google-signin/google-signin | Biblioteca no package.json | 0,5 |
| EAA-02.3 | Configurar app.json (googleServicesFile + plugin) | Config correta conforme codelab | 1 |
| EAA-02.4 | Rodar expo prebuild + expo run:android | App abre no dispositivo (build nativo) | 1,5 |

### EAA-03 · Implementar login e logout com Google
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| EAA-03.1 | Configurar GoogleSignin com webClientId | webClientId correto do google-services.json | 0,5 |
| EAA-03.2 | Botão Entrar chamando GoogleSignin.signIn() | Retorna o objeto user do Google | 1 |
| EAA-03.3 | ActivityIndicator durante o login | Indicador aparece enquanto autentica | 0,5 |
| EAA-03.4 | Botão Sair com GoogleSignin.signOut() | Logout volta à tela de login | 0,5 |

### EAA-04 · Rotas protegidas + Home + sessão persistente
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| EAA-04.1 | Renderização condicional (user ? Home : Login) | Telas protegidas conforme o login | 1 |
| EAA-04.2 | Home exibe nome e foto do usuário | Dados do objeto user na Home | 1 |
| EAA-04.3 | Estado global do usuário (Context) | user acessível em qualquer tela | 1 |
| EAA-04.4 | Persistir sessão (mantém login ao reabrir) | Fechar e reabrir mantém logado | 1 |

## 🔵 Sprint 2 — Lógica de Negócio (Semanas 7–8)

### EAA-05 · Modelo de progresso do usuário
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| EAA-05.1 | Definir/documentar schema de progresso | `{ xp, trilhas, licaoAtual }` no README | 0,5 |
| EAA-05.2 | Criar progresso/{uid} + hook useProgresso() | Hook lê/atualiza; carrega ao abrir | 1,5 |

### EAA-06 · Conteúdo das trilhas (27 lições) — paralelo
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| EAA-06.1 | Schema da lição + 1 lição-modelo | Estrutura aprovada serve de referência | 1 |
| EAA-06.2 | Escrever 9 lições — Emprego | ≤200 palavras + quiz; revisão em dupla | 2 |
| EAA-06.3 | Escrever 9 lições — Faculdade | Mesmo padrão | 2 |
| EAA-06.4 | Escrever 9 lições — Financeiro | Mesmo padrão | 2 |
| EAA-06.5 | Revisão por professor + carregar no Firestore | 27 lições consultáveis | 1,5 |

### EAA-07 · Tela de trilha estilo Duolingo

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| EAA-07.1 | Construir o seletor de trilhas na Home (Emprego · Faculdade · Financeiro) | 3 cards com progresso resumido de cada trilha | 1 |
| EAA-07.2 | Construir o componente `MapaTrilha` (caminho vertical de fases) | Nós de fase em zigue-zague com ScrollView; visual conforme wireframe | 1,5 |
| EAA-07.3 | Implementar os 3 estados visuais da fase (concluída · atual · bloqueada) | Estado derivado do `useProgresso()`; bloqueada não responde ao toque | 1 |
| EAA-07.4 | Conectar navegação da fase atual para a `LicaoScreen` | Toque na fase atual abre a primeira lição pendente com parâmetros corretos | 0,5 |

### EAA-08 · Tela de lição

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| EAA-08.1 | Construir UI da lição (título, texto formatado, progresso da fase) | Tipografia legível; testada com a lição mais longa | 1 |
| EAA-08.2 | Habilitar "Fazer Quiz" apenas ao final da rolagem | Botão desabilitado até o `onScroll` detectar o fim do conteúdo | 0,5 |
| EAA-08.3 | Garantir que voltar sem concluir não marca a lição | Estado de conclusão só muda via aprovação no quiz | 0,5 |

### EAA-09 · Quiz com correção imediata

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| EAA-09.1 | Construir UI do quiz (pergunta + 4 opções + barra de questões) | Uma pergunta por vez; opções como botões grandes | 1 |
| EAA-09.2 | Implementar feedback imediato (acertou/errou + resposta correta) | Cores e mensagem por questão; bloqueio de mudança após responder | 1 |
| EAA-09.3 | Implementar regra de aprovação (≥ 2/3) e tela de resultado | Aprovado → conclui lição e atualiza progresso; reprovado → botão "Tentar novamente" | 1 |
| EAA-09.4 | Atualizar Firestore na conclusão (lição + fase quando completa) | `useProgresso().concluirLicao()` reflete no mapa da trilha ao voltar | 0,5 |

### EAA-10 · XP e barra de progresso

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| EAA-10.1 | Implementar regra de XP (10 por lição + 5 de bônus por quiz perfeito) | XP somado no Firestore na conclusão; regra documentada no README | 0,5 |
| EAA-10.2 | Construir header com XP total + componente `BarraProgresso` | Header visível na Home e na trilha; barra reutilizável por trilha | 1 |
| EAA-10.3 | Animar o ganho de XP na tela de resultado do quiz | Contagem crescente simples (sem libs pesadas) | 0,5 |

---

## 🟢 Sprint 3 — Polimento (Semanas 9–10)

### EAA-11 · Conquistas e medalhas

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| EAA-11.1 | Definir as 6 conquistas (2 por trilha) com nome, ícone e condição | Lista aprovada pela equipe; condições verificáveis pelo progresso | 0,5 |
| EAA-11.2 | Implementar verificação de conquistas após cada lição concluída | Função pura `verificarConquistas(progresso)` com casos de teste manuais | 1 |
| EAA-11.3 | Construir tela de conquistas (desbloqueadas + silhuetas) | Grid 2 colunas; bloqueadas em cinza com cadeado | 1 |
| EAA-11.4 | Exibir modal de comemoração no desbloqueio | Modal aparece uma única vez por conquista | 0,5 |

### EAA-12 · Notificação diária de lembrete

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| EAA-12.1 | Configurar `expo-notifications` e pedir permissão no primeiro uso | Permissão solicitada com explicação; recusa não quebra o app | 1 |
| EAA-12.2 | Agendar notificação local diária (19h) com 3 textos rotativos | Notificação chega no horário em dispositivo físico | 1 |
| EAA-12.3 | Criar alternância ativar/desativar no perfil (persistida) | Desativar cancela os agendamentos; preferência sobrevive ao restart | 0,5 |

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
