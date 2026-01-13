unit uFrete.Interfaces;

interface

type
  // Interface para a estratégia de cálculo
  ICalculoFrete = interface
    ['{A1B2C3D4-E5F6-7890-1234-567890ABCDEF}']
    function Calcular(const AValorPedido: Currency): Currency;
    function ObterNome: string; // Para exibir na tela qual foi usado
  end;

implementation

end.

