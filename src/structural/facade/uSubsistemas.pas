unit uSubsistemas;

interface

uses
  System.SysUtils, uLogger.Interfaces;

type
  TEstoque = class
  private
    FLogger: ILogger;
  public
    constructor Create(ALogger: ILogger);
    procedure BaixarEstoque(Produto: String; Qtde: Integer);
  end;

  TFinanceiro = class
  private
    FLogger: ILogger;
  public
    constructor Create(ALogger: ILogger);
    procedure Faturar(Valor: Currency);
  end;

  TNotaFiscal = class
  private
    FLogger: ILogger;
  public
    constructor Create(ALogger: ILogger);
    procedure Emitir(Cliente: String);
  end;

implementation

{ TEstoque }
constructor TEstoque.Create(ALogger: ILogger);
begin
  FLogger := ALogger;
end;

procedure TEstoque.BaixarEstoque(Produto: String; Qtde: Integer);
begin
  if Assigned(FLogger) then
    FLogger.Registrar('⬇️ Estoque baixado: ' + Produto);
end;

{ TFinanceiro }
constructor TFinanceiro.Create(ALogger: ILogger);
begin
  FLogger := ALogger;
end;

procedure TFinanceiro.Faturar(Valor: Currency);
begin
  if Assigned(FLogger) then
    FLogger.Registrar('💰 Faturamento realizado: ' +  FormatCurr('"R$" #,##0.00', Valor));
end;

{ TNotaFiscal }
constructor TNotaFiscal.Create(ALogger: ILogger);
begin
  FLogger := ALogger;
end;

procedure TNotaFiscal.Emitir(Cliente: String);
begin
  if Assigned(FLogger) then
    FLogger.Registrar('📄 NF emitida para: ' + Cliente);
end;

end.

