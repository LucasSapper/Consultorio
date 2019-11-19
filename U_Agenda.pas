unit U_Agenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.CheckLst,
  Vcl.Menus, QExport4, QExport4XLS, ResizeKit;

type
  TFR_Agenda = class(TForm)
    Panel1: TPanel;
    Label8: TLabel;
    GB_Periodo: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    DTP_Final: TDateTimePicker;
    DTP_Inicio: TDateTimePicker;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    RG_Periodo: TRadioGroup;
    RG_Horario: TRadioGroup;
    GB_Horario: TGroupBox;
    Label5: TLabel;
    DBLC_Hora: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    BB_Novo: TBitBtn;
    BB_Cancelar: TBitBtn;
    CB_Lista: TCheckListBox;
    Timer1: TTimer;
    Label13: TLabel;
    DBLC_Planos_Saude: TDBLookupComboBox;
    PopupMenu1: TPopupMenu;
    ConsultaFinalizada1: TMenuItem;
    PacienteAguardando1: TMenuItem;
    Label1: TLabel;
    Label29: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    BB_Exportar: TBitBtn;
    SaveDialog1: TSaveDialog;
    QExport4XLS1: TQExport4XLS;
    RetornaraoIncio1: TMenuItem;
    AdicionarObservao1: TMenuItem;
    ED_Pacientes: TEdit;
    ResizeKit1: TResizeKit;
    procedure FormActivate(Sender: TObject);
    procedure BB_NovoClick(Sender: TObject);
    procedure BB_CancelarClick(Sender: TObject);
    procedure DBLC_Planos_SaudeClick(Sender: TObject);
    procedure DBLC_Planos_SaudeCloseUp(Sender: TObject);
    procedure RG_PeriodoClick(Sender: TObject);
    procedure RG_HorarioClick(Sender: TObject);
    procedure DTP_InicioClick(Sender: TObject);
    procedure DTP_FinalClick(Sender: TObject);
    procedure DBLC_HoraClick(Sender: TObject);
    procedure DBLC_HoraCloseUp(Sender: TObject);
    procedure CB_ListaClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ConsultaFinalizada1Click(Sender: TObject);
    procedure PacienteAguardando1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BB_ExportarClick(Sender: TObject);
    procedure DTP_InicioCloseUp(Sender: TObject);
    procedure DTP_FinalCloseUp(Sender: TObject);
    procedure DTP_InicioChange(Sender: TObject);
    procedure DTP_FinalChange(Sender: TObject);
    procedure RetornaraoIncio1Click(Sender: TObject);
    procedure DBLC_Planos_SaudeKeyPress(Sender: TObject; var Key: Char);
    procedure DTP_InicioKeyPress(Sender: TObject; var Key: Char);
    procedure DTP_FinalKeyPress(Sender: TObject; var Key: Char);
    procedure DBLC_HoraKeyPress(Sender: TObject; var Key: Char);
    procedure AdicionarObservao1Click(Sender: TObject);
    procedure ED_PacientesKeyPress(Sender: TObject; var Key: Char);
    procedure ED_PacientesChange(Sender: TObject);
  private
    { Private declarations }

    CurrentExport : TQExport4XLS;

  public
    { Public declarations }

    procedure novo;
    procedure alterar;
    procedure cancelar;

    procedure filtrar;

    procedure filtrar_planos_saude;
    procedure filtrar_horario;

    procedure filtrar_tipo_agenda;
    procedure MultiSelect;

  end;

var
  FR_Agenda: TFR_Agenda;

implementation

{$R *.dfm}

Uses U_Global, U_Modulo1, U_Agendamento, U_Observacao;

procedure TFR_Agenda.FormActivate(Sender: TObject);
begin
    Timer1.Enabled := False;

    DTP_Inicio.Date := Date;
    DTP_Final.Date := Date;

    filtrar_planos_saude;
    filtrar_horario;
    filtrar_tipo_agenda;

    ED_Pacientes.Clear;
    DBLC_Planos_Saude.KeyValue := '0';
    DBLC_Hora.KeyValue := '0';

    filtrar;

    Timer1.Enabled := True;
end;

procedure TFR_Agenda.BB_NovoClick(Sender: TObject);
begin
    Timer1.Enabled := False;

    Novo;

    Timer1.Enabled := True;
end;

