unit U_Agendamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFR_Agendamento = class(TForm)
    Panel1: TPanel;
    Label7: TLabel;
    Label13: TLabel;
    DBLC_Planos_Saude: TDBLookupComboBox;
    Label8: TLabel;
    Label4: TLabel;
    DTP_Data: TDateTimePicker;
    Label5: TLabel;
    BB_Salvar: TBitBtn;
    BB_Cancelar: TBitBtn;
    Label1: TLabel;
    DBLC_Tipo_Agenda: TDBLookupComboBox;
    Label16: TLabel;
    MSK_Tel1: TMaskEdit;
    Label17: TLabel;
    MSK_Celular: TMaskEdit;
    ED_Paciente: TEdit;
    DBLC_Hora: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    BB_Adicionar: TSpeedButton;
    Label2: TLabel;
    ED_Medico_Solicitante: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ED_PacienteKeyPress(Sender: TObject; var Key: Char);
    procedure BB_CancelarClick(Sender: TObject);
    procedure BB_SalvarClick(Sender: TObject);
    procedure DBLC_Tipo_AgendaCloseUp(Sender: TObject);
    procedure DBLC_Tipo_AgendaClick(Sender: TObject);
    procedure DTP_DataCloseUp(Sender: TObject);
    procedure DTP_DataClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BB_AdicionarClick(Sender: TObject);
    procedure DTP_DataChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure novo_agendamento;

    procedure filtrar_pacientes;
    procedure filtrar_planos_saude;
    procedure filtrar_horario;
    procedure filtrar_tipo_agenda;

    procedure cadastrar_paciente;

  end;

var
  FR_Agendamento: TFR_Agendamento;

  Tipo : string[1];
  Codigo_Agenda : string;

  Codigo_Paciente : string;

  Cadastro_Realizado : string;

implementation

{$R *.dfm}

Uses U_Global, U_Modulo1, U_Agenda;

procedure TFR_Agendamento.FormActivate(Sender: TObject);
begin
    Modulo1.Q_Tipo_Agenda_Agendamento.Close;
    Modulo1.Q_Planos_Agendamento.Close;
    Modulo1.Q_Horarios_Agendamento.Close;
    Modulo1.Q_Pacientes_Agendamento.Close;


    filtrar_tipo_agenda;
    filtrar_planos_saude;
    filtrar_horario;


    DTP_Data.Date := Date;

    DBLC_Planos_Saude.KeyValue := '0';
    DBLC_Hora.KeyValue := '0';
    ED_Paciente.Clear;
    MSK_Tel1.Text := '(  )     -    ';
    MSK_Celular.Text := '(  )      -    ';
    ED_Medico_Solicitante.Clear;

    Codigo_Paciente := '';

    DBLC_Tipo_Agenda.KeyValue := Modulo1.Q_Agenda.FieldByName('key_tipo_agenda').AsInteger;

    if Tipo = 'A' then
    begin
        DBLC_Tipo_Agenda.KeyValue := Modulo1.Q_Agenda.FieldByName('key_tipo_agenda').AsInteger;

        if Modulo1.Q_Agenda.FieldByName('plano_saude').AsString <> '' then
          DBLC_Planos_Saude.KeyValue := Modulo1.Q_Agenda.FieldByName('key_planos_saude').AsInteger;

        DTP_Data.Date := Modulo1.Q_Agenda.FieldByName('data').AsDateTime;

        filtrar_horario;
        DBLC_Hora.KeyValue := Modulo1.Q_Agenda.FieldByName('key_tipo_agenda_horario').AsInteger;

        Codigo_Paciente := Modulo1.Q_Agenda.FieldByName('key_pacientes').AsString;
        ED_Paciente.Text := Modulo1.Q_Agenda.FieldByName('paciente').AsString;
        MSK_Tel1.Text := Modulo1.Q_Agenda.FieldByName('telefone1').AsString;
        MSK_Celular.Text := Modulo1.Q_Agenda.FieldByName('celular').AsString;

        ED_Medico_Solicitante.Text := Modulo1.Q_Agenda.FieldByName('medico_solicitante').AsString;
    end;


    Cadastro_Realizado := 'N';
