object FR_Pacientes: TFR_Pacientes
  Left = 195
  Top = 55
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Pacientes'
  ClientHeight = 497
  ClientWidth = 957
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 957
    Height = 497
    Align = alClient
    TabOrder = 0
    object ToolBar1: TToolBar
      Left = 1
      Top = 1
      Width = 955
      Height = 28
      ButtonHeight = 25
      Caption = 'ToolBar1'
      Color = clWhite
      ParentColor = False
      TabOrder = 0
      object BB_Novo: TBitBtn
        Left = 0
        Top = 0
        Width = 33
        Height = 25
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777700007777777777777777777700007777770000000000777700007777
          778777777770777700007777778FFFFFFF70777700007777778FFFFFFF707777
          00007777778FFFFFFF70777700007777778FFFFFFF70777700007777778FFFFF
          FF70777700007777778FFFFFFF7077770000777F778FFFFFFF70777700007778
          F88FF8FF00007777000077778B8F8FFF7F8777770000777FF8FBFFFF78777777
          0000777788BFF88887777777000077778B8B8F777777777700007778F78F7777
          777777770000777F778F778F7777777700007777778F77777777777700007777
          77777777777777770000}
        TabOrder = 0
        TabStop = False
        OnClick = BB_NovoClick
      end
      object BB_Procura: TBitBtn
        Left = 33
        Top = 0
        Width = 33
        Height = 25
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          777777770000777777777777777700770000777777777777777C440700007777
          7777777777C4C40700007777777777777C4C4077000077777777777784C40777
          0000777777788888F740777700007777770000007807777700007777707EFEE7
          007777770000777787EF44EF70777777000077778EFE44EEE087777700007777
          8F444444E0877777000077778F444444E0877777000077778EFF44FEF0877777
          0000777778EF44EF7077777700007777778EFEF7077777770000777777788888
          7777777700007777777777777777777700007777777777777777777700007777
          77777777777777770000}
        TabOrder = 1
        TabStop = False
        OnClick = BB_ProcuraClick
      end
    end
    object BB_Sair: TBitBtn
      Left = 913
      Top = 1
      Width = 33
      Height = 25
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F0000000120B0000120B00001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777FF00FF00F
        F00770076D6177F00FF00FF0008008800000770FF00FF00F070080081F0077F0
        0FF00FF007800880080077000000000707880000000077777777077007888077
        0000777777770000078880770000777777770888078880776D61777777770888
        078880770024777700000008070880777410777709999908078880776F6E7770
        9999908807888077000077709099088807888077990077700090088807888077
        0000777770070888807880770700777777770888880780770000777777770888
        88807077A6007777777700000000007720207777777777777777777731367777
        77777777777777776573}
      TabOrder = 1
      TabStop = False
      OnClick = BB_SairClick
    end
    object Notebook1: TNotebook
      Left = 0
      Top = 27
      Width = 957
      Height = 470
      Color = clBtnFace
      ParentColor = False
      TabOrder = 2
      object TPage
        Left = 0
        Top = 0
        Caption = 'Consulta'
        object Label1: TLabel
          Left = 416
          Top = 0
          Width = 110
          Height = 23
          Caption = 'PACIENTES'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 9
          Top = 46
          Width = 35
          Height = 13
          Caption = 'Nome:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 21
          Top = 78
          Width = 23
          Height = 13
          Caption = 'CPF:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 186
          Top = 83
          Width = 86
          Height = 13
          Caption = '*Apenas n'#250'meros'
        end
        object Label5: TLabel
          Left = 288
          Top = 78
          Width = 19
          Height = 13
          Caption = 'RG:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 449
          Top = 83
          Width = 86
          Height = 13
          Caption = '*Apenas n'#250'meros'
        end
        object Label7: TLabel
          Left = 9
          Top = 451
          Width = 202
          Height = 13
          Caption = 'Clique 2 vezes para abrir o cadastro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label29: TLabel
          Left = 530
          Top = 451
          Width = 217
          Height = 13
          Caption = 'Linhas destacada - Cadastro Pendente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label30: TLabel
          Left = 237
          Top = 451
          Width = 267
          Height = 13
          Caption = 'Clique com o bot'#227'o Direito para abrir as Op'#231#245'es'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ED_Nome_Consulta: TEdit
          Left = 50
          Top = 43
          Width = 485
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
          OnChange = ED_Nome_ConsultaChange
          OnKeyPress = ED_Nome_ConsultaKeyPress
        end
        object ED_CPF_Consulta: TEdit
          Left = 50
          Top = 75
          Width = 130
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 1
          OnChange = ED_CPF_ConsultaChange
          OnKeyPress = ED_CPF_ConsultaKeyPress
        end
        object ED_RG_Consulta: TEdit
          Left = 313
          Top = 75
          Width = 130
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 2
          OnChange = ED_RG_ConsultaChange
          OnKeyPress = ED_RG_ConsultaKeyPress
        end
        object DBGrid1: TDBGrid
          Left = 9
          Top = 102
          Width = 937
          Height = 343
          DataSource = Modulo1.DS_Q_Pacientes
          PopupMenu = PopupMenu1
          TabOrder = 5
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = DBGrid1DrawColumnCell
          OnDblClick = DBGrid1DblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'nome'
              Title.Alignment = taCenter
              Title.Caption = 'Nome'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nascimento'
              Title.Alignment = taCenter
              Title.Caption = 'Data Nasc.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cpf'
              Title.Alignment = taCenter
              Title.Caption = 'CPF'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'rg'
              Title.Alignment = taCenter
              Title.Caption = 'RG'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nome_pai'
              Title.Alignment = taCenter
              Title.Caption = 'Nome Pai'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nome_mae'
              Title.Alignment = taCenter
              Title.Caption = 'Nome M'#227'e'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 250
              Visible = True
            end>
        end
        object BB_Filtra: TBitBtn
          Left = 790
          Top = 71
          Width = 75
          Height = 25
          Caption = 'Filtra'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33033333333333333F7F3333333333333000333333333333F777333333333333
            000333333333333F777333333333333000333333333333F77733333333333300
            033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
            33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
            3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
            33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
            333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
            333333773FF77333333333370007333333333333777333333333}
          NumGlyphs = 2
          TabOrder = 3
          OnClick = BB_FiltraClick
        end
        object BB_Exportar: TBitBtn
          Left = 871
          Top = 71
          Width = 75
          Height = 25
          Caption = 'Excel'
          Glyph.Data = {
            66010000424D6601000000000000760000002800000014000000140000000100
            040000000000F0000000120B0000120B00001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555500005577777777777777777500005000000000000000007500005088
            80FFFFFF0FFFF0750000508180F4444F0F44F0750000508880FFFFFF0FFFF075
            0000508180F4444F0F44F0750000508880FFFFFF0FFFF0750000508180F4444F
            0F44F0750000508880FF0078088880750000508180F400007844807500005088
            80FF7008007880750000508180F4408FF80080750000508880FFF70FFF800075
            0000500000000008FF803007000050EEEEEEEE70880B43000000500000000000
            00FBB43000005555555555550BFFBB43000055555555555550BFFBB400005555
            55555555550BFFBB0000}
          TabOrder = 4
          OnClick = BB_ExportarClick
        end
      end
      object TPage
        Left = 0
        Top = 0
        HelpContext = 1
        Caption = 'Cadastro'
        object Label8: TLabel
          Left = 366
          Top = 0
          Width = 254
          Height = 23
          Caption = 'CADASTRO DE PACIENTES'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object GB_Dados: TGroupBox
          Left = 9
          Top = 43
          Width = 937
          Height = 163
          Caption = 'Dados'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          object Label9: TLabel
            Left = 11
            Top = 32
            Width = 35
            Height = 13
            Caption = 'Nome:'
          end
          object Label10: TLabel
            Left = 23
            Top = 64
            Width = 23
            Height = 13
            Caption = 'CPF:'
          end
          object Label11: TLabel
            Left = 193
            Top = 64
            Width = 19
            Height = 13
            Caption = 'RG:'
          end
          object Label12: TLabel
            Left = 359
            Top = 64
            Width = 76
            Height = 13
            Caption = 'Data de Nasc.'
          end
          object Label13: TLabel
            Left = 763
            Top = 32
            Width = 31
            Height = 13
            Caption = 'Sexo:'
          end
          object Label14: TLabel
            Left = 557
            Top = 64
            Width = 64
            Height = 13
            Caption = 'Estado Civil'
          end
          object Label27: TLabel
            Left = 11
            Top = 96
            Width = 55
            Height = 13
            Caption = 'Nome Pai:'
          end
          object Label28: TLabel
            Left = 11
            Top = 128
            Width = 62
            Height = 13
            Caption = 'Nome M'#227'e:'
          end
          object ED_Nome: TEdit
            Left = 52
            Top = 29
            Width = 700
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 300
            TabOrder = 0
          end
          object ED_CPF: TEdit
            Left = 52
            Top = 61
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 15
            TabOrder = 2
          end
          object ED_RG: TEdit
            Left = 218
            Top = 61
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 15
            TabOrder = 3
          end
          object DTP_Nascimento: TDateTimePicker
            Left = 441
            Top = 61
            Width = 105
            Height = 21
            Date = 42750.813144386570000000
            Time = 42750.813144386570000000
            TabOrder = 4
          end
          object CB_Sexo: TComboBox
            Left = 800
            Top = 29
            Width = 125
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
            Items.Strings = (
              'FEMININO'
              'MASCULINO')
          end
          object CB_Estado_Civil: TComboBox
            Left = 627
            Top = 61
            Width = 125
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 5
            Items.Strings = (
              'CASADO'
              'SOLTEIRO'
              'OUTRO')
          end
          object ED_Nome_Pai: TEdit
            Left = 72
            Top = 93
            Width = 853
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 300
            TabOrder = 6
          end
          object ED_Nome_Mae: TEdit
            Left = 79
            Top = 125
            Width = 846
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 300
            TabOrder = 7
          end
        end
        object GB_Contato: TGroupBox
          Left = 9
          Top = 217
          Width = 937
          Height = 98
          Caption = 'Contato'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 1
          object Label16: TLabel
            Left = 11
            Top = 32
            Width = 69
            Height = 13
            Caption = 'Telefone(1):'
          end
          object Label17: TLabel
            Left = 433
            Top = 32
            Width = 42
            Height = 13
            Caption = 'Celular:'
          end
          object Label18: TLabel
            Left = 617
            Top = 32
            Width = 35
            Height = 13
            Caption = 'Outro:'
          end
          object Label26: TLabel
            Left = 11
            Top = 64
            Width = 38
            Height = 13
            Caption = 'E-mail:'
          end
          object Label25: TLabel
            Left = 222
            Top = 32
            Width = 69
            Height = 13
            Caption = 'Telefone(2):'
          end
          object ED_Email: TEdit
            Left = 55
            Top = 61
            Width = 731
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 100
            TabOrder = 4
          end
          object MSK_Tel1: TMaskEdit
            Left = 86
            Top = 29
            Width = 121
            Height = 21
            CharCase = ecUpperCase
            EditMask = '(99) 9999-9999;1;_'
            MaxLength = 14
            TabOrder = 0
            Text = '(  )     -    '
          end
          object MSK_Tel2: TMaskEdit
            Left = 297
            Top = 29
            Width = 121
            Height = 21
            CharCase = ecUpperCase
            EditMask = '(99) 9999-9999;1;_'
            MaxLength = 14
            TabOrder = 1
            Text = '(  )     -    '
          end
          object MSK_Celular: TMaskEdit
            Left = 481
            Top = 29
            Width = 125
            Height = 21
            CharCase = ecUpperCase
            EditMask = '(99) 99999-9999;1;_'
            MaxLength = 15
            TabOrder = 2
            Text = '(  )      -    '
          end
          object MSK_Outro: TMaskEdit
            Left = 658
            Top = 29
            Width = 128
            Height = 21
            CharCase = ecUpperCase
            EditMask = '(99) 99999-9999;1;_'
            MaxLength = 15
            TabOrder = 3
            Text = '(  )      -    '
          end
        end
        object GB_Endereco: TGroupBox
          Left = 9
          Top = 326
          Width = 937
          Height = 101
          Caption = 'Endere'#231'o'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 2
          object Label19: TLabel
            Left = 11
            Top = 32
            Width = 55
            Height = 13
            Caption = 'Endere'#231'o:'
          end
          object Label20: TLabel
            Left = 11
            Top = 64
            Width = 37
            Height = 13
            Caption = 'Bairro:'
          end
          object Label22: TLabel
            Left = 812
            Top = 32
            Width = 47
            Height = 13
            Caption = 'N'#250'mero:'
          end
          object Label23: TLabel
            Left = 215
            Top = 64
            Width = 82
            Height = 13
            Caption = 'Complemento:'
          end
          object Label21: TLabel
            Left = 672
            Top = 64
            Width = 41
            Height = 13
            Caption = 'Estado:'
          end
          object Label24: TLabel
            Left = 790
            Top = 64
            Width = 23
            Height = 13
            Caption = 'CEP:'
          end
          object Label15: TLabel
            Left = 464
            Top = 64
            Width = 41
            Height = 13
            Caption = 'Cidade:'
          end
          object ED_Endereco: TEdit
            Left = 72
            Top = 29
            Width = 729
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 500
            TabOrder = 0
          end
          object ED_Bairro: TEdit
            Left = 54
            Top = 61
            Width = 150
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 100
            TabOrder = 2
          end
          object ED_Numero: TEdit
            Left = 865
            Top = 29
            Width = 60
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
          object ED_Complemento: TEdit
            Left = 303
            Top = 61
            Width = 150
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 100
            TabOrder = 3
          end
          object ED_Estado: TEdit
            Left = 719
            Top = 61
            Width = 60
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 100
            TabOrder = 5
          end
          object ED_Cidade: TEdit
            Left = 511
            Top = 61
            Width = 150
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 100
            TabOrder = 4
          end
          object ED_CEP: TMaskEdit
            Left = 819
            Top = 61
            Width = 106
            Height = 21
            CharCase = ecUpperCase
            EditMask = '99.999-999;1;_'
            MaxLength = 10
            TabOrder = 6
            Text = '  .   -   '
          end
        end
        object BB_Salvar: TBitBtn
          Left = 748
          Top = 438
          Width = 96
          Height = 25
          Caption = 'Salvar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Glyph.Data = {
            66010000424D6601000000000000760000002800000014000000140000000100
            040000000000F0000000120B0000120B00001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            777777776D7077777777777777777777500077777777887777777777A6007777
            777CC887777777777470777777C22C8877777777504177777A2222C887777777
            A6007777A222222C88777777A6007777A222A222C887777765347777A22C8A22
            2C877777342E7777A22C87A22C88777700F077777A2C777A22C887771D777777
            77AA7777A22C88776D707777777777777A22C887500077777777777777A22C87
            9700777777777777777A2C8774767777777777777777AC774945777777777777
            7777777700F0777777777777777777772C7777777777777777777777626D7777
            7777777777777777424D}
          ParentFont = False
          TabOrder = 3
          OnClick = BB_SalvarClick
        end
        object BB_Cancelar: TBitBtn
          Left = 850
          Top = 438
          Width = 96
          Height = 25
          Caption = 'Cancelar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Glyph.Data = {
            66010000424D6601000000000000760000002800000014000000140000000100
            040000000000F0000000120B0000120B00001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            77777777FFFF77777778777777777777FFFE777777088777777777777FFF7777
            7910877777887777FFFF77777910887770088777FFFF77777911088791108777
            FFFF77777791108911107777FFFE777777911191110777777FFF777777791111
            10777777FFFF77777777911108877777FFFF77777777911110877777FFFF7777
            7779110110887777FFFE777777791079110887777FFF77777791077791108877
            FFFF77777791077779110877FFFF77777779777777910777FFFF777777777777
            77797777FFFE777777777777777777777FFF77777777777777777777FFFF7777
            7777777777777777FFFF}
          ParentFont = False
          TabOrder = 4
          OnClick = BB_CancelarClick
        end
        object BB_Historico: TBitBtn
          Left = 9
          Top = 438
          Width = 119
          Height = 25
          Caption = 'Hist'#243'rico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Glyph.Data = {
            66010000424D6601000000000000760000002800000014000000140000000100
            040000000000F0000000120B0000120B00001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555500005577777777777777777500005000000000000000007500005088
            80FFFFFF0FFFF0750000508180F4444F0F44F0750000508880FFFFFF0FFFF075
            0000508180F4444F0F44F0750000508880FFFFFF0FFFF0750000508180F4444F
            0F44F0750000508880FF0078088880750000508180F400007844807500005088
            80FF7008007880750000508180F4408FF80080750000508880FFF70FFF800075
            0000500000000008FF803007000050EEEEEEEE70880B43000000500000000000
            00FBB43000005555555555550BFFBB43000055555555555550BFFBB400005555
            55555555550BFFBB0000}
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = BB_HistoricoClick
        end
      end
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 728
    Top = 8
  end
  object QExport4XLS1: TQExport4XLS
    About = '(About EMS AdvancedExport)'
    _Version = '4.12.5.1'
    Formats.DecimalSeparator = ','
    Formats.ThousandSeparator = '.'
    Formats.DateSeparator = '/'
    Formats.TimeSeparator = ':'
    Formats.BooleanTrue = 'true'
    Formats.BooleanFalse = 'false'
    Formats.IntegerFormat = '#,###,##0'
    Formats.FloatFormat = '#,###,##0.00'
    Formats.DateFormat = 'dd/MM/yyyy'
    Formats.TimeFormat = 'hh:mm'
    Formats.DateTimeFormat = 'dd/MM/yyyy hh:mm:ss'
    Formats.CurrencyFormat = 'R$ #,###,##0.00'
    Options.PageFooter = 'Page &P of &N'
    Options.SheetTitle = 'Sheet 1'
    Options.CaptionsFormat.Font.Style = [xfsBold]
    Options.HyperlinkFormat.Font.Color = clrBlue
    Options.HyperlinkFormat.Font.Underline = fulSingle
    Options.NoteFormat.Alignment.Horizontal = halLeft
    Options.NoteFormat.Alignment.Vertical = valTop
    Options.NoteFormat.Font.Size = 8
    Options.NoteFormat.Font.Style = [xfsBold]
    Options.NoteFormat.Font.Name = 'Tahoma'
    FieldFormats = <>
    StripStyles = <>
    Hyperlinks = <>
    Notes = <>
    Charts = <>
    Sheets = <>
    Pictures = <>
    Images = <>
    Cells = <>
    Aggregates = <>
    MergedCells = <>
    DefRowHeight = 12.750000000000000000
    Left = 808
    Top = 8
  end
  object PopupMenu1: TPopupMenu
    Left = 104
    Top = 187
    object HistricoPaciente1: TMenuItem
      Caption = 'Hist'#243'rico Paciente'
      OnClick = HistricoPaciente1Click
    end
  end
end
