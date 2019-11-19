unit U_Pacientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus, Vcl.Buttons, Vcl.ToolWin, Vcl.ComCtrls,
  Vcl.DBCtrls, Vcl.Mask, QExport4, QExport4XLS;

type
  TFR_Pacientes = class(TForm)
    Panel1: TPanel;
    ToolBar1: TToolBar;
    BB_Novo: TBitBtn;
    BB_Procura: TBitBtn;
    BB_Sair: TBitBtn;
    Notebook1: TNotebook;
    Label1: TLabel;
    Label2: TLabel;
    ED_Nome_Consulta: TEdit;
    Label3: TLabel;
    ED_CPF_Consulta: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    ED_RG_Consulta: TEdit;
    Label6: TLabel;
    DBGrid1: TDBGrid;
    BB_Filtra: TBitBtn;
    Label7: TLabel;
    Label8: TLabel;
    GB_Dados: TGroupBox;
    Label9: TLabel;
    ED_Nome: TEdit;
    Label10: TLabel;
    ED_CPF: TEdit;
    Label11: TLabel;
    ED_RG: TEdit;
    Label12: TLabel;
    DTP_Nascimento: TDateTimePicker;
    Label13: TLabel;
    CB_Sexo: TComboBox;
    Label14: TLabel;
    CB_Estado_Civil: TComboBox;
    GB_Contato: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    GB_Endereco: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    ED_Endereco: TEdit;
    ED_Bairro: TEdit;
    Label26: TLabel;
    ED_Email: TEdit;
    ED_Numero: TEdit;
    Label23: TLabel;
    Label21: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    BB_Salvar: TBitBtn;
    ED_Complemento: TEdit;
    ED_Estado: TEdit;
    Label27: TLabel;
    ED_Nome_Pai: TEdit;
    Label28: TLabel;
    ED_Nome_Mae: TEdit;
    MSK_Tel1: TMaskEdit;
    MSK_Tel2: TMaskEdit;
    MSK_Celular: TMaskEdit;
    MSK_Outro: TMaskEdit;
    Label15: TLabel;
    ED_Cidade: TEdit;
    BB_Exportar: TBitBtn;
    SaveDialog1: TSaveDialog;
    QExport4XLS1: TQExport4XLS;
    BB_Cancelar: TBitBtn;
    ED_CEP: TMaskEdit;
    Label29: TLabel;
    BB_Historico: TBitBtn;
    PopupMenu1: TPopupMenu;
    HistricoPaciente1: TMenuItem;
    Label30: TLabel;
    procedure BB_NovoClick(Sender: TObject);
    procedure BB_ProcuraClick(Sender: TObject);
    procedure BB_SairClick(Sender: TObject);
    procedure BB_FiltraClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BB_SalvarClick(Sender: TObject);
    procedure ED_Nome_ConsultaChange(Sender: TObject);
    procedure ED_CPF_ConsultaChange(Sender: TObject);
    procedure ED_RG_ConsultaChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BB_ExportarClick(Sender: TObject);
    procedure BB_CancelarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ED_Nome_ConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure ED_CPF_ConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure ED_RG_ConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure BB_HistoricoClick(Sender: TObject);
    procedure HistricoPaciente1Click(Sender: TObject);
  private
    { Private declarations }

    CurrentExport : TQExport4XLS;

  public
    { Public declarations }

    procedure pesquisa;
    procedure cadastrar;
    procedure alterar;
    procedure carregar_dados;

    procedure limpa_campos;

  end;

var
  FR_Pacientes: TFR_Pacientes;

  Codigo_Paciente, Nome_Paciente : string;

implementation

{$R *.dfm}

Uses U_Global, U_Modulo1, U_Pacientes_Historico;

procedure TFR_Pacientes.FormActivate(Sender: TObject);
begin
    Modulo1.Q_Pacientes.Close;

    limpa_campos;

    BB_Salvar.Caption := 'Salvar';
end;

procedure TFR_Pacientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Modulo1.Q_Pacientes.Close;
end;

procedure TFR_Pacientes.BB_NovoClick(Sender: TObject);
begin
    limpa_campos;

    BB_Salvar.Caption := 'Salvar';

    Notebook1.PageIndex := 1;

    ED_Nome.SetFocus;
