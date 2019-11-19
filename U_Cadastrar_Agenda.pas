unit U_Cadastrar_Agenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBCtrls,
  Data.DB, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TFR_Cadastrar_Agenda = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    DBLC_Tipo_Agenda1: TDBLookupComboBox;
    Label2: TLabel;
    BB_Cadastrar1: TBitBtn;
    BB_Filtra1: TBitBtn;
    Label3: TLabel;
    DBLC_Tipo_Agenda2: TDBLookupComboBox;
    Label4: TLabel;
    BB_Filtra2: TBitBtn;
    BB_Cadastrar2: TBitBtn;
    DTP_Data: TDateTimePicker;
    BB_Deletar1: TBitBtn;
    BB_Deletar2: TBitBtn;
    CB_Ano: TEdit;
    Label5: TLabel;
    DTP_Data_Final: TDateTimePicker;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BB_Filtra1Click(Sender: TObject);
    procedure BB_Cadastrar1Click(Sender: TObject);
    procedure BB_Deletar1Click(Sender: TObject);
    procedure BB_Filtra2Click(Sender: TObject);
    procedure BB_Cadastrar2Click(Sender: TObject);
    procedure BB_Deletar2Click(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject; var AllowChange: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure filtrar_agenda1;
    procedure filtrar_agenda2;

    procedure cadastrar_agenda_automatico;
    procedure cadastrar_agenda_manual;

    procedure deletar_agenda1;
    procedure deletar_agenda2;

    procedure filtrar_tipo_agenda1;
    procedure filtrar_tipo_agenda2;

  end;

var
  FR_Cadastrar_Agenda: TFR_Cadastrar_Agenda;

implementation

{$R *.dfm}

Uses U_Global, U_Modulo1;

procedure TFR_Cadastrar_Agenda.FormActivate(Sender: TObject);
begin
    Modulo1.Q_Tipo_Agenda.Close;
    Modulo1.Q_Tipo_Agenda_Agendamento.Close;
    Modulo1.Q_Geral1.Close;


    DTP_Data.Date := Now;
    DTP_Data_Final.Date := Now;


    filtrar_tipo_agenda1;
    filtrar_tipo_agenda2;


    DBLC_Tipo_Agenda1.KeyValue := '0';
    DBLC_Tipo_Agenda2.KeyValue := '0';
end;

procedure TFR_Cadastrar_Agenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Modulo1.Q_Tipo_Agenda.Close;
    Modulo1.Q_Tipo_Agenda_Agendamento.Close;
    Modulo1.Q_Geral1.Close;
end;

procedure TFR_Cadastrar_Agenda.PageControl1Changing(Sender: TObject; var AllowChange: Boolean);
begin
    if (pagecontrol1.ActivePageIndex = 0) then
    begin
        Modulo1.Q_Geral1.Close;
    end;

    if (pagecontrol1.ActivePageIndex = 1) then
    begin
        Modulo1.Q_Geral1.Close;
    end;
end;

procedure TFR_Cadastrar_Agenda.BB_Filtra1Click(Sender: TObject);
begin
    if DBLC_Tipo_Agenda1.Text <> '' then
      filtrar_agenda1
    else
      ShowMessage('Necessário preencher o campo Agenda');
end;

procedure TFR_Cadastrar_Agenda.BB_Cadastrar1Click(Sender: TObject);
begin
    if (DBLC_Tipo_Agenda1.Text <> '') and (CB_Ano.Text <> '') then
      cadastrar_agenda_automatico
    else
      ShowMessage('Necessário preencher os campos: Agenda e Ano!');
end;

procedure TFR_Cadastrar_Agenda.BB_Deletar1Click(Sender: TObject);
begin
    if Not Modulo1.Q_Geral1.IsEmpty then
      deletar_agenda1;
end;

procedure TFR_Cadastrar_Agenda.BB_Filtra2Click(Sender: TObject);
begin
    if DBLC_Tipo_Agenda2.Text <> '' then
      filtrar_agenda2
    else
      ShowMessage('Necessário preencher o campo Agenda');
end;

procedure TFR_Cadastrar_Agenda.BB_Cadastrar2Click(Sender: TObject);
begin
    if (DBLC_Tipo_Agenda2.Text <> '') then
      cadastrar_agenda_manual
    else
      ShowMessage('Necessário preencher o campo Agenda');
end;

procedure TFR_Cadastrar_Agenda.BB_Deletar2Click(Sender: TObject);
begin
    if Not Modulo1.Q_Geral1.IsEmpty then
      deletar_agenda2;
end;

procedure TFR_Cadastrar_Agenda.filtrar_agenda1;
begin
    cmd:=' select a.codigo, a.key_pacientes, a.data, ta.descricao as tipo_agenda, tah.hora '
        +' from agendamento a '
        +' inner join tipo_agenda ta on a.key_tipo_agenda = ta.codigo '
        +' inner join tipo_agenda_horarios tah on a.key_tipo_agenda_horario = tah.codigo '
        +' inner join tipo_agenda_dias tad on tah.key_tipo_agenda_dias = tad.codigo '
        +' where true ';

    if DBLC_Tipo_Agenda1.Text <> '' then
    begin
        cmd:=cmd+' and ta.codigo = ' +QuotedStr(DBLC_Tipo_Agenda1.KeyValue);
    end;

    if CB_Ano.Text <> '' then
    begin
        cmd:=cmd+' and a.data >= ' +QuotedStr(CB_Ano.Text + '-01-01')
                +' and a.data <= ' +QuotedStr(CB_Ano.Text + '-12-31');
    end;


    cmd:=cmd+' order by ta.descricao, a.data, tah.hora ';

    QRefresh(Modulo1.Q_Geral1,cmd);
end;

procedure TFR_Cadastrar_Agenda.filtrar_agenda2;
begin
    cmd:=' select a.codigo, a.key_pacientes, a.data, ta.descricao as tipo_agenda, tah.hora '
        +' from agendamento a '
        +' inner join tipo_agenda ta on a.key_tipo_agenda = ta.codigo '
        +' inner join tipo_agenda_horarios tah on a.key_tipo_agenda_horario = tah.codigo '
        +' inner join tipo_agenda_dias tad on tah.key_tipo_agenda_dias = tad.codigo '
        +' where true ';

    if DBLC_Tipo_Agenda2.Text <> '' then
    begin
        cmd:=cmd+' and ta.codigo = ' +QuotedStr(DBLC_Tipo_Agenda2.KeyValue);
    end;


    cmd:=cmd+' and a.data >= ' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Data.DateTime))
            +' and a.data <= ' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Data_Final.DateTime))
            +' order by ta.descricao, a.data, tah.hora ';

    QRefresh(Modulo1.Q_Geral1,cmd);
