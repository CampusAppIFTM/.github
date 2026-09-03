---
titulo: Kanban do backlog à entrega
descricao: Material didático sobre o processo de desenvolvimento de software com Kanban em equipes de até 6 desenvolvedores
versao_em_pagina: https://claude.ai/code/artifact/81d58d90-36ed-4703-8279-4e09091ba4fe
---

# Kanban do backlog à entrega

Kanban não determina papéis, não fixa iterações e não pede estimativas
em pontos. Ele faz três coisas: torna o trabalho visível, limita quanto
se faz ao mesmo tempo e usa o que o próprio fluxo mostra para melhorar o
processo. O texto a seguir percorre o caminho completo de um item — de
uma linha no backlog até um recurso publicado na loja — em uma equipe
pequena.

Equipe de referência: **6 desenvolvedores** Produto: **aplicativo móvel
(React Native + Expo)** Uso: **material didático**

Antes de entrar no fluxo, vale fixar o que Kanban é: um **método
evolutivo de gestão de fluxo de trabalho**. Ele não substitui o processo
que a equipe já tem — ele começa exatamente de onde a equipe está,
revela como o trabalho realmente anda e vai ajustando esse processo por
pequenas mudanças. Por isso não existe “instalar Kanban”: existe
visualizar o que já acontece e começar a agir sobre o que o quadro
mostra.

Princípios

- Comece com o que a equipe faz hoje; respeite papéis e cargos atuais.
- Busque melhoria incremental e evolutiva, não uma reforma de uma vez.
- Incentive iniciativa de melhoria em qualquer nível, não só na
  liderança.
- Entenda e atenda às necessidades de quem recebe o trabalho.

Práticas

- Visualizar o trabalho e o fluxo.
- Limitar o trabalho em progresso (WIP).
- Gerenciar o fluxo, não a ocupação das pessoas.
- Tornar as políticas explícitas.
- Criar ciclos de feedback em cadências regulares.
- Melhorar de forma colaborativa e experimental.

A ideia central vem do sistema de produção da Toyota: *kanban* é o
cartão que sinaliza permissão para produzir. Nada entra na etapa
seguinte porque alguém mandou; entra porque a etapa seguinte tem
capacidade livre e **puxa** o item. Todo o resto deste documento é
consequência dessa inversão.

------------------------------------------------------------------------

01

## O backlog: o estoque de opções

O backlog é uma lista ordenada de tudo que se cogita fazer no produto. A
palavra importante é *cogita*: em Kanban, um item no backlog é uma
**opção**, não um compromisso. Ninguém prometeu prazo, ninguém alocou
pessoa, e o item pode ser descartado sem custo. Isso é deliberado — o
custo de manter opções abertas é baixo, e o custo de assumir
compromissos cedo demais é alto.

Numa equipe de seis desenvolvedores, o backlog costuma reunir quatro
origens de trabalho, e é saudável que todas estejam na mesma lista,
disputando a mesma prioridade:

| Tipo           | Origem                                     | Fatia sugerida | Observação                                               |
|----------------|--------------------------------------------|----------------|----------------------------------------------------------|
| Funcionalidade | Visão de produto, pedidos de usuários      | ≈ 60%          | É o que justifica o produto; nunca deveria ser 100%.     |
| Defeito        | Suporte, testes, monitoramento em produção | ≈ 15%          | Bug recorrente é sintoma de processo, não de azar.       |
| Débito técnico | A própria equipe                           | ≈ 20%          | Sem cota reservada, sempre perde para funcionalidade.    |
| Manutenção     | Plataforma, dependências                   | ≈ 5%           | Em projeto móvel: SDK do Expo, versões de iOS e Android. |

Tipos de item e proporção típica de capacidade

### Como um item deve estar escrito

O formato mais usado é a história de usuário com critérios de aceitação,
porque força a descrever o resultado esperado em vez da solução técnica.
O que realmente importa é que o item responda a três perguntas: **para
quem**, **o que muda** e **como saberemos que está pronto**.

Exemplo de item