end;

procedure TFR_Pacientes.BB_ProcuraClick(Sender: TObject);
begin
    ED_Nome_Consulta.Clear;
    ED_CPF_Consulta.Clear;
    ED_RG_Consulta.Clear;

    Notebook1.PageIndex := 0;

    ED_Nome_Consulta.SetFocus;
end;

procedure TFR_Pacientes.BB_SairClick(Sender: TObject);
begin
    Close;
end;

procedure TFR_Pacientes.BB_SalvarClick(Sender: TObject);
begin
    if ED_Nome.Text <> '' then
    begin
        if BB_Salvar.Caption = 'Salvar' then
        begin
            cmd:=' select * from pacientes where cpf = ' +QuotedStr(RemoveCaracteres(ED_CPF.Text));
            QRefresh(Modulo1.Q_Geral2,cmd);

            if Not Modulo1.Q_Geral2.IsEmpty then
            begin
                ShowMessage('CPF já cadastrado! Não é possivel duplicar o cadastro.');
            end
            else
                cadastrar;
        end
        else
            alterar;
    end
    else
        ShowMessage('Necessário preencher o campo Nome!');
end;

procedure TFR_Pacientes.BB_CancelarClick(Sender: TObject);
begin
    Codigo_Paciente := '';
    Nome_Paciente := '';


    BB_Salvar.Caption := 'Salvar';

    ED_Nome_Consulta.Clear;
    ED_CPF_Consulta.Clear;
    ED_RG_Consulta.Clear;

    Notebook1.PageIndex := 0;

    Application.ProcessMessages;
    pesquisa;
end;

procedure TFR_Pacientes.BB_FiltraClick(Sender: TObject);
begin
    pesquisa;
end;

procedure TFR_Pacientes.DBGrid1DblClick(Sender: TObject);
begin
    if Not Modulo1.Q_Pacientes.IsEmpty then
    begin
        limpa_campos;

        carregar_dados;

        BB_Salvar.Caption := 'Alterar';

        Notebook1.PageIndex := 1;
    end
    else
        ShowMessage('Nenhuma informação encontrada!');
end;

procedure TFR_Pacientes.ED_Nome_ConsultaChange(Sender: TObject);
begin
    pesquisa;
end;

procedure TFR_Pacientes.ED_Nome_ConsultaKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then
      pesquisa;
end;

procedure TFR_Pacientes.ED_CPF_ConsultaChange(Sender: TObject);
begin
    pesquisa;
end;

procedure TFR_Pacientes.ED_CPF_ConsultaKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then
      pesquisa;
end;

procedure TFR_Pacientes.ED_RG_ConsultaChange(Sender: TObject);
begin
    pesquisa;
end;

procedure TFR_Pacientes.ED_RG_ConsultaKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then
      pesquisa;
end;

procedure TFR_Pacientes.limpa_campos;
begin
    ED_Nome.Clear;
    CB_Sexo.ItemIndex := -1;
    ED_CPF.Clear;
    ED_RG.Clear;
    DTP_Nascimento.Date := Now;
    CB_Estado_Civil.ItemIndex := -1;
    ED_Nome_Pai.Clear;
    ED_Nome_Mae.Clear;

    MSK_Tel1.Text := '(  )     -    ';
    MSK_Tel2.Text := '(  )     -    ';
    MSK_Celular.Text := '(  )      -    ';
    MSK_Outro.Text := '(  )      -    ';
    ED_Email.Clear;

    ED_Endereco.Clear;
    ED_Numero.Clear;
    ED_Bairro.Clear;
    ED_Complemento.Clear;
    ED_Cidade.Clear;
    ED_Estado.Clear;
    ED_CEP.Text := '  .   -   ';
end;