end;

procedure TFR_Agendamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if Cadastro_Realizado = 'N' then
    begin
        if Application.MessageBox(Pchar('Nenhuma consulta foi agendada. Deseja sair da tela ?'),'ATENÇÃO', 36) = 6 then
        begin
            Modulo1.Q_Tipo_Agenda_Agendamento.Close;
            Modulo1.Q_Planos_Agendamento.Close;
            Modulo1.Q_Horarios_Agendamento.Close;
            Modulo1.Q_Pacientes_Agendamento.Close;

            Tipo := '';
        end
        else
        begin
            Action := CaNone;

            DBLC_Tipo_Agenda.SetFocus;
        end;
    end
    else
    begin
        Modulo1.Q_Tipo_Agenda_Agendamento.Close;
        Modulo1.Q_Planos_Agendamento.Close;
        Modulo1.Q_Horarios_Agendamento.Close;
        Modulo1.Q_Pacientes_Agendamento.Close;

        Tipo := '';
    end;
end;

procedure TFR_Agendamento.BB_CancelarClick(Sender: TObject);
begin
    Close;
end;

procedure TFR_Agendamento.BB_SalvarClick(Sender: TObject);
begin
    if (
        (Codigo_Paciente = '') or
        (DBLC_Tipo_Agenda.Text = 'TODOS') or
        (DBLC_Hora.Text = '')
       ) then
    begin
        ShowMessage('Necessário verificar campos: Agenda, Paciente e Horário');
    end
    else
    begin
        cmd:=' Select codigo from agendamento '
            +' where key_tipo_agenda = ' +QuotedStr(DBLC_Tipo_Agenda.KeyValue)
            +' and data = ' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Data.Date))
            +' and key_tipo_agenda_horario = ' +QuotedStr(DBLC_Hora.KeyValue);
        QRefresh(Modulo1.Q_Geral3,cmd);


        if Modulo1.Q_Geral3.IsEmpty then
          ShowMessage('Horário indisponível para a agenda selecionada!')
        else
          novo_agendamento;
    end;
end;

procedure TFR_Agendamento.ED_PacienteKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then
    begin
        filtrar_pacientes;

        if Modulo1.Q_Pacientes_Agendamento.IsEmpty then
        begin
            ShowMessage('Paciente não encontrado!');
        end;
    end;
end;

procedure TFR_Agendamento.filtrar_pacientes;
begin
    cmd:=' select * from pacientes '
        +' where nome like ' +QuotedStr(Trim(ED_Paciente.Text +'%'));
    QRefresh(Modulo1.Q_Pacientes_Agendamento,cmd);
end;

procedure TFR_Agendamento.filtrar_planos_saude;
begin
    cmd:=' select 0 as codigo, cast(' +QuotedStr('TODOS')+ ' as varchar(300)) as nome '

        +' UNION ALL '

        +' select codigo, cast(nome as varchar(300)) as nome from planos_saude ';
    QRefresh(Modulo1.Q_Planos_Agendamento,cmd);
end;