procedure TFR_Agenda.BB_CancelarClick(Sender: TObject);
begin
    Timer1.Enabled := False;

    cancelar;

    Timer1.Enabled := True;
end;

procedure TFR_Agenda.DBGrid1DblClick(Sender: TObject);
begin
    Timer1.Enabled := False;

    alterar;

    Timer1.Enabled := True;
end;

procedure TFR_Agenda.ED_PacientesChange(Sender: TObject);
begin
    Timer1.Enabled := False;

    filtrar;

    Timer1.Enabled := True;
end;

procedure TFR_Agenda.ED_PacientesKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then
    begin
        Timer1.Enabled := False;

        filtrar;

        Timer1.Enabled := True;
    end;
end;

procedure TFR_Agenda.DBLC_HoraClick(Sender: TObject);
begin
    Timer1.Enabled := False;

    filtrar;

    Timer1.Enabled := True;
end;

procedure TFR_Agenda.DBLC_HoraCloseUp(Sender: TObject);
begin
    Timer1.Enabled := False;

    filtrar;

    Timer1.Enabled := True;
end;

procedure TFR_Agenda.DBLC_HoraKeyPress(Sender: TObject; var Key: Char);
begin
    Timer1.Enabled := False;

    filtrar;

    Timer1.Enabled := True;
end;

procedure TFR_Agenda.DBLC_Planos_SaudeClick(Sender: TObject);
begin
    Timer1.Enabled := False;

    filtrar;

    Timer1.Enabled := True;
end;

procedure TFR_Agenda.DBLC_Planos_SaudeCloseUp(Sender: TObject);
begin
    Timer1.Enabled := False;

    filtrar;

    Timer1.Enabled := True;
end;

procedure TFR_Agenda.DBLC_Planos_SaudeKeyPress(Sender: TObject; var Key: Char);
begin
    Timer1.Enabled := False;

    filtrar;

    Timer1.Enabled := True;
end;

procedure TFR_Agenda.DTP_FinalChange(Sender: TObject);
begin
    Timer1.Enabled := False;

    filtrar;

    Timer1.Enabled := True;
end;

procedure TFR_Agenda.DTP_FinalClick(Sender: TObject);
begin
    Timer1.Enabled := False;

    filtrar;

    Timer1.Enabled := True;
end;

procedure TFR_Agenda.DTP_FinalCloseUp(Sender: TObject);
begin
    Timer1.Enabled := False;

    filtrar;

    Timer1.Enabled := True;
end;

procedure TFR_Agenda.DTP_FinalKeyPress(Sender: TObject; var Key: Char);
begin
    Timer1.Enabled := False;

    filtrar;

    Timer1.Enabled := True;
end;

procedure TFR_Agenda.DTP_InicioChange(Sender: TObject);
begin
    Timer1.Enabled := False;

    filtrar;

    Timer1.Enabled := True;
end;

procedure TFR_Agenda.DTP_InicioClick(Sender: TObject);
begin
    Timer1.Enabled := False;

    filtrar;

    Timer1.Enabled := True;
end;

procedure TFR_Agenda.DTP_InicioCloseUp(Sender: TObject);
begin
    Timer1.Enabled := False;

    filtrar;

    Timer1.Enabled := True;
end;

procedure TFR_Agenda.DTP_InicioKeyPress(Sender: TObject; var Key: Char);
begin
    Timer1.Enabled := False;

    filtrar;

    Timer1.Enabled := True;
end;

procedure TFR_Agenda.RG_HorarioClick(Sender: TObject);
begin
    Timer1.Enabled := False;

    if RG_Horario.ItemIndex = 0 then
      GB_Horario.Visible := False
    else if RG_Horario.ItemIndex = 1 then
      GB_Horario.Visible := True;


    filtrar;

    Timer1.Enabled := True;
end;

procedure TFR_Agenda.RG_PeriodoClick(Sender: TObject);
begin
    Timer1.Enabled := False;

    if RG_Periodo.ItemIndex = 0 then
      GB_Periodo.Visible := False
    else if RG_Periodo.ItemIndex = 1 then
      GB_Periodo.Visible := True;


    filtrar;

    Timer1.Enabled := True;
end;

procedure TFR_Agenda.BB_ExportarClick(Sender: TObject);
Var
  k : integer;
  tipo, tipo_agenda : string;
