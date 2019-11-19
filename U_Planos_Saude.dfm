object FR_Planos_Saude: TFR_Planos_Saude
  Left = 270
  Top = 103
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Planos de Sa'#250'de'
  ClientHeight = 342
  ClientWidth = 779
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
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 779
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
  object Notebook1: TNotebook
    Left = 0
    Top = 26
    Width = 779
    Height = 316
    Color = clBtnFace
    ParentColor = False
    TabOrder = 1
    object TPage
      Left = 0
      Top = 0
      Caption = 'Consulta'
      object Label1: TLabel
        Left = 305
        Top = 0
        Width = 181
        Height = 23
        Caption = 'PLANOS DE SA'#218'DE'
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
        Top = 295
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
        Width = 223
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
        OnChange = ED_Nome_ConsultaChange
        OnKeyPress = ED_Nome_ConsultaKeyPress
      end
      object DBGrid1: TDBGrid
        Left = 9
        Top = 70
        Width = 760
        Height = 219
        DataSource = Modulo1.DS_Q_Planos
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
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
            FieldName = 'contato'
            Title.Alignment = taCenter
            Title.Caption = 'Contato'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'telefone1'
            Title.Alignment = taCenter
            Title.Caption = 'Telefone'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 150
            Visible = True
          end>
      end
      object BB_Filtra: TBitBtn
        Left = 279
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
      object BB_Exportar: TBitBtn
        Left = 694
        Top = 41
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
        TabOrder = 2
        OnClick = BB_ExportarClick
      end
    end
    object TPage
      Left = 0
      Top = 0
      HelpContext = 1
      Caption = 'Cadastro'
      object Label8: TLabel
        Left = 239
        Top = 0
        Width = 325
        Height = 23
        Caption = 'CADASTRO DE PLANOS DE SA'#218'DE'
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
        Width = 760
        Height = 160
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
          Left = 11
          Top = 64
          Width = 48
          Height = 13
          Caption = 'Contato:'
        end
        object Label27: TLabel
          Left = 11
          Top = 96
          Width = 35
          Height = 13
          Caption = 'E-mail'
        end
        object Label16: TLabel
          Left = 11
          Top = 128
          Width = 69
          Height = 13
          Caption = 'Telefone(1):'
        end
        object Label25: TLabel
          Left = 218
          Top = 128
          Width = 69
          Height = 13
          Caption = 'Telefone(2):'
        end
        object Label17: TLabel
          Left = 427
          Top = 128
          Width = 42
          Height = 13
          Caption = 'Celular:'
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
        object ED_Contato: TEdit
          Left = 65
          Top = 61
          Width = 687
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 300
          TabOrder = 1
        end
        object ED_email: TEdit
          Left = 52
          Top = 93
          Width = 700
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 100
          TabOrder = 2
        end
        object MSK_Tel1: TMaskEdit
          Left = 86
          Top = 125
          Width = 117
          Height = 21
          CharCase = ecUpperCase
          EditMask = '(99) 9999-9999;1;_'
          MaxLength = 14
          TabOrder = 3
          Text = '(  )     -    '
        end
        object MSK_Tel2: TMaskEdit
          Left = 293
          Top = 125
          Width = 119
          Height = 21
          CharCase = ecUpperCase
          EditMask = '(99) 9999-9999;1;_'
          MaxLength = 14
          TabOrder = 4
          Text = '(  )     -    '
        end
        object MSK_Celular: TMaskEdit
          Left = 475
          Top = 125
          Width = 125
          Height = 21
          CharCase = ecUpperCase
          EditMask = '(99) 99999-9999;1;_'
          MaxLength = 15
          TabOrder = 5
          Text = '(  )      -    '
        end
      end
      object BB_Salvar: TBitBtn
        Left = 571
        Top = 214
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
        TabOrder = 1
        OnClick = BB_SalvarClick
      end
      object BB_Cancelar: TBitBtn
        Left = 673
        Top = 214
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
        TabOrder = 2
        OnClick = BB_CancelarClick
      end
    end
  end
  object BB_Sair: TBitBtn
    Left = 736
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
  object SaveDialog1: TSaveDialog
    Left = 592
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
    Left = 663
    Top = 8
  end
end
