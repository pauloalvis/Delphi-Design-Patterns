unit uFrete.Interfaces;

interface

type
  // Enum para garantir Type Safety (Segurança de Tipo)
  TTipoFrete = (tfSedex, tfPAC, tfGratis);

  ICalculoFrete = interface
  ['{F6013EF9-9E07-421B-AB1E-A48ED57C2A88}']
    function Calcular(const APeso: Double): Double;
  end;

implementation

end.