end;

procedure TFR_Cadastrar_Agenda.deletar_agenda1;
begin
    if Modulo1.Q_Geral1.FieldByName('key_pacientes').IsNull then
    begin
        cmd:=' delete from agendamento where codigo = ' +QuotedStr(Modulo1.Q_Geral1.FieldByName('codigo').AsString);
        Exec_SQL(cmd);

        filtrar_agenda1;
    end
    else
    begin
        if Application.MessageBox(Pchar('Paciente já cadastro para este horário. Deseja deletar o horário ?'),'ATENÇÃO', 36) = 6 then
        begin
            cmd:=' delete from agendamento where codigo = ' +QuotedStr(Modulo1.Q_Geral1.FieldByName('codigo').AsString);
            Exec_SQL(cmd);

            filtrar_agenda1;
        end;
    end;
end;

procedure TFR_Cadastrar_Agenda.deletar_agenda2;
begin
    if Modulo1.Q_Geral1.FieldByName('key_pacientes').IsNull then
    begin
        cmd:=' delete from agendamento where codigo = ' +QuotedStr(Modulo1.Q_Geral1.FieldByName('codigo').AsString);
        Exec_SQL(cmd);

        filtrar_agenda2;
    end
    else
    begin
        if Application.MessageBox(Pchar('Paciente já cadastro para este horário. Deseja deletar o horário ?'),'ATENÇÃO', 36) = 6 then
        begin
            cmd:=' delete from agendamento where codigo = ' +QuotedStr(Modulo1.Q_Geral1.FieldByName('codigo').AsString);
            Exec_SQL(cmd);

            filtrar_agenda2;
        end;
    end;
