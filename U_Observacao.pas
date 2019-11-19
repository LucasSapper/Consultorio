unit U_Observacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFR_Observacao = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MM_Observacao: TMemo;
    BB_Salvar: TBitBtn;
    BB_Cancelar: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure BB_CancelarClick(Sender: TObject);
    procedure BB_SalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure salvar;
  end;

var
  FR_Observacao: TFR_Observacao;

  Codigo_Agenda_Observacao : string;

implementation

{$R *.dfm}

Uses U_Global, U_Modulo1, U_Agendamento;

procedure TFR_Observacao.FormActivate(Sender: TObject);
begin
    MM_Observacao.Clear;
    MM_Observacao.SetFocus;

    if Modulo1.Q_Agenda.FieldByName('observacao').AsString <> '' then
      MM_Observacao.Text := Modulo1.Q_Agenda.FieldByName('observacao').AsString;
end;

procedure TFR_Observacao.BB_SalvarClick(Sender: TObject);
begin
    salvar;
end;

procedure TFR_Observacao.BB_CancelarClick(Sender: TObject);
begin
    Close;
end;

procedure TFR_Observacao.salvar;
begin
    cmd:=' Update agendamento set observacao = ' +QuotedStr(MM_Observacao.Text)
        +' where codigo = ' +QuotedStr(Codigo_Agenda_Observacao);
    Exec_SQL(cmd);

    Close;
end;

end.
