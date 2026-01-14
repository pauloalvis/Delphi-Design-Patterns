unit uFrete.Factory.test;

interface

uses
  DUnitX.TestFramework,
  uFrete.Interfaces,
  uFrete.Factory,
  uFrete.Strategies,
  System.SysUtils;

type
  [TestFixture]
  TFreteFactoryTests = class
  public
    // Não precisamos de Setup/TearDown complexos aqui pois a Factory é estática,
    // mas mantemos a estrutura para extensões futuras.
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    // Testes de Criação (Verifica se a fábrica entrega a classe certa)
    [Test]
    procedure DeveCriarInstanciaSedex;

    [Test]
    procedure DeveCriarInstanciaPAC;

    [Test]
    procedure DeveCriarInstanciaGratis;

    // Teste "Senior": Verifica se a fábrica explode graciosamente com input inválido
    [Test]
    procedure DeveLancarExcecaoParaTipoDesconhecido;
  end;

implementation

{ TFreteFactoryTests }

procedure TFreteFactoryTests.Setup;
begin
  // Preparação do ambiente (se necessário)
end;

procedure TFreteFactoryTests.TearDown;
begin
  // Limpeza (se necessário)
end;

procedure TFreteFactoryTests.DeveCriarInstanciaSedex;
var
  LCalculo: ICalculoFrete;
begin
  // Arrange & Act
  LCalculo := TFreteFactory.Criar(tfSedex);

  // Assert
  // Verificamos se a interface retornada é, de fato, uma instância da classe TFreteSedex
  Assert.IsTrue(LCalculo is TFreteSedex, 'A Factory deveria retornar uma instância de TFreteSedex.');
end;

procedure TFreteFactoryTests.DeveCriarInstanciaPAC;
var
  LCalculo: ICalculoFrete;
begin
  // Arrange & Act
  LCalculo := TFreteFactory.Criar(tfPAC);

  // Assert
  Assert.IsTrue(LCalculo is TFretePAC, 'A Factory deveria retornar uma instância de TFretePAC.');
end;

procedure TFreteFactoryTests.DeveCriarInstanciaGratis;
var
  LCalculo: ICalculoFrete;
begin
  // Arrange & Act
  LCalculo := TFreteFactory.Criar(tfGratis);

  // Assert
  Assert.IsTrue(LCalculo is TFreteGratis, 'A Factory deveria retornar uma instância de TFreteGratis.');
end;

procedure TFreteFactoryTests.DeveLancarExcecaoParaTipoDesconhecido;
var
  ATipoInvalido: TTipoFrete;
begin
  // Arrange
  // Forçamos um cast inválido para simular um erro de programação ou memória suja
  ATipoInvalido := TTipoFrete(999);

  // Act & Assert
  Assert.WillRaise(
    procedure
    begin
      TFreteFactory.Criar(ATipoInvalido);
    end,
    Exception, // Esperamos uma Exception genérica (ou específica se você criou uma EFactoryError)
    'A Factory deve proteger o sistema contra Enums não implementados.'
  );
end;

initialization
  TDUnitX.RegisterTestFixture(TFreteFactoryTests);

end.

