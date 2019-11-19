unit U_Planos_Saude;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Mask, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Buttons, Vcl.ToolWin,
  QExport4, QExport4XLS;

type
  TFR_Planos_Saude = class(TForm)
    ToolBar1: TToolBar;
    BB_Novo: TBitBtn;
    BB_Procura: TBitBtn;
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
    Label10: TLabel;
    Label27: TLabel;
    Label16: TLabel;
    Label25: TLabel;
    Label17: TLabel;
    ED_Nome: TEdit;
    ED_Contato: TEdit;
    ED_email: TEdit;
    MSK_Tel1: TMaskEdit;
    MSK_Tel2: TMaskEdit;
    MSK_Celular: TMaskEdit;
    BB_Salvar: TBitBtn;
    BB_Cancelar: TBitBtn;
    BB_Sair: TBitBtn;
    BB_Exportar: TBitBtn;
    SaveDialog1: TSaveDialog;
    QExport4XLS1: TQExport4XLS;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BB_NovoClick(Sender: TObject);
    procedure BB_ProcuraClick(Sender: TObject);
    procedure BB_SairClick(Sender: TObject);
    procedure BB_SalvarClick(Sender: TObject);
    procedure BB_CancelarClick(Sender: TObject);
    procedure BB_FiltraClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ED_Nome_ConsultaChange(Sender: TObject);
    procedure BB_ExportarClick(Sender: TObject);
    procedure ED_Nome_ConsultaKeyPress(Sender: TObject; var Key: Char);
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
  FR_Planos_Saude: TFR_Planos_Saude;

implementation

{$R *.dfm}

Uses U_Global, U_Modulo1;

procedure TFR_Planos_Saude.FormActivate(Sender: TObject);
begin
    Modulo1.Q_Planos.Close;

    limpa_campos;

    BB_Salvar.Caption := 'Salvar';
end;

procedure TFR_Planos_Saude.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Modulo1.Q_Planos.Close;
end;

procedure TFR_Planos_Saude.BB_NovoClick(Sender: TObject);
begin
    limpa_campos;

    BB_Salvar.Caption := 'Salvar';

    Notebook1.PageIndex := 1;

    ED_Nome.SetFocus;
end;

procedure TFR_Planos_Saude.BB_ProcuraClick(Sender: TObject);
begin
    ED_Nome_Consulta.Clear;

    Notebook1.PageIndex := 0;

    ED_Nome_Consulta.SetFocus;
end;

procedure TFR_Planos_Saude.BB_SairClick(Sender: TObject);
begin
    Close;
end;

procedure TFR_Planos_Saude.BB_SalvarClick(Sender: TObject);
begin
    if ED_Nome.Text <> '' then
    begin
        if BB_Salvar.Caption = 'Salvar' then
        begin
            cmd:=' select * from planos_saude where nome = ' +QuotedStr(ED_Nome.Text);
            QRefresh(Modulo1.Q_Geral2,cmd);

            if Not Modulo1.Q_Geral2.IsEmpty then
            begin
                ShowMessage('Plano de Saúde já cadastrado!');
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

procedure TFR_Planos_Saude.BB_CancelarClick(Sender: TObject);
begin
    BB_Salvar.Caption := 'Salvar';

    ED_Nome_Consulta.Clear;

    Notebook1.PageIndex := 0;

    Application.ProcessMessages;
    pesquisa;
end;

procedure TFR_Planos_Saude.BB_FiltraClick(Sender: TObject);
begin
    pesquisa;
end;

procedure TFR_Planos_Saude.DBGrid1DblClick(Sender: TObject);
begin
    if Not Modulo1.Q_Planos.IsEmpty then
    begin
        limpa_campos;

        carregar_dados;

        BB_Salvar.Caption := 'Alterar';

        Notebook1.PageIndex := 1;
    end
    else
        ShowMessage('Nenhuma informação encontrada!');
end;

procedure TFR_Planos_Saude.ED_Nome_ConsultaChange(Sender: TObject);
begin
    pesquisa;
