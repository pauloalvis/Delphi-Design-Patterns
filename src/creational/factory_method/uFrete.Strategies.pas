unit uFrete.Strategies;

interface

uses
  uFrete.Interfaces;

type
  TFreteSedex = class(TInterfacedObject, ICalculoFrete)
  public
    function Calcular(const APeso: Double): Double;
  end;

  TFretePAC = class(TInterfacedObject, ICalculoFrete)
  public
    function Calcular(const APeso: Double): Double;
  end;

  TFreteGratis = class(TInterfacedObject, ICalculoFrete)
  public
    function Calcular(const APeso: Double): Double;
  end;

implementation

{ TFreteSedex }
function TFreteSedex.Calcular(const APeso: Double): Double;
begin
  // R$ 0,50 por Kg + R$ 20,00 fixo (Valor Fictício)
  Result := (APeso * 0.50) + 20.00;
end;

{ TFretePAC }
function TFretePAC.Calcular(const APeso: Double): Double;
begin
  // R$ 0,20 por Kg + R$ 10,00 fixo (Valor Fictício)
  Result := (APeso * 0.20) + 10.00;
end;

{ TFreteGratis }
function TFreteGratis.Calcular(const APeso: Double): Double;
begin
  Result := 0.00;
end;

end.

