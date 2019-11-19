unit U_Pacientes_Historico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCGrids;

type
  TFR_Pacientes_Historico = class(TForm)
    Panel1: TPanel;
    Lbl_Paciente: TLabel;
    Bevel10: TBevel;
    BB_Novo: TBitBtn;
    BB_Editar: TBitBtn;
    DBCtrlGrid1: TDBCtrlGrid;
    Label56: TLabel;
    Label58: TLabel;
    DB_Data: TDBEdit;
    DB_MM: TDBMemo;
    NTB_SPC: TNotebook;
    Label53: TLabel;
    Label55: TLabel;
    DB_Data_Historico1: TDBEdit;
    DB_MM_Historico1: TDBMemo;
    BB_Salvar: TBitBtn;
    BB_Cancelar: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure BB_NovoClick(Sender: TObject);
    procedure BB_EditarClick(Sender: TObject);
    procedure BB_SalvarClick(Sender: TObject);
    procedure BB_CancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FR_Pacientes_Historico: TFR_Pacientes_Historico;

implementation

{$R *.dfm}

Uses U_Global, U_Modulo1, U_Pacientes;

procedure TFR_Pacientes_Historico.FormActivate(Sender: TObject);
begin
    Modulo1.Q_Pacientes_Historico.Close;

    Lbl_Paciente.Caption := 'Paciente: ' + Nome_Paciente;


    cmd:=' select * from pacientes_historico '
        +' where key_pacientes = ' +QuotedStr(Codigo_Paciente)
        +' order by codigo desc ';
    QRefresh(Modulo1.Q_Pacientes_Historico,cmd);
end;

procedure TFR_Pacientes_Historico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Modulo1.Q_Pacientes_Historico.Close;
end;

procedure TFR_Pacientes_Historico.BB_NovoClick(Sender: TObject);
begin
    NTB_SPC.Visible := True;

    BB_Novo.Enabled := False;
    BB_Editar.Enabled := False;

    DB_Data_Historico1.SetFocus;
    Modulo1.Q_Pacientes_Historico.Append;
    Modulo1.Q_Pacientes_Historico.FieldByName('data').AsDateTime := Date;
end;

procedure TFR_Pacientes_Historico.BB_EditarClick(Sender: TObject);
begin
    NTB_SPC.Visible := True;

    DB_Data_Historico1.SetFocus;

    Modulo1.Q_Pacientes_Historico.Edit;
end;

procedure TFR_Pacientes_Historico.BB_SalvarClick(Sender: TObject);
Var
  codigo_historico : string;
begin
    codigo_historico := '';

    if (DB_Data_Historico1.text <> '') and (DB_MM_Historico1.text <> '') then
    begin
        cmd:='select nextval('+quotedstr('pacientes_historico_codigo_seq')+') as numero ';
        QRefresh(Modulo1.Q_Geral,cmd);

        codigo_historico := Modulo1.Q_Geral.FieldByName('numero').AsString;


        Modulo1.Q_Pacientes_Historico.FieldByName('codigo').AsString := codigo_historico;
        Modulo1.Q_Pacientes_Historico.FieldByName('key_pacientes').AsString := Codigo_Paciente;
        Modulo1.Q_Pacientes_Historico.Post;

        NTB_SPC.Visible:=False;

        BB_Novo.Enabled:=True;
        BB_Editar.Enabled:=True;
    end
    else
    begin
        ShowMessage('Existem campos obrigatórios não preenchidos');

        DB_Data_Historico1.SetFocus;
    end;
end;

procedure TFR_Pacientes_Historico.BB_CancelarClick(Sender: TObject);
begin
    NTB_SPC.Visible:=False;

    Modulo1.Q_Pacientes_Historico.Cancel;

    BB_Novo.Enabled:=True;
    BB_Editar.Enabled:=True;
end;

end.
