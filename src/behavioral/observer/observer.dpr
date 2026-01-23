program observer;

uses
  Vcl.Forms,
  uFrmObserver in 'uFrmObserver.pas' {FrmObserver},
  uObserver.Interfaces in 'uObserver.Interfaces.pas',
  uObserver.Publisher in 'uObserver.Publisher.pas',
  uObserver.Concrete in 'uObserver.Concrete.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmObserver, FrmObserver);
  Application.Run;
end.