**Como aluno, quero acessar minha grade de aulas sem conexão**, para
consultar horários dentro do campus onde o sinal falha.

- A grade da semana corrente fica disponível após o primeiro
  carregamento com rede.
- Sem conexão, o aplicativo exibe os dados salvos e a data da última
  sincronização.
- Ao recuperar a conexão, a sincronização ocorre em segundo plano, sem
  bloquear a tela.
- Funciona em Android 10+ e iOS 15+, verificado em aparelho físico.

### Fatiar até caber no fluxo

Este é o ponto em que a maioria das equipes pequenas tropeça. Um item de
duas semanas trava o quadro: fica visível como uma única barra parada,
esconde o progresso real e impede que qualquer métrica de fluxo
signifique alguma coisa. A regra prática é fatiar **verticalmente** —
cada fatia atravessa interface, lógica e dados e entrega algo observável
— até que um item leve de **um a três dias** para ser concluído por uma
pessoa ou uma dupla.

Fatiar por camada (“fazer a tela”, depois “fazer a API”) parece
produtivo e não é: nenhuma das metades entrega valor sozinha, e o item
só termina quando as duas terminam. O item de exemplo acima se fatia bem
em três: exibir a grade vinda da rede; persistir e exibir os dados
salvos; sincronizar em segundo plano.

### Ordenar, não priorizar em “alta, média e baixa”

Prioridade em três níveis colapsa para “tudo alto”. O backlog precisa de
uma **ordem**: existe um primeiro item, um segundo, um terceiro. Os
critérios que sustentam essa ordem, em uma equipe pequena, cabem em
quatro perguntas — quanto valor entrega, qual o custo de atrasar, que
risco técnico ele elimina, e que outros itens ele destrava.

### Refinamento é contínuo, não é um evento

Não é preciso refinar o backlog inteiro. Basta manter **de dez a quinze
itens no topo** em estado utilizável, o que costuma consumir uma hora
por semana com duas ou três pessoas. Um item só é considerado *pronto
para puxar* quando satisfaz a política de entrada acordada pela equipe.

Política de entrada — exemplo

O item tem critérios de aceitação verificáveis; não depende de decisão
pendente de terceiros; cabe em até três dias; o comportamento em erro e
sem rede está definido; se houver interface nova, o desenho já existe.

------------------------------------------------------------------------

02

## Do backlog ao quadro: o ponto de compromisso

A passagem do backlog para o quadro é a transição mais importante do
método, e é onde a diferença em relação a um processo por iterações fica
clara. Existe uma linha no quadro — o **ponto de compromisso** — e o
item que a cruza deixa de ser opção e passa a ser trabalho assumido: a
equipe se compromete a levá-lo até o fim sem interrupções
desnecessárias, e o relógio das métricas começa a contar.

Duas consequências práticas decorrem disso. A primeira: o compromisso
deve ser assumido **o mais tarde possível**, quando já se sabe o
suficiente para começar e o item ainda é o mais valioso disponível. A
segunda: itens que cruzaram a linha não voltam para o backlog, salvo
cancelamento explícito — e cancelamento é um evento que merece ser
discutido, não um hábito.

Quem faz o item cruzar a linha não é uma reunião de planejamento que
enche uma caixa de duas semanas. É o **reabastecimento**: uma conversa
curta e regular, semanal na maioria das equipes de seis, em que se olha
quanto espaço existe na fila de entrada e se puxa exatamente essa
quantidade de itens do topo do backlog.

| Aspecto    | Antes (backlog)                | Depois (fila de entrada e quadro)       |
|------------|--------------------------------|-----------------------------------------|
| Natureza   | Opção descartável              | Compromisso da equipe                   |
| Ordem      | Reordenável a qualquer momento | Estável; mudar exige decisão consciente |
| Detalhe    | Pode estar em uma linha        | Critérios de aceitação definidos        |
| Tempo      | Não é medido                   | *Lead time* do sistema começa a contar  |
| Quantidade | Ilimitada                      | Sujeita a limite de WIP                 |

Backlog e fila de entrada — o que muda ao cruzar a linha

### Classes de serviço