end;

procedure TFR_Planos_Saude.ED_Nome_ConsultaKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then
      pesquisa;
end;

procedure TFR_Planos_Saude.limpa_campos;
begin
    ED_Nome.Clear;
    ED_Contato.Clear;

    MSK_Tel1.Text := '(  )     -    ';
    MSK_Tel2.Text := '(  )     -    ';
    MSK_Celular.Text := '(  )      -    ';
    ED_Email.Clear;
end;

procedure TFR_Planos_Saude.pesquisa;
begin
    cmd:=' select * from planos_saude '
        +' where true ';

    if ED_Nome_Consulta.Text <> '' then
      cmd:=cmd+' and nome like ' +QuotedStr(ED_Nome_Consulta.Text +'%');

    cmd:=cmd+' order by nome ';

    QRefresh(Modulo1.Q_Planos,cmd);
end;

procedure TFR_Planos_Saude.cadastrar;
begin
    cmd:=' Insert into planos_saude (nome, contato, telefone1, telefone2, celular, email) '
        +' Values ( '

        +QuotedStr(ED_Nome.Text) +','
        +QuotedStr(ED_Contato.Text) +',';


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


    cmd:=cmd+QuotedStr(ED_Email.Text)

        +' ) ';

    Exec_SQL(cmd);


    ShowMessage('Cadastro realizado com sucesso!');

    BB_Salvar.Caption := 'Salvar';

    ED_Nome_Consulta.Clear;

    Notebook1.PageIndex := 0;

    Application.ProcessMessages;
    pesquisa;
end;

procedure TFR_Planos_Saude.alterar;
begin
    cmd:=' Update planos_saude set '
        +' nome = ' +QuotedStr(ED_Nome.Text)
        +' ,contato = ' +QuotedStr(ED_Contato.Text);


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


    cmd:=cmd+' ,email = ' +QuotedStr(ED_Email.Text)

            +' where codigo = ' +QuotedStr(Modulo1.Q_Planos.FieldByName('codigo').AsString);

    Exec_SQL(cmd);


    ShowMessage('Alteração realizada com sucesso!');

    BB_Salvar.Caption := 'Salvar';

    ED_Nome_Consulta.Clear;

    Notebook1.PageIndex := 0;

    Application.ProcessMessages;
    pesquisa;
end;

procedure TFR_Planos_Saude.carregar_dados;
begin
    ED_Nome.Text := Modulo1.Q_Planos.FieldByName('nome').AsString;
    ED_Contato.Text := Modulo1.Q_Planos.FieldByName('contato').AsString;

    MSK_Tel1.Text := Modulo1.Q_Planos.FieldByName('telefone1').AsString;
    MSK_Tel2.Text := Modulo1.Q_Planos.FieldByName('telefone2').AsString;
    MSK_Celular.Text := Modulo1.Q_Planos.FieldByName('celular').AsString;
    ED_Email.Text := Modulo1.Q_Planos.FieldByName('email').AsString;
end;

procedure TFR_Planos_Saude.BB_ExportarClick(Sender: TObject);
begin
    if Not Modulo1.Q_Planos.IsEmpty then
    begin
        SaveDialog1.FileName := 'Planos de Saúde';
        SaveDialog1.Filter := 'Documentos do Excel|*.xls;Todos os Arquivos|*.*';
        SaveDialog1.DefaultExt := 'XLS';
        SaveDialog1.Title := 'Exportação para o Excel';

        if SaveDialog1.execute then
        begin
            Modulo1.Q_Planos.DisableControls;

            CurrentExport := QExport4XLS1;


            CurrentExport.ShowFile := True;
            CurrentExport.PrintFile := False;

            CurrentExport.FileName := SaveDialog1.FileName;
            CurrentExport.DataSet := Modulo1.Q_Planos;
            CurrentExport.Execute();


            Modulo1.Q_Planos.EnableControls;

            ShowMessage('Arquivo Gerado');
        end;
    end
    else
        ShowMessage('Nenhuma informação encontrada!');
end;

end.
