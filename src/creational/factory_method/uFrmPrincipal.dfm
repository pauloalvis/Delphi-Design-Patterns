object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Factory Method - Exemplo'
  ClientHeight = 242
  ClientWidth = 344
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object lblPeso: TLabel
    Left = 24
    Top = 136
    Width = 28
    Height = 15
    Caption = 'Peso:'
  end
  object lblResultado: TLabel
    Left = 24
    Top = 200
    Width = 297
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = 'R$ 0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object rdgTipoFrete: TRadioGroup
    Left = 24
    Top = 16
    Width = 297
    Height = 105
    Caption = ' Selecione o Frete '
    Items.Strings = (
      'Sedex'
      'PAC'
      'Gr'#225'tis')
    TabOrder = 0
  end
  object edtPeso: TEdit
    Left = 24
    Top = 157
    Width = 121
    Height = 23
    TabOrder = 1
    Text = '10'
  end
  object btnCalcular: TButton
    Left = 168
    Top = 155
    Width = 153
    Height = 25
    Caption = 'Calcular Frete'
    TabOrder = 2
    OnClick = btnCalcularClick
  end
end
