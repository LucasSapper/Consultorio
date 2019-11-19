unit U_Cadastrar_Agenda_Manual;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.CheckLst, Vcl.Buttons, Vcl.ComCtrls, Vcl.DBCtrls,
  Vcl.ExtCtrls;

type
  TFR_Cadastrar_Agenda_Manual = class(TForm)
    Panel1: TPanel;
    Label6: TLabel;
    DBLC_Tipo_Agenda: TDBLookupComboBox;
    Label7: TLabel;
    DTP_Data: TDateTimePicker;
    Label8: TLabel;
    DTP_Data_Final: TDateTimePicker;
    BB_Cadastrar: TBitBtn;
    BB_Deletar: TBitBtn;
    CB_Lista: TCheckListBox;
    Label5: TLabel;
    DBGrid1: TDBGrid;
    BB_Filtra: TBitBtn;
    DBLC_Dia_Semana: TDBLookupComboBox;
    procedure FormActivate(Sender: TObject);
    procedure BB_FiltraClick(Sender: TObject);
    procedure BB_CadastrarClick(Sender: TObject);
    procedure BB_DeletarClick(Sender: TObject);
    procedure DBLC_Tipo_AgendaClick(Sender: TObject);
    procedure DBLC_Tipo_AgendaCloseUp(Sender: TObject);
    procedure DBLC_Dia_SemanaClick(Sender: TObject);
    procedure DBLC_Dia_SemanaCloseUp(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure filtrar_agenda;

    procedure cadastrar_agenda;
    procedure deletar_agenda;

    procedure filtrar_tipo_agenda;
    procedure filtrar_dias;
    procedure filtrar_horarios;
    procedure MultiSelect;

  end;

var
  FR_Cadastrar_Agenda_Manual: TFR_Cadastrar_Agenda_Manual;

implementation

{$R *.dfm}

Uses U_Global, U_Modulo1;

procedure TFR_Cadastrar_Agenda_Manual.FormActivate(Sender: TObject);
begin
    Modulo1.Q_Geral1.Close;
    Modulo1.Q_Tipo_Agenda.Close;
    Modulo1.Q_Dias.Close;
    Modulo1.Q_Horarios.Close;


    DTP_Data.Date := Now;
    DTP_Data_Final.Date := Now;


    filtrar_tipo_agenda;


    DBLC_Tipo_Agenda.KeyValue := '0';
    DBLC_Dia_Semana.KeyValue := '0';
end;

procedure TFR_Cadastrar_Agenda_Manual.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Modulo1.Q_Geral1.Close;
    Modulo1.Q_Tipo_Agenda.Close;
    Modulo1.Q_Dias.Close;
    Modulo1.Q_Horarios.Close;
end;

procedure TFR_Cadastrar_Agenda_Manual.BB_FiltraClick(Sender: TObject);
begin
    if DBLC_Tipo_Agenda.Text <> '' then
      filtrar_agenda
    else
      ShowMessage('Necessário preencher o campo Agenda');
end;

procedure TFR_Cadastrar_Agenda_Manual.BB_CadastrarClick(Sender: TObject);
begin
    if (DBLC_Tipo_Agenda.Text <> '') and (DBLC_Dia_Semana.Text <> '') then
      cadastrar_agenda
    else
      ShowMessage('Necessário preencher o campo Agenda e Dia da Semana');
end;

procedure TFR_Cadastrar_Agenda_Manual.BB_DeletarClick(Sender: TObject);
begin
    if Not Modulo1.Q_Geral1.IsEmpty then
      deletar_agenda;
end;

procedure TFR_Cadastrar_Agenda_Manual.DBLC_Tipo_AgendaClick(Sender: TObject);
begin
    filtrar_dias;
end;

procedure TFR_Cadastrar_Agenda_Manual.DBLC_Tipo_AgendaCloseUp(Sender: TObject);
begin
    filtrar_dias;
end;

procedure TFR_Cadastrar_Agenda_Manual.DBLC_Dia_SemanaClick(Sender: TObject);
begin
    filtrar_horarios;
end;

procedure TFR_Cadastrar_Agenda_Manual.DBLC_Dia_SemanaCloseUp(Sender: TObject);
begin
    filtrar_horarios;
end;

procedure TFR_Cadastrar_Agenda_Manual.filtrar_agenda;
begin
    cmd:=' select a.codigo, a.key_pacientes, a.data, ta.descricao as tipo_agenda, tah.hora '
        +' from agendamento a '
        +' inner join tipo_agenda ta on a.key_tipo_agenda = ta.codigo '
        +' inner join tipo_agenda_horarios tah on a.key_tipo_agenda_horario = tah.codigo '
        +' inner join tipo_agenda_dias tad on tah.key_tipo_agenda_dias = tad.codigo '
        +' where true ';

    if DBLC_Tipo_Agenda.Text <> '' then
    begin
        cmd:=cmd+' and ta.codigo = ' +QuotedStr(DBLC_Tipo_Agenda.KeyValue);
    end;


    cmd:=cmd+' and a.data >= ' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Data.DateTime))
            +' and a.data <= ' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Data_Final.DateTime))
            +' order by ta.descricao, a.data, tah.hora ';

    QRefresh(Modulo1.Q_Geral1,cmd);
