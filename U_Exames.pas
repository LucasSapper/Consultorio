unit U_Exames;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ToolWin, Vcl.ComCtrls,
  Vcl.Mask, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.DBCtrls;

type
  TFR_Tipo_Agenda = class(TForm)
    Notebook1: TNotebook;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    ED_Nome_Consulta: TEdit;
    DBGrid1: TDBGrid;
    BB_Filtra: TBitBtn;
    Label8: TLabel;
    GB_Dados: TGroupBox;
    Label9: TLabel;
    ED_Nome: TEdit;
    BB_Salvar: TBitBtn;
    BB_Cancelar: TBitBtn;
    ToolBar1: TToolBar;
    BB_Novo: TBitBtn;
    BB_Procura: TBitBtn;
    BB_Sair: TBitBtn;
    CB_Ativo: TCheckBox;
    Label3: TLabel;
    GB_Dias: TGroupBox;
    CB_Segunda: TCheckBox;
    CB_Terca: TCheckBox;
    CB_Quarta: TCheckBox;
    CB_Quinta: TCheckBox;
    CB_Sexta: TCheckBox;
    CB_Sabado: TCheckBox;
    GB_Horarios: TGroupBox;
    DBGrid2: TDBGrid;
    Label5: TLabel;
    DBLC_Hora: TDBLookupComboBox;
    SB_Salvar: TSpeedButton;
    BB_Adicionar: TSpeedButton;
    BB_Deletar: TBitBtn;
    SB_Salvar2: TSpeedButton;
    Label4: TLabel;
    DBLC_Dia: TDBLookupComboBox;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BB_NovoClick(Sender: TObject);
    procedure BB_ProcuraClick(Sender: TObject);
    procedure BB_SairClick(Sender: TObject);
    procedure BB_CancelarClick(Sender: TObject);
    procedure BB_FiltraClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ED_Nome_ConsultaChange(Sender: TObject);
    procedure SB_SalvarClick(Sender: TObject);
    procedure BB_AdicionarClick(Sender: TObject);
    procedure BB_DeletarClick(Sender: TObject);
    procedure SB_Salvar2Click(Sender: TObject);
    procedure BB_SalvarClick(Sender: TObject);
    procedure ED_Nome_ConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure DBLC_DiaClick(Sender: TObject);
    procedure DBLC_DiaCloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure pesquisa;

    procedure cadastrar_nome;
    procedure alterar_nome;

    procedure cadastrar;
    procedure alterar;

    procedure carregar_dados;

    procedure limpa_campos;

    procedure filtrar_dias;
    procedure filtrar_horario;

    procedure cadastrar_horario_agenda;
    procedure deletar_horario_agenda;
    procedure filtra_horario_agenda;

  end;

var
  FR_Tipo_Agenda: TFR_Tipo_Agenda;

  codigo_tipo_agenda : integer;

implementation

{$R *.dfm}

Uses U_Global, U_Modulo1;

procedure TFR_Tipo_Agenda.FormActivate(Sender: TObject);
begin
    Modulo1.Q_Tipo_Agenda.Close;
    Modulo1.Q_Horarios.Close;
    Modulo1.Q_Horarios_Agendamento.Close;
    Modulo1.Q_Dias.Close;

    limpa_campos;

    BB_Salvar.Caption := 'Salvar';
end;

procedure TFR_Tipo_Agenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Modulo1.Q_Tipo_Agenda.Close;
    Modulo1.Q_Horarios.Close;
    Modulo1.Q_Horarios_Agendamento.Close;
    Modulo1.Q_Dias.Close;
end;

procedure TFR_Tipo_Agenda.BB_NovoClick(Sender: TObject);
begin
    limpa_campos;

    GB_Dias.Enabled := False;
    GB_Horarios.Enabled := False;

    BB_Salvar.Caption := 'Salvar';

    Modulo1.Q_Horarios_Agendamento.Close;

    Notebook1.PageIndex := 1;

    GB_Dados.Enabled := True;

    ED_Nome.SetFocus;
end;

procedure TFR_Tipo_Agenda.BB_ProcuraClick(Sender: TObject);
begin
    ED_Nome_Consulta.Clear;

    Notebook1.PageIndex := 0;

    ED_Nome_Consulta.SetFocus;
end;

procedure TFR_Tipo_Agenda.BB_SairClick(Sender: TObject);
begin
    Close;
end;

procedure TFR_Tipo_Agenda.BB_FiltraClick(Sender: TObject);
begin
    pesquisa;
end;

procedure TFR_Tipo_Agenda.DBGrid1DblClick(Sender: TObject);
begin
    if Not Modulo1.Q_Tipo_Agenda.IsEmpty then
    begin
        codigo_tipo_agenda := Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsInteger;

        limpa_campos;

        GB_Dados.Enabled := True;
        GB_Dias.Enabled := True;
        GB_Horarios.Enabled := True;

        carregar_dados;

        BB_Salvar.Caption := 'Alterar';

        Notebook1.PageIndex := 1;
    end
    else
        ShowMessage('Nenhuma informação encontrada!');
end;

procedure TFR_Tipo_Agenda.ED_Nome_ConsultaChange(Sender: TObject);
begin
    pesquisa;
end;

procedure TFR_Tipo_Agenda.ED_Nome_ConsultaKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then
      pesquisa;
end;

procedure TFR_Tipo_Agenda.DBLC_DiaClick(Sender: TObject);
begin
    filtrar_horario;
    filtra_horario_agenda;
end;

procedure TFR_Tipo_Agenda.DBLC_DiaCloseUp(Sender: TObject);
begin
    filtrar_dias;
    filtra_horario_agenda;
end;