end;

procedure TFR_Cadastrar_Agenda.cadastrar_agenda_automatico;
Var
  data_inicial, data_final : TDate;

  Result_cadastro : Boolean;
begin
    Result_cadastro := False;


    data_inicial := StrToDate('01/01/' +CB_Ano.Text);
    data_final   := StrToDate('31/12/' +CB_Ano.Text);

    while data_inicial <= data_final do
    begin
        cmd:=' select * from tipo_agenda_dias '
            +' where key_tipo_agenda = ' +QuotedStr(DBLC_Tipo_Agenda1.KeyValue)
            +' and ativo = True '
            +' and descricao = '
            +' (Case '
            +'      When date_part(' +QuotedStr('dow')+ ', cast(' +QuotedStr(FormatDateTime('yyyy-mm-dd', data_inicial))+ ' as date) ) = 6 then ' +QuotedStr('Sábado')
            +'      When date_part(' +QuotedStr('dow')+ ', cast(' +QuotedStr(FormatDateTime('yyyy-mm-dd', data_inicial))+ ' as date) ) = 5 then ' +QuotedStr('Sexta')
            +'      When date_part(' +QuotedStr('dow')+ ', cast(' +QuotedStr(FormatDateTime('yyyy-mm-dd', data_inicial))+ ' as date) ) = 4 then ' +QuotedStr('Quinta')
            +'      When date_part(' +QuotedStr('dow')+ ', cast(' +QuotedStr(FormatDateTime('yyyy-mm-dd', data_inicial))+ ' as date) ) = 3 then ' +QuotedStr('Quarta')
            +'      When date_part(' +QuotedStr('dow')+ ', cast(' +QuotedStr(FormatDateTime('yyyy-mm-dd', data_inicial))+ ' as date) ) = 2 then ' +QuotedStr('Terça')
            +'      When date_part(' +QuotedStr('dow')+ ', cast(' +QuotedStr(FormatDateTime('yyyy-mm-dd', data_inicial))+ ' as date) ) = 1 then ' +QuotedStr('Segunda')
            +' End) ';
        QRefresh(Modulo1.Q_Geral2,cmd);


        if Modulo1.Q_Geral2.FieldByName('codigo').AsString <> '' then
        begin
            cmd:=' select * from tipo_agenda_horarios '
                +' where key_tipo_agenda = ' +QuotedStr(DBLC_Tipo_Agenda1.KeyValue)
                +' and key_tipo_agenda_dias = ' +QuotedStr(Modulo1.Q_Geral2.FieldByName('codigo').AsString)
                +' and ativo = True '
                +' order by hora ';
            QRefresh(Modulo1.Q_Geral2,cmd);

            while Not Modulo1.Q_Geral2.Eof do
            begin
                cmd:=' Select codigo from agendamento '
                    +' where key_tipo_agenda_horario = ' +QuotedStr(Modulo1.Q_Geral2.FieldByName('codigo').AsString)
                    +' and data = ' +QuotedStr(FormatDateTime('yyyy-mm-dd', data_inicial))
                    +' and key_tipo_agenda = ' +IntToStr(DBLC_Tipo_Agenda1.KeyValue);
                QRefresh(Modulo1.Q_Geral3,cmd);

                if Modulo1.Q_Geral3.IsEmpty then
                begin
                    cmd:=' Insert into agendamento (key_tipo_agenda_horario, data, key_tipo_agenda) Values ( '
                        +QuotedStr(Modulo1.Q_Geral2.FieldByName('codigo').AsString) +','
                        +QuotedStr(FormatDateTime('yyyy-mm-dd', data_inicial)) +','
                        +IntToStr(DBLC_Tipo_Agenda1.KeyValue)
                        +')';
                    Exec_SQL(cmd);


                    Result_cadastro := True;
                end;

                Modulo1.Q_Geral2.Next;
            end;
        end;


        data_inicial := data_inicial + 1;
    end;

    if Result_cadastro = True then
      ShowMessage('Agenda cadastrada com sucesso!')
    else
      ShowMessage('Horários já cadastrados para a agenda e dia(s) desejado(s)!!');


    filtrar_agenda1;
end;

