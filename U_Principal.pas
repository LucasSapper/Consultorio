unit U_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ToolWin, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Imaging.jpeg, ShellApi, ResizeKit;

type
  TFR_Principal = class(TForm)
    Panel1: TPanel;
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Funcionario1: TMenuItem;
    Clientes1: TMenuItem;
    PlanosdeSade1: TMenuItem;
    Exames1: TMenuItem;
    MarcaodeExames1: TMenuItem;
    ToolBar1: TToolBar;
    BitBtn13: TBitBtn;
    Sobre1: TMenuItem;
    Sair2: TMenuItem;
    Novo2: TMenuItem;
    Consulta2: TMenuItem;
    Novo3: TMenuItem;
    Consulta3: TMenuItem;
    Novo4: TMenuItem;
    Consulta4: TMenuItem;
    Novo5: TMenuItem;
    COnsulta5: TMenuItem;
    Agendamento1: TMenuItem;
    BB_Paciente: TBitBtn;
    BB_Plano_Saude: TBitBtn;
    BB_Agenda: TBitBtn;
    CadastrarAgenda1: TMenuItem;
    Image1: TImage;
    Backup1: TMenuItem;
    Automtico1: TMenuItem;
    Manual1: TMenuItem;
    DBGrid1: TDBGrid;
    Timer1: TTimer;
    procedure Sair2Click(Sender: TObject);
    procedure Novo2Click(Sender: TObject);
    procedure Consulta2Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure Novo5Click(Sender: TObject);
    procedure COnsulta5Click(Sender: TObject);
    procedure Novo3Click(Sender: TObject);
    procedure Consulta3Click(Sender: TObject);
    procedure Novo4Click(Sender: TObject);
    procedure Consulta4Click(Sender: TObject);
    procedure BB_ExameClick(Sender: TObject);
    procedure BB_PacienteClick(Sender: TObject);
    procedure BB_Plano_SaudeClick(Sender: TObject);
    procedure Agendamento1Click(Sender: TObject);
    procedure BB_AgendaClick(Sender: TObject);
    procedure Backup1Click(Sender: TObject);
    procedure Automtico1Click(Sender: TObject);
    procedure Manual1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure listar_aguardando_paciente;
  end;

var
  FR_Principal: TFR_Principal;

implementation

{$R *.dfm}

Uses U_Global, U_Modulo1, U_Pacientes, U_Usuarios, U_Planos_Saude, U_Exames, U_Agenda,
     U_Cadastrar_Agenda, U_Cadastrar_Agenda_Manual;

procedure TFR_Principal.FormActivate(Sender: TObject);
begin
    Timer1.Enabled := False;


    if glAcesso_Adm = True then
    begin
        Cadastros1.Visible := True;
        BB_Paciente.Visible := True;
        BB_Plano_Saude.Visible := True;
    end
    else
    begin
        Cadastros1.Visible := False;
        BB_Paciente.Visible := False;
        BB_Plano_Saude.Visible := False;
    end;


    if glAvisoTelaPrincipal = True then
    begin
        Image1.Visible  := False;
        DBGrid1.Visible := True;
    end
    else
    begin
        Image1.Visible  := True;
        DBGrid1.Visible := False;
    end;


    listar_aguardando_paciente;
end;

procedure TFR_Principal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Modulo1.ZConnection.Disconnect;
    Application.Terminate;
end;

procedure TFR_Principal.Automtico1Click(Sender: TObject);
begin
    Timer1.Enabled := False;

    Application.CreateForm(TFR_Cadastrar_Agenda, FR_Cadastrar_Agenda);
    FR_Cadastrar_Agenda.ShowModal;
    FR_Cadastrar_Agenda.Free;

    listar_aguardando_paciente;
end;