procedure TFR_Tipo_Agenda.BB_SalvarClick(Sender: TObject);
begin
    if BB_Salvar.Caption = 'Salvar' then
    begin
        ShowMessage('Cadastro realizado com sucesso!');

        BB_Salvar.Caption := 'Salvar';

        limpa_campos;

        GB_Dados.Enabled := True;
        GB_Dias.Enabled := False;
        GB_Horarios.Enabled := False;

        Notebook1.PageIndex := 0;


        Application.ProcessMessages;
        pesquisa;
    end
    else
    begin
        ShowMessage('Alteração realizada com sucesso!');

        BB_Salvar.Caption := 'Salvar';

        limpa_campos;

        GB_Dias.Enabled := False;
        GB_Horarios.Enabled := False;

        Notebook1.PageIndex := 0;


        Application.ProcessMessages;
        pesquisa;
    end;
end;

procedure TFR_Tipo_Agenda.BB_CancelarClick(Sender: TObject);
begin
    BB_Salvar.Caption := 'Salvar';

    limpa_campos;

    GB_Dados.Enabled := True;
    GB_Dias.Enabled := False;
    GB_Horarios.Enabled := False;

    Notebook1.PageIndex := 0;

    Application.ProcessMessages;
    pesquisa;
end;

procedure TFR_Tipo_Agenda.SB_SalvarClick(Sender: TObject);
begin
    if ED_Nome.Text <> '' then
    begin
        if BB_Salvar.Caption = 'Salvar' then
        begin
            cmd:=' select * from tipo_agenda where descricao = ' +QuotedStr(ED_Nome.Text);
            QRefresh(Modulo1.Q_Geral2,cmd);

            if Not Modulo1.Q_Geral2.IsEmpty then
            begin
                ShowMessage('Tipo já cadastrado!');
            end
            else
                cadastrar_nome;
        end
        else
            alterar_nome;
    end
    else
        ShowMessage('Necessário preencher o campo Nome!');
end;

procedure TFR_Tipo_Agenda.SB_Salvar2Click(Sender: TObject);
begin
    if ED_Nome.Text <> '' then
    begin
        if BB_Salvar.Caption = 'Salvar' then
        begin
            cadastrar;
        end
        else
            alterar;
    end
    else
        ShowMessage('Necessário preencher o campo Nome!');
end;

procedure TFR_Tipo_Agenda.BB_AdicionarClick(Sender: TObject);
begin
    if DBLC_Hora.Text <> '' then
    begin
        cmd:=' select * from tipo_agenda_horarios '
            +' where key_tipo_agenda = ' + IntToStr(codigo_tipo_agenda)
            +' and key_tipo_agenda_dias = ' + IntToStr(DBLC_Dia.KeyValue)
            +' and hora = ' +QuotedStr(DBLC_Hora.Text)
            +' and ativo = true '
            +' order by hora ';
        QRefresh(Modulo1.Q_Geral2,cmd);

        if Modulo1.Q_Geral2.IsEmpty then
        begin
            cadastrar_horario_agenda;

            filtra_horario_agenda;
        end
        else
          ShowMessage('Horário já cadastrado!');
    end;
end;

procedure TFR_Tipo_Agenda.BB_DeletarClick(Sender: TObject);
begin
    if Not Modulo1.Q_Horarios_Agendamento.IsEmpty then
    begin
        deletar_horario_agenda;

        filtra_horario_agenda;
    end;
end;

procedure TFR_Tipo_Agenda.limpa_campos;
begin
    ED_Nome.Clear;
    CB_Ativo.Checked := False;

    CB_Segunda.Checked := False;
    CB_Terca.Checked := False;
    CB_Quarta.Checked := False;
    CB_Quinta.Checked := False;
    CB_Sexta.Checked := False;
    CB_Sabado.Checked := False;

    DBLC_Dia.KeyValue := '0';
    DBLC_Hora.KeyValue := '0';
end;

procedure TFR_Tipo_Agenda.pesquisa;
begin
    cmd:=' select ta.*, cast((case when ta.ativo = true then ' +QuotedStr('Sim')+ ' else ' +QuotedStr('Não')+ ' end) as varchar(3)) as ativo_descricao '
        +' from tipo_agenda ta '
        +' where true ';

    if ED_Nome_Consulta.Text <> '' then
      cmd:=cmd+' and ta.descricao like ' +QuotedStr(ED_Nome_Consulta.Text +'%');


    cmd:=cmd+' order by ta.descricao ';

    QRefresh(Modulo1.Q_Tipo_Agenda,cmd);
end;

procedure TFR_Tipo_Agenda.carregar_dados;
begin
    cmd:=' select ta.*, tad.descricao as descricao_dia '
        +' from tipo_agenda ta '
        +' left join tipo_agenda_dias tad on ta.codigo = tad.key_tipo_agenda and tad.ativo = true '
        +' where ta.codigo = ' +IntToStr(codigo_tipo_agenda)
        +' order by ta.descricao ';
    QRefresh(Modulo1.Q_Geral2,cmd);


    Modulo1.Q_Geral2.First;


    ED_Nome.Text := Modulo1.Q_Geral2.FieldByName('descricao').AsString;

    if Modulo1.Q_Geral2.FieldByName('ativo').AsBoolean = True then
      CB_Ativo.Checked := True
    else
      CB_Ativo.Checked := False;


    while not Modulo1.Q_Geral2.Eof do
    begin
        if Modulo1.Q_Geral2.FieldByName('descricao_dia').AsString = 'Segunda' then
          CB_Segunda.Checked := True;


        if Modulo1.Q_Geral2.FieldByName('descricao_dia').AsString = 'Terça' then
          CB_Terca.Checked := True;


        if Modulo1.Q_Geral2.FieldByName('descricao_dia').AsString = 'Quarta' then
          CB_Quarta.Checked := True;


        if Modulo1.Q_Geral2.FieldByName('descricao_dia').AsString = 'Quinta' then
          CB_Quinta.Checked := True;


        if Modulo1.Q_Geral2.FieldByName('descricao_dia').AsString = 'Sexta' then
          CB_Sexta.Checked := True;


        if Modulo1.Q_Geral2.FieldByName('descricao_dia').AsString = 'Sábado' then
          CB_Sabado.Checked := True;



        Modulo1.Q_Geral2.Next;
    end;


    filtrar_dias;
    filtrar_horario;
    filtra_horario_agenda;
