object FrmWait: TFrmWait
  Left = 0
  Top = 0
  AlphaBlend = True
  AlphaBlendValue = 150
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 110
  ClientWidth = 400
  Color = clBlack
  TransparentColorValue = clFuchsia
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWhite
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    400
    110)
  PixelsPerInch = 96
  TextHeight = 17
  object lblTitle: TLabel
    Left = 80
    Top = 29
    Width = 306
    Height = 20
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    Caption = 'Title'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Segoe UI Semibold'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    WordWrap = True
  end
  object pbWait: TGauge
    Left = 0
    Top = 105
    Width = 400
    Height = 5
    Align = alBottom
    BorderStyle = bsNone
    Color = clWhite
    ForeColor = 6316032
    ParentColor = False
    Progress = 0
    ShowText = False
    Visible = False
    ExplicitLeft = 3
    ExplicitTop = 101
    ExplicitWidth = 374
  end
  object lblSubTitle: TLabel
    Left = 80
    Top = 57
    Width = 306
    Height = 20
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    Caption = 'Sub Title'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Segoe UI Semibold'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    WordWrap = True
  end
  object ActivityIndicator: TActivityIndicator
    Left = 17
    Top = 29
    Animate = True
    IndicatorColor = aicWhite
    IndicatorSize = aisLarge
  end
end
