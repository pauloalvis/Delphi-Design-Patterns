unit uVenda.Facade.Test;

interface

uses
  DUnitX.TestFramework,
  System.Classes, System.SysUtils,
  // Nossas units
  uVenda.Interfaces, uVenda.Facade, uLogger.Interfaces;

type
  // 1. O "Mock" (Simulador) do Logger
  // Ele finge ser o Form, mas só guarda as strings na memória para conferirmos depois.
  TFakeLogger = class(TInterfacedObject, ILogger)
  private
    FLogInterno: TStringList;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Registrar(const Msg: String);
    // Propriedade para o teste ler o que foi gravado
    property LogInterno: TStringList read FLogInterno;
  end;

  // 2. A Classe de Teste DUnitX
  [TestFixture]
  TTestVendaFacade = class
  private
    FFacade: IVendaFacade;
    FFakeLogger: TFakeLogger; // Mantemos a referência como objeto concreto para acessar a lista
    FDadosTeste: IVendaDados;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure DeveExecutarFluxoCompletoDeVenda;
  end;

  // Classe auxiliar para dados de teste (igual fizemos no Form)
  TDadosTeste = class(TInterfacedObject, IVendaDados)
  private
    FValor: Extended;
  public
    constructor Create(AValor: Extended);
    function GetCliente: String;
    function GetValorTotal: Extended;
  end;

implementation

{ TFakeLogger }

constructor TFakeLogger.Create;
begin
  FLogInterno := TStringList.Create;
end;

destructor TFakeLogger.Destroy;
begin
  FLogInterno.Free;
  inherited;
end;

procedure TFakeLogger.Registrar(const Msg: String);
begin
  // Em vez de mostrar na tela, guardamos na lista
  FLogInterno.Add(Msg);
end;

{ TDadosTeste }

constructor TDadosTeste.Create(AValor: Extended);
begin
  FValor := AValor;
end;

function TDadosTeste.GetCliente: String;
begin
  Result := 'Cliente Teste DUnitX';
end;

function TDadosTeste.GetValorTotal: Extended;
begin
  Result := FValor;
end;

{ TTestVendaFacade }

procedure TTestVendaFacade.Setup;
begin
  // Criamos o Logger Falso
  FFakeLogger := TFakeLogger.Create;

  // Injetamos o Logger Falso na Facade!
  // A Facade nem sabe que está sendo testada, ela acha que é um Logger normal.
  FFacade := TVendaFacade.Create(FFakeLogger);

  FDadosTeste := TDadosTeste.Create(1000);
end;

procedure TTestVendaFacade.TearDown;
begin
  // Interfaces são liberadas automaticamente, mas se precisar limpar algo específico:
  FFacade := nil;
  // O FFakeLogger é gerenciado por contagem de referência da interface também,
  // mas como seguramos uma referência de objeto, cuidado com vazamentos se não for interface pura.
  // Neste caso simples, deixar o Delphi limpar as interfaces é seguro.
end;

procedure TTestVendaFacade.DeveExecutarFluxoCompletoDeVenda;
begin
  // Arrange (Preparação já feita no Setup)

  // Act (Ação)
  FFacade.FinalizarVenda(FDadosTeste);

  // Assert (Validação)

  // 1. Verificamos se algo foi gravado
  Assert.IsTrue(FFakeLogger.LogInterno.Count > 0, 'O log não deveria estar vazio.');

  // 2. Verificamos se a mensagem de início apareceu
  Assert.IsTrue(FFakeLogger.LogInterno[0].Contains('INICIANDO'), 'Deveria ter logado o início.');

  // 3. Verificamos se o Estoque foi chamado
  Assert.IsTrue(FFakeLogger.LogInterno.Text.Contains('Estoque baixado'), 'Deveria ter baixado estoque.');

  // 4. Verificamos se o Financeiro foi chamado com o valor formatado (R$)
  // Aqui validamos se sua formatação FormatCurr funcionou!
  Assert.IsTrue(FFakeLogger.LogInterno.Text.Contains('R$ 1.000,00'), 'Deveria ter faturado com formatação correta.');

  // 5. Verificamos se a Nota Fiscal foi emitida
  Assert.IsTrue(FFakeLogger.LogInterno.Text.Contains('NF emitida'), 'Deveria ter emitido NF.');
end;

end.

