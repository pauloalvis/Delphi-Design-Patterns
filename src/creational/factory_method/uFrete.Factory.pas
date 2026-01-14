unit uFrete.Factory;

interface

uses
  uFrete.Interfaces;

type
  TFreteFactory = class
  public
    // Método de Classe (Static): Não precisa instanciar a fábrica para usar
    class function Criar(const ATipo: TTipoFrete): ICalculoFrete;
  end;

implementation

uses
  System.SysUtils,
  uFrete.Strategies; // A Factory é a ÚNICA que conhece as classes concretas

{ TFreteFactory }

class function TFreteFactory.Criar(const ATipo: TTipoFrete): ICalculoFrete;
begin
  case ATipo of
    tfSedex:  Result := TFreteSedex.Create;
    tfPAC:    Result := TFretePAC.Create;
    tfGratis: Result := TFreteGratis.Create;
  else
    raise Exception.Create('Tipo de frete não implementado na Factory.');
  end;
end;

end.