procedure TFR_Pacientes.pesquisa;
begin
    cmd:=' select * from pacientes '
        +' where true ';

    if ED_Nome_Consulta.Text <> '' then
      cmd:=cmd+' and nome like ' +QuotedStr(ED_Nome_Consulta.Text +'%');

    if ED_CPF_Consulta.Text <> '' then
      cmd:=cmd+' and cpf like ' +QuotedStr(ED_CPF_Consulta.Text +'%');

    if ED_RG_Consulta.Text <> '' then
      cmd:=cmd+' and rg like ' +QuotedStr(ED_RG_Consulta.Text +'%');

    cmd:=cmd+' order by nome ';

    QRefresh(Modulo1.Q_Pacientes,cmd);
end;

procedure TFR_Pacientes.cadastrar;
begin
    cmd:=' Insert into pacientes (nome, sexo, cpf, rg, nascimento, estado_civil, nome_pai, nome_mae, telefone1, telefone2, celular, outro, email, endereco, numero, bairro, complemento, cidade, estado, cep) '
        +' Values ( '

        +QuotedStr(ED_Nome.Text) +','
        +QuotedStr(CB_Sexo.Text) +','
        +QuotedStr(RemoveCaracteres(ED_CPF.Text)) +','
        +QuotedStr(RemoveCaracteres(ED_RG.Text)) +','
        +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Nascimento.Date)) +','
        +QuotedStr(CB_Estado_Civil.Text) +','
        +QuotedStr(ED_Nome_Pai.Text) +','
        +QuotedStr(ED_Nome_Mae.Text) +',';


    if MSK_Tel1.Text <> '(  )     -    ' then
      cmd:=cmd+QuotedStr(MSK_Tel1.Text) +','
    else
      cmd:=cmd+'null,';


    if MSK_Tel2.Text <> '(  )     -    ' then
      cmd:=cmd+QuotedStr(MSK_Tel2.Text) +','
    else
      cmd:=cmd+'null,';


    if MSK_Celular.Text <> '(  )      -    ' then
      cmd:=cmd+QuotedStr(MSK_Celular.Text) +','
    else
      cmd:=cmd+'null,';


    if MSK_Outro.Text <> '(  )      -    ' then
      cmd:=cmd+QuotedStr(MSK_Outro.Text) +','
    else
      cmd:=cmd+'null,';


    cmd:=cmd+QuotedStr(ED_Email.Text) +','
            +QuotedStr(ED_Endereco.Text) +',';


    if ED_Numero.Text <> '' then
        cmd:=cmd+QuotedStr(ED_Numero.Text) +','
    else
        cmd:=cmd+' Null, ';


    cmd:=cmd+QuotedStr(ED_Bairro.Text) +','
            +QuotedStr(ED_Complemento.Text) +','
            +QuotedStr(ED_Cidade.Text) +','
            +QuotedStr(ED_Estado.Text) +','
            +QuotedStr(ED_CEP.Text)

        +' ) ';

    Exec_SQL(cmd);


    ShowMessage('Cadastro realizado com sucesso!');

    BB_Salvar.Caption := 'Salvar';

    ED_Nome_Consulta.Clear;
    ED_CPF_Consulta.Clear;
    ED_RG_Consulta.Clear;

    Notebook1.PageIndex := 0;

    Application.ProcessMessages;
    pesquisa;
end;

