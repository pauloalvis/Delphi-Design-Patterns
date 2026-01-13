unit uFrete.Service;

interface

uses
  uFrete.Interfaces;

type
  TFreteService = class
  private
    FEstrategia: ICalculoFrete;
  public
    // Injeção de Dependência via Construtor (Clean Code)
    constructor Create(const AEstrategia: ICalculoFrete);

    function ExecutarCalculo(const AValor: Currency): Currency;
    function ObterDescricaoServico: string;
  end;

implementation

uses
  System.SysUtils;

constructor TFreteService.Create(const AEstrategia: ICalculoFrete);
begin
  FEstrategia := AEstrategia;
end;

function TFreteService.ExecutarCalculo(const AValor: Currency): Currency;
begin
  // Adicione esta validação no início do método
  if AValor < 0 then
    raise Exception.Create('O valor do pedido não pode ser negativo.');

  // O serviço não sabe se é Sedex ou PAC, ele apenas pede para calcular.
  Result := FEstrategia.Calcular(AValor);
end;

function TFreteService.ObterDescricaoServico: string;
begin
  Result := 'Calculando via: ' + FEstrategia.ObterNome;
end;

end.

