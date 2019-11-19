object FR_Agenda: TFR_Agenda
  Left = 14
  Top = 15
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Agenda'
  ClientHeight = 639
  ClientWidth = 1308
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  Scaled = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1308
    Height = 639
    Align = alClient
    TabOrder = 0
    object Label8: TLabel
      Left = 570
      Top = 5
      Width = 81
      Height = 23
      Caption = 'AGENDA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 9
      Top = 620
      Width = 202
      Height = 13
      Caption = 'Clique 2 vezes para abrir o cadastro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label29: TLabel
      Left = 530
      Top = 620
      Width = 217
      Height = 13
      Caption = 'Linhas destacada - Consulta Finalizada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 237
      Top = 620
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
    object Label6: TLabel
      Left = 773
      Top = 620
      Width = 230
      Height = 13
      Caption = 'Linhas destacada - Paciente Aguardando'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object GB_Periodo: TGroupBox
      Left = 556
      Top = 42
      Width = 129
      Height = 106
      TabOrder = 2
      object Label3: TLabel
        Left = 7
        Top = 62
        Width = 59
        Height = 13
        Caption = 'Data Final:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 7
        Top = 11
        Width = 64
        Height = 13
        Caption = 'Data In'#237'cio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DTP_Final: TDateTimePicker
        Left = 7
        Top = 76
        Width = 114
        Height = 21
        Date = 42759.922812789350000000
        Time = 42759.922812789350000000
        TabOrder = 1
        OnClick = DTP_FinalClick
        OnCloseUp = DTP_FinalCloseUp
        OnChange = DTP_FinalChange
        OnKeyPress = DTP_FinalKeyPress
      end
      object DTP_Inicio: TDateTimePicker
        Left = 7
        Top = 25
        Width = 114
        Height = 21
        Date = 42759.922842280100000000
        Time = 42759.922842280100000000
        TabOrder = 0
        OnClick = DTP_InicioClick
        OnCloseUp = DTP_InicioCloseUp
        OnChange = DTP_InicioChange
        OnKeyPress = DTP_InicioKeyPress
      end
    end
    object GroupBox2: TGroupBox
      Left = 5
      Top = 42
      Width = 426
      Height = 106
      TabOrder = 0
      object Label7: TLabel
        Left = 6
        Top = 11
        Width = 52
        Height = 13
        Caption = 'Paciente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 6
        Top = 62
        Width = 86
        Height = 13
        Caption = 'Plano de Sa'#250'de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBLC_Planos_Saude: TDBLookupComboBox
        Left = 6
        Top = 76
        Width = 172
        Height = 21
        KeyField = 'codigo'
        ListField = 'nome'
        ListSource = Modulo1.DS_Q_Planos
        TabOrder = 1
        OnClick = DBLC_Planos_SaudeClick
        OnCloseUp = DBLC_Planos_SaudeCloseUp
        OnKeyPress = DBLC_Planos_SaudeKeyPress
      end
      object ED_Pacientes: TEdit
        Left = 6
        Top = 25
        Width = 414
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
        OnChange = ED_PacientesChange
        OnKeyPress = ED_PacientesKeyPress
      end
    end
    object RG_Periodo: TRadioGroup
      Left = 437
      Top = 36
      Width = 120
      Height = 112
      Caption = 'Per'#237'odo'
      ItemIndex = 1
      Items.Strings = (
        'Todos'
        'Selecionar')
      TabOrder = 1
      OnClick = RG_PeriodoClick
    end
    object RG_Horario: TRadioGroup
      Left = 691
      Top = 36
      Width = 120
      Height = 112
      Caption = 'Hor'#225'rio'
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Selecionar')
      TabOrder = 3
      OnClick = RG_HorarioClick
    end
    object GB_Horario: TGroupBox
      Left = 810
      Top = 42
      Width = 127
      Height = 106
      TabOrder = 4
      Visible = False
      object Label5: TLabel
        Left = 6
        Top = 11
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
      object DBLC_Hora: TDBLookupComboBox
        Left = 6
        Top = 25
        Width = 114
        Height = 21
        KeyField = 'codigo'
        ListField = 'hora'
        ListSource = Modulo1.DS_Q_Horarios
        TabOrder = 0
        OnClick = DBLC_HoraClick
        OnCloseUp = DBLC_HoraCloseUp
        OnKeyPress = DBLC_HoraKeyPress
      end
    end
    object DBGrid1: TDBGrid
      Left = 5
      Top = 203
      Width = 1296
      Height = 411
      DataSource = Modulo1.DS_Q_Agenda
      PopupMenu = PopupMenu1
      TabOrder = 9
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
          FieldName = 'tipo_agenda'
          Title.Alignment = taCenter
          Title.Caption = 'Agenda'
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
          FieldName = 'data'
          Title.Alignment = taCenter
          Title.Caption = 'Data'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'hora'
          Title.Alignment = taCenter
          Title.Caption = 'Hor'#225'rio'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'paciente'
          Title.Alignment = taCenter
          Title.Caption = 'Paciente'
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
          FieldName = 'plano_saude'
          Title.Alignment = taCenter
          Title.Caption = 'Plano de Sa'#250'de'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'medico_solicitante'
          Title.Alignment = taCenter
          Title.Caption = 'M'#233'dico Solicitante'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'observacao'
          Title.Alignment = taCenter
          Title.Caption = 'Observa'#231#227'o'
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
          FieldName = 'usuario'
          Title.Alignment = taCenter
          Title.Caption = 'Usu'#225'rio'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 150
          Visible = True
        end>
    end
    object BB_Novo: TBitBtn
      Left = 5
      Top = 159
      Width = 148
      Height = 33
      Caption = 'Novo Hor'#225'rio'
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
      TabOrder = 6
      OnClick = BB_NovoClick
    end
    object BB_Cancelar: TBitBtn
      Left = 164
      Top = 159
      Width = 148
      Height = 33
      Caption = 'Cancelar Hor'#225'rio'
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
      TabOrder = 7
      OnClick = BB_CancelarClick
    end
    object CB_Lista: TCheckListBox
      Left = 943
      Top = 42
      Width = 358
      Height = 106
      ItemHeight = 13
      TabOrder = 5
      OnClick = CB_ListaClick
    end
    object BB_Exportar: TBitBtn
      Left = 1226
      Top = 172
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
      TabOrder = 8
      OnClick = BB_ExportarClick
    end
  end
  object Timer1: TTimer
    Interval = 60000
    OnTimer = Timer1Timer
    Left = 136
  end
  object PopupMenu1: TPopupMenu
    Left = 512
    Top = 280
    object ConsultaFinalizada1: TMenuItem
      Caption = 'Consulta Finalizada'
      OnClick = ConsultaFinalizada1Click
    end
    object PacienteAguardando1: TMenuItem
      Caption = 'Paciente Aguardando'
      OnClick = PacienteAguardando1Click
    end
    object RetornaraoIncio1: TMenuItem
      Caption = 'Desmarcar Linha Selecionada'
      OnClick = RetornaraoIncio1Click
    end
    object AdicionarObservao1: TMenuItem
      Caption = 'Adicionar Observa'#231#227'o'
      OnClick = AdicionarObservao1Click
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 640
    Top = 288
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
    Left = 720
    Top = 288
  end
  object ResizeKit1: TResizeKit
    FormPos = rpDefault
    FormWidth = 0
    FormHeight = 0
    FormMaxWidth = 0
    FormMaxHeight = 0
    FormMinWidth = 0
    FormMinHeight = 0
    ResizeFont = True
    Enabled = True
    ValidTaskbar = True
    Left = 216
    DesignFrmW = 1308
    DesignFrmH = 639
    DesignDpiW = 96
    DesignDpiH = 96
  end
end
