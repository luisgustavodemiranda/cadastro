inherited FrmEnviarEmail: TFrmEnviarEmail
  BorderStyle = bsDialog
  Caption = 'Envio de E-mail'
  ClientHeight = 265
  ClientWidth = 483
  Position = poMainFormCenter
  ExplicitWidth = 489
  ExplicitHeight = 294
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 483
    Height = 231
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      483
      231)
    object Label4: TLabel
      Left = 9
      Top = 36
      Width = 30
      Height = 13
      Caption = 'Nome'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 10
      Top = 83
      Width = 27
      Height = 13
      Caption = 'Email'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 357
      Top = 83
      Width = 73
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Criptografado'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 10
      Top = 129
      Width = 73
      Height = 13
      Caption = 'Servidor SMTP'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 357
      Top = 129
      Width = 27
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Porta'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 402
      Top = 129
      Width = 67
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Autentica'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 284
      Top = 175
      Width = 32
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Senha'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 10
      Top = 175
      Width = 40
      Height = 13
      Caption = 'Usu'#225'rio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object pnlHeaderEmailConfiguration: TPanel
      Left = 0
      Top = 0
      Width = 483
      Height = 21
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = 'Configura'#231#227'o'
      Color = 7039851
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object edtNameFrom: TEdit
      Left = 9
      Top = 55
      Width = 460
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Text = 'Luis Gustavo de Miranda'
    end
    object edtFrom: TEdit
      Left = 10
      Top = 102
      Width = 341
      Height = 21
      CharCase = ecLowerCase
      TabOrder = 2
      Text = 'luismiranda.teste@outlook.com'
    end
    object cbCriptocrafia: TComboBox
      Left = 357
      Top = 102
      Width = 112
      Height = 21
      Anchors = [akTop, akRight]
      ItemIndex = 1
      TabOrder = 3
      Text = 'TSL'
      Items.Strings = (
        'SSL'
        'TSL')
    end
    object edtHost: TEdit
      Left = 10
      Top = 148
      Width = 341
      Height = 21
      CharCase = ecLowerCase
      TabOrder = 4
      Text = 'smtp-mail.outlook.com'
    end
    object edtPort: TEdit
      Left = 357
      Top = 148
      Width = 40
      Height = 21
      CharCase = ecLowerCase
      TabOrder = 5
      Text = '587'
    end
    object cbAuth: TComboBox
      Left = 403
      Top = 148
      Width = 66
      Height = 21
      Anchors = [akTop, akRight]
      ItemIndex = 1
      TabOrder = 6
      Text = 'Sim'
      Items.Strings = (
        'N'#227'o'
        'Sim')
    end
    object edtPassword: TEdit
      Left = 285
      Top = 194
      Width = 184
      Height = 21
      PasswordChar = '*'
      TabOrder = 7
      Text = '@testedeemail'
    end
    object edtUser: TEdit
      Left = 10
      Top = 194
      Width = 269
      Height = 21
      CharCase = ecLowerCase
      TabOrder = 8
      Text = 'luismiranda.teste@outlook.com'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 231
    Width = 483
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnSend: TButton
      Left = 320
      Top = -1
      Width = 72
      Height = 30
      Hint = 'Enviar e-mail'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 0
      Margins.Bottom = 2
      Caption = 'Enviar'
      ImageIndex = 0
      ImageMargins.Left = 8
      Images = ImageList
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnSendClick
    end
    object Button1: TButton
      Left = 397
      Top = -1
      Width = 72
      Height = 30
      Hint = 'Sair do envio de e-mail'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 0
      Margins.Bottom = 2
      Caption = 'Sair'
      ImageIndex = 2
      ImageMargins.Left = 12
      Images = ImageList
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object ImageList: TImageList
    Left = 200
    Top = 24
    Bitmap = {
      494C010103000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FBFAF7000000000000000000000000000000
      00000000000000000000000000000000000000000000D1C1A800835611007E50
      08007E5008007E5008007E5008007E5008007E5008007E5008007E5008007E50
      08007E50080083561100D2C3AA000000000000000000BAC0F7004352E8003C4C
      E7003C4CE7003C4CE7003C4CE7003C4CE7003C4CE7003C4CE7003C4CE7003C4C
      E7003C4CE7004352E800BCC1F700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D0C0A600E6DDCF0000000000000000000000
      000000000000000000000000000000000000D1C1A7007E5008007E5008007E50
      08007E5008007E5008007E5008007E5008007E5008007E5008007E5008007E50
      08007E5008007E5008007E500800D2C3AA00B9BFF6003C4CE7003C4CE7003C4C
      E7003C4CE7003C4CE7003C4CE7003C4CE7003C4CE7003C4CE7003C4CE7003C4C
      E7003C4CE7003C4CE7003C4CE700BCC1F7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FBFAF7008255100000000000000000000000
      00007E500800835611000000000000000000835611007E5008007E5008007E50
      08007E5008007E5008007E5008007E5008007E5008007E5008007E5008007E50
      08007E5008007E5008007E500800835712004352E8003C4CE7003C4CE7003C4C
      E7003C4CE7003C4CE7003C4CE7003C4CE7003C4CE7003C4CE7003C4CE7003C4C
      E7003C4CE7003C4CE7003C4CE7004453E8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A4835100A4835100EDE6DC00F6F3
      EF007E5008007E500800CCBA9D00000000007E5008007E5008007E5008007E50
      08007E5008007E5008007E5008007E5008007E5008007E5008007E5008007E50
      08007E5008007E5008007E5008007E5008003C4CE7003C4CE7003C4CE7003C4C
      E7003C4CE7003C4CE7003C4CE7003C4CE7003C4CE7003C4CE7003C4CE7003C4C
      E7003C4CE7003C4CE7003C4CE7003C4CE7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007E5008007E5008007E50
      08007E5008007E5008007E500800B69B73007E5008007E5008007E5008007E50
      080080530C00CFBEA300845814007E5008007E50080084581400CFBEA3008053
      0C007E5008007E5008007E5008007E5008003C4CE7003C4CE7003C4CE7003C4C
      E7003F4FE700B6BCF6004554E8003C4CE7003C4CE7004554E800B6BCF6003F4F
      E7003C4CE7003C4CE7003C4CE7003C4CE7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AF9265007E5008007E50
      08007E5008007E5008007E500800B2976C007E5008007E5008007E5008007E50
      0800CFBEA30000000000E1D6C5007E5008007E500800E1D6C50000000000CFBE
      A3007E5008007E5008007E5008007E5008003C4CE7003C4CE7003C4CE7003C4C
      E700B6BCF60000000000D1D5F9003C4CE7003C4CE700D1D5F90000000000B6BC
      F6003C4CE7003C4CE7003C4CE7003C4CE7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFBF9008B6221007E5008007E50
      08007E5008007E5008007E5008007E5008007E500800B4997000000000000000
      00007E5008007E500800CAB79900000000007E5008007E5008007E5008007E50
      080084581400E1D6C50000000000E1D6C500E1D6C50000000000E1D6C5008458
      14007E5008007E5008007E5008007E5008003C4CE7003C4CE7003C4CE7003C4C
      E7004554E800D1D5F90000000000D1D5F900D1D5F90000000000D1D5F9004554
      E8003C4CE7003C4CE7003C4CE7003C4CE7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008B6221008A601F007E5008007E50
      08007E5008007E5008007E5008007E5008007E5008007E5008007E500800BBA3
      7D00946E3200E1D7C600BCA47F00000000007E5008007E5008007E5008007E50
      08007E5008007E500800DFD3C1000000000000000000E2D7C7007E5008007E50
      08007E5008007E5008007E5008007E5008003C4CE7003C4CE7003C4CE7003C4C
      E7003C4CE7003C4CE700CED2F9000000000000000000D3D6FA003C4CE7003C4C
      E7003C4CE7003C4CE7003C4CE7003C4CE7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007E5008007E50080098743A007E50
      08007E5008007E5008007E5008007E5008007E5008007E5008007E5008009671
      360000000000FAF8F5007E500800000000007E5008007E5008007E5008007E50
      08007E5008007E500800DFD3C1000000000000000000E1D7C6007E5008007E50
      08007E5008007E5008007E5008007E5008003C4CE7003C4CE7003C4CE7003C4C
      E7003C4CE7003C4CE700CED2F9000000000000000000D2D6F9003C4CE7003C4C
      E7003C4CE7003C4CE7003C4CE7003C4CE7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007E5008007E5008007E500800C6B1
      92008C6322007E5008007E500800A07F4A007E5008007E500800DDD1BE00C6B2
      93007E5008007E5008007E500800000000007E5008007E5008007E5008007E50
      080084581400E1D6C50000000000E1D6C500E1D6C50000000000E1D6C5008559
      15007E5008007E5008007E5008007E5008003C4CE7003C4CE7003C4CE7003C4C
      E7004554E800D1D5F90000000000D1D5F900D1D5F90000000000D1D5F9004655
      E8003C4CE7003C4CE7003C4CE7003C4CE7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007E5008007E5008007E5008007E50
      0800CCBA9D000000000000000000EBE4D90000000000000000007F5109007E50
      08007E5008007E5008007E500800000000007E5008007E5008007E5008007E50
      0800CEBDA20000000000E1D6C5007E5008007E500800E0D5C40000000000CFBE
      A3007E5008007E5008007E5008007E5008003C4CE7003C4CE7003C4CE7003C4C
      E700B6BCF60000000000D1D5F9003C4CE7003C4CE700D0D4F90000000000B6BC
      F6003C4CE7003C4CE7003C4CE7003C4CE7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007E5008007E5008007E5008007E50
      0800C4AF8F0000000000B2976C0080530C00B2976C000000000080530C007E50
      08007E5008007E5008007E500800000000007E5008007E5008007E5008007E50
      080080520B00CEBDA200845814007E5008007E50080084581400CFBEA3008053
      0C007E5008007E5008007E5008007E5008003C4CE7003C4CE7003C4CE7003C4C
      E7003E4EE700B6BCF6004554E8003C4CE7003C4CE7004554E800B6BCF6003F4F
      E7003C4CE7003C4CE7003C4CE7003C4CE7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007E5008007E50080098743A00ECE6
      DB008A601E007E5008007E5008007E5008007E5008007E500800C3AD8C00EDE7
      DD007E5008007E5008007E500800000000007E5008007E5008007E5008007E50
      08007E5008007E5008007E5008007E5008007E5008007E5008007E5008007E50
      08007E5008007E5008007E5008007E5008003C4CE7003C4CE7003C4CE7003C4C
      E7003C4CE7003C4CE7003C4CE7003C4CE7003C4CE7003C4CE7003C4CE7003C4C
      E7003C4CE7003C4CE7003C4CE7003C4CE7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007E5008007E500800D1C1A7009068
      2A007E5008007E5008007E5008007E5008007E5008007E5008007E5008008D65
      2500B9A078007E5008007E50080000000000835611007E5008007E5008007E50
      08007E5008007E5008007E5008007E5008007E5008007E5008007E5008007E50
      08007E5008007E5008007E500800835712004352E8003C4CE7003C4CE7003C4C
      E7003C4CE7003C4CE7003C4CE7003C4CE7003C4CE7003C4CE7003C4CE7003C4C
      E7003C4CE7003C4CE7003C4CE7004453E8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008B6221007E5008007E5008007E50
      08007E5008007E5008007E5008007E5008007E5008007E5008007E5008007E50
      08007E5008007E5008008B62210000000000D0C0A6007E5008007E5008007E50
      08007E5008007E5008007E5008007E5008007E5008007E5008007E5008007E50
      08007E5008007E5008007E500800D1C1A800B9BEF6003C4CE7003C4CE7003C4C
      E7003C4CE7003C4CE7003C4CE7003C4CE7003C4CE7003C4CE7003C4CE7003C4C
      E7003C4CE7003C4CE7003C4CE700BAC0F7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFBF9008B6120007E5008007E50
      08007E5008007E5008007E5008007E5008007E5008007E5008007E5008007E50
      08007E5008008B622100FCFBF9000000000000000000D0C0A600835611007E50
      08007E5008007E5008007E5008007E5008007E5008007E5008007E5008007E50
      08007E50080083561100D1C1A7000000000000000000B9BEF6004352E8003C4C
      E7003C4CE7003C4CE7003C4CE7003C4CE7003C4CE7003C4CE7003C4CE7003C4C
      E7003C4CE7004352E800B9BFF600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FEFF800180010000FE7F000000000000
      FE73000000000000FF01000000000000FF80000000000000FF80042004200000
      0031024002400000000101800180000000090180018000000001024002400000
      06C1042004200000044100000000000000010000000000000001000000000000
      0001000000000000000180018001000000000000000000000000000000000000
      000000000000}
  end
end
