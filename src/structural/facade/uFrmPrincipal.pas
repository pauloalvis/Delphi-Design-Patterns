unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  // Units do projeto
  uVenda.Interfaces, uVenda.Facade, uLogger.Interfaces;

type
  TFrmPrincipal = class(TForm, ILogger)
    pnlHeader: TPanel;
    lblTitulo: TLabel;
    pnlBody: TPanel;
    lblCliente: TLabel;
    edtCliente: TEdit;
    lblValor: TLabel;
    edtValor: TEdit;
    btnFinalizar: TButton;
    memLog: TMemo;
    lblLog: TLabel;
    procedure btnFinalizarClick(Sender: TObject);
  private
    procedure Registrar(const Msg: String);
  public
  end;

  TDadosTela = class(TInterfacedObject, IVendaDados)
  private
    FCliente: String;
    FValor: Extended;
  public
    constructor Create(const ACliente: String; const AValor: Extended);
    function GetCliente: String;
    function GetValorTotal: Extended;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

{ TDadosTela }
constructor TDadosTela.Create(const ACliente: String; const AValor: Extended);
begin
  FCliente := ACliente;
  FValor := AValor;
end;

function TDadosTela.GetCliente: String;
begin
  Result := FCliente;
end;

function TDadosTela.GetValorTotal: Extended;
begin
  Result := FValor;
end;

{ TFrmPrincipal }

// Implementação do método da interface ILogger
procedure TFrmPrincipal.Registrar(const Msg: String);
begin
  // O Form decide onde mostrar. Hoje é num Memo, amanhã poderia ser num arquivo de log.
  memLog.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' + Msg);
end;

procedure TFrmPrincipal.btnFinalizarClick(Sender: TObject);
var
  LFacade: IVendaFacade;
  LDados: IVendaDados;
begin
  memLog.Clear;

  LDados := TDadosTela.Create(edtCliente.Text, StrToCurrDef(edtValor.Text, 0));

  // AQUI ESTÁ A MÁGICA:
  // Passamos "Self" (o próprio Form) como o Logger, pois ele implementa ILogger.
  LFacade := TVendaFacade.Create(Self);

  try
    LFacade.FinalizarVenda(LDados);
  except
    on E: Exception do
      Registrar('Erro: ' + E.Message);
  end;
end;

end.
