object FR_Tipo_Agenda: TFR_Tipo_Agenda
  Left = 242
  Top = 89
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Tipo Agenda'
  ClientHeight = 446
  ClientWidth = 723
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
  object Notebook1: TNotebook
    Left = 0
    Top = 31
    Width = 723
    Height = 415
    Color = clBtnFace
    PageIndex = 1
    ParentColor = False
    TabOrder = 0
    object TPage
      Left = 0
      Top = 0
      Caption = 'Consulta'
      object Label1: TLabel
        Left = 271
        Top = 0
        Width = 179
        Height = 23
        Caption = 'TIPOS DE AGENDA'
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
      object Label7: TLabel
        Left = 9
        Top = 395
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
      object ED_Nome_Consulta: TEdit
        Left = 50
        Top = 43
        Width = 479
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
        OnChange = ED_Nome_ConsultaChange
        OnKeyPress = ED_Nome_ConsultaKeyPress
      end
      object DBGrid1: TDBGrid
        Left = 9
        Top = 70
        Width = 704
        Height = 319
        DataSource = Modulo1.DS_Q_Tipo_Agenda
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'descricao'
            Title.Alignment = taCenter
            Title.Caption = 'Nome'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 547
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ativo_descricao'
            Title.Alignment = taCenter
            Title.Caption = 'Ativo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 100
            Visible = True
          end>
      end
      object BB_Filtra: TBitBtn
        Left = 535
        Top = 41
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
        TabOrder = 1
        OnClick = BB_FiltraClick
      end
    end
    object TPage
      Left = 0
      Top = 0
      HelpContext = 1
      Caption = 'Cadastro'
      object Label8: TLabel
        Left = 225
        Top = 0
        Width = 279
        Height = 23
        Caption = 'CADASTRO TIPO DE AGENDA'
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
        Width = 704
        Height = 64
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
        object Label3: TLabel
          Left = 507
          Top = 32
          Width = 40
          Height = 13
          Caption = 'Status:'
        end
        object SB_Salvar: TSpeedButton
          Left = 617
          Top = 27
          Width = 78
          Height = 25
          Caption = '&Salvar'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
            00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
            00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
            00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
            00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
            00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
            00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
            0003737FFFFFFFFF7F7330099999999900333777777777777733}
          NumGlyphs = 2
          OnClick = SB_SalvarClick
        end
        object ED_Nome: TEdit
          Left = 52
          Top = 29
          Width = 439
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 100
          TabOrder = 0
        end
        object CB_Ativo: TCheckBox
          Left = 553
          Top = 31
          Width = 48
          Height = 17
          Caption = 'Ativo'
          TabOrder = 1
        end
      end
      object BB_Salvar: TBitBtn
        Left = 510
        Top = 384
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
        Left = 617
        Top = 384
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
      object GB_Dias: TGroupBox
        Left = 9
        Top = 118
        Width = 704
        Height = 60
        Caption = 'Dias da Semana'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object SB_Salvar2: TSpeedButton
          Left = 617
          Top = 25
          Width = 78
          Height = 25
          Caption = '&Salvar'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
            00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
            00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
            00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
            00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
            00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
            00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
            0003737FFFFFFFFF7F7330099999999900333777777777777733}
          NumGlyphs = 2
          OnClick = SB_Salvar2Click
        end
        object CB_Segunda: TCheckBox
          Left = 11
          Top = 29
          Width = 97
          Height = 17
          Caption = 'Segunda-Feira'
          TabOrder = 0
        end
        object CB_Terca: TCheckBox
          Left = 124
          Top = 29
          Width = 83
          Height = 17
          Caption = 'Ter'#231'a-Feira'
          TabOrder = 1
        end
        object CB_Quarta: TCheckBox
          Left = 223
          Top = 29
          Width = 89
          Height = 17
          Caption = 'Quarta-Feira'
          TabOrder = 2
        end
        object CB_Quinta: TCheckBox
          Left = 328
          Top = 29
          Width = 89
          Height = 17
          Caption = 'Quinta-Feira'
          TabOrder = 3
        end
        object CB_Sexta: TCheckBox
          Left = 433
          Top = 29
          Width = 89
          Height = 17
          Caption = 'Sexta-Feira'
          TabOrder = 4
        end
        object CB_Sabado: TCheckBox
          Left = 538
          Top = 29
          Width = 63
          Height = 17
          Caption = 'S'#225'bado'
          TabOrder = 5
        end
      end
      object GB_Horarios: TGroupBox
        Left = 10
        Top = 189
        Width = 703
        Height = 184
        Caption = 'Hor'#225'rios'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object Label5: TLabel
          Left = 168
          Top = 27
          Width = 45
          Height = 13
          Caption = 'Hor'#225'rio:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object BB_Adicionar: TSpeedButton
          Left = 67
          Top = 67
          Width = 96
          Height = 25
          Caption = 'Adicionar'
          Glyph.Data = {
            66010000424D6601000000000000760000002800000014000000140000000100
            040000000000F0000000120B0000120B00001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            77777777D7D777777777377777777777D7D777777777307777777777D7D77777
            777773077777777700A07777777773B0777777776D6177777773000F07777777
            000077777773FBFBF07777779900777777773FB0333777770000777777773BFB
            07777777FFFF7777730000BFB0777777A600777773FBFBFBFB07777700007777
            773FBFB03337777700007777773BFBFB07777777000077777773BFBFB0777777
            970077777773FBFBFB0777775469777777773FBFBFB077770054777777773333
            33333777000077777777777777777777A6007777777777777777777700007777
            77777777777777770000}
          OnClick = BB_AdicionarClick
        end
        object Label4: TLabel
          Left = 11
          Top = 27
          Width = 21
          Height = 13
          Caption = 'Dia:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBGrid2: TDBGrid
          Left = 427
          Top = 23
          Width = 267
          Height = 154
          DataSource = Modulo1.DS_Q_Horarios_Agendamento
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 'descricao'
              Title.Alignment = taCenter
              Title.Caption = 'Dia'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'hora'
              Title.Alignment = taCenter
              Title.Caption = 'Hor'#225'rio'
              Width = 80
              Visible = True
            end>
        end
        object DBLC_Hora: TDBLookupComboBox
          Left = 219
          Top = 23
          Width = 114
          Height = 21
          KeyField = 'codigo'
          ListField = 'hora'
          ListSource = Modulo1.DS_Q_Horarios
          TabOrder = 0
        end
        object BB_Deletar: TBitBtn
          Left = 169
          Top = 67
          Width = 96
          Height = 25
          Caption = 'Deletar'
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
          TabOrder = 2
          OnClick = BB_DeletarClick
        end
        object DBLC_Dia: TDBLookupComboBox
          Left = 38
          Top = 23
          Width = 114
          Height = 21
          KeyField = 'codigo'
          ListField = 'descricao'
          ListSource = Modulo1.DS_Q_Dias
          TabOrder = 3
          OnClick = DBLC_DiaClick
          OnCloseUp = DBLC_DiaCloseUp
        end
      end
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 723
    Height = 30
    ButtonHeight = 25
    Caption = 'ToolBar1'
    Color = clWhite
    ParentColor = False
    TabOrder = 1
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
    Left = 680
    Top = 0
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
    TabOrder = 2
    OnClick = BB_SairClick
  end
end
