object FR_Agendamento: TFR_Agendamento
  Left = 285
  Top = 89
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Agendamento Exames'
  ClientHeight = 474
  ClientWidth = 784
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
    Width = 784
    Height = 474
    Align = alClient
    TabOrder = 0
    object Label7: TLabel
      Left = 6
      Top = 150
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
      Left = 312
      Top = 48
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
    object Label8: TLabel
      Left = 264
      Top = 3
      Width = 269
      Height = 23
      Caption = 'AGENDAMENTO DE EXAMES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 544
      Top = 48
      Width = 30
      Height = 13
      Caption = 'Data:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 661
      Top = 48
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
    object Label1: TLabel
      Left = 6
      Top = 48
      Width = 46
      Height = 13
      Caption = 'Agenda:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 411
      Top = 150
      Width = 52
      Height = 13
      Caption = 'Telefone:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label17: TLabel
      Left = 543
      Top = 150
      Width = 42
      Height = 13
      Caption = 'Celular:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BB_Adicionar: TSpeedButton
      Left = 679
      Top = 162
      Width = 96
      Height = 25
      Caption = 'Cadastrar'
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
        77777777D7D777777777377777777777D7D777777777307777777777D7D77777
        777773077777777700A07777777773B0777777776D6177777773000F07777777
        000077777773FBFBF07777779900777777773FB0333777770000777777773BFB
        07777777FFFF7777730000BFB0777777A600777773FBFBFBFB07777700007777
        773FBFB03337777700007777773BFBFB07777777000077777773BFBFB0777777
        970077777773FBFBFB0777775469777777773FBFBFB077770054777777773333
        33333777000077777777777777777777A6007777777777777777777700007777
        77777777777777770000}
      ParentFont = False
      OnClick = BB_AdicionarClick
    end
    object Label2: TLabel
      Left = 6
      Top = 99
      Width = 103
      Height = 13
      Caption = 'M'#233'dico Solicitante'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBLC_Planos_Saude: TDBLookupComboBox
      Left = 312
      Top = 62
      Width = 221
      Height = 21
      KeyField = 'codigo'
      ListField = 'nome'
      ListSource = Modulo1.DS_Q_Planos_Agendamento
      TabOrder = 1
    end
    object DTP_Data: TDateTimePicker
      Left = 544
      Top = 62
      Width = 106
      Height = 21
      Date = 42759.922842280100000000
      Time = 42759.922842280100000000
      TabOrder = 2
      OnClick = DTP_DataClick
      OnCloseUp = DTP_DataCloseUp
      OnChange = DTP_DataChange
    end
    object BB_Salvar: TBitBtn
      Left = 289
      Top = 442
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
      TabOrder = 9
      OnClick = BB_SalvarClick
    end
    object BB_Cancelar: TBitBtn
      Left = 391
      Top = 442
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
      TabOrder = 10
      OnClick = BB_CancelarClick
    end
    object DBLC_Tipo_Agenda: TDBLookupComboBox
      Left = 6
      Top = 62
      Width = 295
      Height = 21
      KeyField = 'codigo'
      ListField = 'descricao'
      ListSource = Modulo1.DS_Q_Tipo_Agenda_Agendamento
      TabOrder = 0
      OnClick = DBLC_Tipo_AgendaClick
      OnCloseUp = DBLC_Tipo_AgendaCloseUp
    end
    object MSK_Tel1: TMaskEdit
      Left = 411
      Top = 164
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      EditMask = '(99) 9999-9999;1;_'
      MaxLength = 14
      TabOrder = 6
      Text = '(  )     -    '
    end
    object MSK_Celular: TMaskEdit
      Left = 543
      Top = 164
      Width = 125
      Height = 21
      CharCase = ecUpperCase
      EditMask = '(99) 99999-9999;1;_'
      MaxLength = 15
      TabOrder = 7
      Text = '(  )      -    '
    end
    object ED_Paciente: TEdit
      Left = 6
      Top = 164
      Width = 395
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 5
      OnKeyPress = ED_PacienteKeyPress
    end
    object DBLC_Hora: TDBLookupComboBox
      Left = 661
      Top = 62
      Width = 114
      Height = 21
      KeyField = 'codigo'
      ListField = 'hora'
      ListSource = Modulo1.DS_Q_Horarios_Agendamento
      TabOrder = 3
    end
    object DBGrid1: TDBGrid
      Left = 6
      Top = 196
      Width = 769
      Height = 235
      DataSource = Modulo1.DS_Q_Pacientes_Agendamento
      TabOrder = 8
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
          Width = 230
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
          FieldName = 'telefone1'
          Title.Alignment = taCenter
          Title.Caption = 'Telefone1'
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
          FieldName = 'celular'
          Title.Alignment = taCenter
          Title.Caption = 'Celular'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 120
          Visible = True
        end>
    end
    object ED_Medico_Solicitante: TEdit
      Left = 6
      Top = 113
      Width = 395
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 4
      OnKeyPress = ED_PacienteKeyPress
    end
  end
end