end;

procedure TFR_Cadastrar_Agenda_Manual.cadastrar_agenda;
Var
  data_inicial : TDate;

  Result_cadastro : Boolean;


  k : integer;
  tipo, tipo_horarios : string;
begin
    tipo := '';
    tipo_horarios := '';


    // varre os horários
    for k := 0 to CB_Lista.Items.Count -1 do
    begin
        // verifica se existe algum selecionado
        if CB_Lista.Checked[k] = True then
        begin
           tipo := FR_Cadastrar_Agenda_Manual.CB_Lista.Items[k];

           tipo_horarios := tipo_horarios + QuotedStr(tipo) + ',';
        end;
    end;

    if tipo_horarios <> '' then
    begin
        tipo_horarios := copy(tipo_horarios,1,(length(tipo_horarios)-1));
    end;


    if tipo_horarios <> '' then
    begin
        Result_cadastro := False;

        data_inicial := DTP_Data.Date;

        while DTP_Data.Date <= DTP_Data_Final.Date do
        begin
            cmd:=' select * from tipo_agenda_dias '
                +' where key_tipo_agenda = ' +QuotedStr(DBLC_Tipo_Agenda.KeyValue)
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
                if Modulo1.Q_Geral2.FieldByName('descricao').AsString = DBLC_Dia_Semana.Text then
                begin
                    cmd:=' select * from tipo_agenda_horarios '
                        +' where key_tipo_agenda = ' +QuotedStr(DBLC_Tipo_Agenda.KeyValue)
                        +' and ativo = True '
                        +' and key_tipo_agenda_dias = ' +QuotedStr(Modulo1.Q_Geral2.FieldByName('codigo').AsString)
                        +' and hora in (' +tipo_horarios+ ')'
                        +' order by hora ';
                    QRefresh(Modulo1.Q_Geral2,cmd);

                    while Not Modulo1.Q_Geral2.Eof do
                    begin
                        cmd:=' Select codigo from agendamento '
                            +' where key_tipo_agenda_horario = ' +QuotedStr(Modulo1.Q_Geral2.FieldByName('codigo').AsString)
                            +' and data = ' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Data.Date))
                            +' and key_tipo_agenda = ' +IntToStr(DBLC_Tipo_Agenda.KeyValue);
                        QRefresh(Modulo1.Q_Geral3,cmd);

                        if Modulo1.Q_Geral3.IsEmpty then
                        begin
                            cmd:=' Insert into agendamento (key_tipo_agenda_horario, data, key_tipo_agenda) Values ( '
                                +QuotedStr(Modulo1.Q_Geral2.FieldByName('codigo').AsString) +','
                                +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Data.Date)) +','
                                +IntToStr(DBLC_Tipo_Agenda.KeyValue)
                                +')';
                            Exec_SQL(cmd);


                            Result_cadastro := True;
                        end;


                        Modulo1.Q_Geral2.Next;
                    end;
                end;
            end;

            filtrar_agenda;

            DTP_Data.Date := DTP_Data.Date + 1;
        end;


        if Result_cadastro = True then
          ShowMessage('Agenda cadastrada para o dia e horários selecionados!')
        else
          ShowMessage('Horários já cadastrados para a agenda e dia(s) desejado(s)!!');

        DTP_Data.Date := data_inicial;

        filtrar_agenda;
    end
    else
    begin
        ShowMessage('Necessário selecionar pelo menos 1 horário.');
    end;