begin
    Timer1.Enabled := False;

    tipo := '';
    tipo_agenda := '';

    // varre o tipo de agenda
    for k := 0 to CB_Lista.Items.Count -1 do
    begin
        // verifica se existe algum selecionado
        if CB_Lista.Checked[k] = True then
        begin
           tipo := FR_Agenda.CB_Lista.Items[k];

           tipo_agenda := tipo_agenda + QuotedStr(tipo) + ',';
        end;
    end;

    if tipo_agenda <> '' then
    begin
        tipo_agenda := copy(tipo_agenda,1,(length(tipo_agenda)-1));
    end;


    cmd:=' select ta.descricao as agenda, tah.hora as horario, a.data, p.nome as paciente, ps.nome as plano_saude, '
        +' (case when ps.nome is not null then ' +QuotedStr('Conv')+ ' else ' +QuotedStr('Part')+ ' end) as tipo, '
        +' a.medico_solicitante as Médico_Indicador, null as Valor_Exame '
        +' from agendamento a '
        +' left join pacientes p on a.key_pacientes = p.codigo '
        +' left join planos_saude ps on a.key_planos_saude = ps.codigo '
        +' inner join tipo_agenda ta on a.key_tipo_agenda = ta.codigo '
        +' inner join tipo_agenda_horarios tah on a.key_tipo_agenda_horario = tah.codigo '
        +' inner join tipo_agenda_dias tad on tah.key_tipo_agenda_dias = tad.codigo '
        +' where true '
        +' and (Case when a.key_pacientes is null then tah.ativo = true else true End) '
        +' and (Case when a.key_pacientes is null then tad.ativo = true else true End) ';

    if ED_Pacientes.Text <> '' then
      cmd:=cmd+' and p.nome = ' +QuotedStr(ED_Pacientes.Text);

    if DBLC_Planos_Saude.Text <> 'TODOS' then
      cmd:=cmd+' and ps.nome = ' +QuotedStr(DBLC_Planos_Saude.Text);

    if RG_Periodo.ItemIndex = 1 then
    begin
        cmd:=cmd+' and a.data >= ' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Inicio.Date))
                +' and a.data <= ' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Final.Date))
    end;

    if RG_Horario.ItemIndex = 1 then
    begin
        cmd:=cmd+' and tah.hora = ' +QuotedStr(DBLC_Hora.Text);
    end;

    if tipo_agenda <> '' then
    begin
        cmd:=cmd+' and ta.descricao in (' +tipo_agenda+ ')';
    end;


    cmd:=cmd+' and tad.descricao = '
            +' (Case '
            +'      When date_part(' +QuotedStr('dow')+ ', a.data) = 6 then ' +QuotedStr('Sábado')
            +'      When date_part(' +QuotedStr('dow')+ ', a.data) = 5 then ' +QuotedStr('Sexta')
            +'      When date_part(' +QuotedStr('dow')+ ', a.data) = 4 then ' +QuotedStr('Quinta')
            +'      When date_part(' +QuotedStr('dow')+ ', a.data) = 3 then ' +QuotedStr('Quarta')
            +'      When date_part(' +QuotedStr('dow')+ ', a.data) = 2 then ' +QuotedStr('Terça')
            +'      When date_part(' +QuotedStr('dow')+ ', a.data) = 1 then ' +QuotedStr('Segunda')
            +' End) '

            +' order by a.data, tah.hora ';

    QRefresh(Modulo1.Q_Geral2, cmd);


    if Not Modulo1.Q_Geral2.IsEmpty then
    begin
        SaveDialog1.FileName := 'Agenda';
        SaveDialog1.Filter := 'Documentos do Excel|*.xls;Todos os Arquivos|*.*';
        SaveDialog1.DefaultExt := 'XLS';
        SaveDialog1.Title := 'Exportação para o Excel';

        if SaveDialog1.execute then
        begin
            Modulo1.Q_Geral2.DisableControls;

            CurrentExport := QExport4XLS1;


            CurrentExport.ShowFile := True;
            CurrentExport.PrintFile := False;

            CurrentExport.FileName := SaveDialog1.FileName;
            CurrentExport.DataSet := Modulo1.Q_Geral2;
            CurrentExport.Execute();


            Modulo1.Q_Geral2.EnableControls;
        end;
    end
    else
        ShowMessage('Nenhuma informação encontrada!');

    Timer1.Enabled := True;
end;