end;

procedure TFR_Tipo_Agenda.cadastrar_nome;
begin
    cmd:='select nextval('+quotedstr('tipo_agenda_codigo_seq')+') as numero ';
    QRefresh(Modulo1.Q_Geral,cmd);

    codigo_tipo_agenda := Modulo1.Q_Geral.FieldByName('numero').AsInteger;


    cmd:=' Insert into tipo_agenda (codigo, descricao, ativo) '
        +' Values ( '

        +IntToStr(codigo_tipo_agenda) +','
        +QuotedStr(ED_Nome.Text) +',';


    if CB_Ativo.Checked = True then
      cmd:=cmd+' True '
    else
      cmd:=cmd+' False ';


    cmd:=cmd+' ) ';

    Exec_SQL(cmd);


    ShowMessage('Nome cadastrado com sucesso!');

    GB_Dados.Enabled := False;
    GB_Dias.Enabled := True;
end;

procedure TFR_Tipo_Agenda.cadastrar;
begin
    if CB_Segunda.Checked = True then
    begin
        cmd:=' Insert into tipo_agenda_dias (key_tipo_agenda, descricao) '
            +' Values ( '

            +IntToStr(codigo_tipo_agenda)+','
            +QuotedStr('Segunda')
            +')';
        Exec_SQL(cmd);
    end;


    if CB_Terca.Checked = True then
    begin
        cmd:=' Insert into tipo_agenda_dias (key_tipo_agenda, descricao) '
            +' Values ( '

            +IntToStr(codigo_tipo_agenda)+','
            +QuotedStr('Terça')
            +')';
        Exec_SQL(cmd);
    end;


    if CB_Quarta.Checked = True then
    begin
        cmd:=' Insert into tipo_agenda_dias (key_tipo_agenda, descricao) '
            +' Values ( '

            +IntToStr(codigo_tipo_agenda)+','
            +QuotedStr('Quarta')
            +')';
        Exec_SQL(cmd);
    end;


    if CB_Quinta.Checked = True then
    begin
        cmd:=' Insert into tipo_agenda_dias (key_tipo_agenda, descricao) '
            +' Values ( '

            +IntToStr(codigo_tipo_agenda)+','
            +QuotedStr('Quinta')
            +')';
        Exec_SQL(cmd);
    end;


    if CB_Sexta.Checked = True then
    begin
        cmd:=' Insert into tipo_agenda_dias (key_tipo_agenda, descricao) '
            +' Values ( '

            +IntToStr(codigo_tipo_agenda)+','
            +QuotedStr('Sexta')
            +')';
        Exec_SQL(cmd);
    end;


    if CB_Sabado.Checked = True then
    begin
        cmd:=' Insert into tipo_agenda_dias (key_tipo_agenda, descricao) '
            +' Values ( '

            +IntToStr(codigo_tipo_agenda)+','
            +QuotedStr('Sábado')
            +')';
        Exec_SQL(cmd);
    end;



    ShowMessage('Dias cadastrados com sucesso!');


    GB_Dias.Enabled := False;
    GB_Horarios.Enabled := True;

    filtrar_dias;
    filtrar_horario;
    filtra_horario_agenda;
end;

procedure TFR_Tipo_Agenda.alterar_nome;
begin
    cmd:=' Update tipo_agenda set '
        +' descricao = ' +QuotedStr(ED_Nome.Text);


    if CB_Ativo.Checked = True then
      cmd:=cmd+' ,ativo = True '
    else
      cmd:=cmd+' ,ativo = False ';


    cmd:=cmd+' where codigo = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString);

    Exec_SQL(cmd);


    ShowMessage('Nome alterado com sucesso!');
end;

procedure TFR_Tipo_Agenda.alterar;
Var
  codigo_agenda_dias : integer;