end;

procedure TFR_Cadastrar_Agenda_Manual.deletar_agenda;
begin
    if Modulo1.Q_Geral1.FieldByName('key_pacientes').IsNull then
    begin
        cmd:=' delete from agendamento where codigo = ' +QuotedStr(Modulo1.Q_Geral1.FieldByName('codigo').AsString);
        Exec_SQL(cmd);

        filtrar_agenda;
    end
    else
    begin
        if Application.MessageBox(Pchar('Paciente já cadastro para este horário. Deseja deletar o horário ?'),'ATENÇÃO', 36) = 6 then
        begin
            cmd:=' delete from agendamento where codigo = ' +QuotedStr(Modulo1.Q_Geral1.FieldByName('codigo').AsString);
            Exec_SQL(cmd);

            filtrar_agenda;
        end;
    end;
end;

procedure TFR_Cadastrar_Agenda_Manual.filtrar_tipo_agenda;
begin
    cmd:=' select * from tipo_agenda where ativo = true '
        +' order by codigo ';
    QRefresh(Modulo1.Q_Tipo_Agenda,cmd);
end;

procedure TFR_Cadastrar_Agenda_Manual.filtrar_dias;
begin
    cmd:=' select * from tipo_agenda_dias '
        +' where ativo = true '
        +' and key_tipo_agenda = ' +QuotedStr(DBLC_Tipo_Agenda.KeyValue)
        +' order by codigo ';
    QRefresh(Modulo1.Q_Dias,cmd);
end;

procedure TFR_Cadastrar_Agenda_Manual.filtrar_horarios;
begin
    cmd:=' select * from tipo_agenda_horarios '
        +' where ativo = true '
        +' and key_tipo_agenda = ' +QuotedStr(DBLC_Tipo_Agenda.KeyValue)
        +' and key_tipo_agenda_dias = ' +QuotedStr(DBLC_Dia_Semana.KeyValue)
        +' order by codigo ';
    QRefresh(Modulo1.Q_Horarios,cmd);


    CB_Lista.Clear;

    if Not Modulo1.Q_Horarios.IsEmpty then
    begin
        Modulo1.Q_Horarios.First;
        while not Modulo1.Q_Horarios.Eof do
        begin
            CB_Lista.Items.Add(Modulo1.Q_Horarios.FieldByName('hora').AsString);

            Modulo1.Q_Horarios.Next;
        end;

        CB_Lista.Checked[0] := True;

        CB_Lista.Columns := 4;
    end;
end;

procedure TFR_Cadastrar_Agenda_Manual.MultiSelect;
var
  i: Integer;
begin
    with CB_Lista do
    begin
        if ItemIndex >= 0 then
        begin
            if (Checked[ItemIndex]) then
            begin
                Items.BeginUpdate;

                for i := 0 to Pred(Items.Count) do
                begin
                    if (i <> ItemIndex) then
                      Checked[i] := False;
                end;

                Items.EndUpdate;
            end;
        end;
    end;
end;

end.
