# 📱 Campus App 2026

_Tecnologia feita por quem vive o campus._

**Projeto Final · Desenvolvimento de Dispositivos Móveis · IFTM Campus Uberlândia Centro**

![React Native](https://img.shields.io/badge/React_Native-20232A?style=for-the-badge&logo=react&logoColor=61DAFB)  ![Expo](https://img.shields.io/badge/Expo-000020?style=for-the-badge&logo=expo&logoColor=white)  ![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)  ![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)

![Status](https://img.shields.io/badge/status-em_desenvolvimento-red)  ![Equipes](https://img.shields.io/badge/equipes-12-blue)  ![Duração](https://img.shields.io/badge/dura%C3%A7%C3%A3o-12_semanas-green)

## 🎯 Sobre o Projeto

O **Campus App** é o projeto final da disciplina de Desenvolvimento de Dispositivos Móveis do IFTM — Campus Uberlândia. Durante **12 semanas**, seis equipes de estudantes vivenciam o ciclo completo de desenvolvimento de software: da identificação de um problema real do campus até a apresentação de um aplicativo funcional para uma banca avaliadora.

Cada aplicativo é construído em **React Native com Expo**, utilizando **Firebase** para autenticação e persistência de dados, e gerenciado com **metodologia ágil** (sprints quinzenais, daily meetings e backlog priorizado via MoSCoW).

## 💡 Motivação

> _A ideia começa no problema, não na tecnologia. Ninguém baixa um app que resolve um problema que não existe._

Tecnologia se aprende de verdade resolvendo problemas reais. Em vez de exercícios isolados, cada equipe escolheu uma dor concreta da comunidade do campus — apoio a estudantes neurodivergentes, divulgação de eventos, agendamento da quadra, monitorias, sobrecarga de atividades, transição para a vida adulta — e está transformando essa dor em produto.

O projeto desenvolve, ao mesmo tempo:

* **Competência técnica** — todos os módulos do curso (navegação, estado global, persistência, APIs, recursos do dispositivo) aplicados em um produto integrado;
* **Trabalho em equipe** — papéis definidos, code review entre colegas e testes cruzados entre grupos;
* **Comunicação** — cada equipe encerra o trimestre apresentando seu app no **Shark Tank IFTM**, com pitch para banca de convidados.

## 🗓️ Plano de Aulas — 12 Semanas

| Semanas | Fase | Conteúdo | Entrega | Pontos |
| --- | --- | --- | --- | --- |
| **1–2**<br>**01/06 a 12/06** | Ideação | Formação das equipes · Canvas do Problema · MVP Workshop (MoSCoW) | 1. Canvas do problema <br> 2. Backlog inicial | 1 <br> 1 |
| **3–4** <br> **15/06 a 26/06** | Design & Navegação | Wireframes no Figma · Estrutura React Navigation | 3. Wireframes todas as telas <br> 4. Telas navegáveis no Expo Go | 1 <br> 3 |
| **5–6** <br> **29/06 a 09/07** | Sprint 1 — Identidade | Login (Firebase Auth / Google) · Context API · AsyncStorage | 5. Autenticação funcionando | 5 |
| **7–8** <br> **28/07 a 07/08** | Sprint 2 — Lógica Core | Funcionalidade principal · FlatList · Firestore | 6. MVP de ponta a ponta | 5 |
| **9–10** <br> **10/08 a 21/08** | Sprint 3 — Polimento | Estilização · Testes cruzados · Correção de bugs | 7. App estável e estilizado | 5 |
| **11** <br> **24/08 a 28/08** | Pitch Deck | Slides: Problema / Solução / Demo / Próximos Passos · Ensaio | 8. Pitch de 5 minutos | 4 |
| **12** <br> **01/09 a 04/09** | Shark Tank IFTM | Apresentação para banca · Demo ao vivo no Expo Go | 9. Entrega final | 10 |

**Ritmo da sala:** toda aula começa com uma _Daily Meeting_ de 10 minutos — cada equipe responde: _o que fizemos? o que faremos hoje? existe algum impedimento?_

## Equipes

### 3º ano turma A

| Nome da equipe | Integrantes |
| --- | --- |
| Avisa IF | Rebeca, Adan, Alejandro, Enzo Eduardo, Enzo Leonardo |
| IFinanças | Gabriel Almeida, Vinicius Mendes, Gabelo, Davi Gonzaga |
| iHelp | Caio, Vitoria, Camille, Iago Borges, Daniel |
| IFala | Clara, Davi Rodovalho, Enzo Candido, Lucas Mercado |
| StudyDev | Iago Oliveira, Nicolas Bruno, Felipe Peixoto, Felipe Marques, Heitor Moreira |
| MonitoraIF | Heitor Leal, Gabriel Zumba, Otávio Rodrigues, João Lucas Sivieri |

### 3º ano turma B

| Nome da equipe | Integrantes | Backlog | Kanban |
| --- | --- | --- | --- |
| Anbylize | Luiza, Andressa, Byanca, Manuella | [Backlog](https://github.com/CampusAppIFTM/.github/blob/main/docs/3DSB_Backlog_Anbylize.md) | --- |
| FlowUp | Rafael Costa, Guilherme Ferreira, Luiz Meireles, Murilo Portes, Túlio Looks | <https://github.com/CampusAppIFTM/.github/blob/main/docs/3DSB_Backlog_FlowUp.md> | --- |
| Sincronize | Lara, Alexandre, Giovana, Matheus, Rian, Maria Eduarda | --- | --- |
| Radar Neuro Divergente | Ana Beatriz, João Victor, Maria Paula, Sarah | --- | --- |
| Monitorizador | Miguel Antonio, Erik, Kaique, Muryel | --- | --- |
| E Agora, Adulto? | Felipe Augusto, Gabriel Vieira, Heitor Calegari, Philipe Medeiros, Vitor Hugo | --- | --- |

## Stack Comum

| Camada | Tecnologia |
| --- | --- |
| Framework | React Native + Expo |
| Navegação | React Navigation (Stack · Bottom Tabs · Drawer) |
| Estado global | Context API |
| Autenticação | Firebase Authentication (e-mail/senha · Google) |
| Banco de dados | Cloud Firestore (tempo real via `onSnapshot`) |
| Persistência local | AsyncStorage |
| Notificações | expo-notifications (agendamento local) |
| Distribuição | Expo Go + EAS Internal Distribution (QR code) |

---

**Prof. Edson Angoti Júnior** · IFTM — Instituto Federal do Triângulo Mineiro · Campus Uberlândia Centro

_Apps construídos aqui. Problemas resolvidos aqui._ 🎓