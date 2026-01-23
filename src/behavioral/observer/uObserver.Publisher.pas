unit uObserver.Publisher;

interface

uses
  System.Generics.Collections,
  uObserver.Interfaces;

type
  TLoja = class(TInterfacedObject, IPublisher)
  private
    FSubscribers: TList<ISubscriber>;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Subscribe(ASubscriber: ISubscriber);
    procedure Unsubscribe(ASubscriber: ISubscriber);
    procedure Notify(const AMessage: string);

    // Método de negócio
    procedure NovoProdutoEmPromocao(const AProduto: string; APreco: Currency);
  end;

implementation

uses
  System.SysUtils;

{ TLoja }

constructor TLoja.Create;
begin
  FSubscribers := TList<ISubscriber>.Create;
end;

destructor TLoja.Destroy;
begin
  FSubscribers.Free;
  inherited;
end;

procedure TLoja.Subscribe(ASubscriber: ISubscriber);
begin
  if not FSubscribers.Contains(ASubscriber) then
    FSubscribers.Add(ASubscriber);
end;

procedure TLoja.Unsubscribe(ASubscriber: ISubscriber);
begin
  FSubscribers.Remove(ASubscriber);
end;

procedure TLoja.Notify(const AMessage: string);
var
  I: Integer;
begin
  // Itera de trás para frente para permitir remoção segura se necessário,
  // embora aqui seja apenas notificação.
  for I := FSubscribers.Count - 1 downto 0 do
    FSubscribers[I].Update(AMessage);
end;

procedure TLoja.NovoProdutoEmPromocao(const AProduto: string; APreco: Currency);
var
  LMsg: string;
begin
  LMsg := Format('PROMOÇÃO: %s agora custa apenas %m', [AProduto, APreco]);
  Notify(LMsg);
end;

end.

