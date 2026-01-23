unit uFrmObserver;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  uObserver.Interfaces, uObserver.Publisher, uObserver.Concrete;

type
  TFrmObserver = class(TForm)
    EdtProduto: TEdit;
    EdtPreco: TEdit;
    LblProduto: TLabel;
    LblPreco: TLabel;
    BtnNotificar: TButton;
    MemoLog: TMemo;
    GrpInscritos: TGroupBox;
    ChkClienteA: TCheckBox;
    ChkClienteB: TCheckBox;
    ChkClienteC: TCheckBox;
    Bevel1: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnNotificarClick(Sender: TObject);
    procedure ChkClienteAClick(Sender: TObject);
    procedure ChkClienteBClick(Sender: TObject);
    procedure ChkClienteCClick(Sender: TObject);
  private
    { Private declarations }
    FLoja: TLoja; // Nossa classe concreta que implementa IPublisher

    // Mantemos referências às interfaces para poder dar Subscribe/Unsubscribe
    FClienteA: ISubscriber;
    FClienteB: ISubscriber;
    FClienteC: ISubscriber;

    procedure Log(const AText: string);
    procedure GerenciarInscricao(chk: TCheckBox; ASubscriber: ISubscriber);
  public
    { Public declarations }
  end;

var
  FrmObserver: TFrmObserver;

implementation

{$R *.dfm}

procedure TFrmObserver.FormCreate(Sender: TObject);
begin
  // Instancia o Publisher (Subject)
  FLoja := TLoja.Create;

  // Instancia os Subscribers (Observers)
  // Passamos um método anônimo que chama o Log do formulário
  FClienteA := TCliente.Create('João',
    procedure(const S: string)
    begin
      Log(S);
    end);

  FClienteB := TCliente.Create('Maria',
    procedure(const S: string)
    begin
      Log(S);
    end);

  FClienteC := TCliente.Create('Carlos',
    procedure(const S: string)
    begin
      Log(S);
    end);

  // Estado inicial conforme os checkboxes
  GerenciarInscricao(ChkClienteA, FClienteA);
  GerenciarInscricao(ChkClienteB, FClienteB);
  GerenciarInscricao(ChkClienteC, FClienteC);
end;

procedure TFrmObserver.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FLoja); 
end;

procedure TFrmObserver.Log(const AText: string);
begin
  MemoLog.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' + AText);
end;

procedure TFrmObserver.GerenciarInscricao(chk: TCheckBox; ASubscriber: ISubscriber);
begin
  if chk.Checked then
  begin
    FLoja.Subscribe(ASubscriber);
    Log('Sistema: ' + chk.Caption + ' inscrito.');
  end
  else
  begin
    FLoja.Unsubscribe(ASubscriber);
    Log('Sistema: ' + chk.Caption + ' removido.');
  end;
end;

procedure TFrmObserver.BtnNotificarClick(Sender: TObject);
var
  LPreco: Currency;
begin
  if TryStrToCurr(EdtPreco.Text, LPreco) then
  begin
    MemoLog.Lines.Add('--- Iniciando Notificação ---');
    FLoja.NovoProdutoEmPromocao(EdtProduto.Text, LPreco);
    MemoLog.Lines.Add('---------------------------');
  end
  else
    ShowMessage('Preço inválido');
end;

procedure TFrmObserver.ChkClienteAClick(Sender: TObject);
begin
  GerenciarInscricao(ChkClienteA, FClienteA);
end;

procedure TFrmObserver.ChkClienteBClick(Sender: TObject);
begin
  GerenciarInscricao(ChkClienteB, FClienteB);
end;

procedure TFrmObserver.ChkClienteCClick(Sender: TObject);
begin
  GerenciarInscricao(ChkClienteC, FClienteC);
end;

end.
