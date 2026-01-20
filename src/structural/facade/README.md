# 🝗︝ Facade Pattern - Simplificação de Subsistemas em Delphi

> **"Interface Simples, Poder Oculto."**
> Este projeto demonstra como utilizar o padrão **Facade (Fachada)** para fornecer uma interface única e simplificada para um conjunto complexo de subsistemas, reduzindo o acoplamento entre a interface do utilizador (UI) e a lógica de negócio.

---

## 📋 Descrição e Objetivo

Em muitos sistemas, a realização de uma única tarefa (como finalizar uma venda) exige a interação com múltiplos módulos independentes. Sem um padrão adequado, a UI acaba "sabendo demais", instanciando e coordenando diversas classes de baixo nível.

**O Problema (Antes):**
O formulário principal precisaria de conhecer e orquestrar as classes de `TEstoque`, `TFinanceiro` e `TNotaFiscal` manualmente. Qualquer mudança na forma como um desses subsistemas opera exigiria alterações diretas na unidade visual.

**A Solução (Depois):**
A UI interage exclusivamente com a interface `IVendaFacade`. A implementação concreta, `TVendaFacade`, assume a responsabilidade de coordenar os subsistemas internos, escondendo toda a complexidade técnica atrás de um único método: `FinalizarVenda`.

### Benefícios

- ✅ **Desacoplamento:** A interface do utilizador não conhece as entranhas dos subsistemas de estoque ou financeiro.
- ✅ **Simplicidade:** Reduz o "ruído" visual no formulário, que passa a lidar com um contrato simples e direto.
- ✅ **Segurança Arquitetural:** Impede que a lógica de negócio "vaze" para a camada de apresentação.
- ✅ **Extensibilidade:** Através do uso de interfaces como `ILogger`, é possível injetar diferentes comportamentos (como logs em memo, ficheiro ou base de dados) sem alterar a fachada.

---

## 🛠︝ Estrutura do Projeto

- **`uVenda.Interfaces.pas`**: Define o contrato da fachada (`IVendaFacade`) e o transporte de dados (`IVendaDados`).
- **`uVenda.Facade.pas`**: Implementação da Fachada que orquestra os subsistemas de estoque, financeiro e fiscal.
- **`uSubsistemas.pas`**: Contém as classes concretas de negócio que executam as tarefas específicas.
- **`uLogger.Interfaces.pas`**: Define o contrato para registo de logs via Injeção de Dependência.
- **`uFrmPrincipal.pas`**: Interface visual que consome a fachada de forma totalmente desacoplada.

---

## 🛠︝ Instalação e Requisitos

### Pré-requisitos

- **IDE:** Delphi (Testado no Delphi 12, compatível com versões que suportam Interfaces e Generics).
- **Conhecimento:** Conceitos básicos de Programação Orientada a Objetos e Interfaces.

### Instalação

1.  Faz o clone deste repositório para a tua máquina local.
2.  Abre o projeto (`.dproj`) no Delphi.
3.  Compila e executa para observar no log como a fachada coordena os três subsistemas com um único comando da UI.