procedure TFR_Cadastrar_Agenda.cadastrar_agenda_manual;
Var
  data_inicial : TDate;

  Result_cadastro : Boolean;
begin
    Result_cadastro := False;

    data_inicial := DTP_Data.Date;

    while DTP_Data.Date <= DTP_Data_Final.Date do
    begin
        cmd:=' select * from tipo_agenda_dias '
            +' where key_tipo_agenda = ' +QuotedStr(DBLC_Tipo_Agenda2.KeyValue)
            +' and ativo = True '
            +' and descricao = '
            +' (Case '
            +'      When date_part(' +QuotedStr('dow')+ ', cast(' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Data.Date))+ ' as date) ) = 6 then ' +QuotedStr('Sábado')
            +'      When date_part(' +QuotedStr('dow')+ ', cast(' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Data.Date))+ ' as date) ) = 5 then ' +QuotedStr('Sexta')
            +'      When date_part(' +QuotedStr('dow')+ ', cast(' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Data.Date))+ ' as date) ) = 4 then ' +QuotedStr('Quinta')
            +'      When date_part(' +QuotedStr('dow')+ ', cast(' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Data.Date))+ ' as date) ) = 3 then ' +QuotedStr('Quarta')
            +'      When date_part(' +QuotedStr('dow')+ ', cast(' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Data.Date))+ ' as date) ) = 2 then ' +QuotedStr('Terça')
            +'      When date_part(' +QuotedStr('dow')+ ', cast(' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Data.Date))+ ' as date) ) = 1 then ' +QuotedStr('Segunda')
            +' End) ';
        QRefresh(Modulo1.Q_Geral2,cmd);


        if Modulo1.Q_Geral2.FieldByName('codigo').AsString <> '' then
        begin
            cmd:=' select * from tipo_agenda_horarios '
                +' where key_tipo_agenda = ' +QuotedStr(DBLC_Tipo_Agenda2.KeyValue)
                +' and ativo = True '
                +' and key_tipo_agenda_dias = ' +QuotedStr(Modulo1.Q_Geral2.FieldByName('codigo').AsString)
                +' order by hora ';
            QRefresh(Modulo1.Q_Geral2,cmd);

            while Not Modulo1.Q_Geral2.Eof do
            begin
                cmd:=' Select codigo from agendamento '
                    +' where key_tipo_agenda_horario = ' +QuotedStr(Modulo1.Q_Geral2.FieldByName('codigo').AsString)
                    +' and data = ' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Data.Date))
                    +' and key_tipo_agenda = ' +IntToStr(DBLC_Tipo_Agenda2.KeyValue);
                QRefresh(Modulo1.Q_Geral3,cmd);

                if Modulo1.Q_Geral3.IsEmpty then
                begin
                    cmd:=' Insert into agendamento (key_tipo_agenda_horario, data, key_tipo_agenda) Values ( '
                        +QuotedStr(Modulo1.Q_Geral2.FieldByName('codigo').AsString) +','
                        +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Data.Date)) +','
                        +IntToStr(DBLC_Tipo_Agenda2.KeyValue)
                        +')';
                    Exec_SQL(cmd);


                    Result_cadastro := True;
                end;


                Modulo1.Q_Geral2.Next;
            end;
        end;

        filtrar_agenda2;

        DTP_Data.Date := DTP_Data.Date + 1;
    end;


    if Result_cadastro = True then
      ShowMessage('Agenda cadastrada com sucesso!')
    else
      ShowMessage('Horários já cadastrados para a agenda e dia(s) desejado(s)!!');
    
    DTP_Data.Date := data_inicial;

    filtrar_agenda2;
end;

procedure TFR_Cadastrar_Agenda.filtrar_tipo_agenda1;
begin
    cmd:=' select codigo, descricao from tipo_agenda where ativo = true '
        +' order by codigo ';
    QRefresh(Modulo1.Q_Tipo_Agenda,cmd);
end;

procedure TFR_Cadastrar_Agenda.filtrar_tipo_agenda2;
begin
    cmd:=' select codigo, descricao from tipo_agenda where ativo = true '
        +' order by codigo ';
    QRefresh(Modulo1.Q_Tipo_Agenda_Agendamento,cmd);
end;

end.