procedure TFR_Agendamento.filtrar_horario;
begin
    cmd:='(select tah.* from tipo_agenda_horarios tah '
        +' inner join tipo_agenda_dias tad on tah.key_tipo_agenda_dias = tad.codigo '

        +' where tad.descricao = '
        +' (Case '
        +'      When date_part(' +QuotedStr('dow')+ ', cast(' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Data.Date))+ ' as date) ) = 6 then ' +QuotedStr('Sábado')
        +'      When date_part(' +QuotedStr('dow')+ ', cast(' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Data.Date))+ ' as date) ) = 5 then ' +QuotedStr('Sexta')
        +'      When date_part(' +QuotedStr('dow')+ ', cast(' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Data.Date))+ ' as date) ) = 4 then ' +QuotedStr('Quinta')
        +'      When date_part(' +QuotedStr('dow')+ ', cast(' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Data.Date))+ ' as date) ) = 3 then ' +QuotedStr('Quarta')
        +'      When date_part(' +QuotedStr('dow')+ ', cast(' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Data.Date))+ ' as date) ) = 2 then ' +QuotedStr('Terça')
        +'      When date_part(' +QuotedStr('dow')+ ', cast(' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Data.Date))+ ' as date) ) = 1 then ' +QuotedStr('Segunda')
        +' End) '


        +' and tah.key_tipo_agenda = ' +QuotedStr(DBLC_Tipo_Agenda.KeyValue)
        +' and tah.ativo = True '
        +' and tah.codigo not in ( '

        +'  select key_tipo_agenda_horario from agendamento '
        +'  where key_tipo_agenda = ' +QuotedStr(DBLC_Tipo_Agenda.KeyValue)
        +'  and data = ' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Data.Date))
        +'  and key_pacientes is not null '

        +' ) '

        +' and tah.codigo in ( '

        +'  select key_tipo_agenda_horario from agendamento '
        +'  where key_tipo_agenda = ' +QuotedStr(DBLC_Tipo_Agenda.KeyValue)
        +'  and data = ' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Data.Date))
        +'  and key_pacientes is null '

        +' ) '
        +' order by tah.hora) ';


    if Tipo = 'A' then
    begin
        cmd:=cmd+' UNION '

                +'(select tah.* from tipo_agenda_horarios tah '
                +' inner join tipo_agenda_dias tad on tah.key_tipo_agenda_dias = tad.codigo '

                +' where tah.codigo = ' + Modulo1.Q_Agenda.FieldByName('key_tipo_agenda_horario').AsString

                +' order by tah.hora) ';
    end;

    QRefresh(Modulo1.Q_Horarios_Agendamento,cmd);
end;

procedure TFR_Agendamento.filtrar_tipo_agenda;
begin
    cmd:=' select codigo, descricao from tipo_agenda where ativo = true '
        +' order by codigo ';
    QRefresh(Modulo1.Q_Tipo_Agenda_Agendamento,cmd);

    DBLC_Tipo_Agenda.KeyValue := 1;
end;

