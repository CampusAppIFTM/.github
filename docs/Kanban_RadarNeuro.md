# Atividades Kanban — Radar Neurodivergente

> **Como usar:** cada linha da coluna "Card" vira um *draft item* no GitHub Project (coluna **A Fazer** do sprint correspondente). Ao iniciar, mover para **Fazendo**; ao terminar, validar a Definição de Pronto (DoD) e mover para **Em Review** — outro membro confere antes de ir para **Feito**.
> **Convenção de ID:** `RND-NN.T` (issue NN, tarefa T). A estimativa usa **aulas** (1 aula ≈ 50 min) como unidade.
> **Regra de ouro:** nenhuma tarefa maior que 2 aulas — se for, quebrar antes de iniciar.

---

## 🟣 Sprint 1 — Identidade e Login (Semanas 5–6)

### RND-01 · Cadastro e login com e-mail e senha

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| RND-01.1 | Criar projeto no Firebase Console e ativar Authentication (e-mail/senha) | Projeto criado; método e-mail/senha ativo; config copiada para `firebaseConfig.js` | 0,5 |
| RND-01.2 | Instalar e configurar SDK do Firebase no projeto Expo | `npx expo install firebase`; app inicializa sem erro com o config | 0,5 |
| RND-01.3 | Construir UI da tela de Login (logo, e-mail, senha, botão Entrar, link Criar conta) | Tela renderiza no Expo Go conforme wireframe; campos controlados com `useState` | 1 |
| RND-01.4 | Construir UI da tela de Cadastro (nome, e-mail, senha, confirmar senha) | Tela renderiza; validação local: e-mail com formato válido, senha ≥ 6, senhas iguais | 1 |
| RND-01.5 | Integrar `createUserWithEmailAndPassword` no cadastro | Conta criada aparece no Firebase Console; erro de e-mail duplicado tratado com mensagem amigável | 1 |
| RND-01.6 | Integrar `signInWithEmailAndPassword` no login | Login válido navega para a Home; credencial errada mostra mensagem clara (sem código de erro cru) | 1 |
| RND-01.7 | Testar fluxo completo no dispositivo físico (criar conta → sair → logar) | Vídeo curto do fluxo gravado e anexado à issue | 0,5 |

### RND-02 · Sessão global com Context API + persistência

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| RND-02.1 | Criar `AuthContext` com estados `usuario` e `carregando` | Provider envolve o app; qualquer tela acessa `usuario` via `useContext` | 1 |
| RND-02.2 | Implementar navegação condicional (Stack de auth ↔ Stack do app) | Sem usuário → telas de login; com usuário → Home; transição automática após login/logout | 1 |
| RND-02.3 | Persistir sessão com `onAuthStateChanged` + AsyncStorage | Fechar e reabrir o app mantém o usuário logado; splash/loading durante a verificação | 1 |
| RND-02.4 | Implementar `logout()` no Context e botão Sair na tela de perfil | Logout limpa estado e AsyncStorage; volta para a tela de login | 0,5 |

### RND-03 · Tipos de perfil: Aluno e Apoio (CAPNE/CAE)

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| RND-03.1 | Criar coleção `usuarios` no Firestore e gravar documento no cadastro | Documento `{ nome, email, tipo: "aluno" }` criado junto com a conta | 1 |
| RND-03.2 | Adicionar seleção de tipo no cadastro (aluno padrão; apoio via código de acesso) | Campo "Código de equipe de apoio" opcional; código correto grava `tipo: "apoio"` | 1 |
| RND-03.3 | Carregar o tipo no `AuthContext` após o login | `usuario.tipo` disponível em qualquer tela | 0,5 |
| RND-03.4 | Rotear Home por tipo (aluno → Home do aluno; apoio → painel de alertas) | Cada tipo cai na tela certa; aluno não acessa o painel nem por deep link | 1 |

---

## 🔵 Sprint 2 — Lógica de Negócio (Semanas 7–8)

