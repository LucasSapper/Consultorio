object FR_Cadastrar_Agenda_Manual: TFR_Cadastrar_Agenda_Manual
  Left = 342
  Top = 103
  Caption = 'Cadastrar Agenda Manual'
  ClientHeight = 440
  ClientWidth = 680
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
    Width = 680
    Height = 440
    Align = alClient
    TabOrder = 0
    object Label6: TLabel
      Left = 5
      Top = 6
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
    object Label7: TLabel
      Left = 321
      Top = 6
      Width = 34
      Height = 13
      Caption = 'In'#237'cio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 420
      Top = 6
      Width = 29
      Height = 13
      Caption = 'Final:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 529
      Top = 6
      Width = 87
      Height = 13
      Caption = 'Dia da Semana:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBLC_Tipo_Agenda: TDBLookupComboBox
      Left = 5
      Top = 20
      Width = 300
      Height = 21
      KeyField = 'codigo'
      ListField = 'descricao'
      ListSource = Modulo1.DS_Q_Tipo_Agenda
      TabOrder = 0
      OnClick = DBLC_Tipo_AgendaClick
      OnCloseUp = DBLC_Tipo_AgendaCloseUp
    end
    object DTP_Data: TDateTimePicker
      Left = 321
      Top = 20
      Width = 93
      Height = 21
      Date = 42759.922842280100000000
      Time = 42759.922842280100000000
      TabOrder = 1
    end
    object DTP_Data_Final: TDateTimePicker
      Left = 420
      Top = 20
      Width = 93
      Height = 21
      Date = 42759.922842280100000000
      Time = 42759.922842280100000000
      TabOrder = 2
    end
    object BB_Cadastrar: TBitBtn
      Left = 476
      Top = 191
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
      OnClick = BB_CadastrarClick
    end
    object BB_Deletar: TBitBtn
      Left = 578
      Top = 191
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
      TabOrder = 4
      OnClick = BB_DeletarClick
    end
    object CB_Lista: TCheckListBox
      Left = 5
      Top = 52
      Width = 669
      Height = 128
      ItemHeight = 13
      TabOrder = 5
    end
    object DBGrid1: TDBGrid
      Left = 5
      Top = 227
      Width = 669
      Height = 205
      DataSource = Modulo1.DS_Q_Geral1
      TabOrder = 6
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
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
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'data'
          Title.Alignment = taCenter
          Title.Caption = 'Data'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'hora'
          Title.Alignment = taCenter
          Title.Caption = 'Hora'
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
      Left = 390
      Top = 191
      Width = 75
      Height = 25
      Caption = 'Filtra'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
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
      ParentFont = False
      TabOrder = 7
      OnClick = BB_FiltraClick
    end
    object DBLC_Dia_Semana: TDBLookupComboBox
      Left = 529
      Top = 20
      Width = 145
      Height = 21
      KeyField = 'codigo'
      ListField = 'descricao'
      ListSource = Modulo1.DS_Q_Dias
      TabOrder = 8
      OnClick = DBLC_Dia_SemanaClick
      OnCloseUp = DBLC_Dia_SemanaCloseUp
    end
  end
end