procedure TFR_Agendamento.novo_agendamento;
begin
    if Tipo = 'A' then
    begin
        if Codigo_Agenda <> '' then
        begin
            cmd:=' Update agendamento set '
                +' key_pacientes = null '
                +' , key_planos_saude = null '
                +' , consulta_finalizada = false '
                +' , paciente_aguardando = false '
                +' , medico_solicitante = null '
                +' , observacao = null '
                +' , key_usuarios = null '
                +' where codigo = ' +QuotedStr(Codigo_Agenda);
            Exec_SQL(cmd);
        end;


        cmd:=' update agendamento set '
            +' data = ' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Data.Date))
            +' , key_tipo_agenda_horario = ' +QuotedStr(DBLC_Hora.KeyValue)
            +' , key_pacientes = ' +QuotedStr(Codigo_Paciente);


        if DBLC_Planos_Saude.Text <> 'TODOS' then
          cmd:=cmd+' , key_planos_saude = ' +QuotedStr(DBLC_Planos_Saude.KeyValue)
        else
          cmd:=cmd+' , key_planos_saude = null ';


        cmd:=cmd+' , key_tipo_agenda = ' +QuotedStr(DBLC_Tipo_Agenda.KeyValue)
                +' , medico_solicitante = ' +QuotedStr(ED_Medico_Solicitante.Text)
                +' , key_usuarios = ' +QuotedStr(glUsuario)
                +' where data = ' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Data.Date))
                +' and key_tipo_agenda = ' +QuotedStr(DBLC_Tipo_Agenda.KeyValue)
                +' and key_tipo_agenda_horario = ' +QuotedStr(DBLC_Hora.KeyValue);
        Exec_SQL(cmd);


        ShowMessage('Alteração realizada com sucesso!');
    end
    else
    begin
        cmd:=' Select codigo from agendamento '
            +' where data = ' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Data.Date))
            +' and key_tipo_agenda_horario = ' +QuotedStr(DBLC_Hora.KeyValue)
            +' and key_tipo_agenda = ' +QuotedStr(DBLC_Tipo_Agenda.KeyValue);
        QRefresh(Modulo1.Q_Geral2,cmd);

        if Modulo1.Q_Geral2.IsEmpty then
        begin
            cmd:=' insert into agendamento (data, key_tipo_agenda_horario, key_pacientes, key_planos_saude, key_tipo_agenda, medico_solicitante, key_usuarios) Values ( '
                +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Data.Date)) +','
                +QuotedStr(DBLC_Hora.KeyValue) +','
                +QuotedStr(Codigo_Paciente) +',';


            if DBLC_Planos_Saude.Text <> 'TODOS' then
              cmd:=cmd+QuotedStr(DBLC_Planos_Saude.KeyValue) +','
            else
              cmd:=cmd+' Null, ';


            cmd:=cmd+QuotedStr(DBLC_Tipo_Agenda.KeyValue) +','
                    +QuotedStr(ED_Medico_Solicitante.Text) +','
                    +QuotedStr(glUsuario)
                    +' ) ';
            Exec_SQL(cmd);
        end
        else
        begin
            cmd:=' update agendamento set '
                +' data = ' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Data.Date))
                +' , key_tipo_agenda_horario = ' +QuotedStr(DBLC_Hora.KeyValue)
                +' , key_pacientes = ' +QuotedStr(Codigo_Paciente);


            if DBLC_Planos_Saude.Text <> 'TODOS' then
              cmd:=cmd+' , key_planos_saude = ' +QuotedStr(DBLC_Planos_Saude.KeyValue)
            else
              cmd:=cmd+' , key_planos_saude = null ';


            cmd:=cmd+' , key_tipo_agenda = ' +QuotedStr(DBLC_Tipo_Agenda.KeyValue)
                    +' , medico_solicitante = ' +QuotedStr(ED_Medico_Solicitante.Text)
                    +' , key_usuarios = ' +QuotedStr(glUsuario)
                    +' where codigo = ' +QuotedStr(Modulo1.Q_Geral2.FieldByName('codigo').AsString);
            Exec_SQL(cmd);
        end;


        ShowMessage('Marcação realizada com sucesso!');
    end;


    Cadastro_Realizado := 'S';


    Close;
end;

procedure TFR_Agendamento.cadastrar_paciente;
begin
    cmd:=' Insert into pacientes (nome, telefone1, celular, cadastro_pendente) '
        +' Values ( '

        +QuotedStr(Trim(ED_Paciente.Text)) +',';

    if MSK_Tel1.Text <> '(  )     -    ' then
      cmd:=cmd+QuotedStr(MSK_Tel1.Text) +','
    else
      cmd:=cmd+'null,';


    if MSK_Celular.Text <> '(  )      -    ' then
      cmd:=cmd+QuotedStr(MSK_Celular.Text) +','
    else
      cmd:=cmd+'null,';


    cmd:=cmd+' True '
            +' ) ';

    Exec_SQL(cmd);



    cmd:=' select * from pacientes '
        +' where nome = ' +QuotedStr(Trim(ED_Paciente.Text));
    QRefresh(Modulo1.Q_Pacientes_Agendamento,cmd);

    Codigo_Paciente := Modulo1.Q_Pacientes_Agendamento.FieldByName('codigo').AsString;
    ED_Paciente.Text := Trim(ED_Paciente.Text);
end;

procedure TFR_Agendamento.DBLC_Tipo_AgendaClick(Sender: TObject);
begin
    filtrar_horario;
end;

procedure TFR_Agendamento.DBLC_Tipo_AgendaCloseUp(Sender: TObject);
begin
    filtrar_horario;
end;

procedure TFR_Agendamento.DTP_DataChange(Sender: TObject);
begin
    filtrar_horario;
end;

procedure TFR_Agendamento.DTP_DataClick(Sender: TObject);
begin
    filtrar_horario;
end;

