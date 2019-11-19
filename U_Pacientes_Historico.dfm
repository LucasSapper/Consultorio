object FR_Pacientes_Historico: TFR_Pacientes_Historico
  Left = 313
  Top = 74
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Paciente Hist'#243'rico'
  ClientHeight = 459
  ClientWidth = 749
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
    Width = 749
    Height = 459
    Align = alClient
    TabOrder = 0
    object Lbl_Paciente: TLabel
      Left = 9
      Top = 12
      Width = 61
      Height = 16
      Caption = 'Paciente:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel10: TBevel
      Left = 9
      Top = 34
      Width = 731
      Height = 415
      Shape = bsFrame
    end
    object BB_Novo: TBitBtn
      Left = 639
      Top = 60
      Width = 84
      Height = 25
      Caption = 'Novo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
        0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
        33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = BB_NovoClick
    end
    object BB_Editar: TBitBtn
      Left = 639
      Top = 92
      Width = 84
      Height = 25
      Caption = 'Editar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000055
        555557777777775F55550FFFFFFFFF0555557F5555555F7FFF5F0FEEEEEE0000
        05007F555555777775770FFFFFF0BFBFB00E7F5F5557FFF557770F0EEEE000FB
        FB0E7F75FF57775555770FF00F0FBFBFBF0E7F57757FFFF555770FE0B00000FB
        FB0E7F575777775555770FFF0FBFBFBFBF0E7F5575FFFFFFF5770FEEE0000000
        FB0E7F555777777755770FFFFF0B00BFB0007F55557577FFF7770FEEEEE0B000
        05557F555557577775550FFFFFFF0B0555557FF5F5F57575F55500F0F0F0F0B0
        555577F7F7F7F7F75F5550707070700B055557F7F7F7F7757FF5507070707050
        9055575757575757775505050505055505557575757575557555}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      OnClick = BB_EditarClick
    end
    object DBCtrlGrid1: TDBCtrlGrid
      Left = 24
      Top = 49
      Width = 609
      Height = 288
      Color = clBtnFace
      DataSource = Modulo1.DS_Q_Pacientes_Historico
      PanelHeight = 96
      PanelWidth = 592
      ParentColor = False
      TabOrder = 2
      object Label56: TLabel
        Left = 18
        Top = 8
        Width = 28
        Height = 13
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label58: TLabel
        Left = 107
        Top = 8
        Width = 51
        Height = 13
        Caption = 'Hist'#243'rico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DB_Data: TDBEdit
        Left = 18
        Top = 22
        Width = 71
        Height = 21
        Color = clInfoBk
        DataField = 'data'
        DataSource = Modulo1.DS_Q_Pacientes_Historico
        ReadOnly = True
        TabOrder = 0
      end
      object DB_MM: TDBMemo
        Left = 107
        Top = 22
        Width = 469
        Height = 65
        Color = clInfoBk
        DataField = 'historico'
        DataSource = Modulo1.DS_Q_Pacientes_Historico
        ReadOnly = True
        TabOrder = 1
      end
    end
    object NTB_SPC: TNotebook
      Left = 24
      Top = 343
      Width = 704
      Height = 99
      TabOrder = 3
      Visible = False
      object TPage
        Left = 0
        Top = 0
        Caption = 'Default'
        object Label53: TLabel
          Left = 18
          Top = 8
          Width = 32
          Height = 13
          Caption = 'Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label55: TLabel
          Left = 107
          Top = 8
          Width = 55
          Height = 13
          Caption = 'Hist'#243'rico:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DB_Data_Historico1: TDBEdit
          Left = 18
          Top = 22
          Width = 71
          Height = 21
          Color = 16771788
          DataField = 'data'
          DataSource = Modulo1.DS_Q_Pacientes_Historico
          TabOrder = 0
        end
        object DB_MM_Historico1: TDBMemo
          Left = 107
          Top = 22
          Width = 469
          Height = 70
          Color = 16771788
          DataField = 'historico'
          DataSource = Modulo1.DS_Q_Pacientes_Historico
          TabOrder = 1
        end
        object BB_Salvar: TBitBtn
          Left = 615
          Top = 28
          Width = 84
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
          TabOrder = 2
          OnClick = BB_SalvarClick
        end
        object BB_Cancelar: TBitBtn
          Left = 615
          Top = 60
          Width = 84
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
          TabOrder = 3
          OnClick = BB_CancelarClick
        end
      end
    end
  end
end
