inherited FrmCadastroClientes: TFrmCadastroClientes
  Caption = 'Cadastro de clientes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlHeader: TPanel
    ExplicitTop = 27
    object btnEnviarEmail: TButton
      Left = 240
      Top = 0
      Width = 60
      Height = 56
      Hint = 'Enviar e-mail'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 0
      Margins.Bottom = 2
      Align = alLeft
      Caption = 'E-mail'
      ImageAlignment = iaTop
      ImageIndex = 12
      ImageMargins.Top = 4
      Images = imgCadastro
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = btnEnviarEmailClick
    end
  end
  inherited pclManutencao: TPageControl
    ActivePage = tabManutencao
    ExplicitTop = 83
    ExplicitHeight = 429
    inherited tabPesquisa: TTabSheet
      inherited DBGridVisualizar: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'Nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Identidade'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPF'
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Telefone'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Email'
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 992
      ExplicitHeight = 401
      inherited pnlManutencao: TPanel
        ExplicitHeight = 343
        object Label4: TLabel [0]
          Left = 5
          Top = 28
          Width = 19
          Height = 13
          Caption = 'CPF'
        end
        object Label5: TLabel [1]
          Left = 119
          Top = 28
          Width = 15
          Height = 13
          Caption = 'RG'
        end
        object Label8: TLabel [2]
          Left = 233
          Top = 28
          Width = 30
          Height = 13
          Caption = 'Nome'
        end
        object Label11: TLabel [3]
          Left = 5
          Top = 74
          Width = 44
          Height = 13
          Caption = 'Telefone'
        end
        object Label12: TLabel [4]
          Left = 121
          Top = 74
          Width = 31
          Height = 13
          Caption = 'E-mail'
        end
        object Label3: TLabel [5]
          Left = 687
          Top = 74
          Width = 61
          Height = 13
          Caption = 'Logradouro'
        end
        object Label1: TLabel [6]
          Left = 5
          Top = 120
          Width = 41
          Height = 13
          Caption = 'N'#250'mero'
        end
        object Label6: TLabel [7]
          Left = 55
          Top = 120
          Width = 72
          Height = 13
          Caption = 'Complemento'
        end
        object Label7: TLabel [8]
          Left = 511
          Top = 74
          Width = 19
          Height = 13
          Caption = 'CEP'
        end
        object Label2: TLabel [9]
          Left = 287
          Top = 120
          Width = 30
          Height = 13
          Caption = 'Bairro'
        end
        object Label9: TLabel [10]
          Left = 601
          Top = 120
          Width = 36
          Height = 13
          Caption = 'Cidade'
        end
        object Label10: TLabel [11]
          Left = 791
          Top = 120
          Width = 35
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Estado'
        end
        object Label13: TLabel [12]
          Left = 832
          Top = 120
          Width = 20
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Pais'
        end
        object edtCPF: TDBEdit
          Left = 5
          Top = 47
          Width = 108
          Height = 21
          CharCase = ecUpperCase
          Color = clWhite
          DataField = 'CPF'
          DataSource = dsCadastro
          TabOrder = 1
          OnExit = edtCPFExit
        end
        object DBEdit8: TDBEdit
          Left = 121
          Top = 47
          Width = 108
          Height = 21
          CharCase = ecUpperCase
          Color = clWhite
          DataField = 'Identidade'
          DataSource = dsCadastro
          TabOrder = 2
        end
        object edtNome: TDBEdit
          Left = 233
          Top = 47
          Width = 750
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          DataField = 'NOME'
          DataSource = dsCadastro
          TabOrder = 3
        end
        object edtTelefone: TDBEdit
          Left = 5
          Top = 93
          Width = 109
          Height = 21
          CharCase = ecUpperCase
          Color = clWhite
          DataField = 'TELEFONE'
          DataSource = dsCadastro
          TabOrder = 4
          OnExit = edtTelefoneExit
        end
        object EdtEmail: TDBEdit
          Left = 121
          Top = 93
          Width = 384
          Height = 21
          CharCase = ecLowerCase
          Color = clWhite
          DataField = 'EMAIL'
          DataSource = dsCadastro
          TabOrder = 5
          OnExit = EdtEmailExit
        end
        object edtLogradouro: TDBEdit
          Left = 687
          Top = 93
          Width = 296
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          Color = clWhite
          DataField = 'Logradouro'
          DataSource = dsCadastro
          TabOrder = 8
        end
        object edtNumero: TDBEdit
          Left = 5
          Top = 139
          Width = 44
          Height = 21
          CharCase = ecUpperCase
          Color = clWhite
          DataField = 'Numero'
          DataSource = dsCadastro
          TabOrder = 9
        end
        object edtComplemento: TDBEdit
          Left = 55
          Top = 139
          Width = 226
          Height = 21
          CharCase = ecUpperCase
          Color = clWhite
          DataField = 'Complemento'
          DataSource = dsCadastro
          TabOrder = 10
        end
        object edtCep: TDBEdit
          Left = 511
          Top = 93
          Width = 85
          Height = 21
          CharCase = ecUpperCase
          Color = clWhite
          DataField = 'Cep'
          DataSource = dsCadastro
          TabOrder = 6
        end
        object edtBairro: TDBEdit
          Left = 287
          Top = 139
          Width = 308
          Height = 21
          CharCase = ecUpperCase
          Color = clWhite
          DataField = 'Bairro'
          DataSource = dsCadastro
          TabOrder = 11
        end
        object edtCidade: TDBEdit
          Left = 601
          Top = 139
          Width = 184
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          Color = clWhite
          DataField = 'Cidade'
          DataSource = dsCadastro
          TabOrder = 12
        end
        object edtEstado: TDBEdit
          Left = 791
          Top = 139
          Width = 35
          Height = 21
          Anchors = [akTop, akRight]
          CharCase = ecUpperCase
          Color = clWhite
          DataField = 'Estado'
          DataSource = dsCadastro
          TabOrder = 13
        end
        object edtPais: TDBEdit
          Left = 832
          Top = 139
          Width = 151
          Height = 21
          Anchors = [akTop, akRight]
          CharCase = ecUpperCase
          Color = clWhite
          DataField = 'Pais'
          DataSource = dsCadastro
          TabOrder = 14
        end
        object btnBuscaCep: TBitBtn
          Left = 596
          Top = 92
          Width = 85
          Height = 23
          Hint = 'Pesquisa o CEP'
          Caption = 'Busca CEP'
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
            FDB49970926B2FE4DACBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFEFEFDAF93667E50087E5008926B2FFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDB093677E50
            087E50087E5008B49970FFFFFFFFFFFFFFFFFFFFFFFFFDFDFCEFEAE1EAE3D7FA
            F8F5FFFFFFFFFFFFC1AB897E50087E50087E5008AF9366FEFEFDFFFFFFFFFFFF
            F6F3EFB89F77885E1B81530D83571282550FA78856EAE2D6A586547E50087E50
            08B09367FEFEFDFFFFFFFFFFFFEEE8DF90682AA17F4BE1D6C5FEFEFDFFFFFFED
            E7DDB89E768255107E5008A78856C2AD8BFEFEFDFFFFFFFFFFFFFCFCFA956F34
            B49970FEFEFDD0C0A6AC8E5FB2976CEAE2D6FFFFFFD9CBB5825510E9E1D4FFFF
            FFFFFFFFFFFFFFFFFFFFCDBCA0936D31FDFCFBB093678C6323D5C6AFFCFCFAFF
            FFFFFFFFFFFFFFFFB89E76A68655FFFFFFFFFFFFFFFFFFFFFFFFA38350C6B293
            E4DBCC8A601FF1ECE4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDE7DD81540EFAF8
            F5FFFFFFFFFFFFFFFFFF926B2EDDD0BDCAB799C9B698FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF835712EBE4D8FFFFFFFFFFFFFFFFFF957035D9CCB6
            D7C8B2EFEAE1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFC81530DEFE9
            E0FFFFFFFFFFFFFFFFFFAE9163BAA17AFCFBF9FDFCFBFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFE1D6C5885E1BFDFDFCFFFFFFFFFFFFFFFFFFDFD3C1865B17
            F3EFE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEA17F4BB89F77FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFAE9163977238F3EFE8FFFFFFFFFFFFFFFFFFFF
            FFFFFDFCFBB4997090682AF6F3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFAF8
            AE9163865B17BAA17AD9CCB6DCD0BCC6B293936D31956F34EEE8DFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD3C1AE9163956F34926B2FA3
            824FCDBCA0FCFCFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          OnClick = btnBuscaCepClick
        end
      end
      inherited pnlFooter: TPanel
        ExplicitTop = 343
      end
    end
  end
  inherited Panel1: TPanel
    inherited lblTitle: TLabel
      Width = 153
      Caption = 'Cadastro de clientes'
      ExplicitWidth = 153
    end
  end
  inherited dsCadastro: TDataSource
    Left = 317
    Top = 5
  end
  inherited imgCadastro: TImageList
    Left = 344
    Top = 5
  end
end