Nem todo item merece o mesmo tratamento no fluxo. Distinguir quatro
classes evita que a equipe negocie prioridade caso a caso, todos os
dias:

| Classe     | Quando usar                                        | Política                                                                  |
|------------|----------------------------------------------------|---------------------------------------------------------------------------|
| Padrão     | Maioria dos itens                                  | Puxado pela ordem da fila; sem tratamento especial.                       |
| Urgente    | Falha em produção, bloqueio de usuários            | Fura a fila; no máximo **um por vez** no quadro; consome o limite de WIP. |
| Data fixa  | Prazo externo (matrícula, evento, exigência legal) | Entra no fluxo com folga calculada a partir do *lead time* histórico.     |
| Intangível | Débito técnico, atualização de SDK                 | Ocupa a cota reservada; cede lugar quando há item de data fixa em risco.  |

Classes de serviço e suas políticas

------------------------------------------------------------------------

03

## O quadro e os limites de WIP

### Por que limitar o WIP

Um limite de WIP é um número escrito no alto da coluna: aquela coluna
não pode conter mais itens do que isso. É a regra que transforma o
quadro em um **sistema puxado** — quando o limite está cheio, ninguém
começa nada novo ali; a única ação disponível é ajudar a terminar o que
já está em andamento.

O efeito é contraintuitivo para quem está começando: limitar o trabalho
simultâneo **aumenta** a velocidade de entrega. Trabalhar em seis itens
ao mesmo tempo não os entrega mais rápido — apenas faz os seis
terminarem juntos, lá no fim, depois de somar o custo de troca de
contexto, de revisões que esperam dias e de conflitos de *merge* em
ramos longos.

| Coluna                 | Limite | Justificativa                                                                                  |
|------------------------|--------|------------------------------------------------------------------------------------------------|
| Pronto para puxar      | 4      | Fila curta: garante trabalho disponível sem antecipar compromisso.                             |
| Em desenvolvimento     | 4      | Com duas duplas e dois trabalhos individuais, ocupa os seis sem multitarefa.                   |
| Revisão                | 2      | Fila cheia obriga alguém a revisar antes de puxar item novo.                                   |
| Verificação            | 2      | Mesma lógica; evita acúmulo de itens “quase prontos”.                                          |
| Pronto para publicar   | 3      | Buffer até a janela de publicação; se enche, publique mais vezes.                              |
| WIP total comprometido | 8      | ≈ 1,3 item por desenvolvedor — folga suficiente para bloqueios, apertada o bastante para doer. |

Limites iniciais sugeridos — 6 desenvolvedores

Como ajustar

Comece com o WIP total próximo ao número de pessoas e reduza aos poucos,
uma unidade por vez, enquanto o tempo de ciclo cair. Quando as pessoas
passarem a esperar sem ter o que fazer com frequência, o limite foi
longe demais — volte um. Limite que nunca é atingido não está regulando
nada; limite atingido todos os dias e sempre burlado não é uma política,
é um enfeite.

------------------------------------------------------------------------

04

## O ciclo de desenvolvimento de um item

Este é o ciclo que se repete continuamente. Note que ele não começa com
“receber uma tarefa”: começa com um desenvolvedor com capacidade livre
puxando o próximo item — a atribuição parte de quem executa, não de quem
coordena.

1.  <div>

    ### Puxar

    Ao concluir um item, o desenvolvedor olha o quadro **da direita para
    a esquerda**: existe algo bloqueado a destravar? Algo aguardando
    revisão? Algo em verificação? Só depois de esgotar essas opções ele
    puxa o primeiro item da fila de entrada, respeitando o limite da
    coluna, e escreve o próprio nome no cartão.

2.  <div>

    ### Alinhar antes de codificar

    Dez a vinte minutos com quem escreveu o item e, se houver risco
    técnico, com mais um colega: confirmar critérios de aceitação,
    decidir a abordagem, identificar o que pode dar errado. Se aparecer
    uma incerteza grande, é melhor devolver o item à fila do que
    descobrir isso no terceiro dia.