begin
    // Segunda-Feira -----------------------------------------------------------
    codigo_agenda_dias := 0;

    if CB_Segunda.Checked = True then
    begin
        // Verifica se Segunda-Feira esta cadastrado
        cmd:=' Select codigo '
            +' from tipo_agenda_dias '
            +' where descricao = ' +QuotedStr('Segunda')
            +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString);
        QRefresh(Modulo1.Q_Geral2,cmd);

        if Modulo1.Q_Geral2.FieldByName('codigo').AsString = '' then
        begin
            cmd:=' Insert into tipo_agenda_dias (key_tipo_agenda, descricao) '
                +' Values ( '

                +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)+','
                +QuotedStr('Segunda')
                +')';
            Exec_SQL(cmd);
        end
        else
        begin
            cmd:=' Update tipo_agenda_dias set ativo = True '
                +' where codigo = ' +QuotedStr(Modulo1.Q_Geral2.FieldByName('codigo').AsString);
            Exec_SQL(cmd);
        end;
    end
    else
    begin
        // Verificar se Segunda-Feira esta cadastrado
        cmd:=' Select codigo '
            +' from tipo_agenda_dias '
            +' where descricao = ' +QuotedStr('Segunda')
            +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString);
        QRefresh(Modulo1.Q_Geral2,cmd);

        if Modulo1.Q_Geral2.FieldByName('codigo').AsString <> '' then
        begin
            codigo_agenda_dias := Modulo1.Q_Geral2.FieldByName('codigo').AsInteger;


            // Verificar se existe algum horário cadastrado para Segunda-Feira
            cmd:=' Select codigo, key_tipo_agenda_dias '
                +' from tipo_agenda_horarios '
                +' where key_tipo_agenda_dias = ' +QuotedStr(Modulo1.Q_Geral2.FieldByName('codigo').AsString)
                +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString);
            QRefresh(Modulo1.Q_Geral2,cmd);

            if Modulo1.Q_Geral2.FieldByName('codigo').AsString <> '' then
            begin
                // Verificar se existe algum agendamento para o dia/horário
                cmd:=' Select codigo '
                    +' from agendamento '
                    +' where key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)
                    +' and key_pacientes is not null '
                    +' and key_tipo_agenda_horario in ( '

                      +' Select codigo '
                      +' from tipo_agenda_horarios '
                      +' where key_tipo_agenda_dias = ' +InttoStr(codigo_agenda_dias)
                      +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)

                    +' ) ';
                QRefresh(Modulo1.Q_Geral3,cmd);

                if Modulo1.Q_Geral3.FieldByName('codigo').AsString <> '' then
                begin
                    ShowMessage('As marcações de consultas e horários vinculados a Segunda-Feira NÃO serão apagados!');


                    cmd:=' Delete from agendamento '
                        +' where key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)
                        +' and key_pacientes is null '
                        +' and key_tipo_agenda_horario in ( '

                          +' Select codigo '
                          +' from tipo_agenda_horarios '
                          +' where key_tipo_agenda_dias = ' +InttoStr(codigo_agenda_dias)
                          +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)

                        +' ) ';
                    Exec_SQL(cmd);


                    cmd:=' Update tipo_agenda_horarios set ativo = False '
                        +' where key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)
                        +' and key_tipo_agenda_dias = ' +InttoStr(codigo_agenda_dias);
                    Exec_SQL(cmd);


                    cmd:=' Update tipo_agenda_dias set ativo = False where codigo = ' +InttoStr(codigo_agenda_dias);
                    Exec_SQL(cmd);
                end
                else
                begin
                    cmd:=' Delete from agendamento '
                        +' where key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)
                        +' and key_tipo_agenda_horario in ( '

                          +' Select codigo '
                          +' from tipo_agenda_horarios '
                          +' where key_tipo_agenda_dias = ' +InttoStr(codigo_agenda_dias)
                          +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)

                        +' ) ';
                    Exec_SQL(cmd);


                    cmd:=' Delete from tipo_agenda_horarios '
                        +' where key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)
                        +' and key_tipo_agenda_dias = ' +InttoStr(codigo_agenda_dias);
                    Exec_SQL(cmd);


                    cmd:=' Delete from tipo_agenda_dias where codigo = ' +InttoStr(codigo_agenda_dias);
                    Exec_SQL(cmd);
                end;
            end
            else
            begin
                cmd:=' Delete from tipo_agenda_dias where codigo = ' +IntToStr(codigo_agenda_dias);
                Exec_SQL(cmd);
            end;
        end;
    end;
    // Segunda-Feira -----------------------------------------------------------


    // Terça-Feira -------------------------------------------------------------
    codigo_agenda_dias := 0;

    if CB_Terca.Checked = True then
    begin
        // Verifica se Terça-Feira esta cadastrado
        cmd:=' Select codigo '
            +' from tipo_agenda_dias '
            +' where descricao = ' +QuotedStr('Terça')
            +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString);
        QRefresh(Modulo1.Q_Geral2,cmd);

        if Modulo1.Q_Geral2.FieldByName('codigo').AsString = '' then
        begin
            cmd:=' Insert into tipo_agenda_dias (key_tipo_agenda, descricao) '
                +' Values ( '

                +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)+','
                +QuotedStr('Terça')
                +')';
            Exec_SQL(cmd);
        end
        else
        begin
            cmd:=' Update tipo_agenda_dias set ativo = True '
                +' where codigo = ' +QuotedStr(Modulo1.Q_Geral2.FieldByName('codigo').AsString);
            Exec_SQL(cmd);
        end;
    end
    else
    begin
        // Verificar se Terça-Feira esta cadastrado
        cmd:=' Select codigo '
            +' from tipo_agenda_dias '
            +' where descricao = ' +QuotedStr('Terça')
            +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString);
        QRefresh(Modulo1.Q_Geral2,cmd);

        if Modulo1.Q_Geral2.FieldByName('codigo').AsString <> '' then
        begin
            codigo_agenda_dias := Modulo1.Q_Geral2.FieldByName('codigo').AsInteger;


            // Verificar se existe algum horário cadastrado para Terça-Feira
            cmd:=' Select codigo, key_tipo_agenda_dias '
                +' from tipo_agenda_horarios '
                +' where key_tipo_agenda_dias = ' +QuotedStr(Modulo1.Q_Geral2.FieldByName('codigo').AsString)
                +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString);
            QRefresh(Modulo1.Q_Geral2,cmd);

            if Modulo1.Q_Geral2.FieldByName('codigo').AsString <> '' then
            begin
                // Verificar se existe algum agendamento para o dia/horário
                cmd:=' Select codigo '
                    +' from agendamento '
                    +' where key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)
                    +' and key_pacientes is not null '
                    +' and key_tipo_agenda_horario in ( '

                      +' Select codigo '
                      +' from tipo_agenda_horarios '
                      +' where key_tipo_agenda_dias = ' +InttoStr(codigo_agenda_dias)
                      +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)

                    +' ) ';
                QRefresh(Modulo1.Q_Geral3,cmd);

                if Modulo1.Q_Geral3.FieldByName('codigo').AsString <> '' then
                begin
                    ShowMessage('As marcações de consultas e horários vinculados a Terça-Feira NÃO serão apagados!');


                    cmd:=' Delete from agendamento '
                        +' where key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)
                        +' and key_pacientes is null '
                        +' and key_tipo_agenda_horario in ( '

                          +' Select codigo '
                          +' from tipo_agenda_horarios '
                          +' where key_tipo_agenda_dias = ' +InttoStr(codigo_agenda_dias)
                          +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)

                        +' ) ';
                    Exec_SQL(cmd);


                    cmd:=' Update tipo_agenda_horarios set ativo = False '
                        +' where key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)
                        +' and key_tipo_agenda_dias = ' +InttoStr(codigo_agenda_dias);
                    Exec_SQL(cmd);


                    cmd:=' Update tipo_agenda_dias set ativo = False where codigo = ' +InttoStr(codigo_agenda_dias);
                    Exec_SQL(cmd);
                end
                else
                begin
                    cmd:=' Delete from agendamento '
                        +' where key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)
                        +' and key_tipo_agenda_horario in ( '

                          +' Select codigo '
                          +' from tipo_agenda_horarios '
                          +' where key_tipo_agenda_dias = ' +InttoStr(codigo_agenda_dias)
                          +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)

                        +' ) ';
                    Exec_SQL(cmd);


                    cmd:=' Delete from tipo_agenda_horarios '
                        +' where key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)
                        +' and key_tipo_agenda_dias = ' +InttoStr(codigo_agenda_dias);
                    Exec_SQL(cmd);


                    cmd:=' Delete from tipo_agenda_dias where codigo = ' +InttoStr(codigo_agenda_dias);
                    Exec_SQL(cmd);
                end;
            end
            else
            begin
                cmd:=' Delete from tipo_agenda_dias where codigo = ' +IntToStr(codigo_agenda_dias);
                Exec_SQL(cmd);
            end;
        end;
    end;
    // Terça-Feira -------------------------------------------------------------


    // Quarta-Feira ------------------------------------------------------------
    codigo_agenda_dias := 0;

    if CB_Quarta.Checked = True then
    begin
        // Verifica se Quarta-Feira esta cadastrado
        cmd:=' Select codigo '
            +' from tipo_agenda_dias '
            +' where descricao = ' +QuotedStr('Quarta')
            +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString);
        QRefresh(Modulo1.Q_Geral2,cmd);

        if Modulo1.Q_Geral2.FieldByName('codigo').AsString = '' then
        begin
            cmd:=' Insert into tipo_agenda_dias (key_tipo_agenda, descricao) '
                +' Values ( '

                +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)+','
                +QuotedStr('Quarta')
                +')';
            Exec_SQL(cmd);
        end
        else
        begin
            cmd:=' Update tipo_agenda_dias set ativo = True '
                +' where codigo = ' +QuotedStr(Modulo1.Q_Geral2.FieldByName('codigo').AsString);
            Exec_SQL(cmd);
        end;
    end
    else
    begin
        // Verificar se Quarta-Feira esta cadastrado
        cmd:=' Select codigo '
            +' from tipo_agenda_dias '
            +' where descricao = ' +QuotedStr('Quarta')
            +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString);
        QRefresh(Modulo1.Q_Geral2,cmd);

        if Modulo1.Q_Geral2.FieldByName('codigo').AsString <> '' then
        begin
            codigo_agenda_dias := Modulo1.Q_Geral2.FieldByName('codigo').AsInteger;


            // Verificar se existe algum horário cadastrado para Quarta-Feira
            cmd:=' Select codigo, key_tipo_agenda_dias '
                +' from tipo_agenda_horarios '
                +' where key_tipo_agenda_dias = ' +QuotedStr(Modulo1.Q_Geral2.FieldByName('codigo').AsString)
                +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString);
            QRefresh(Modulo1.Q_Geral2,cmd);

            if Modulo1.Q_Geral2.FieldByName('codigo').AsString <> '' then
            begin
                // Verificar se existe algum agendamento para o dia/horário
                cmd:=' Select codigo '
                    +' from agendamento '
                    +' where key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)
                    +' and key_pacientes is not null '
                    +' and key_tipo_agenda_horario in ( '

                      +' Select codigo '
                      +' from tipo_agenda_horarios '
                      +' where key_tipo_agenda_dias = ' +InttoStr(codigo_agenda_dias)
                      +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)

                    +' ) ';
                QRefresh(Modulo1.Q_Geral3,cmd);

                if Modulo1.Q_Geral3.FieldByName('codigo').AsString <> '' then
                begin
                    ShowMessage('As marcações de consultas e horários vinculados a Quarta-Feira NÃO serão apagados!');


                    cmd:=' Delete from agendamento '
                        +' where key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)
                        +' and key_pacientes is null '
                        +' and key_tipo_agenda_horario in ( '

                          +' Select codigo '
                          +' from tipo_agenda_horarios '
                          +' where key_tipo_agenda_dias = ' +InttoStr(codigo_agenda_dias)
                          +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)

                        +' ) ';
                    Exec_SQL(cmd);


                    cmd:=' Update tipo_agenda_horarios set ativo = False '
                        +' where key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)
                        +' and key_tipo_agenda_dias = ' +InttoStr(codigo_agenda_dias);
                    Exec_SQL(cmd);


                    cmd:=' Update tipo_agenda_dias set ativo = False where codigo = ' +InttoStr(codigo_agenda_dias);
                    Exec_SQL(cmd);
                end
                else
                begin
                    cmd:=' Delete from agendamento '
                        +' where key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)
                        +' and key_tipo_agenda_horario in ( '

                          +' Select codigo '
                          +' from tipo_agenda_horarios '
                          +' where key_tipo_agenda_dias = ' +InttoStr(codigo_agenda_dias)
                          +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)

                        +' ) ';
                    Exec_SQL(cmd);


                    cmd:=' Delete from tipo_agenda_horarios '
                        +' where key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)
                        +' and key_tipo_agenda_dias = ' +InttoStr(codigo_agenda_dias);
                    Exec_SQL(cmd);


                    cmd:=' Delete from tipo_agenda_dias where codigo = ' +InttoStr(codigo_agenda_dias);
                    Exec_SQL(cmd);
                end;
            end
            else
            begin
                cmd:=' Delete from tipo_agenda_dias where codigo = ' +IntToStr(codigo_agenda_dias);
                Exec_SQL(cmd);
            end;
        end;
    end;
    // Quarta-Feira ------------------------------------------------------------


    // Quinta-Feira ------------------------------------------------------------
    codigo_agenda_dias := 0;

    if CB_Quinta.Checked = True then
    begin
        // Verifica se Quinta-Feira esta cadastrado
        cmd:=' Select codigo '
            +' from tipo_agenda_dias '
            +' where descricao = ' +QuotedStr('Quinta')
            +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString);
        QRefresh(Modulo1.Q_Geral2,cmd);

        if Modulo1.Q_Geral2.FieldByName('codigo').AsString = '' then
        begin
            cmd:=' Insert into tipo_agenda_dias (key_tipo_agenda, descricao) '
                +' Values ( '

                +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)+','
                +QuotedStr('Quinta')
                +')';
            Exec_SQL(cmd);
        end
        else
        begin
            cmd:=' Update tipo_agenda_dias set ativo = True '
                +' where codigo = ' +QuotedStr(Modulo1.Q_Geral2.FieldByName('codigo').AsString);
            Exec_SQL(cmd);
        end;
    end
    else
    begin
        // Verificar se Quinta-Feira esta cadastrado
        cmd:=' Select codigo '
            +' from tipo_agenda_dias '
            +' where descricao = ' +QuotedStr('Quinta')
            +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString);
        QRefresh(Modulo1.Q_Geral2,cmd);

        if Modulo1.Q_Geral2.FieldByName('codigo').AsString <> '' then
        begin
            codigo_agenda_dias := Modulo1.Q_Geral2.FieldByName('codigo').AsInteger;


            // Verificar se existe algum horário cadastrado para Quinta-Feira
            cmd:=' Select codigo, key_tipo_agenda_dias '
                +' from tipo_agenda_horarios '
                +' where key_tipo_agenda_dias = ' +QuotedStr(Modulo1.Q_Geral2.FieldByName('codigo').AsString)
                +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString);
            QRefresh(Modulo1.Q_Geral2,cmd);

            if Modulo1.Q_Geral2.FieldByName('codigo').AsString <> '' then
            begin
                // Verificar se existe algum agendamento para o dia/horário
                cmd:=' Select codigo '
                    +' from agendamento '
                    +' where key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)
                    +' and key_pacientes is not null '
                    +' and key_tipo_agenda_horario in ( '

                      +' Select codigo '
                      +' from tipo_agenda_horarios '
                      +' where key_tipo_agenda_dias = ' +InttoStr(codigo_agenda_dias)
                      +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)

                    +' ) ';
                QRefresh(Modulo1.Q_Geral3,cmd);

                if Modulo1.Q_Geral3.FieldByName('codigo').AsString <> '' then
                begin
                    ShowMessage('As marcações de consultas e horários vinculados a Quinta-Feira NÃO serão apagados!');


                    cmd:=' Delete from agendamento '
                        +' where key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)
                        +' and key_pacientes is null '
                        +' and key_tipo_agenda_horario in ( '

                          +' Select codigo '
                          +' from tipo_agenda_horarios '
                          +' where key_tipo_agenda_dias = ' +InttoStr(codigo_agenda_dias)
                          +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)

                        +' ) ';
                    Exec_SQL(cmd);


                    cmd:=' Update tipo_agenda_horarios set ativo = False '
                        +' where key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)
                        +' and key_tipo_agenda_dias = ' +InttoStr(codigo_agenda_dias);
                    Exec_SQL(cmd);


                    cmd:=' Update tipo_agenda_dias set ativo = False where codigo = ' +InttoStr(codigo_agenda_dias);
                    Exec_SQL(cmd);
                end
                else
                begin
                    cmd:=' Delete from agendamento '
                        +' where key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)
                        +' and key_tipo_agenda_horario in ( '

                          +' Select codigo '
                          +' from tipo_agenda_horarios '
                          +' where key_tipo_agenda_dias = ' +InttoStr(codigo_agenda_dias)
                          +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)

                        +' ) ';
                    Exec_SQL(cmd);


                    cmd:=' Delete from tipo_agenda_horarios '
                        +' where key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)
                        +' and key_tipo_agenda_dias = ' +InttoStr(codigo_agenda_dias);
                    Exec_SQL(cmd);


                    cmd:=' Delete from tipo_agenda_dias where codigo = ' +InttoStr(codigo_agenda_dias);
                    Exec_SQL(cmd);
                end;
            end
            else
            begin
                cmd:=' Delete from tipo_agenda_dias where codigo = ' +IntToStr(codigo_agenda_dias);
                Exec_SQL(cmd);
            end;
        end;
    end;
    // Quinta-Feira ------------------------------------------------------------


    // Sexta-Feira -------------------------------------------------------------
    codigo_agenda_dias := 0;

    if CB_Sexta.Checked = True then
    begin
        // Verifica se Sexta-Feira esta cadastrado
        cmd:=' Select codigo '
            +' from tipo_agenda_dias '
            +' where descricao = ' +QuotedStr('Sexta')
            +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString);
        QRefresh(Modulo1.Q_Geral2,cmd);

        if Modulo1.Q_Geral2.FieldByName('codigo').AsString = '' then
        begin
            cmd:=' Insert into tipo_agenda_dias (key_tipo_agenda, descricao) '
                +' Values ( '

                +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)+','
                +QuotedStr('Sexta')
                +')';
            Exec_SQL(cmd);
        end
        else
        begin
            cmd:=' Update tipo_agenda_dias set ativo = True '
                +' where codigo = ' +QuotedStr(Modulo1.Q_Geral2.FieldByName('codigo').AsString);
            Exec_SQL(cmd);
        end;
    end
    else
    begin
        // Verificar se Sexta-Feira esta cadastrado
        cmd:=' Select codigo '
            +' from tipo_agenda_dias '
            +' where descricao = ' +QuotedStr('Sexta')
            +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString);
        QRefresh(Modulo1.Q_Geral2,cmd);

        if Modulo1.Q_Geral2.FieldByName('codigo').AsString <> '' then
        begin
            codigo_agenda_dias := Modulo1.Q_Geral2.FieldByName('codigo').AsInteger;


            // Verificar se existe algum horário cadastrado para Sexta-Feira
            cmd:=' Select codigo, key_tipo_agenda_dias '
                +' from tipo_agenda_horarios '
                +' where key_tipo_agenda_dias = ' +QuotedStr(Modulo1.Q_Geral2.FieldByName('codigo').AsString)
                +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString);
            QRefresh(Modulo1.Q_Geral2,cmd);

            if Modulo1.Q_Geral2.FieldByName('codigo').AsString <> '' then
            begin
                // Verificar se existe algum agendamento para o dia/horário
                cmd:=' Select codigo '
                    +' from agendamento '
                    +' where key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)
                    +' and key_pacientes is not null '
                    +' and key_tipo_agenda_horario in ( '

                      +' Select codigo '
                      +' from tipo_agenda_horarios '
                      +' where key_tipo_agenda_dias = ' +InttoStr(codigo_agenda_dias)
                      +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)

                    +' ) ';
                QRefresh(Modulo1.Q_Geral3,cmd);

                if Modulo1.Q_Geral3.FieldByName('codigo').AsString <> '' then
                begin
                    ShowMessage('As marcações de consultas e horários vinculados a Sexta-Feira NÃO serão apagados!');


                    cmd:=' Delete from agendamento '
                        +' where key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)
                        +' and key_pacientes is null '
                        +' and key_tipo_agenda_horario in ( '

                          +' Select codigo '
                          +' from tipo_agenda_horarios '
                          +' where key_tipo_agenda_dias = ' +InttoStr(codigo_agenda_dias)
                          +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)

                        +' ) ';
                    Exec_SQL(cmd);


                    cmd:=' Update tipo_agenda_horarios set ativo = False '
                        +' where key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)
                        +' and key_tipo_agenda_dias = ' +InttoStr(codigo_agenda_dias);
                    Exec_SQL(cmd);


                    cmd:=' Update tipo_agenda_dias set ativo = False where codigo = ' +InttoStr(codigo_agenda_dias);
                    Exec_SQL(cmd);
                end
                else
                begin
                    cmd:=' Delete from agendamento '
                        +' where key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)
                        +' and key_tipo_agenda_horario in ( '

                          +' Select codigo '
                          +' from tipo_agenda_horarios '
                          +' where key_tipo_agenda_dias = ' +InttoStr(codigo_agenda_dias)
                          +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)

                        +' ) ';
                    Exec_SQL(cmd);


                    cmd:=' Delete from tipo_agenda_horarios '
                        +' where key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)
                        +' and key_tipo_agenda_dias = ' +InttoStr(codigo_agenda_dias);
                    Exec_SQL(cmd);


                    cmd:=' Delete from tipo_agenda_dias where codigo = ' +InttoStr(codigo_agenda_dias);
                    Exec_SQL(cmd);
                end;
            end
            else
            begin
                cmd:=' Delete from tipo_agenda_dias where codigo = ' +IntToStr(codigo_agenda_dias);
                Exec_SQL(cmd);
            end;
        end;
    end;
    // Sexta-Feira -------------------------------------------------------------


    // Sábado ------------------------------------------------------------------
    codigo_agenda_dias := 0;

    if CB_Sabado.Checked = True then
    begin
        // Verifica se Sábado esta cadastrado
        cmd:=' Select codigo '
            +' from tipo_agenda_dias '
            +' where descricao = ' +QuotedStr('Sábado')
            +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString);
        QRefresh(Modulo1.Q_Geral2,cmd);

        if Modulo1.Q_Geral2.FieldByName('codigo').AsString = '' then
        begin
            cmd:=' Insert into tipo_agenda_dias (key_tipo_agenda, descricao) '
                +' Values ( '

                +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)+','
                +QuotedStr('Sábado')
                +')';
            Exec_SQL(cmd);
        end
        else
        begin
            cmd:=' Update tipo_agenda_dias set ativo = True '
                +' where codigo = ' +QuotedStr(Modulo1.Q_Geral2.FieldByName('codigo').AsString);
            Exec_SQL(cmd);
        end;
    end
    else
    begin
        // Verificar se Sábado esta cadastrado
        cmd:=' Select codigo '
            +' from tipo_agenda_dias '
            +' where descricao = ' +QuotedStr('Sábado')
            +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString);
        QRefresh(Modulo1.Q_Geral2,cmd);

        if Modulo1.Q_Geral2.FieldByName('codigo').AsString <> '' then
        begin
            codigo_agenda_dias := Modulo1.Q_Geral2.FieldByName('codigo').AsInteger;


            // Verificar se existe algum horário cadastrado para Sábado
            cmd:=' Select codigo, key_tipo_agenda_dias '
                +' from tipo_agenda_horarios '
                +' where key_tipo_agenda_dias = ' +QuotedStr(Modulo1.Q_Geral2.FieldByName('codigo').AsString)
                +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString);
            QRefresh(Modulo1.Q_Geral2,cmd);

            if Modulo1.Q_Geral2.FieldByName('codigo').AsString <> '' then
            begin
                // Verificar se existe algum agendamento para o dia/horário
                cmd:=' Select codigo '
                    +' from agendamento '
                    +' where key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)
                    +' and key_pacientes is not null '
                    +' and key_tipo_agenda_horario in ( '

                      +' Select codigo '
                      +' from tipo_agenda_horarios '
                      +' where key_tipo_agenda_dias = ' +InttoStr(codigo_agenda_dias)
                      +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)

                    +' ) ';
                QRefresh(Modulo1.Q_Geral3,cmd);

                if Modulo1.Q_Geral3.FieldByName('codigo').AsString <> '' then
                begin
                    ShowMessage('As marcações de consultas e horários vinculados a Sábado NÃO serão apagados!');


                    cmd:=' Delete from agendamento '
                        +' where key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)
                        +' and key_pacientes is null '
                        +' and key_tipo_agenda_horario in ( '

                          +' Select codigo '
                          +' from tipo_agenda_horarios '
                          +' where key_tipo_agenda_dias = ' +InttoStr(codigo_agenda_dias)
                          +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)

                        +' ) ';
                    Exec_SQL(cmd);


                    cmd:=' Update tipo_agenda_horarios set ativo = False '
                        +' where key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)
                        +' and key_tipo_agenda_dias = ' +InttoStr(codigo_agenda_dias);
                    Exec_SQL(cmd);


                    cmd:=' Update tipo_agenda_dias set ativo = False where codigo = ' +InttoStr(codigo_agenda_dias);
                    Exec_SQL(cmd);
                end
                else
                begin
                    cmd:=' Delete from agendamento '
                        +' where key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)
                        +' and key_tipo_agenda_horario in ( '

                          +' Select codigo '
                          +' from tipo_agenda_horarios '
                          +' where key_tipo_agenda_dias = ' +InttoStr(codigo_agenda_dias)
                          +' and key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)

                        +' ) ';
                    Exec_SQL(cmd);


                    cmd:=' Delete from tipo_agenda_horarios '
                        +' where key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Tipo_Agenda.FieldByName('codigo').AsString)
                        +' and key_tipo_agenda_dias = ' +InttoStr(codigo_agenda_dias);
                    Exec_SQL(cmd);


                    cmd:=' Delete from tipo_agenda_dias where codigo = ' +InttoStr(codigo_agenda_dias);
                    Exec_SQL(cmd);
                end;
            end
            else
            begin
                cmd:=' Delete from tipo_agenda_dias where codigo = ' +IntToStr(codigo_agenda_dias);
                Exec_SQL(cmd);
            end;
        end;
    end;
    // Sábado ------------------------------------------------------------------



    ShowMessage('Dias alterados com sucesso!');

    filtrar_dias;
    filtrar_horario;
    filtra_horario_agenda;