procedure TFR_Agenda.novo;
begin
    Application.CreateForm(TFR_Agendamento, FR_Agendamento);
    FR_Agendamento.ShowModal;
    FR_Agendamento.Free;

    filtrar;
end;

procedure TFR_Agenda.alterar;
begin
    if Not Modulo1.Q_Agenda.IsEmpty then
    begin
        Tipo := 'A';
        Codigo_Agenda := Modulo1.Q_Agenda.FieldByName('codigo').AsString;

        Application.CreateForm(TFR_Agendamento, FR_Agendamento);
        FR_Agendamento.ShowModal;
        FR_Agendamento.Free;

        Tipo := '';
        Codigo_Agenda := '';

        filtrar;
    end
    else
        ShowMessage('Nenhuma informação encontrada!');
end;

procedure TFR_Agenda.cancelar;
begin
    if Not Modulo1.Q_Agenda.IsEmpty then
    begin
        cmd:=' Update agendamento set '
            +' key_pacientes = null '
            +' , key_planos_saude = null '
            +' , consulta_finalizada = false '
            +' , paciente_aguardando = false '
            +' , medico_solicitante = null '
            +' where codigo = ' +QuotedStr(Modulo1.Q_Agenda.FieldByName('codigo').AsString);
        Exec_SQL(cmd);

        ShowMessage('Horário cancelado!');

        filtrar;
    end
    else
        ShowMessage('Nenhuma informação encontrada!');
end;

procedure TFR_Agenda.CB_ListaClick(Sender: TObject);
Var
  k : integer;
  Result : Boolean;
begin
    Timer1.Enabled := False;

    MultiSelect;


    Result := False;

    // varre o tipo de agenda
    for k := 0 to CB_Lista.Items.Count -1 do
    begin
        // verifica se existe algum selecionado
        if CB_Lista.Checked[k] = True then
        begin
            Result := True
        end;
    end;


    if Result = False then
      CB_Lista.Checked[0] := True;

    filtrar;

    Timer1.Enabled := True;
end;

procedure TFR_Agenda.filtrar;
Var
  k : integer;
  tipo, tipo_agenda : string;
begin
    tipo := '';
    tipo_agenda := '';

    // varre o tipo de agenda
    for k := 0 to CB_Lista.Items.Count -1 do
    begin
        // verifica se existe algum selecionado
        if CB_Lista.Checked[k] = True then
        begin
           tipo := FR_Agenda.CB_Lista.Items[k];

           tipo_agenda := tipo_agenda + QuotedStr(tipo) + ',';
        end;
    end;

    if tipo_agenda <> '' then
    begin
        tipo_agenda := copy(tipo_agenda,1,(length(tipo_agenda)-1));
    end;


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
        +' and (Case when a.key_pacientes is null then tah.ativo = true else true End) '
        +' and (Case when a.key_pacientes is null then tad.ativo = true else true End) ';

    if ED_Pacientes.Text <> '' then
      cmd:=cmd+' and p.nome like ' +QuotedStr(ED_Pacientes.Text + '%');

    if DBLC_Planos_Saude.Text <> 'TODOS' then
      cmd:=cmd+' and ps.nome = ' +QuotedStr(DBLC_Planos_Saude.Text);

    if RG_Periodo.ItemIndex = 1 then
    begin
        cmd:=cmd+' and a.data >= ' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Inicio.Date))
                +' and a.data <= ' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Final.Date))
    end;

    if RG_Horario.ItemIndex = 1 then
    begin
        cmd:=cmd+' and tah.hora = ' +QuotedStr(DBLC_Hora.Text);
    end;

    if tipo_agenda <> '' then
    begin
        cmd:=cmd+' and ta.descricao in (' +tipo_agenda+ ')';
    end;


    cmd:=cmd+' and tad.descricao = '
            +' (Case '
            +'      When date_part(' +QuotedStr('dow')+ ', a.data) = 6 then ' +QuotedStr('Sábado')
            +'      When date_part(' +QuotedStr('dow')+ ', a.data) = 5 then ' +QuotedStr('Sexta')
            +'      When date_part(' +QuotedStr('dow')+ ', a.data) = 4 then ' +QuotedStr('Quinta')
            +'      When date_part(' +QuotedStr('dow')+ ', a.data) = 3 then ' +QuotedStr('Quarta')
            +'      When date_part(' +QuotedStr('dow')+ ', a.data) = 2 then ' +QuotedStr('Terça')
            +'      When date_part(' +QuotedStr('dow')+ ', a.data) = 1 then ' +QuotedStr('Segunda')
            +' End) '

            +' order by a.data, tah.hora ';

    QRefresh(Modulo1.Q_Agenda,cmd);