procedure TFR_Agendamento.DTP_DataCloseUp(Sender: TObject);
begin
    if DBLC_Tipo_Agenda.KeyValue > 0 then
    begin
        cmd:=' select codigo from tipo_agenda_dias '
            +' where key_tipo_agenda =' +IntToStr(DBLC_Tipo_Agenda.KeyValue)
            +' and ativo = True '
            +' and descricao  = '
            +' (Case '
            +'      When date_part(' +QuotedStr('dow')+ ', cast(' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Data.Date))+ ' as date) ) = 6 then ' +QuotedStr('Sábado')
            +'      When date_part(' +QuotedStr('dow')+ ', cast(' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Data.Date))+ ' as date) ) = 5 then ' +QuotedStr('Sexta')
            +'      When date_part(' +QuotedStr('dow')+ ', cast(' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Data.Date))+ ' as date) ) = 4 then ' +QuotedStr('Quinta')
            +'      When date_part(' +QuotedStr('dow')+ ', cast(' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Data.Date))+ ' as date) ) = 3 then ' +QuotedStr('Quarta')
            +'      When date_part(' +QuotedStr('dow')+ ', cast(' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Data.Date))+ ' as date) ) = 2 then ' +QuotedStr('Terça')
            +'      When date_part(' +QuotedStr('dow')+ ', cast(' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Data.Date))+ ' as date) ) = 1 then ' +QuotedStr('Segunda')
            +' End) ';
        QRefresh(Modulo1.Q_Geral3,cmd);


        if Modulo1.Q_Geral3.IsEmpty then
          ShowMessage('Data Indisponível!')
        else
          filtrar_horario;
    end;
end;

procedure TFR_Agendamento.DBGrid1DblClick(Sender: TObject);
begin
    Codigo_Paciente := '';
    Codigo_Paciente  := Modulo1.Q_Pacientes_Agendamento.FieldByName('codigo').AsString;

    ED_Paciente.Text := Modulo1.Q_Pacientes_Agendamento.FieldByName('nome').AsString;
    MSK_Tel1.Text    := Modulo1.Q_Pacientes_Agendamento.FieldByName('telefone1').AsString;
    MSK_Celular.Text := Modulo1.Q_Pacientes_Agendamento.FieldByName('celular').AsString;
end;

procedure TFR_Agendamento.BB_AdicionarClick(Sender: TObject);
begin
    if ED_Paciente.Text <> '' then
    begin
        if ( (MSK_Tel1.Text <> '(  )     -    ') or (MSK_Celular.Text <> '(  )      -    ') ) then
        begin
            cmd:=' select * from pacientes '
                +' where nome = ' +QuotedStr(Trim(ED_Paciente.Text));

            if MSK_Tel1.Text <> '(  )     -    ' then
              cmd:=cmd+' and telefone1 = ' +QuotedStr(MSK_Tel1.Text);

            if MSK_Celular.Text <> '(  )      -    ' then
              cmd:=cmd+' and celular = ' +QuotedStr(MSK_Celular.Text);

            QRefresh(Modulo1.Q_Geral3,cmd);


            if Modulo1.Q_Geral3.IsEmpty then
              cadastrar_paciente
            else
            begin
                ShowMessage('Paciente já cadastrado!');



                cmd:=' select * from pacientes '
                    +' where nome like ' +QuotedStr(Trim(ED_Paciente.Text +'%'));

                if MSK_Tel1.Text <> '(  )     -    ' then
                  cmd:=cmd+' and telefone1 = ' +QuotedStr(MSK_Tel1.Text);

                if MSK_Celular.Text <> '(  )      -    ' then
                  cmd:=cmd+' and celular = ' +QuotedStr(MSK_Celular.Text);

                QRefresh(Modulo1.Q_Pacientes_Agendamento,cmd);


                ED_Paciente.Text := Trim(ED_Paciente.Text);
                ED_Paciente.SetFocus;
            end;
        end
        else
            ShowMessage('Necessário preencher pelo menos 1 contato!');
    end
    else
        ShowMessage('Necessário preencher o nome do paciente!');
end;

end.
