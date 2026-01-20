# ??? Facade Pattern - Simplificação de Subsistemas em Delphi

> **"Interface Simples, Poder Oculto."**
> Este projeto demonstra como utilizar o padrão **Facade (Fachada)** para fornecer uma interface única e simplificada para um conjunto complexo de subsistemas, reduzindo o acoplamento entre a interface do usuário (UI) e a lógica de negócio.

---

## ?? Descrição e Objetivo

Em muitos sistemas, a realização de uma única tarefa (como finalizar uma venda) exige a interação com múltiplos módulos independentes. Sem um padrão adequado, a UI acaba "sabendo demais", instanciando e coordenando diversas classes.

**O Problema (Antes):**
O formulário principal precisaria conhecer e orquestrar as classes de `TEstoque`, `TFinanceiro` e `TNotaFiscal` manualmente. Qualquer mudança na forma como um desses subsistemas opera exigiria alterações diretas na unidade visual.

**A Solução (Depois):**
A UI interage exclusivamente com a interface `IVendaFacade`. A implementação concreta, `TVendaFacade`, assume a responsabilidade de coordenar os subsistemas internos, escondendo toda a complexidade técnica atrás de um único método: `FinalizarVenda`.

### Benefícios

- ? **Desacoplamento:** A interface do usuário não conhece as entranhas dos subsistemas de estoque ou financeiro.

- ? **Simplicidade:** Reduz o "ruído" visual no formulário, que passa a lidar com um contrato simples e direto.

- ? **Segurança Arquitetural:** Impede que a lógica de negócio vaze para a camada de apresentação.

- ? **Extensibilidade:** Através do uso de interfaces como `ILogger`, é possível injetar diferentes comportamentos (como logs em arquivo ou tela) sem alterar a fachada.

---

## ??? Estrutura do Projeto

- **`uVenda.Interfaces.pas`**: Define o contrato da fachada (`IVendaFacade`) e dos dados necessários (`IVendaDados`).

- **`uVenda.Facade.pas`**: Implementação da Fachada que orquestra os subsistemas.

- **`uSubsistemas.pas`**: Contém as classes concretas de negócio (`TEstoque`, `TFinanceiro`, `TNotaFiscal`).

- **`uLogger.Interfaces.pas`**: Define o contrato para registro de logs via Injeção de Dependência.

- **`uFrmPrincipal.pas`**: Interface visual que consome a fachada de forma desacoplada.

---

## ??? Instalação e Requisitos

### Pré-requisitos

- **IDE:** Delphi (Testado no Delphi 12, compatível com versões que suportam Interfaces e Generics).
- **Dependências:** Nenhuma dependência externa necessária.

### Instalação

1. Clone este repositório para sua máquina local.
2. Abra o projeto no Delphi.
3. Compile e execute para visualizar o log de execução orquestrado pela fachada.

---
