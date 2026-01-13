object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Design Patterns - Strategy (C'#225'lculo de Frete)'
  ClientHeight = 360
  ClientWidth = 580
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 580
    Height = 60
    Align = alTop
    BevelOuter = bvNone
    Color = 16744448
    ParentBackground = False
    TabOrder = 0
    object lblTitulo: TLabel
      Left = 24
      Top = 18
      Width = 250
      Height = 25
      Caption = 'Simulador de Frete (Strategy)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
    end
  end
  object pnlSide: TPanel
    Left = 0
    Top = 60
    Width = 200
    Height = 300
    Align = alLeft
    BevelOuter = bvNone
    Color = clWhitesmoke
    ParentBackground = False
    TabOrder = 1
    object rgTipoFrete: TRadioGroup
      AlignWithMargins = True
      Left = 15
      Top = 20
      Width = 170
      Height = 150
      Margins.Left = 15
      Margins.Top = 20
      Margins.Right = 15
      Caption = ' Escolha o Servi'#231'o '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      Items.Strings = (
        'SEDEX (Expresso)'
        'PAC (Econ'#244'mico)'
        'Frete Gr'#225'tis')
      ParentFont = False
      TabOrder = 0
    end
  end
  object pnlContent: TPanel
    Left = 200
    Top = 60
    Width = 380
    Height = 300
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 30
    Padding.Top = 30
    Padding.Right = 30
    Padding.Bottom = 30
    TabOrder = 2
    object edtValor: TLabeledEdit
      Left = 30
      Top = 30
      Width = 320
      Height = 25
      Align = alTop
      EditLabel.Width = 123
      EditLabel.Height = 17
      EditLabel.Caption = 'Valor do Pedido (R$)'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = 6710886
      EditLabel.Font.Height = -13
      EditLabel.Font.Name = 'Segoe UI Semibold'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '100,00'
    end
    object btnCalcular: TBitBtn
      AlignWithMargins = True
      Left = 30
      Top = 75
      Width = 320
      Height = 45
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'Calcular Frete'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnCalcularClick
    end
    object pnlResult: TPanel
      AlignWithMargins = True
      Left = 30
      Top = 150
      Width = 320
      Height = 120
      Margins.Left = 0
      Margins.Top = 30
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      BevelOuter = bvNone
      Color = 16316664
      ParentBackground = False
      TabOrder = 2
      object lblResultadoTitulo: TLabel
        Left = 0
        Top = 15
        Width = 320
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = 'VALOR DO FRETE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10526880
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblValorFrete: TLabel
        Left = 0
        Top = 35
        Width = 320
        Height = 37
        Alignment = taCenter
        AutoSize = False
        Caption = 'R$ 35,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4210752
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDescricaoServico: TLabel
        Left = 0
        Top = 80
        Width = 320
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = 'Calculado via SEDEX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6710886
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
    end
  end
end
