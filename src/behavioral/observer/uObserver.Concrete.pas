unit uObserver.Concrete;

interface

uses
  uObserver.Interfaces,
  System.SysUtils;

type
  TLogCallback = reference to procedure(const AText: string);

  TCliente = class(TInterfacedObject, ISubscriber)
  private
    FNome: string;
    FOnLog: TLogCallback;
  public
    constructor Create(const ANome: string; AOnLog: TLogCallback);
    procedure Update(const AMessage: string);
  end;

implementation

{ TCliente }

constructor TCliente.Create(const ANome: string; AOnLog: TLogCallback);
begin
  FNome := ANome;
  FOnLog := AOnLog;
end;

procedure TCliente.Update(const AMessage: string);
begin
  if Assigned(FOnLog) then
    FOnLog(Format('[Cliente %s] recebeu: %s', [FNome, AMessage]));
end;

end.

