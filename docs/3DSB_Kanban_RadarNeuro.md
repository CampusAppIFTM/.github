# Atividades Kanban — Radar Neurodivergente

> **Como usar:** cada linha da coluna "Card" vira um *draft item* no GitHub Project (coluna **A Fazer** do sprint correspondente). Ao iniciar, mover para **Fazendo**; ao terminar, validar a Definição de Pronto (DoD) e mover para **Em Review** — outro membro confere antes de ir para **Feito**.
> **Convenção de ID:** `RND-NN.T` (issue NN, tarefa T). A estimativa usa **aulas** (1 aula ≈ 50 min) como unidade.
> **Regra de ouro:** nenhuma tarefa maior que 2 aulas — se for, quebrar antes de iniciar.

---

## 🟣 Sprint 1 — Identidade e Login (PADRÃO — igual para as 12 equipes)

> Baseado no codelab *Autenticação Firebase/Google*. Build nativo (`expo prebuild` + `run:android`), não Expo Go. Papéis de usuário só no Sprint 2.

### RND-01 · Configurar Firebase e ativar login com Google
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| RND-01.1 | Criar projeto no console do Firebase | Projeto criado; painel acessível | 0,5 |
| RND-01.2 | Ativar provedor de login Google (Authentication) | Google ativado com nome e e-mail de suporte | 0,5 |
| RND-01.3 | Registrar app Android + baixar google-services.json | Arquivo na raiz do projeto | 1 |
| RND-01.4 | Gerar SHA-1 (gradlew signingReport) e cadastrar no Firebase | Impressão digital salva no Firebase | 1 |

### RND-02 · Criar o app React Native e integrar as bibliotecas
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| RND-02.1 | Criar projeto Expo e abrir no VS Code | Projeto roda localmente | 0,5 |
| RND-02.2 | Instalar @react-native-google-signin/google-signin | Biblioteca no package.json | 0,5 |
| RND-02.3 | Configurar app.json (googleServicesFile + plugin) | Config correta conforme codelab | 1 |
| RND-02.4 | Rodar expo prebuild + expo run:android | App abre no dispositivo (build nativo) | 1,5 |

### RND-03 · Implementar login e logout com Google
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| RND-03.1 | Configurar GoogleSignin com webClientId | webClientId correto do google-services.json | 0,5 |
| RND-03.2 | Botão Entrar chamando GoogleSignin.signIn() | Retorna o objeto user do Google | 1 |
| RND-03.3 | ActivityIndicator durante o login | Indicador aparece enquanto autentica | 0,5 |
| RND-03.4 | Botão Sair com GoogleSignin.signOut() | Logout volta à tela de login | 0,5 |

### RND-04 · Rotas protegidas + Home + sessão persistente
| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| RND-04.1 | Renderização condicional (user ? Home : Login) | Telas protegidas conforme o login | 1 |
| RND-04.2 | Home exibe nome e foto do usuário | Dados do objeto user na Home | 1 |
| RND-04.3 | Estado global do usuário (Context) | user acessível em qualquer tela | 1 |
| RND-04.4 | Persistir sessão (mantém login ao reabrir) | Fechar e reabrir mantém logado | 1 |

## 🔵 Sprint 2 — Lógica de Negócio (Semanas 7–8)

### RND-05 · Botão de Emergência

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| RND-05.1 | Construir UI da Home do aluno com botão Emergência em destaque | Botão grande, alto contraste, alcançável com o polegar; demais botões (Conversar, Perfil) presentes | 1 |
| RND-05.2 | Criar coleção `alertas` e função `dispararAlerta()` | Documento `{ uid, nome, timestamp, status: "aberto" }` gravado ao tocar o botão | 1 |
| RND-05.3 | Construir tela `EmergenciaConfirmada` com mensagem acolhedora | Tela aparece imediatamente após o toque; confirma que o apoio foi avisado | 1 |
| RND-05.4 | Adicionar feedback tátil/visual no acionamento (vibração + animação simples) | `Vibration.vibrate()` no toque; botão muda de estado enquanto grava | 0,5 |
| RND-05.5 | Garantir acionamento em até 2 toques desde a abertura do app | Teste cronometrado no dispositivo; ajustar navegação se passar de 2 toques | 0,5 |