### RND-04 · Botão de Emergência

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| RND-04.1 | Construir UI da Home do aluno com botão Emergência em destaque | Botão grande, alto contraste, alcançável com o polegar; demais botões (Conversar, Perfil) presentes | 1 |
| RND-04.2 | Criar coleção `alertas` e função `dispararAlerta()` | Documento `{ uid, nome, timestamp, status: "aberto" }` gravado ao tocar o botão | 1 |
| RND-04.3 | Construir tela `EmergenciaConfirmada` com mensagem acolhedora | Tela aparece imediatamente após o toque; confirma que o apoio foi avisado | 1 |
| RND-04.4 | Adicionar feedback tátil/visual no acionamento (vibração + animação simples) | `Vibration.vibrate()` no toque; botão muda de estado enquanto grava | 0,5 |
| RND-04.5 | Garantir acionamento em até 2 toques desde a abertura do app | Teste cronometrado no dispositivo; ajustar navegação se passar de 2 toques | 0,5 |

### RND-05 · Painel de alertas (CAPNE/CAE)

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| RND-05.1 | Construir UI do painel: FlatList de alertas abertos | Card mostra nome do aluno e horário; lista ordenada do mais recente | 1 |
| RND-05.2 | Conectar `onSnapshot` filtrando `status == "aberto"` | Novo alerta aparece no painel sem recarregar (testar com 2 celulares) | 1 |
| RND-05.3 | Implementar botão "Marcar como atendido" | Status muda no Firestore; alerta some da lista de abertos | 0,5 |
| RND-05.4 | Destacar alertas com mais de 5 min sem atendimento | Card muda de cor com base em `timestamp`; recalcula a cada minuto | 1 |
| RND-05.5 | Teste integrado: aluno dispara em um celular, apoio recebe em outro | Vídeo do teste com 2 dispositivos anexado à issue | 0,5 |

### RND-06 · Chatbot de acolhimento na emergência

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| RND-06.1 | Validar roteiro de acolhimento com o CAPNE (reunião + ata) | Roteiro aprovado por profissional registrado em documento no repositório | 1 |
| RND-06.2 | Modelar o roteiro como array de passos (mensagem + opções de botão) | Estrutura `{ id, mensagem, opcoes: [{ texto, proximoId }] }` revisada pela equipe | 1 |
| RND-06.3 | Construir UI de conversa guiada (bolhas + botões de resposta) | Fluxo navegável do início ao fim; sem campo de texto livre | 1,5 |
| RND-06.4 | Salvar as respostas do aluno no documento do alerta | Painel do apoio exibe as respostas dentro do alerta correspondente | 1 |

### RND-07 · Mensagens aluno ↔ CAPNE (chat simplificado)

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| RND-07.1 | Modelar coleção `conversas/{id}/mensagens` no Firestore | Estrutura documentada no README do repo; regras de leitura restritas aos participantes | 1 |
| RND-07.2 | Construir UI do chat (FlatList invertida + input + botão enviar) | Mensagens do aluno à direita, do apoio à esquerda; input limpa após enviar | 1,5 |
| RND-07.3 | Conectar envio e recebimento com `onSnapshot` | Mensagem enviada em um celular aparece no outro em segundos | 1 |
| RND-07.4 | Listar conversas no painel do apoio | Apoio vê lista de alunos com conversa ativa e abre cada uma | 1 |

---

## 🟢 Sprint 3 — Polimento (Semanas 9–10)

### RND-08 · Procurar amizade

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| RND-08.1 | Adicionar campos `visivelNaBusca` e `interesses[]` ao perfil | Edição salva no Firestore; padrão é **não visível** (opt-in consciente) | 1 |
| RND-08.2 | Construir tela de busca (lista de alunos visíveis + filtro por interesse) | Apenas perfis opt-in aparecem; filtro funciona sem recarregar | 1 |
| RND-08.3 | Conectar "Iniciar conversa" reutilizando o chat (RND-07) | Tocar em um perfil abre conversa 1:1 entre os dois alunos | 1 |

### RND-09 · Modo escuro

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| RND-09.1 | Criar `ThemeContext` com paletas clara e escura | Alternância no perfil troca o tema em todas as telas abertas | 1 |
| RND-09.2 | Persistir preferência no AsyncStorage | App reabre no último tema escolhido | 0,5 |
| RND-09.3 | Auditar contraste de todas as telas no tema escuro | Checklist tela a tela na issue; nenhum texto ilegível | 1 |

### RND-10 · Edição de perfil

| ID | Card | Definição de Pronto | Est. |
|---|---|---|:---:|
| RND-10.1 | Construir tela de perfil com dados atuais e modo de edição | Nome e interesses editáveis; e-mail somente leitura | 1 |
| RND-10.2 | Salvar alterações no Firestore com feedback de sucesso | Alteração reflete no app sem reabrir; toast/alerta de confirmação | 0,5 |

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