end;

procedure TFR_Tipo_Agenda.cadastrar_horario_agenda;
begin
    cmd:=' insert into tipo_agenda_horarios (key_tipo_agenda, key_tipo_agenda_dias, hora) Values ( '
        +IntToStr(codigo_tipo_agenda) +','
        +QuotedStr(DBLC_Dia.KeyValue) +','
        +QuotedStr(DBLC_Hora.Text)
        +' ) ';
    Exec_SQL(cmd);
end;

procedure TFR_Tipo_Agenda.deletar_horario_agenda;
begin
    cmd:=' Select * from tipo_agenda_horarios '
        +' where codigo = ' +QuotedStr(Modulo1.Q_Horarios_Agendamento.FieldByName('codigo').AsString);
    QRefresh(Modulo1.Q_Geral,cmd);


    // Verificar se existe algum agendamento para o dia/horário
    cmd:=' Select codigo '
        +' from agendamento '
        +' where key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Geral.FieldByName('key_tipo_agenda').AsString)
        +' and key_tipo_agenda_horario = ' +QuotedStr(Modulo1.Q_Horarios_Agendamento.FieldByName('codigo').AsString)
        +' and key_pacientes is not null ';
    QRefresh(Modulo1.Q_Geral3,cmd);

    if Modulo1.Q_Geral3.FieldByName('codigo').AsString <> '' then
    begin
        ShowMessage('As marcações de consultas e horários vinculados ao horário deletado NÃO serão apagados!');


        cmd:=' Delete from agendamento '
            +' where key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Geral.FieldByName('key_tipo_agenda').AsString)
            +' and key_pacientes is null '
            +' and key_tipo_agenda_horario = ' +QuotedStr(Modulo1.Q_Horarios_Agendamento.FieldByName('codigo').AsString);
        Exec_SQL(cmd);


        cmd:=' Update tipo_agenda_horarios set ativo = False '
            +' where codigo = ' +QuotedStr(Modulo1.Q_Horarios_Agendamento.FieldByName('codigo').AsString);
        Exec_SQL(cmd);
    end
    else
    begin
        cmd:=' Delete from agendamento '
            +' where key_tipo_agenda = ' +QuotedStr(Modulo1.Q_Geral.FieldByName('key_tipo_agenda').AsString)
            +' and key_tipo_agenda_horario = ' +QuotedStr(Modulo1.Q_Horarios_Agendamento.FieldByName('codigo').AsString);
        Exec_SQL(cmd);


        cmd:=' delete from tipo_agenda_horarios where codigo = ' +QuotedStr(Modulo1.Q_Horarios_Agendamento.FieldByName('codigo').AsString);
        Exec_SQL(cmd);
    end;
end;

procedure TFR_Tipo_Agenda.filtra_horario_agenda;
begin
    cmd:=' select tah.*, tad.descricao '
        +' from tipo_agenda_horarios tah '
        +' inner join tipo_agenda_dias tad on tah.key_tipo_agenda_dias = tad.codigo '
        +' where tah.key_tipo_agenda = ' + IntToStr(codigo_tipo_agenda)
        +' and tah.key_tipo_agenda_dias = ' + IntToStr(DBLC_Dia.KeyValue)
        +' and tah.ativo = true '
        +' order by tad.descricao, tah.hora ';
    QRefresh(Modulo1.Q_Horarios_Agendamento,cmd);
end;

procedure TFR_Tipo_Agenda.filtrar_dias;
begin
    DBLC_Hora.KeyValue := '0';

    cmd:=' select codigo, descricao '
        +' from tipo_agenda_dias '
        +' where key_tipo_agenda = ' +IntToStr(codigo_tipo_agenda)
        +' and ativo = true ';
    QRefresh(Modulo1.Q_Dias,cmd);
end;

procedure TFR_Tipo_Agenda.filtrar_horario;
begin
    cmd:=' select codigo, hora from horarios ';
    QRefresh(Modulo1.Q_Horarios,cmd);
end;

end.
