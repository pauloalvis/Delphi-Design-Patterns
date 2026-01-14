program facade;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {FrmPrincipal},
  uVenda.Interfaces in 'uVenda.Interfaces.pas',
  uVenda.Facade in 'uVenda.Facade.pas',
  uSubsistemas in 'uSubsistemas.pas',
  uLogger.Interfaces in 'uLogger.Interfaces.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
