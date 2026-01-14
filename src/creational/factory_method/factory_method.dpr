program factory_method;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {FormPrincipal},
  uFrete.Interfaces in 'uFrete.Interfaces.pas',
  uFrete.Strategies in 'uFrete.Strategies.pas',
  uFrete.Factory in 'uFrete.Factory.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