procedure TFR_Principal.Manual1Click(Sender: TObject);
begin
    Timer1.Enabled := False;

    Application.CreateForm(TFR_Cadastrar_Agenda_Manual, FR_Cadastrar_Agenda_Manual);
    FR_Cadastrar_Agenda_Manual.ShowModal;
    FR_Cadastrar_Agenda_Manual.Free;

    listar_aguardando_paciente;
end;

procedure TFR_Principal.Consulta2Click(Sender: TObject);
begin
    Timer1.Enabled := False;

    Application.CreateForm(TFR_Pacientes, FR_Pacientes);
    FR_Pacientes.Notebook1.PageIndex := 0;
    FR_Pacientes.ShowModal;
    FR_Pacientes.Free;

    listar_aguardando_paciente;
end;

procedure TFR_Principal.Novo2Click(Sender: TObject);
begin
    Timer1.Enabled := False;

    Application.CreateForm(TFR_Pacientes, FR_Pacientes);
    FR_Pacientes.Notebook1.PageIndex := 1;
    FR_Pacientes.ShowModal;
    FR_Pacientes.Free;

    listar_aguardando_paciente;
end;

procedure TFR_Principal.COnsulta5Click(Sender: TObject);
begin
    Timer1.Enabled := False;

    Application.CreateForm(TFR_Usuario, FR_Usuario);
    FR_Usuario.Notebook1.PageIndex := 0;
    FR_Usuario.ShowModal;
    FR_Usuario.Free;

    listar_aguardando_paciente;
end;

procedure TFR_Principal.Novo5Click(Sender: TObject);
begin
    Timer1.Enabled := False;

    Application.CreateForm(TFR_Usuario, FR_Usuario);
    FR_Usuario.Notebook1.PageIndex := 1;
    FR_Usuario.ShowModal;
    FR_Usuario.Free;

    listar_aguardando_paciente;
end;

procedure TFR_Principal.Consulta3Click(Sender: TObject);
begin
    Timer1.Enabled := False;

    Application.CreateForm(TFR_Planos_Saude, FR_Planos_Saude);
    FR_Planos_Saude.Notebook1.PageIndex := 0;
    FR_Planos_Saude.ShowModal;
    FR_Planos_Saude.Free;

    listar_aguardando_paciente;
end;

procedure TFR_Principal.Novo3Click(Sender: TObject);
begin
    Timer1.Enabled := False;

    Application.CreateForm(TFR_Planos_Saude, FR_Planos_Saude);
    FR_Planos_Saude.Notebook1.PageIndex := 1;
    FR_Planos_Saude.ShowModal;
    FR_Planos_Saude.Free;

    listar_aguardando_paciente;
end;

procedure TFR_Principal.Consulta4Click(Sender: TObject);
begin
    Timer1.Enabled := False;

    Application.CreateForm(TFR_Tipo_Agenda, FR_Tipo_Agenda);
    FR_Tipo_Agenda.Notebook1.PageIndex := 0;
    FR_Tipo_Agenda.ShowModal;
    FR_Tipo_Agenda.Free;

    listar_aguardando_paciente;
end;

procedure TFR_Principal.Novo4Click(Sender: TObject);
begin
    Timer1.Enabled := False;

    Application.CreateForm(TFR_Tipo_Agenda, FR_Tipo_Agenda);
    FR_Tipo_Agenda.Notebook1.PageIndex := 1;
    FR_Tipo_Agenda.ShowModal;
    FR_Tipo_Agenda.Free;

    listar_aguardando_paciente;
end;

procedure TFR_Principal.Sair2Click(Sender: TObject);
begin
    Modulo1.ZConnection.Disconnect;
    Application.Terminate;
end;

procedure TFR_Principal.Agendamento1Click(Sender: TObject);
begin
    Timer1.Enabled := False;

    Modulo1.Q_Pacientes.Close;
    Modulo1.Q_Planos.Close;
    Modulo1.Q_Horarios.Close;
    Modulo1.Q_Tipo_Agenda.Close;

    Application.CreateForm(TFR_Agenda, FR_Agenda);
    FR_Agenda.ShowModal;
    FR_Agenda.Free;

    Modulo1.Q_Pacientes.Close;
    Modulo1.Q_Planos.Close;
    Modulo1.Q_Horarios.Close;
    Modulo1.Q_Tipo_Agenda.Close;

    listar_aguardando_paciente;
