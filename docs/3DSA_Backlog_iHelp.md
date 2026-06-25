# Backlog Inicial — iHelp

> **Equipe:** Caio Gabriel, Vitória Sophia, Camille, Iago Borges, Daniel
> **Problema:** Dificuldade em encontrar profissionais confiáveis e disponíveis para serviços domésticos, reparos e manutenção.
> **Usuários:** Moradores, estudantes, idosos, famílias e pequenos comerciantes; também os profissionais autônomos que querem divulgar serviços.

---

## ✅ Nota do professor

MoSCoW coerente — a equipe acertou em cortar chat e IA. Atenção a dois pontos:

1. O app tem **dois lados** (quem busca serviço e quem oferece). O cadastro do prestador com seus serviços é tão essencial quanto a listagem — por isso virou issue M própria (IHP-02).
2. **Avaliação/reputação** não estava no MoSCoW, mas o Canvas fala em "profissionais confiáveis". Sem nenhum sinal de confiança, a listagem perde o sentido. Incluí uma versão mínima (estrelas) como Should Have (IHP-07) — vale a equipe discutir se sobe para M.

---

## Épicos

| Épico | Issues | Sprint |
|---|---|---|
| 🔐 Contas (cliente / prestador) | IHP-01, IHP-02 | Sprint 1 |
| 🛠️ Catálogo de Prestadores (núcleo) | IHP-03, IHP-04, IHP-05 | Sprint 2 |
| 📇 Perfil do Prestador | IHP-06 | Sprint 2 |
| ✨ Confiança e Busca | IHP-07, IHP-08, IHP-09 | Sprint 3 |

---

## Issues — Sprint 1 · Identidade e Login

### [M] IHP-01 · Cadastro e login (cliente / prestador)
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`

**História de usuário**
Como usuário, quero me cadastrar como cliente ou prestador, para acessar as funções certas para o meu objetivo.

**Critérios de aceite**
- [ ] Cadastro/login com e-mail/senha (Firebase Auth)
- [ ] Escolha do tipo (cliente | prestador) no cadastro
- [ ] Sessão persiste; logout no perfil
- [ ] Prestador vê "Meu perfil profissional"; cliente vê a busca

**Tarefas técnicas**
- [ ] Firebase Auth + coleção `usuarios` com `tipo`
- [ ] `AuthContext` + navegação condicional

---

### [M] IHP-02 · Cadastro do serviço do prestador
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`

**História de usuário**
Como prestador, quero cadastrar os serviços que ofereço, para aparecer nas buscas dos clientes.

**Critérios de aceite**
- [ ] Formulário: nome, categoria(s) de serviço, descrição, contato, região
- [ ] Perfil profissional salvo no Firestore
- [ ] Prestador pode editar o próprio perfil

**Tarefas técnicas**
- [ ] Coleção `prestadores`: `{ uid, nome, categorias[], descricao, contato, regiao }`

---

## Issues — Sprint 2 · Lógica de Negócio

### [M] IHP-03 · Listar prestadores
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como cliente, quero ver a lista de prestadores disponíveis, para escolher quem pode resolver meu problema.

**Critérios de aceite**
- [ ] FlatList com nome, categoria principal e região de cada prestador
- [ ] Dados carregam do Firestore com indicador de carregamento
- [ ] Lista vazia exibe mensagem amigável

**Tarefas técnicas**
- [ ] Componente `CardPrestador`
- [ ] Query da coleção `prestadores`

---

### [M] IHP-04 · Detalhe do prestador
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como cliente, quero ver o perfil completo de um prestador, para decidir se vou contratá-lo e como contatá-lo.

**Critérios de aceite**
- [ ] Tela exibe nome, categorias, descrição, região e contato
- [ ] Botão para acionar contato (telefone/WhatsApp via deep link)
- [ ] Voltar preserva a posição da lista

---

### [M] IHP-05 · Categorias de serviço
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como cliente, quero navegar pelas categorias mais solicitadas (elétrica, encanamento, pintura...), para chegar rápido ao tipo de serviço que preciso.

**Critérios de aceite**
- [ ] Tela inicial mostra as categorias principais
- [ ] Tocar numa categoria lista os prestadores dela
- [ ] Conjunto de categorias definido e documentado

**Tarefas técnicas**
- [ ] Lista fixa de categorias no MVP
- [ ] Filtro da listagem por categoria selecionada

---

### [M] IHP-06 · Perfil profissional editável
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como prestador, quero manter meu perfil atualizado, para refletir os serviços e contatos corretos.

**Critérios de aceite**
- [ ] Prestador edita nome, categorias, descrição, contato e região
- [ ] Alterações refletem imediatamente na listagem

---

## Issues — Sprint 3 · Polimento

### [S] IHP-07 · Avaliação por estrelas
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como cliente, quero avaliar um prestador com estrelas, para ajudar outros a escolherem profissionais confiáveis.

**Critérios de aceite**
- [ ] Cliente dá nota de 1 a 5 estrelas a um prestador
- [ ] Média de avaliações exibida no card e no detalhe
- [ ] Um cliente avalia cada prestador uma vez (pode atualizar)

---

### [S] IHP-08 · Barra de pesquisa
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como cliente, quero buscar prestadores por nome ou serviço, para chegar mais rápido ao que procuro.

**Critérios de aceite**
- [ ] Campo de busca filtra a lista em tempo real
- [ ] Busca por nome e por categoria

---

### [S] IHP-09 · Filtro por categoria na listagem
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como cliente, quero filtrar a lista por tipo de serviço, para ver só os profissionais relevantes.

**Critérios de aceite**
- [ ] Chips de categoria acima da lista
- [ ] Filtro aplica sem recarregar; "Todos" limpa

---

## Icebox (Could Have — sem milestone)

| ID | Item | Condição para entrar |
|---|---|---|
| IHP-C1 | Integração com redes sociais | Planejamento futuro |
| IHP-C2 | Chat em tempo real | Infraestrutura complexa |

## Fora do Escopo (Won't Have — registrado, não vira issue)

| Item | Motivo (da própria equipe) |
|---|---|
| Assistente de IA | Sem necessidade de implementação neste trimestre |