3.  <div>

    ### Implementar em ramo curto

    Um ramo por item, com vida de um a três dias. *Commits* pequenos,
    integração diária com a linha principal para evitar conflitos,
    testes escritos junto com o código. Se o ramo passa de três dias, o
    item estava mal fatiado — vale registrar isso e reaproveitar a lição
    no próximo refinamento.

4.  <div>

    ### Abrir a revisão

    O item vai para a coluna de revisão com a integração contínua já
    verde: verificação estática, testes e compilação para as duas
    plataformas. Numa equipe de seis, a política costuma ser **revisar
    em até quatro horas úteis**. Revisão parada é o gargalo mais comum e
    o mais fácil de resolver: quando a coluna encher, revisar vira a
    única tarefa disponível.

5.  <div>

    ### Integrar e verificar

    Aprovado, o ramo é integrado e a compilação de pré-visualização é
    gerada e instalada em aparelho físico — Android e iOS. A verificação
    testa os critérios de aceitação, não o código: comportamento sem
    rede, telas pequenas, permissões negadas, retorno de segundo plano.
    Quem verifica não é quem implementou.

6.  <div>

    ### Publicar

    O item aguarda a janela de publicação. Correções de JavaScript podem
    seguir por atualização remota no mesmo dia; mudanças que tocam
    código nativo exigem nova versão nas lojas, com o tempo de análise
    correspondente. Enquanto não estiver disponível ao usuário, o item
    **não está pronto** — é essa definição que mantém as métricas
    honestas.

7.  <div>

    ### Observar

    Depois da publicação, acompanhar erros, travamentos e uso por alguns
    dias. O que se aprende aqui volta ao backlog como item novo,
    fechando o ciclo.

Definição de pronto — exemplo

Critérios de aceitação verificados em aparelho físico Android e iOS ·
revisão aprovada por outra pessoa · testes automatizados passando na
integração contínua · sem regressão conhecida · texto de interface
revisado · publicado ou incluído na próxima versão agendada.

------------------------------------------------------------------------

05

## As cadências de coordenação

Kanban não tem cerimônias obrigatórias, mas tem **cadências**: reuniões
com frequência própria, cada uma com um propósito distinto. Numa equipe
de seis, quatro cadências bastam e somam menos de duas horas por semana.

| Cadência           | Frequência           | Duração   | Pergunta que responde                            |
|--------------------|----------------------|-----------|--------------------------------------------------|
| Reunião diária     | Todo dia, mesma hora | 15 min    | O que está impedindo os itens de andarem hoje?   |
| Reabastecimento    | Semanal              | 30–45 min | Quais itens cruzam o ponto de compromisso agora? |
| Revisão de entrega | Quinzenal            | 45 min    | O que foi publicado serviu a quem pediu?         |
| Revisão do sistema | Mensal               | 60 min    | O que as métricas dizem sobre o nosso processo?  |

Cadências para uma equipe de seis

### A reunião diária é sobre o quadro, não sobre as pessoas

A diferença em relação ao formato “o que fiz ontem, o que farei hoje” é
grande. Aqui a equipe **caminha o quadro da direita para a esquerda**,
item por item, e sobre cada um pergunta apenas: o que precisa acontecer
para ele avançar? Começar pela direita é intencional — os itens mais
próximos da entrega são os mais valiosos, porque já consumiram
investimento e ainda não devolveram nada.

Três sinais merecem parar a caminhada: cartões bloqueados, itens parados
há mais tempo que o normal e colunas no limite. Ninguém precisa relatar
o próprio dia; o quadro já relata.

------------------------------------------------------------------------

06

## Bloqueios, urgências e o fluxo travado

Um item bloqueado deve ser **marcado no quadro**, com o motivo e a data.
Deixar o cartão parado sem marca é perder a informação mais barata que o
processo produz: um mês depois, a lista de bloqueios revela padrões —
depende de aprovação externa, depende de credencial, depende de uma
única pessoa — e cada padrão é um item de melhoria concreto.

