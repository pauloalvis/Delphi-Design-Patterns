unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  // Nossas units
  uFrete.Interfaces, uFrete.Strategies, uFrete.Service, Vcl.Mask;

type
  TFrmPrincipal = class(TForm)
    pnlHeader: TPanel;
    lblTitulo: TLabel;
    pnlSide: TPanel;
    rgTipoFrete: TRadioGroup;
    pnlContent: TPanel;
    edtValor: TLabeledEdit;
    btnCalcular: TBitBtn;
    pnlResult: TPanel;
    lblResultadoTitulo: TLabel;
    lblValorFrete: TLabel;
    lblDescricaoServico: TLabel;
    procedure btnCalcularClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ExibirResultado(const ADescricao: string; AValor: Currency);
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  // Limpa os labels iniciais
  lblValorFrete.Caption := 'R$ 0,00';
  lblDescricaoServico.Caption := 'Aguardando cálculo...';
end;

procedure TFrmPrincipal.btnCalcularClick(Sender: TObject);
var
  Estrategia: ICalculoFrete;
  Servico: TFreteService;
  ValorPedido: Currency;
  ValorFrete: Currency;
begin
  // 1. Validação simples
  if not TryStrToCurr(edtValor.Text, ValorPedido) then
  begin
    ShowMessage('Por favor, informe um valor válido.');
    edtValor.SetFocus;
    Exit;
  end;

  // 2. Factory simples (Escolha da Estratégia)
  case rgTipoFrete.ItemIndex of
    0: Estrategia := TFreteSedex.Create;
    1: Estrategia := TFretePAC.Create;
    2: Estrategia := TFreteGratis.Create;
  else
    ShowMessage('Selecione um tipo de frete.');
    Exit;
  end;

  // 3. Execução do Padrão Strategy
  Servico := TFreteService.Create(Estrategia);
  try
    ValorFrete := Servico.ExecutarCalculo(ValorPedido);
    ExibirResultado(Servico.ObterDescricaoServico, ValorFrete);
  finally
    Servico.Free;
  end;
end;

procedure TFrmPrincipal.ExibirResultado(const ADescricao: string; AValor: Currency);
begin
  lblDescricaoServico.Caption := ADescricao;
  lblValorFrete.Caption := FormatCurr('R$ #,##0.00', AValor);
end;

end.
