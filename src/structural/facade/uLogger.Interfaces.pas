unit uLogger.Interfaces;

interface

type
  // Contrato para qualquer coisa que aceite logs
  ILogger = interface
  ['{15ECE6A5-A2DE-4790-98C9-10BAF0136752}']
    procedure Registrar(const Msg: String);
  end;

implementation

end.