A tentação natural, ao ser bloqueado, é começar outro item. É exatamente
o que o limite de WIP existe para impedir. Em ordem de preferência, um
desenvolvedor bloqueado deve: remover o bloqueio; ajudar quem está com
um item mais à direita no quadro; parear com alguém em desenvolvimento;
e só então, com o acordo da equipe e o limite estourado de forma
explícita, iniciar algo novo.

Para urgências vale uma política escrita e curta, porque urgência
negociada no calor do momento vira urgência todos os dias: **no máximo
um item urgente no quadro por vez**, ele consome o limite de WIP como
qualquer outro, e todo urgente é revisado depois — por que não foi
previsto?

A frase que resume a prática

Pare de começar, comece a terminar. Um item concluído entrega valor;
seis itens pela metade entregam zero e ainda custam manutenção mental.

------------------------------------------------------------------------

07

## Métricas: saber se o fluxo está saudável

Kanban dispensa estimativas em pontos porque mede o que aconteceu de
verdade. Quatro números bastam, e todos saem do próprio quadro:

**4 d**Tempo de ciclo — mediana

**8 d**Tempo de ciclo — percentil 85

**6 / sem**Vazão média

**8**WIP comprometido

- **Tempo de ciclo** — do ponto de compromisso à publicação. É a
  promessa que a equipe pode fazer.
- ***Lead time*** — do pedido do cliente à publicação. Inclui a espera
  no backlog; é o que o usuário sente.
- **Vazão** — itens concluídos por semana. Base de qualquer previsão.
- **Idade do item em progresso** — há quantos dias cada cartão está no
  fluxo. É a única métrica que permite agir enquanto ainda dá tempo.

### Prever sem estimar

Com o histórico de tempos de ciclo, a equipe deixa de responder “quanto
tempo leva?” com um palpite e passa a responder com uma distribuição:
**metade dos itens fica pronta em até 4 dias e 85% em até 8 dias**. Essa
segunda frase é uma *expectativa de nível de serviço*, e ela se torna
uma ferramenta de gestão diária: qualquer cartão que passe de 8 dias no
fluxo é uma exceção e merece atenção imediata, sem esperar reunião.

<figure>

<p><em>[gráfico disponível na versão em página: dispersão de tempo de
ciclo / diagrama de fluxo cumulativo]</em></p>

<figcaption>Cada ponto é um item concluído. A dispersão importa mais que
a média: os três pontos acima da linha de 8 dias não são “atrasos”, são
<strong>casos a investigar</strong> — item mal fatiado, dependência
externa ou revisão esquecida.</figcaption>
</figure>

<figure>

<p><em>[gráfico disponível na versão em página: dispersão de tempo de
ciclo / diagrama de fluxo cumulativo]</em></p>

<figcaption>O diagrama de fluxo cumulativo lê-se em duas direções: a
<strong>distância vertical</strong> entre as bordas de uma faixa é o WIP
daquele estado; a <strong>distância horizontal</strong> é o tempo médio
que os itens passam nele. Faixas que engordam ao longo do tempo indicam
gargalo; faixas paralelas indicam fluxo estável.</figcaption>
</figure>

### A relação que amarra tudo

A Lei de Little diz que, em um sistema estável, **WIP = vazão × tempo de
ciclo**. Com os números da equipe de exemplo: 8 itens em progresso ÷ 6
itens por semana ≈ 1,3 semana de tempo de ciclo. A consequência prática
é direta e não depende de esforço: *para entregar mais rápido sem
contratar ninguém, reduza o WIP*.

### Eficiência de fluxo

Compare o tempo em que o item esteve efetivamente sendo trabalhado com o
tempo total no fluxo. O resultado costuma ser desconfortável — e é o
argumento mais convincente a favor de limitar o WIP:

<figure>

