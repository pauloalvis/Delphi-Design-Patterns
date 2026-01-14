object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Exemplo Facade - Venda Simplificada'
  ClientHeight = 450
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 13
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 600
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    Color = 16744448
    ParentBackground = False
    TabOrder = 0
    object lblTitulo: TLabel
      Left = 24
      Top = 20
      Width = 255
      Height = 30
      Caption = 'Checkout (Padr'#227'o Facade)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnlBody: TPanel
    Left = 0
    Top = 65
    Width = 600
    Height = 385
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object lblCliente: TLabel
      Left = 40
      Top = 32
      Width = 99
      Height = 17
      Caption = 'Nome do Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6710886
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblValor: TLabel
      Left = 320
      Top = 32
      Width = 62
      Height = 17
      Caption = 'Valor Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6710886
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblLog: TLabel
      Left = 40
      Top = 152
      Width = 106
      Height = 17
      Caption = 'Log de Execu'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6710886
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCliente: TEdit
      Left = 40
      Top = 55
      Width = 257
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'Empresa Teste Ltda'
    end
    object edtValor: TEdit
      Left = 320
      Top = 55
      Width = 121
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '1500,00'
    end
    object btnFinalizar: TButton
      Left = 40
      Top = 105
      Width = 401
      Height = 41
      Cursor = crHandPoint
      Caption = 'FINALIZAR VENDA (Via Facade)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnFinalizarClick
    end
    object memLog: TMemo
      Left = 40
      Top = 175
      Width = 521
      Height = 186
      Color = clWhitesmoke
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 3
    end
  end
end
