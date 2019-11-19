object Modulo1: TModulo1
  OldCreateOrder = False
  Height = 563
  Width = 997
  object ZConnection: TZConnection
    ControlsCodePage = cCP_UTF16
    ClientCodepage = 'WIN1252'
    Catalog = ''
    Properties.Strings = (
      'codepage=WIN1252'
      'AutoEncodeStrings=ON'
      'controls_cp=CP_UTF16')
    HostName = ''
    Port = 5432
    Database = ''
    User = 'postgres'
    Password = 'ncor@2017'
    Protocol = 'postgresql'
    Left = 34
    Top = 15
  end
  object Q_Pacientes: TZQuery
    Connection = ZConnection
    Params = <>
    Left = 67
    Top = 95
  end
  object DS_Q_Pacientes: TDataSource
    DataSet = Q_Pacientes
    Left = 67
    Top = 135
  end
  object Q_Usuarios: TZQuery
    Connection = ZConnection
    Params = <>
    Left = 67
    Top = 207
  end
  object DS_Q_Usuarios: TDataSource
    DataSet = Q_Usuarios
    Left = 67
    Top = 247
  end
  object Q_Planos: TZQuery
    Connection = ZConnection
    Params = <>
    Left = 67
    Top = 319
  end
  object DS_Q_Planos: TDataSource
    DataSet = Q_Planos
    Left = 67
    Top = 359
  end
  object Q_Geral: TZQuery
    Connection = ZConnection
    Params = <>
    Left = 429
    Top = 103
  end
  object DS_Q_Geral: TDataSource
    DataSet = Q_Geral
    Left = 429
    Top = 143
  end
  object Q_Geral1: TZQuery
    Connection = ZConnection
    Params = <>
    Left = 429
    Top = 215
  end
  object DS_Q_Geral1: TDataSource
    DataSet = Q_Geral1
    Left = 429
    Top = 255
  end
  object Q_Geral2: TZQuery
    Connection = ZConnection
    Params = <>
    Left = 429
    Top = 327
  end
  object DS_Q_Geral2: TDataSource
    DataSet = Q_Geral2
    Left = 429
    Top = 367
  end
  object QRefresh: TZQuery
    Connection = ZConnection
    Params = <>
    Left = 120
    Top = 16
  end
  object Q_Exec_SQL: TZQuery
    Connection = ZConnection
    Params = <>
    Left = 195
    Top = 18
  end
  object Q_Agenda: TZQuery
    Connection = ZConnection
    Params = <>
    Left = 194
    Top = 324
  end
  object DS_Q_Agenda: TDataSource
    DataSet = Q_Agenda
    Left = 194
    Top = 364
  end
  object Q_Horarios: TZQuery
    Connection = ZConnection
    Params = <>
    Left = 194
    Top = 95
  end
  object DS_Q_Horarios: TDataSource
    DataSet = Q_Horarios
    Left = 194
    Top = 135
  end
  object Q_Tipo_Agenda: TZQuery
    Connection = ZConnection
    Params = <>
    Left = 193
    Top = 207
  end
  object DS_Q_Tipo_Agenda: TDataSource
    DataSet = Q_Tipo_Agenda
    Left = 193
    Top = 247
  end
  object Q_Pacientes_Agendamento: TZQuery
    Connection = ZConnection
    Params = <>
    Left = 685
    Top = 95
  end
  object DS_Q_Pacientes_Agendamento: TDataSource
    DataSet = Q_Pacientes_Agendamento
    Left = 685
    Top = 135
  end
  object Q_Horarios_Agendamento: TZQuery
    Connection = ZConnection
    Params = <>
    Left = 877
    Top = 95
  end
  object DS_Q_Horarios_Agendamento: TDataSource
    DataSet = Q_Horarios_Agendamento
    Left = 877
    Top = 135
  end
  object Q_Tipo_Agenda_Agendamento: TZQuery
    Connection = ZConnection
    Params = <>
    Left = 685
    Top = 199
  end
  object DS_Q_Tipo_Agenda_Agendamento: TDataSource
    DataSet = Q_Tipo_Agenda_Agendamento
    Left = 687
    Top = 239
  end
  object Q_Planos_Agendamento: TZQuery
    Connection = ZConnection
    Params = <>
    Left = 879
    Top = 200
  end
  object DS_Q_Planos_Agendamento: TDataSource
    DataSet = Q_Planos_Agendamento
    Left = 879
    Top = 240
  end
  object Q_Pacientes_Historico: TZQuery
    Connection = ZConnection
    Params = <>
    Left = 67
    Top = 431
  end
  object DS_Q_Pacientes_Historico: TDataSource
    DataSet = Q_Pacientes_Historico
    Left = 67
    Top = 471
  end
  object Q_Dias: TZQuery
    Connection = ZConnection
    Params = <>
    Left = 194
    Top = 431
  end
  object DS_Q_Dias: TDataSource
    DataSet = Q_Dias
    Left = 194
    Top = 471
  end
  object Q_Geral3: TZQuery
    Connection = ZConnection
    Params = <>
    Left = 432
    Top = 431
  end
  object DS_Q_Geral3: TDataSource
    DataSet = Q_Geral3
    Left = 432
    Top = 471
  end
  object Q_Grid: TZQuery
    Connection = ZConnection
    Params = <>
    Left = 536
    Top = 431
  end
  object DS_Q_Grid: TDataSource
    DataSet = Q_Grid
    Left = 536
    Top = 471
  end
end
