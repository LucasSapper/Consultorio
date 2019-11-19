unit U_Modulo1;

interface

uses
  System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection;

type
  TModulo1 = class(TDataModule)
    ZConnection: TZConnection;
    Q_Pacientes: TZQuery;
    DS_Q_Pacientes: TDataSource;
    Q_Usuarios: TZQuery;
    DS_Q_Usuarios: TDataSource;
    Q_Planos: TZQuery;
    DS_Q_Planos: TDataSource;
    Q_Geral: TZQuery;
    DS_Q_Geral: TDataSource;
    Q_Geral1: TZQuery;
    DS_Q_Geral1: TDataSource;
    Q_Geral2: TZQuery;
    DS_Q_Geral2: TDataSource;
    QRefresh: TZQuery;
    Q_Exec_SQL: TZQuery;
    Q_Agenda: TZQuery;
    DS_Q_Agenda: TDataSource;
    Q_Horarios: TZQuery;
    DS_Q_Horarios: TDataSource;
    Q_Tipo_Agenda: TZQuery;
    DS_Q_Tipo_Agenda: TDataSource;
    Q_Pacientes_Agendamento: TZQuery;
    DS_Q_Pacientes_Agendamento: TDataSource;
    Q_Horarios_Agendamento: TZQuery;
    DS_Q_Horarios_Agendamento: TDataSource;
    Q_Tipo_Agenda_Agendamento: TZQuery;
    DS_Q_Tipo_Agenda_Agendamento: TDataSource;
    Q_Planos_Agendamento: TZQuery;
    DS_Q_Planos_Agendamento: TDataSource;
    Q_Pacientes_Historico: TZQuery;
    DS_Q_Pacientes_Historico: TDataSource;
    Q_Dias: TZQuery;
    DS_Q_Dias: TDataSource;
    Q_Geral3: TZQuery;
    DS_Q_Geral3: TDataSource;
    Q_Grid: TZQuery;
    DS_Q_Grid: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Modulo1: TModulo1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