<p><em>[barra de eficiência de fluxo do item #131]</em></p>

<figcaption>Item #131, 53 horas úteis do compromisso à publicação.
Trabalho efetivo: 10 horas — <strong>eficiência de fluxo de
19%</strong>. Nenhuma pessoa foi lenta; as filas é que foram longas.
Otimizar as 10 horas rende pouco; encurtar as 43 horas de espera rende
tudo.</figcaption>
</figure>

------------------------------------------------------------------------

08

## Melhoria contínua e evolutiva

O quadro é um instrumento de medição, e a revisão mensal do sistema é
quando a equipe lê esse instrumento e decide um experimento — **um por
vez**, com hipótese declarada e prazo para avaliação. Mudar três coisas
ao mesmo tempo impede saber qual delas funcionou.

| O que o quadro mostra                     | Causa provável                      | Experimento                                                          |
|-------------------------------------------|-------------------------------------|----------------------------------------------------------------------|
| Coluna de revisão sempre cheia            | Revisar não é prioridade de ninguém | Baixar o limite para 1 e revisar antes de qualquer coisa pela manhã. |
| Muitos itens acima do p85                 | Fatias grandes demais               | Recusar, no reabastecimento, itens estimados acima de 3 dias.        |
| Bloqueios repetidos pelo mesmo motivo     | Dependência externa fixa            | Adicionar a dependência à política de entrada da fila.               |
| Faixa de “pronto para publicar” crescendo | Publicação rara demais              | Passar de publicação quinzenal para semanal.                         |
| Defeitos consumindo mais de 25% da vazão  | Verificação tardia                  | Testes automatizados obrigatórios no item, antes da revisão.         |

Do sintoma no quadro ao experimento

------------------------------------------------------------------------

Apoio

## Papéis em uma equipe de seis

Kanban define apenas dois papéis, e nenhum deles distribui tarefas. Numa
equipe pequena, ambos podem ser acumulados por pessoas que também
desenvolvem.

### Solicitante do serviço

Representa quem recebe o produto. Mantém o backlog ordenado, escreve e
refina os itens, conduz o reabastecimento e decide o que cruza o ponto
de compromisso. Não decide quem faz o quê.

### Facilitador de fluxo

Cuida do sistema, não das pessoas. Conduz a reunião diária, expõe
bloqueios e itens envelhecidos, mantém as métricas visíveis e provoca os
experimentos de melhoria. Costuma ser papel rotativo.

### Desenvolvedores (6)

Puxam o próprio trabalho, revisam uns aos outros, verificam itens de
colegas e respeitam os limites de WIP. A autonomia é a contrapartida das
políticas explícitas: como as regras estão escritas, ninguém precisa
autorizar cada passo.

------------------------------------------------------------------------

Apoio

## Um item, do começo ao fim

O item \#132 — *sincronizar a grade em segundo plano* — nasceu do
feedback de alunos, ficou onze dias no backlog e atravessou o quadro em
seis dias úteis.

| Dia | Estado             | O que aconteceu                                                                                        |
|-----|--------------------|--------------------------------------------------------------------------------------------------------|
| —   | Backlog            | Registrado a partir de três relatos de alunos; fatiado em três itens no refinamento.                   |
| Seg | Pronto para puxar  | Cruza o ponto de compromisso no reabastecimento. O relógio do tempo de ciclo começa.                   |
| Ter | Em desenvolvimento | Dupla AL+RM puxa o item ao concluir o \#128; alinhamento de 15 min sobre a política de nova tentativa. |
| Qua | Em desenvolvimento | Bloqueio: credencial do serviço de notificações vencida. Cartão marcado, bloqueio resolvido em 4 h.    |
| Qui | Revisão            | Integração contínua verde; revisão aprovada em 3 h com dois ajustes de tratamento de erro.             |
| Sex | Verificação        | Compilação de pré-visualização testada em dois aparelhos, com modo avião e retorno de segundo plano.   |
| Seg | Publicado          | Incluído na versão semanal. Tempo de ciclo: 6 dias — dentro do p85 de 8.                               |

Histórico do item \#132

------------------------------------------------------------------------

Apoio

## Armadilhas comuns

| Armadilha                    | Como se manifesta                                  | Correção                                                                  |
|------------------------------|----------------------------------------------------|---------------------------------------------------------------------------|
| Quadro sem limites           | Virou lista de tarefas colorida; tudo em “fazendo” | Definir limite por coluna e tratá-lo como regra, não sugestão.            |
| Colunas que mentem           | Três colunas para um fluxo de sete estados         | Mapear os estados reais, inclusive as esperas.                            |
| Otimizar ocupação            | “Ninguém pode ficar parado”                        | Gerenciar o fluxo dos itens; ociosidade eventual é o preço da velocidade. |
| Itens gigantes               | Cartões parados por semanas                        | Fatiar verticalmente até caber em três dias.                              |
| Urgência permanente          | Tudo fura a fila                                   | Uma vaga de urgência; revisar cada uso na retrospectiva.                  |
| Métricas para cobrar pessoas | Comparação de vazão individual                     | Métricas descrevem o sistema; individualizá-las destrói a colaboração.    |
| Concluído ≠ entregue         | Coluna final cheia há um mês                       | Só é pronto quando está com o usuário.                                    |

O que costuma dar errado em equipes pequenas

------------------------------------------------------------------------

Apoio

## Kanban e Scrum, lado a lado

| Aspecto               | Kanban                                     | Scrum                          |
|-----------------------|--------------------------------------------|--------------------------------|
| Ritmo                 | Fluxo contínuo; entrega quando pronto      | Sprints de duração fixa        |
| Compromisso           | Item a item, no último momento responsável | Conjunto de itens por sprint   |
| Limite de trabalho    | WIP por coluna                             | Escopo do sprint               |
| Previsão              | Percentis do tempo de ciclo                | Velocidade em pontos           |
| Papéis                | Dois, opcionais                            | Três, obrigatórios             |
| Mudança de prioridade | A qualquer momento, antes do compromisso   | Entre sprints                  |
| Adoção                | Sobre o processo existente                 | Substitui o processo existente |

Comparação para fins didáticos — não são alternativas excludentes

Equipes que atendem demanda imprevisível — sustentação, produto com
muitos defeitos, prioridades que mudam na semana — tendem a se sair
melhor com fluxo contínuo. Equipes que precisam de um ritmo forte de
alinhamento se beneficiam da caixa de tempo. Combinar os dois é comum e
legítimo.

------------------------------------------------------------------------

Apoio

## As primeiras quatro semanas

1.  <div>

    ### Semana 1 — visualizar

    Mapear os estados reais acompanhando dois itens concluídos. Montar o
    quadro, físico ou digital, e colocar nele **todo** o trabalho em
    andamento — inclusive o que ninguém costuma registrar. O susto com a
    quantidade faz parte do método.

2.  <div>

    ### Semana 2 — escrever as políticas

    Definir por escrito, ao lado de cada coluna, o que significa entrar
    e sair dela. Acordar a definição de pronto e a política de urgência.
    Começar a marcar bloqueios com data.

3.  <div>

    ### Semana 3 — limitar

    Estabelecer limites de WIP generosos e respeitá-los por duas semanas
    antes de discutir números. Iniciar a reunião diária caminhando o
    quadro da direita para a esquerda.

4.  <div>

    ### Semana 4 — medir

    Registrar data de compromisso e data de conclusão de cada item. Com
    cerca de vinte itens concluídos, o primeiro gráfico de dispersão já
    sustenta uma conversa de melhoria — e a partir daí o ciclo se repete
    todos os meses.

------------------------------------------------------------------------

Apoio

## Para aprofundar

ANDERSON, David J. *Kanban: mudança evolucionária de sucesso para seu
negócio de tecnologia*. Blue Hole Press, 2010. — a formulação original
do método.

VACANTI, Daniel S. *Actionable Agile Metrics for Predictability*.
ActionableAgile Press, 2015. — tempo de ciclo, percentis e previsão sem
estimativas.

BURROWS, Mike. *Kanban from the Inside*. Blue Hole Press, 2014. — os
princípios por trás das práticas.

ANDERSON, David J.; CARMICHAEL, Andy. *Essential Kanban Condensed*. Lean
Kanban University Press, 2016. — resumo gratuito e conciso do método.

REINERTSEN, Donald G. *The Principles of Product Development Flow*.
Celeritas, 2009. — a base econômica de filas, lotes e WIP.