procedure TFR_Pacientes.alterar;
begin
    cmd:=' Update pacientes set '
        +' nome = ' +QuotedStr(ED_Nome.Text)
        +' ,sexo = ' +QuotedStr(CB_Sexo.Text)
        +' ,cpf = ' +QuotedStr(RemoveCaracteres(ED_CPF.Text))
        +' ,rg = ' +QuotedStr(RemoveCaracteres(ED_RG.Text))
        +' ,nascimento = ' +QuotedStr(FormatDateTime('yyyy-mm-dd', DTP_Nascimento.Date))
        +' ,estado_civil = ' +QuotedStr(CB_Estado_Civil.Text)
        +' ,nome_pai = ' +QuotedStr(ED_Nome_Pai.Text)
        +' ,nome_mae = ' +QuotedStr(ED_Nome_Mae.Text);

    if MSK_Tel1.Text <> '(  )     -    ' then
      cmd:=cmd+' ,telefone1 = ' +QuotedStr(MSK_Tel1.Text)
    else
      cmd:=cmd+' ,telefone1 = null ';


    if MSK_Tel2.Text <> '(  )     -    ' then
      cmd:=cmd+' ,telefone2 = ' +QuotedStr(MSK_Tel2.Text)
    else
      cmd:=cmd+' ,telefone2 = null ';


    if MSK_Celular.Text <> '(  )      -    ' then
      cmd:=cmd+' ,celular = ' +QuotedStr(MSK_Celular.Text)
    else
      cmd:=cmd+' ,celular = null ';


    if MSK_Outro.Text <> '(  )      -    ' then
      cmd:=cmd+' ,outro = ' +QuotedStr(MSK_Outro.Text)
    else
      cmd:=cmd+' ,outro = null ';


    cmd:=cmd+' ,email = ' +QuotedStr(ED_Email.Text)
            +' ,endereco = ' +QuotedStr(ED_Endereco.Text);


    if ED_Numero.Text <> '' then
      cmd:=cmd+' ,numero = ' +QuotedStr(ED_Numero.Text)
    else
      cmd:=cmd+' ,numero = null ';


    cmd:=cmd+' ,bairro = ' +QuotedStr(ED_Bairro.Text)
            +' ,complemento = ' +QuotedStr(ED_Complemento.Text)
            +' ,cidade = ' +QuotedStr(ED_Cidade.Text)
            +' ,estado = ' +QuotedStr(ED_Estado.Text)
            +' ,cep = ' +QuotedStr(ED_CEP.Text)
            +' ,cadastro_pendente = False '

            +' where codigo = ' +QuotedStr(Modulo1.Q_Pacientes.FieldByName('codigo').AsString);

    Exec_SQL(cmd);


    ShowMessage('Alteração realizada com sucesso!');

    BB_Salvar.Caption := 'Salvar';

    ED_Nome_Consulta.Clear;
    ED_CPF_Consulta.Clear;
    ED_RG_Consulta.Clear;

    Notebook1.PageIndex := 0;

    Application.ProcessMessages;
    pesquisa;
end;

procedure TFR_Pacientes.carregar_dados;
begin
    ED_Nome.Text := Modulo1.Q_Pacientes.FieldByName('nome').AsString;
    CB_Sexo.Text := Modulo1.Q_Pacientes.FieldByName('sexo').AsString;
    ED_CPF.Text := Modulo1.Q_Pacientes.FieldByName('cpf').AsString;
    ED_RG.Text := Modulo1.Q_Pacientes.FieldByName('rg').AsString;
    DTP_Nascimento.Date := Modulo1.Q_Pacientes.FieldByName('nascimento').AsDateTime;
    CB_Estado_Civil.Text := Modulo1.Q_Pacientes.FieldByName('estado_civil').AsString;
    ED_Nome_Pai.Text := Modulo1.Q_Pacientes.FieldByName('nome_pai').AsString;
    ED_Nome_Mae.Text := Modulo1.Q_Pacientes.FieldByName('nome_mae').AsString;

    MSK_Tel1.Text := Modulo1.Q_Pacientes.FieldByName('telefone1').AsString;
    MSK_Tel2.Text := Modulo1.Q_Pacientes.FieldByName('telefone2').AsString;
    MSK_Celular.Text := Modulo1.Q_Pacientes.FieldByName('celular').AsString;
    MSK_Outro.Text := Modulo1.Q_Pacientes.FieldByName('outro').AsString;
    ED_Email.Text := Modulo1.Q_Pacientes.FieldByName('email').AsString;

    ED_Endereco.Text := Modulo1.Q_Pacientes.FieldByName('endereco').AsString;
    ED_Numero.Text := Modulo1.Q_Pacientes.FieldByName('numero').AsString;
    ED_Bairro.Text := Modulo1.Q_Pacientes.FieldByName('bairro').AsString;
    ED_Complemento.Text := Modulo1.Q_Pacientes.FieldByName('complemento').AsString;
    ED_Cidade.Text := Modulo1.Q_Pacientes.FieldByName('cidade').AsString;
    ED_Estado.Text := Modulo1.Q_Pacientes.FieldByName('estado').AsString;
    ED_CEP.Text := Modulo1.Q_Pacientes.FieldByName('cep').AsString;


    Codigo_Paciente := Modulo1.Q_Pacientes.FieldByName('codigo').AsString;
    Nome_Paciente := Modulo1.Q_Pacientes.FieldByName('nome').AsString;
