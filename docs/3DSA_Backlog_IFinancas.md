# Backlog Inicial — IFinanças

> **Equipe:** Davi Gonzaga, Gabelo, Gabriel Almeida, Vinicius Mendes
> **Problema:** Dificuldade em contabilizar os gastos mensais do dia a dia — não há ferramenta dedicada; quem controla usa planilha.
> **Usuários:** Alunos e servidores vinculados ao IFTM (~200 pessoas).

---

## ✅ Nota do professor

MoSCoW bem montado. Único ajuste: o item M da equipe juntou **5 funcionalidades em uma linha** (cadastro, registro, classificação, dashboard, alertas). Para o kanban, cada uma virou issue própria — todas continuam M, mas assim cabem em cards de até 2 aulas e o progresso fica visível. O "alerta de gastos" foi rebaixado para S, pois o app entrega valor sem ele (registrar + classificar + dashboard já resolvem o problema central).

---

## Épicos

| Épico | Issues | Sprint |
|---|---|---|
| 🔐 Autenticação | IFI-01 | Sprint 1 |
| 💰 Registro de Gastos (núcleo) | IFI-02, IFI-03, IFI-04 | Sprint 2 |
| 📊 Dashboard | IFI-05, IFI-06 | Sprint 2 |
| ✨ Acompanhamento | IFI-07, IFI-08, IFI-09 | Sprint 3 |

---

## Issues — Sprint 1 · Identidade e Login

### [M] IFI-01 · Cadastro, login e sessão persistente
**Milestone:** Sprint 1 — Identidade e Login · **Labels:** `must-have`, `sprint-1`

**História de usuário**
Como usuário, quero criar conta e permanecer logado, para que meus dados financeiros fiquem salvos e privados.

**Critérios de aceite**
- [ ] Cadastro/login com e-mail/senha (Firebase Auth)
- [ ] Sessão persiste entre aberturas (AsyncStorage)
- [ ] Cada usuário só enxerga os próprios dados
- [ ] Logout no perfil

**Tarefas técnicas**
- [ ] Firebase Auth + `AuthContext`
- [ ] Regras de segurança do Firestore por UID

---

## Issues — Sprint 2 · Lógica de Negócio

### [M] IFI-02 · Registrar gasto
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como usuário, quero registrar um gasto com valor, descrição e data, para acompanhar para onde meu dinheiro está indo.

**Critérios de aceite**
- [ ] Formulário: valor, descrição, data, categoria
- [ ] Validação: valor numérico positivo; campos obrigatórios
- [ ] Gasto salvo no Firestore aparece imediatamente na lista

**Tarefas técnicas**
- [ ] Coleção `transacoes/{uid}`: `{ valor, descricao, data, categoria, tipo }`
- [ ] Máscara de valor monetário no input

---

### [M] IFI-03 · Classificar gasto (escola / fora dela)
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como usuário do IFTM, quero classificar cada gasto como "na escola" ou "fora dela", para entender quanto gasto no instituto (diferencial do Canvas).

**Critérios de aceite**
- [ ] Seleção de contexto (escola | fora) no registro
- [ ] Categoria livre adicional (alimentação, transporte, etc.)
- [ ] Dashboard separa os totais por contexto

**Tarefas técnicas**
- [ ] Campo `contexto` na transação
- [ ] Conjunto fixo de categorias + contexto

---

### [M] IFI-04 · Listar e remover transações
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como usuário, quero ver todas as minhas transações em uma lista e poder remover lançamentos errados, para manter o controle correto.

**Critérios de aceite**
- [ ] FlatList ordenada por data (mais recente primeiro)
- [ ] Cada item mostra valor, descrição, categoria e contexto
- [ ] Deslizar/segurar permite remover com confirmação

---

### [M] IFI-05 · Dashboard com resumo financeiro
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como usuário, quero ver na tela inicial meu saldo, total de receitas e despesas, para ter a visão geral em poucos toques.

**Critérios de aceite**
- [ ] Painel exibe total gasto no mês, por contexto (escola/fora)
- [ ] Cartões informativos com os números principais
- [ ] Atualiza automaticamente ao registrar/remover transação

**Tarefas técnicas**
- [ ] Cálculo de totais a partir das transações do mês
- [ ] Componentes de cartão reutilizáveis

---

### [M] IFI-06 · Gráfico simples de gastos por categoria
**Milestone:** Sprint 2 — Lógica de Negócio · **Labels:** `must-have`, `sprint-2`

**História de usuário**
Como usuário, quero ver um gráfico dos meus gastos por categoria, para identificar onde gasto mais.

**Critérios de aceite**
- [ ] Gráfico de pizza ou barras por categoria no mês
- [ ] Legenda com valor/percentual por categoria
- [ ] Reflete os dados reais do Firestore

**Tarefas técnicas**
- [ ] Avaliar lib de gráfico leve para RN (decidir e registrar)
- [ ] Agregar transações por categoria

---

## Issues — Sprint 3 · Polimento

### [S] IFI-07 · Alertas de gastos
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como usuário, quero ser alertado quando passar de um limite definido, para evitar gastar demais.

**Critérios de aceite**
- [ ] Definição de limite mensal no perfil
- [ ] Aviso visual no dashboard ao ultrapassar o limite

---

### [S] IFI-08 · Metas financeiras simples
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como usuário, quero definir uma meta de economia, para acompanhar minha evolução.

**Critérios de aceite**
- [ ] Cadastro de meta (valor + prazo)
- [ ] Barra de progresso da meta no dashboard

---

### [S] IFI-09 · Relatório mensal e histórico
**Milestone:** Sprint 3 — Polimento · **Labels:** `should-have`, `sprint-3`

**História de usuário**
Como usuário, quero ver o histórico de meses anteriores, para comparar minha evolução financeira.

**Critérios de aceite**
- [ ] Seletor de mês/ano
- [ ] Resumo do mês selecionado com os mesmos cartões do dashboard

---

## Icebox (Could Have — sem milestone)

| ID | Item | Condição para entrar |
|---|---|---|
| IFI-C1 | Gráficos avançados | Sprint 3 com folga |
| IFI-C2 | Exportar relatório em PDF | Sprint 3 com folga |

## Fora do Escopo (Won't Have — registrado, não vira issue)

| Item | Motivo (da própria equipe) |
|---|---|
| Investimentos | Funcionalidade complexa |
| Pix e pagamentos pelo app | Envolve transações financeiras reais |
| IA para recomendações financeiras | Complexa para a primeira versão |