### RND-06 · Painel de alertas (CAPNE/CAE)

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| RND-06.1 | Construir UI do painel: FlatList de alertas abertos | Card mostra nome do aluno e horário; lista ordenada do mais recente | 1 |
| RND-06.2 | Conectar `onSnapshot` filtrando `status == "aberto"` | Novo alerta aparece no painel sem recarregar (testar com 2 celulares) | 1 |
| RND-06.3 | Implementar botão "Marcar como atendido" | Status muda no Firestore; alerta some da lista de abertos | 0,5 |
| RND-06.4 | Destacar alertas com mais de 5 min sem atendimento | Card muda de cor com base em `timestamp`; recalcula a cada minuto | 1 |
| RND-06.5 | Teste integrado: aluno dispara em um celular, apoio recebe em outro | Vídeo do teste com 2 dispositivos anexado à issue | 0,5 |

### RND-07 · Chatbot de acolhimento na emergência

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| RND-07.1 | Validar roteiro de acolhimento com o CAPNE (reunião + ata) | Roteiro aprovado por profissional registrado em documento no repositório | 1 |
| RND-07.2 | Modelar o roteiro como array de passos (mensagem + opções de botão) | Estrutura `{ id, mensagem, opcoes: [{ texto, proximoId }] }` revisada pela equipe | 1 |
| RND-07.3 | Construir UI de conversa guiada (bolhas + botões de resposta) | Fluxo navegável do início ao fim; sem campo de texto livre | 1,5 |
| RND-07.4 | Salvar as respostas do aluno no documento do alerta | Painel do apoio exibe as respostas dentro do alerta correspondente | 1 |

### RND-08 · Mensagens aluno ↔ CAPNE (chat simplificado)

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| RND-08.1 | Modelar coleção `conversas/{id}/mensagens` no Firestore | Estrutura documentada no README do repo; regras de leitura restritas aos participantes | 1 |
| RND-08.2 | Construir UI do chat (FlatList invertida + input + botão enviar) | Mensagens do aluno à direita, do apoio à esquerda; input limpa após enviar | 1,5 |
| RND-08.3 | Conectar envio e recebimento com `onSnapshot` | Mensagem enviada em um celular aparece no outro em segundos | 1 |
| RND-08.4 | Listar conversas no painel do apoio | Apoio vê lista de alunos com conversa ativa e abre cada uma | 1 |

---

## 🟢 Sprint 3 — Polimento (Semanas 9–10)

### RND-09 · Procurar amizade

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| RND-09.1 | Adicionar campos `visivelNaBusca` e `interesses[]` ao perfil | Edição salva no Firestore; padrão é **não visível** (opt-in consciente) | 1 |
| RND-09.2 | Construir tela de busca (lista de alunos visíveis + filtro por interesse) | Apenas perfis opt-in aparecem; filtro funciona sem recarregar | 1 |
| RND-09.3 | Conectar "Iniciar conversa" reutilizando o chat (RND-08) | Tocar em um perfil abre conversa 1:1 entre os dois alunos | 1 |

### RND-10 · Modo escuro

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| RND-10.1 | Criar `ThemeContext` com paletas clara e escura | Alternância no perfil troca o tema em todas as telas abertas | 1 |
| RND-10.2 | Persistir preferência no AsyncStorage | App reabre no último tema escolhido | 0,5 |
| RND-10.3 | Auditar contraste de todas as telas no tema escuro | Checklist tela a tela na issue; nenhum texto ilegível | 1 |

### RND-11 · Edição de perfil

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| RND-11.1 | Construir tela de perfil com dados atuais e modo de edição | Nome e interesses editáveis; e-mail somente leitura | 1 |
| RND-11.2 | Salvar alterações no Firestore com feedback de sucesso | Alteração reflete no app sem reabrir; toast/alerta de confirmação | 0,5 |

### Encerramento do Sprint 3 (todas as equipes)

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| RND-QA.1 | Rodar teste cruzado com outra equipe e registrar bugs como issues `bug` | Mínimo de 1 sessão de 30 min; cada bug com passos para reproduzir | 1 |
| RND-QA.2 | Corrigir bugs priorizados do teste cruzado | Issues `bug` críticas fechadas com commit referenciado | 2 |
| RND-QA.3 | Revisão final de acessibilidade (fontes, contraste, áreas de toque) | Checklist preenchido — app será usado em momentos de crise, acessibilidade é função | 1 |

---

## 📌 Definição de Pronto geral (vale para todo card)

- [ ] Código commitado em branch + Pull Request aberto
- [ ] PR revisado por pelo menos 1 colega (não o autor)
- [ ] Testado em dispositivo físico via Expo Go
- [ ] Sem `console.log` de depuração esquecido
- [ ] Card movido com comentário do que foi feito