end;

procedure TFR_Principal.BB_ExameClick(Sender: TObject);
begin
    Timer1.Enabled := False;

    Application.CreateForm(TFR_Tipo_Agenda, FR_Tipo_Agenda);
    FR_Tipo_Agenda.Notebook1.PageIndex := 0;
    FR_Tipo_Agenda.ShowModal;
    FR_Tipo_Agenda.Free;

    listar_aguardando_paciente;
end;

procedure TFR_Principal.BB_PacienteClick(Sender: TObject);
begin
    Timer1.Enabled := False;

    Application.CreateForm(TFR_Pacientes, FR_Pacientes);
    FR_Pacientes.Notebook1.PageIndex := 0;
    FR_Pacientes.ShowModal;
    FR_Pacientes.Free;

    listar_aguardando_paciente;
end;

procedure TFR_Principal.BB_Plano_SaudeClick(Sender: TObject);
begin
    Timer1.Enabled := False;

    Application.CreateForm(TFR_Planos_Saude, FR_Planos_Saude);
    FR_Planos_Saude.Notebook1.PageIndex := 0;
    FR_Planos_Saude.ShowModal;
    FR_Planos_Saude.Free;

    listar_aguardando_paciente;
end;

procedure TFR_Principal.Backup1Click(Sender: TObject);
begin
    Timer1.Enabled := False;

    WinExec('C:\Consultorio\Backup\Comando.bat', SW_NORMAL);

    listar_aguardando_paciente;
end;

procedure TFR_Principal.BB_AgendaClick(Sender: TObject);
begin
    Timer1.Enabled := False;

    Application.CreateForm(TFR_Agenda, FR_Agenda);
    FR_Agenda.ShowModal;
    FR_Agenda.Free;

    listar_aguardando_paciente;
end;

procedure TFR_Principal.BitBtn13Click(Sender: TObject);
begin
    Modulo1.ZConnection.Disconnect;
    Application.Terminate;
end;

procedure TFR_Principal.listar_aguardando_paciente;
begin
    Timer1.Enabled := False;

    if glAvisoTelaPrincipal = True then
    begin
        Image1.Visible  := False;
        DBGrid1.Visible := True;


        cmd:=' select a.codigo, a.data, a.consulta_finalizada, a.paciente_aguardando, a.key_pacientes, p.nome as paciente, p.telefone1, p.celular, '
            +' a.key_planos_saude, ps.nome as plano_saude, a.key_tipo_agenda, ta.descricao as tipo_agenda, a.key_tipo_agenda_horario, tah.hora, '
            +' a.medico_solicitante, a.observacao, u.usuario as usuario '
            +' from agendamento a '
            +' left join pacientes p on a.key_pacientes = p.codigo '
            +' left join planos_saude ps on a.key_planos_saude = ps.codigo '
            +' inner join tipo_agenda ta on a.key_tipo_agenda = ta.codigo '
            +' inner join tipo_agenda_horarios tah on a.key_tipo_agenda_horario = tah.codigo '
            +' inner join tipo_agenda_dias tad on tah.key_tipo_agenda_dias = tad.codigo '
            +' left join usuarios u on a.key_usuarios = u.codigo '
            +' where true '
            +' and a.paciente_aguardando = True '
            +' order by a.data, tah.hora ';

        QRefresh(Modulo1.Q_Grid,cmd);
    end
    else
    begin
        Image1.Visible  := True;
        DBGrid1.Visible := False;
    end;

    Timer1.Enabled := True;
end;

procedure TFR_Principal.Timer1Timer(Sender: TObject);
begin
    listar_aguardando_paciente;
end;

end.