end;

procedure TFR_Agenda.filtrar_planos_saude;
begin
    cmd:=' select 0 as codigo, cast(' +QuotedStr('TODOS')+ ' as varchar(300)) as nome '

        +' UNION ALL '

        +' select codigo, cast(nome as varchar(300)) as nome from planos_saude ';
    QRefresh(Modulo1.Q_Planos,cmd);
end;

procedure TFR_Agenda.filtrar_horario;
begin
    cmd:=' select codigo, hora from horarios ';
    QRefresh(Modulo1.Q_Horarios,cmd);
end;

procedure TFR_Agenda.filtrar_tipo_agenda;
begin
    cmd:=' select codigo, descricao from tipo_agenda where ativo = true '
        +' order by codigo ';
    QRefresh(Modulo1.Q_Tipo_Agenda,cmd);


    CB_Lista.Clear;

    if Not Modulo1.Q_Tipo_Agenda.IsEmpty then
    begin
        Modulo1.Q_Tipo_Agenda.First;
        while not Modulo1.Q_Tipo_Agenda.Eof do
        begin
            CB_Lista.Items.Add(Modulo1.Q_Tipo_Agenda.FieldByName('descricao').AsString);

            Modulo1.Q_Tipo_Agenda.Next;
        end;

        CB_Lista.Checked[0] := True;

        CB_Lista.Columns := 4;
    end;
end;

procedure TFR_Agenda.MultiSelect;
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

procedure TFR_Agenda.Timer1Timer(Sender: TObject);
begin
    filtrar;
end;

procedure TFR_Agenda.ConsultaFinalizada1Click(Sender: TObject);
begin
    Timer1.Enabled := False;

    cmd:=' Update agendamento set '
        +' consulta_finalizada = True '
        +' , paciente_aguardando = False '
        +' where codigo = ' +QuotedStr(Modulo1.Q_Agenda.FieldByName('codigo').AsString);
    Exec_SQL(cmd);

    filtrar;

    Timer1.Enabled := True;
end;

procedure TFR_Agenda.PacienteAguardando1Click(Sender: TObject);
begin
    Timer1.Enabled := False;

    cmd:=' Update agendamento set paciente_aguardando = True '
        +' where codigo = ' +QuotedStr(Modulo1.Q_Agenda.FieldByName('codigo').AsString);
    Exec_SQL(cmd);

    filtrar;

    Timer1.Enabled := True;
end;

procedure TFR_Agenda.RetornaraoIncio1Click(Sender: TObject);
begin
    Timer1.Enabled := False;

    cmd:=' Update agendamento set '
        +' consulta_finalizada = False '
        +' , paciente_aguardando = False '
        +' where codigo = ' +QuotedStr(Modulo1.Q_Agenda.FieldByName('codigo').AsString);
    Exec_SQL(cmd);

    filtrar;

    Timer1.Enabled := True;
end;

procedure TFR_Agenda.AdicionarObservao1Click(Sender: TObject);
begin
    Timer1.Enabled := False;

    if Not Modulo1.Q_Agenda.IsEmpty then
    begin
        Codigo_Agenda_Observacao := Modulo1.Q_Agenda.FieldByName('codigo').AsString;

        Application.CreateForm(TFR_Observacao, FR_Observacao);
        FR_Observacao.ShowModal;
        FR_Observacao.Free;

        Codigo_Agenda_Observacao := '';

        filtrar;
    end
    else
        ShowMessage('Nenhuma informação encontrada!');

    Timer1.Enabled := True;
end;

procedure TFR_Agenda.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    if Modulo1.Q_Agenda.FieldByName('consulta_finalizada').AsBoolean = True Then
      DBGrid1.Canvas.Brush.Color:=clGreen;

    if Modulo1.Q_Agenda.FieldByName('paciente_aguardando').AsBoolean = True Then
      DBGrid1.Canvas.Brush.Color:=clRed;

    DBGrid1.DefaultDrawDataCell(Rect, DBGrid1.columns[DataCol].field, State);
end;

end.