end;

procedure TFR_Pacientes.BB_ExportarClick(Sender: TObject);
begin
    if Not Modulo1.Q_Pacientes.IsEmpty then
    begin
        SaveDialog1.FileName := 'Pacientes';
        SaveDialog1.Filter := 'Documentos do Excel|*.xls;Todos os Arquivos|*.*';
        SaveDialog1.DefaultExt := 'XLS';
        SaveDialog1.Title := 'Exportação para o Excel';

        if SaveDialog1.execute then
        begin
            Modulo1.Q_Pacientes.DisableControls;

            CurrentExport := QExport4XLS1;


            CurrentExport.ShowFile := True;
            CurrentExport.PrintFile := False;

            CurrentExport.FileName := SaveDialog1.FileName;
            CurrentExport.DataSet := Modulo1.Q_Pacientes;
            CurrentExport.Execute();


            Modulo1.Q_Pacientes.EnableControls;
        end;
    end
    else
        ShowMessage('Nenhuma informação encontrada!');
end;

procedure TFR_Pacientes.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    if Modulo1.Q_Pacientes.FieldByName('cadastro_pendente').AsBoolean = True Then
      DBGrid1.Canvas.Brush.Color:=clYellow;

    DBGrid1.DefaultDrawDataCell(Rect, DBGrid1.columns[DataCol].field, State);
end;

procedure TFR_Pacientes.BB_HistoricoClick(Sender: TObject);
begin
    if ED_Nome.Text <> '' then
    begin
        if BB_Salvar.Caption = 'Salvar' then
        begin
            cmd:=' select * from pacientes where cpf = ' +QuotedStr(RemoveCaracteres(ED_CPF.Text));
            QRefresh(Modulo1.Q_Geral2,cmd);

            if Not Modulo1.Q_Geral2.IsEmpty then
            begin
                Codigo_Paciente := Modulo1.Q_Geral2.FieldByName('codigo').AsString;

                Application.CreateForm(TFR_Pacientes_Historico, FR_Pacientes_Historico);
                FR_Pacientes_Historico.ShowModal;
                FR_Pacientes_Historico.Free;
            end
            else
                ShowMessage('Necessário cadastrar o Paciente para depois preencher o histórico!');
        end
        else
        begin
            if Codigo_Paciente <> '' then
            begin
                Application.CreateForm(TFR_Pacientes_Historico, FR_Pacientes_Historico);
                FR_Pacientes_Historico.ShowModal;
                FR_Pacientes_Historico.Free;
            end
            else
            begin
                cmd:=' select * from pacientes where cpf = ' +QuotedStr(RemoveCaracteres(ED_CPF.Text));
                QRefresh(Modulo1.Q_Geral2,cmd);

                if Not Modulo1.Q_Geral2.IsEmpty then
                begin
                    Codigo_Paciente := Modulo1.Q_Geral2.FieldByName('codigo').AsString;

                    Application.CreateForm(TFR_Pacientes_Historico, FR_Pacientes_Historico);
                    FR_Pacientes_Historico.ShowModal;
                    FR_Pacientes_Historico.Free;
                end;
            end;
        end;
    end
    else
        ShowMessage('Necessário cadastrar o Paciente para depois preencher o histórico!');


    Codigo_Paciente := '';
    Nome_Paciente := '';
end;

procedure TFR_Pacientes.HistricoPaciente1Click(Sender: TObject);
begin
    Codigo_Paciente := Modulo1.Q_Pacientes.FieldByName('codigo').AsString;
    Nome_Paciente := Modulo1.Q_Pacientes.FieldByName('nome').AsString;

    if Codigo_Paciente <> '' then
    begin
        Application.CreateForm(TFR_Pacientes_Historico, FR_Pacientes_Historico);
        FR_Pacientes_Historico.ShowModal;
        FR_Pacientes_Historico.Free;
    end
    else
        ShowMessage('Paciente deve estar cadastrado!');

    Codigo_Paciente := '';
    Nome_Paciente := '';
end;

end.
