program strategy;

uses
  Vcl.Forms,
  uFrete.Interfaces in 'uFrete.Interfaces.pas',
  uFrete.Strategies in '..\..\..\..\Design Patterns\strategy\uFrete.Strategies.pas',
  uFrete.Service in 'uFrete.Service.pas',
  uFrmPrincipal in 'uFrmPrincipal.pas' {FrmPrincipal};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
