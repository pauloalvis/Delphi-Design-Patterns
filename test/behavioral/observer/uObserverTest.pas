unit uObserverTest;

interface

uses
  DUnitX.TestFramework,
  uObserver.Interfaces,
  uObserver.Publisher,
  uObserver.Concrete,
  System.SysUtils;

type
  [TestFixture]
  TObserverTest = class
  public
    [Test]
    procedure TestarNotificacao;
    [Test]
    procedure TestarUnsubscribe;
  end;

implementation

procedure TObserverTest.TestarNotificacao;
var
  LLoja: IPublisher; // Usamos a interface para testar
  LCliente: ISubscriber;
  LMsgRecebida: string;
begin
  // Arrange
  LLoja := TLoja.Create;

  LMsgRecebida := '';

  // Criamos um cliente com um callback que captura a mensagem localmente para verificação
  LCliente := TCliente.Create('TesteUnitario',
    procedure(const S: string)
    begin
      LMsgRecebida := S;
    end);

  LLoja.Subscribe(LCliente);

  // Act
  (LLoja as TLoja).NovoProdutoEmPromocao('Produto 01', 1000);

  // Assert
  // Verificamos se a string contém o que esperamos
  Assert.IsTrue(LMsgRecebida.Contains('Produto 01'), 'A mensagem deveria conter o nome do produto');
  Assert.IsTrue(LMsgRecebida.Contains('1.000,00'), 'A mensagem deveria conter o preço');
end;

procedure TObserverTest.TestarUnsubscribe;
var
  LLoja: TLoja;
  LCliente: ISubscriber;
  LContadorChamadas: Integer;
begin
  // Arrange
  LLoja := TLoja.Create;
  try
    LContadorChamadas := 0;

    LCliente := TCliente.Create('TesteRemocao',
      procedure(const S: string)
      begin
        Inc(LContadorChamadas);
      end);

    LLoja.Subscribe(LCliente);

    // Act 1 - Notifica (Contador deve ir para 1)
    LLoja.Notify('Primeira msg');

    // Remove
    LLoja.Unsubscribe(LCliente);

    // Act 2 - Notifica novamente (Contador deve permanecer em 1)
    LLoja.Notify('Segunda msg');

    // Assert
    Assert.AreEqual(1, LContadorChamadas, 'O cliente não deveria receber a segunda mensagem após unsubscribe');
  finally
    LLoja.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TObserverTest);

end.

