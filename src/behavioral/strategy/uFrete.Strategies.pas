unit uFrete.Strategies;

interface

uses
  uFrete.Interfaces;

type
  // Estratégia: SEDEX (Mais caro, mais rápido)
  TFreteSedex = class(TInterfacedObject, ICalculoFrete)
  public
    function Calcular(const AValorPedido: Currency): Currency;
    function ObterNome: string;
  end;

  // Estratégia: PAC (Mais barato)
  TFretePAC = class(TInterfacedObject, ICalculoFrete)
  public
    function Calcular(const AValorPedido: Currency): Currency;
    function ObterNome: string;
  end;

  // Estratégia: Grátis (Regra de negócio: acima de X valor ou promoção)
  TFreteGratis = class(TInterfacedObject, ICalculoFrete)
  public
    function Calcular(const AValorPedido: Currency): Currency;
    function ObterNome: string;
  end;

implementation

{ TFreteSedex }

function TFreteSedex.Calcular(const AValorPedido: Currency): Currency;
begin
  // Exemplo: 15% do valor + taxa fixa de 20 reais
  Result := (AValorPedido * 0.15) + 20.00;
end;

function TFreteSedex.ObterNome: string;
begin
  Result := 'SEDEX (Expresso)';
end;

{ TFretePAC }

function TFretePAC.Calcular(const AValorPedido: Currency): Currency;
begin
  // Exemplo: 10% do valor
  Result := AValorPedido * 0.10;
end;

function TFretePAC.ObterNome: string;
begin
  Result := 'PAC (Econômico)';
end;

{ TFreteGratis }

function TFreteGratis.Calcular(const AValorPedido: Currency): Currency;
begin
  Result := 0.00;
end;

function TFreteGratis.ObterNome: string;
begin
  Result := 'Frete Grátis (Promocional)';
end;

end.

