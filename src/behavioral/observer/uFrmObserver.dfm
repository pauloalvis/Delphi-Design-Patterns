object FrmObserver: TFrmObserver
  Left = 0
  Top = 0
  Caption = 'Padr'#227'o Observer (Publisher/Subscriber)'
  ClientHeight = 350
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    500
    350)
  TextHeight = 13
  object LblProduto: TLabel
    Left = 24
    Top = 24
    Width = 38
    Height = 13
    Caption = 'Produto'
  end
  object LblPreco: TLabel
    Left = 24
    Top = 54
    Width = 35
    Height = 13
    Caption = 'Pre'#195#167'o'
  end
  object Bevel1: TBevel
    Left = 24
    Top = 136
    Width = 450
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsTopLine
  end
  object EdtProduto: TEdit
    Left = 80
    Top = 21
    Width = 200
    Height = 21
    TabOrder = 0
    Text = 'Produto 01'
  end
  object EdtPreco: TEdit
    Left = 80
    Top = 51
    Width = 100
    Height = 21
    TabOrder = 1
    Text = '1000'
  end
  object BtnNotificar: TButton
    Left = 80
    Top = 90
    Width = 200
    Height = 35
    Caption = 'Lan'#231'ar Promo'#231#227'o (Notificar)'
    TabOrder = 2
    OnClick = BtnNotificarClick
  end
  object MemoLog: TMemo
    Left = 24
    Top = 151
    Width = 450
    Height = 180
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object GrpInscritos: TGroupBox
    Left = 300
    Top = 16
    Width = 174
    Height = 109
    Caption = 'Gerenciar Inscritos'
    TabOrder = 4
    object ChkClienteA: TCheckBox
      Left = 16
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Jo'#227'o'
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = ChkClienteAClick
    end
    object ChkClienteB: TCheckBox
      Left = 16
      Top = 47
      Width = 97
      Height = 17
      Caption = 'Maria'
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = ChkClienteBClick
    end
    object ChkClienteC: TCheckBox
      Left = 16
      Top = 70
      Width = 97
      Height = 17
      Caption = 'Carlos'
      TabOrder = 2
      OnClick = ChkClienteCClick
    end
  end
end
