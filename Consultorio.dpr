program Consultorio;

uses
  Vcl.Forms,
  U_Principal in 'U_Principal.pas' {FR_Principal},
  U_Modulo1 in 'U_Modulo1.pas' {Modulo1: TDataModule},
  U_Global in 'U_Global.pas',
  U_Pacientes in 'U_Pacientes.pas' {FR_Pacientes},
  Vcl.Themes,
  Vcl.Styles,
  U_Usuarios in 'U_Usuarios.pas' {FR_Usuario},
  U_Planos_Saude in 'U_Planos_Saude.pas' {FR_Planos_Saude},
  U_Exames in 'U_Exames.pas' {FR_Tipo_Agenda},
  U_Senha in 'U_Senha.pas' {FR_Senha},
  U_Agenda in 'U_Agenda.pas' {FR_Agenda},
  U_Agendamento in 'U_Agendamento.pas' {FR_Agendamento},
  U_Pacientes_Historico in 'U_Pacientes_Historico.pas' {FR_Pacientes_Historico},
  U_Cadastrar_Agenda in 'U_Cadastrar_Agenda.pas' {FR_Cadastrar_Agenda},
  U_Observacao in 'U_Observacao.pas' {FR_Observacao},
  U_Cadastrar_Agenda_Manual in 'U_Cadastrar_Agenda_Manual.pas' {FR_Cadastrar_Agenda_Manual};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFR_Senha, FR_Senha);
  Application.CreateForm(TFR_Principal, FR_Principal);
  Application.CreateForm(TModulo1, Modulo1);
  Application.Run;
end.
