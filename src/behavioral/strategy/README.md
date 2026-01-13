## 💡 A Solução
Utilizamos o padrão **Strategy** (Comportamental) para encapsular cada algoritmo em uma classe separada (`TFreteSedex`, `TFretePAC`), implementando uma interface comum `ICalculoFrete`.

### Benefícios
*   **Extensibilidade (OCP):** Adicionar uma nova transportadora não exige alterar o código existente.
*   **Testabilidade:** Cada regra pode ser testada isoladamente.
*   **Limpeza:** O código cliente (`TFreteService`) apenas delega a execução, sem saber os detalhes do cálculo.

---

## 🛠️ Estrutura do Projeto

Este diretório contém apenas o **código-fonte** (Regras de Negócio).

*   `uFrete.Interfaces.pas`: Contrato (`ICalculoFrete`).
*   `uFrete.Strategies.pas`: Implementações concretas (Sedex, PAC, Grátis).
*   `uFrete.Service.pas`: Contexto que executa o cálculo.
*   `uFrmPrincipal.pas`: Exemplo visual de uso (VCL).

> **Onde estão os testes?**
> Os testes unitários (DUnitX) para este padrão encontram-se na pasta espelho:
> `../../../test/behavioral/strategy/`

---

## 🚀 Como Executar

1.  Abra o arquivo `delphi_clean_strategy.dpr` (ou o `.groupproj` na raiz).
2.  Compile o projeto.
3.  Execute para ver o cálculo funcionando na interface VCL.

---

## 🧪 Testes Unitários

Para validar as regras de negócio, abra o projeto de testes localizado na pasta `test`.
Ele utiliza **DUnitX** para garantir que o cálculo do Sedex e PAC estejam corretos.

> **Nota:** Os valores monetários e taxas utilizados (ex: custo do Sedex) são **fictícios** e servem apenas para fins didáticos.

---

<div align="center">
  Feito com 💙 e Delphi
</div>