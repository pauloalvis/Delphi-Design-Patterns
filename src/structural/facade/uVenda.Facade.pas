unit uVenda.Facade;

interface

uses
  uVenda.Interfaces, uSubsistemas, uLogger.Interfaces;

type
  TVendaFacade = class(TInterfacedObject, IVendaFacade)
  private
    FEstoque: TEstoque;
    FFinanceiro: TFinanceiro;
    FNotaFiscal: TNotaFiscal;
    FLogger: ILogger;
  public
    // Injeção de Dependência via Construtor
    constructor Create(ALogger: ILogger);
    destructor Destroy; override;

    procedure FinalizarVenda(Dados: IVendaDados);
  end;

implementation

{ TVendaFacade }

constructor TVendaFacade.Create(ALogger: ILogger);
begin
  FLogger := ALogger;

  // Repassa o logger para os subsistemas
  FEstoque := TEstoque.Create(ALogger);
  FFinanceiro := TFinanceiro.Create(ALogger);
  FNotaFiscal := TNotaFiscal.Create(ALogger);
end;

destructor TVendaFacade.Destroy;
begin
  FEstoque.Free;
  FFinanceiro.Free;
  FNotaFiscal.Free;
  inherited;
end;

procedure TVendaFacade.FinalizarVenda(Dados: IVendaDados);
var
  LRegistrarLog: Boolean;
begin
  LRegistrarLog := Assigned(FLogger);

  if LRegistrarLog then
    FLogger.Registrar('--- INICIANDO PROCESSO (VIA FACADE) ---');

  FEstoque.BaixarEstoque('Produto Genérico', 1);
  FFinanceiro.Faturar(Dados.GetValorTotal);
  FNotaFiscal.Emitir(Dados.GetCliente);

  if LRegistrarLog then
    FLogger.Registrar('--- VENDA FINALIZADA ---');
end;

end.

