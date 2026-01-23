# Padrão Observer (Publish-Subscribe)

## ?? A Solução

Utilizamos o padrão **Observer** (Comportamental) para criar um mecanismo de notificação onde a Regra de Negócio (`TLoja`) não conhece seus dependentes (`TCliente`, `Logs`, `Interface`).

Em vez da Loja atualizar a tela diretamente (o que geraria acoplamento forte), ela apenas notifica seus inscritos.

### Benefícios

- **Desacoplamento:** A classe `TLoja` não possui referências à unit do formulário (`uFrmObserver`).
- **Reatividade:** Múltiplos objetos podem reagir à mesma mudança de estado (ex: atualizar log e tela simultaneamente).
- **Extensibilidade (OCP):** É possível adicionar novos tipos de observadores (ex: enviar e-mail) sem alterar uma linha de código da classe `TLoja`.

---

## ??? Estrutura do Projeto

Este diretório contém a implementação do padrão aplicada ao cenário de **Promoções de Loja**.

- `uObserver.Interfaces.pas`: Contratos (`IPublisher`, `ISubscriber`). Define como os objetos conversam.
- `uObserver.Publisher.pas`: O Sujeito (`TLoja`). Gerencia a lista de inscritos e dispara notificações.
- `uObserver.Concrete.pas`: O Observador (`TCliente`). Recebe a notificação e executa uma ação (via callback).
- `uFrmObserver.pas`: A Camada de Apresentação (VCL). Atua como o "compositor", ligando a Loja aos Clientes.

> Onde estão os testes?
> Os testes unitários (DUnitX) para este padrão encontram-se na pasta espelho:
> ../../../test/behavioral/observer/

---

## ?? Como Executar

1. Abra o projeto no Delphi (versão Berlin ou superior).
2. Compile a aplicação.
3. No formulário, utilize os **Checkboxes** para inscrever ou remover clientes dinamicamente.
4. Clique em **"Lançar Promoção"** e observe como apenas os clientes marcados recebem a notificação no Log.

---

## ?? Testes Unitários

Para validar a lógica de notificação sem depender da interface gráfica, execute o projeto de testes localizado na pasta `test`.

O teste `uTestObserver.pas` valida:

1. Se a inscrição (`Subscribe`) funciona.
2. Se a notificação (`Notify`) entrega a mensagem correta com o preço formatado.
3. Se a remoção (`Unsubscribe`) impede o recebimento de novas mensagens.

---

<div align="center">
Feito com ?? e Delphi
</div>
