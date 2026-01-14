unit uVenda.Interfaces;

interface

type
  // Interface para os dados da venda (apenas para exemplo)
  IVendaDados = interface
  ['{A20ABC49-0174-4983-BD81-99E15E5B37E3}']
    function GetCliente: String;
    function GetValorTotal: Extended;
  end;

  // A Interface da nossa FACHADA
  // O Form só vai enxergar isso aqui! 👇
  IVendaFacade = interface
  ['{9C0F811F-D092-4027-BF3A-53A58B87C349}']
    procedure FinalizarVenda(Dados: IVendaDados);
  end;

implementation

end.

