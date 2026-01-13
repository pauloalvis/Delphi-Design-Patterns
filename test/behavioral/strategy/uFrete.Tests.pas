unit uFrete.Tests;

interface

uses
  DUnitX.TestFramework,
  uFrete.Interfaces,
  uFrete.Strategies,
  uFrete.Service;

type
  [TestFixture]
  TFreteTests = class
  private
    FService: TFreteService;
    // Helper para facilitar a injeção nos testes
    procedure ConfigurarEstrategia(AEstrategia: ICalculoFrete);
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    // Testes de SEDEX
    [Test]
    [TestCase('Sedex_ValorPadrao', '100,35')] // 100 * 0.15 + 20 = 35
    [TestCase('Sedex_ValorZero', '0,20')]     // 0 * 0.15 + 20 = 20 (Taxa fixa)
    procedure DeveCalcularFreteSedexCorretamente(const AValorPedido: Currency; const AEsperado: Currency);

    // Testes de PAC
    [Test]
    [TestCase('PAC_ValorPadrao', '100,10')]   // 100 * 0.10 = 10
    procedure DeveCalcularFretePACCorretamente(const AValorPedido: Currency; const AEsperado: Currency);

    // Testes de Regra de Negócio (Exceções/Bordas)
    [Test]
    procedure DeveRetornarZeroParaFreteGratis;

    [Test]
    procedure DeveLancarExcecaoSeValorNegativo;
  end;

implementation

uses
  System.SysUtils;

{ TFreteTests }

procedure TFreteTests.Setup;
begin
  // O Setup roda ANTES de cada teste.
  // Inicializamos com nil para garantir limpeza, embora o Create seja feito em cada teste ou helper.
  FService := nil;
end;

procedure TFreteTests.TearDown;
begin
  // O TearDown roda DEPOIS de cada teste.
  // Garante que não haja vazamento de memória do Service.
  if Assigned(FService) then
    FService.Free;
end;

procedure TFreteTests.ConfigurarEstrategia(AEstrategia: ICalculoFrete);
begin
  // Se já existir um serviço anterior, libera antes de criar o novo
  if Assigned(FService) then
    FService.Free;

  FService := TFreteService.Create(AEstrategia);
end;

procedure TFreteTests.DeveCalcularFreteSedexCorretamente(const AValorPedido, AEsperado: Currency);
begin
  // Arrange
  ConfigurarEstrategia(TFreteSedex.Create);

  // Act
  var Resultado := FService.ExecutarCalculo(AValorPedido);

  // Assert
  Assert.AreEqual(AEsperado, Resultado, 0.001, 'O cálculo do SEDEX está incorreto.');
end;

procedure TFreteTests.DeveCalcularFretePACCorretamente(const AValorPedido, AEsperado: Currency);
begin
  // Arrange
  ConfigurarEstrategia(TFretePAC.Create);

  // Act
  var Resultado := FService.ExecutarCalculo(AValorPedido);

  // Assert
  Assert.AreEqual(AEsperado, Resultado, 0.001, 'O cálculo do PAC está incorreto.');
end;

procedure TFreteTests.DeveRetornarZeroParaFreteGratis;
begin
  // Arrange
  ConfigurarEstrategia(TFreteGratis.Create);

  // Act
  var Resultado := FService.ExecutarCalculo(5000);

  // Assert
  Assert.AreEqual(Currency(0), Resultado, 'Frete Grátis deve sempre retornar zero.');
end;

procedure TFreteTests.DeveLancarExcecaoSeValorNegativo;
begin
  // Arrange
  ConfigurarEstrategia(TFretePAC.Create);

  // Act & Assert
  // Aqui assumimos que sua regra de negócio não permite valor negativo.
  // Isso é um teste "Sênior": testar o comportamento defensivo do código.
  Assert.WillRaise(
    procedure
    begin
      FService.ExecutarCalculo(-100);
    end,
    Exception, // Ou uma exceção específica tipo EValorInvalido
    'Deveria lançar exceção para valores negativos'
  );
end;

initialization
  TDUnitX.RegisterTestFixture(TFreteTests);

end.

