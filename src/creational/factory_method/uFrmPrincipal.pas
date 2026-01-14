unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  uFrete.Interfaces; // O Form só conhece a Interface e a Factory

type
  TFormPrincipal = class(TForm)
    rdgTipoFrete: TRadioGroup;
    edtPeso: TEdit;
    lblPeso: TLabel;
    btnCalcular: TButton;
    lblResultado: TLabel;
    procedure btnCalcularClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

uses
  uFrete.Factory; // Referência apenas à Fábrica

{$R *.dfm}

procedure TFormPrincipal.btnCalcularClick(Sender: TObject);
var
  LCalculo: ICalculoFrete;
  LValorFrete: Double;
  LTipoSelecionado: TTipoFrete;
begin
  // 1. Captura o tipo selecionado (Cast seguro pois a ordem é a mesma)
  if rdgTipoFrete.ItemIndex = -1 then
  begin
    ShowMessage('Selecione um tipo de frete.');
    Exit;
  end;

  LTipoSelecionado := TTipoFrete(rdgTipoFrete.ItemIndex);

  // 2. A Mágica: A Factory decide qual classe criar. O Form não sabe.
  LCalculo := TFreteFactory.Criar(LTipoSelecionado);

  // 3. Executa a lógica
  LValorFrete := LCalculo.Calcular(StrToFloatDef(edtPeso.Text, 0));

  // 4. Exibe
  lblResultado.Caption := FormatFloat('R$ #,##0.00', LValorFrete);
end;

end.
