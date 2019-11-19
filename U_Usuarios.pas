unit U_Usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Mask, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Buttons, Vcl.ToolWin;

type
  TFR_Usuario = class(TForm)
    ToolBar1: TToolBar;
    BB_Novo: TBitBtn;
    BB_Procura: TBitBtn;
    Notebook1: TNotebook;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    ED_Nome_Consulta: TEdit;
    ED_Usuario_Consulta: TEdit;
    DBGrid1: TDBGrid;
    BB_Filtra: TBitBtn;
    Label8: TLabel;
    GB_Dados: TGroupBox;
    Label9: TLabel;
    Label27: TLabel;
    ED_Nome: TEdit;
    ED_email: TEdit;
    BB_Salvar: TBitBtn;
    BB_Cancelar: TBitBtn;
    Label16: TLabel;
    MSK_Tel1: TMaskEdit;
    Label25: TLabel;
    MSK_Tel2: TMaskEdit;
    Label17: TLabel;
    MSK_Celular: TMaskEdit;
    GB_Login: TGroupBox;
    Label28: TLabel;
    ED_Usuario: TEdit;
    Label14: TLabel;
    BB_Sair: TBitBtn;
    ED_Senha: TEdit;
    CB_Administrador: TCheckBox;
    CB_Mensagem_Tela_Principal: TCheckBox;
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
    procedure ED_Usuario_ConsultaChange(Sender: TObject);
    procedure ED_RG_ConsultaChange(Sender: TObject);
    procedure ED_Nome_ConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure ED_Usuario_ConsultaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure pesquisa;
    procedure cadastrar;
    procedure alterar;
    procedure carregar_dados;

    procedure limpa_campos;

  end;

var
  FR_Usuario: TFR_Usuario;

implementation

{$R *.dfm}

Uses U_Global, U_Modulo1;

procedure TFR_Usuario.FormActivate(Sender: TObject);
begin
    Modulo1.Q_Usuarios.Close;

    limpa_campos;

    BB_Salvar.Caption := 'Salvar';
end;

procedure TFR_Usuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Modulo1.Q_Usuarios.Close;
end;

procedure TFR_Usuario.BB_NovoClick(Sender: TObject);
begin
    limpa_campos;

    BB_Salvar.Caption := 'Salvar';

    Notebook1.PageIndex := 1;

    ED_Nome.SetFocus;
end;

procedure TFR_Usuario.BB_ProcuraClick(Sender: TObject);
begin
    ED_Nome_Consulta.Clear;
    ED_Usuario_Consulta.Clear;

    Notebook1.PageIndex := 0;

    ED_Usuario_Consulta.SetFocus;
end;

procedure TFR_Usuario.BB_SairClick(Sender: TObject);
begin
    Close;
end;

procedure TFR_Usuario.BB_SalvarClick(Sender: TObject);
begin
    if ED_Usuario.Text <> '' then
    begin
        if BB_Salvar.Caption = 'Salvar' then
        begin
            cmd:=' select * from usuarios where nome = ' +QuotedStr(ED_Nome.Text);
            QRefresh(Modulo1.Q_Geral2,cmd);

            if Not Modulo1.Q_Geral2.IsEmpty then
            begin
                ShowMessage('Usuário já cadastrado!');
            end
            else
                cadastrar;
        end
        else
            alterar;
    end
    else
        ShowMessage('Necessário preencher o campo Usuário!');
end;

procedure TFR_Usuario.BB_CancelarClick(Sender: TObject);
begin
    BB_Salvar.Caption := 'Salvar';

    ED_Nome_Consulta.Clear;
    ED_Usuario_Consulta.Clear;

    Notebook1.PageIndex := 0;

    Application.ProcessMessages;
    pesquisa;
end;

procedure TFR_Usuario.BB_FiltraClick(Sender: TObject);
begin
    pesquisa;
end;

procedure TFR_Usuario.DBGrid1DblClick(Sender: TObject);
begin
    if Not Modulo1.Q_Usuarios.IsEmpty then
    begin
        limpa_campos;

        carregar_dados;

        BB_Salvar.Caption := 'Alterar';

        Notebook1.PageIndex := 1;
    end
    else
        ShowMessage('Nenhuma informação encontrada!');
end;

procedure TFR_Usuario.ED_Nome_ConsultaChange(Sender: TObject);
begin
    pesquisa;
end;

procedure TFR_Usuario.ED_Nome_ConsultaKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then
      pesquisa;
end;

procedure TFR_Usuario.ED_RG_ConsultaChange(Sender: TObject);
begin
    pesquisa;
end;

procedure TFR_Usuario.ED_Usuario_ConsultaChange(Sender: TObject);
begin
    pesquisa;
end;

procedure TFR_Usuario.ED_Usuario_ConsultaKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then
      pesquisa;
end;

procedure TFR_Usuario.limpa_campos;
begin
    ED_Nome.Clear;

    MSK_Tel1.Text := '(  )     -    ';
    MSK_Tel2.Text := '(  )     -    ';
    MSK_Celular.Text := '(  )      -    ';
    ED_Email.Clear;

    ED_Usuario.Clear;
    ED_Senha.Clear;

    CB_Administrador.Checked := False;
    CB_Mensagem_Tela_Principal.Checked := False;
end;

procedure TFR_Usuario.pesquisa;
begin
    cmd:=' select * from usuarios '
        +' where true ';

    if ED_Nome_Consulta.Text <> '' then
      cmd:=cmd+' and nome like ' +QuotedStr(ED_Nome_Consulta.Text +'%');

    if ED_Usuario_Consulta.Text <> '' then
      cmd:=cmd+' and usuario like ' +QuotedStr(ED_Usuario_Consulta.Text +'%');


    cmd:=cmd+' order by nome ';

    QRefresh(Modulo1.Q_Usuarios,cmd);
end;

procedure TFR_Usuario.cadastrar;
begin
    cmd:=' Insert into usuarios (nome, telefone1, telefone2, celular, email, usuario, senha, acesso_adm, aviso_tela_principal) '
        +' Values ( '

        +QuotedStr(ED_Nome.Text) +',';


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


    cmd:=cmd+QuotedStr(ED_Email.Text) +','
            +QuotedStr(ED_Usuario.Text) +','
            +QuotedStr(ED_Senha.Text)+',';


    if CB_Administrador.Checked = True then
      cmd:=cmd+' True,'
    else
      cmd:=cmd+' False,';


    if CB_Mensagem_Tela_Principal.Checked = True then
      cmd:=cmd+' True'
    else
      cmd:=cmd+' False';


    cmd:=cmd+')';
    Exec_SQL(cmd);


    ShowMessage('Cadastro realizado com sucesso!');

    BB_Salvar.Caption := 'Salvar';

    ED_Nome_Consulta.Clear;
    ED_Usuario_Consulta.Clear;

    Notebook1.PageIndex := 0;

    Application.ProcessMessages;
    pesquisa;
end;

procedure TFR_Usuario.alterar;
begin
    cmd:=' Update usuarios set '
        +' nome = ' +QuotedStr(ED_Nome.Text);


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
            +' ,usuario = ' +QuotedStr(ED_Usuario.Text)
            +' ,senha = ' +QuotedStr(ED_Senha.Text);


    if CB_Administrador.Checked = True then
      cmd:=cmd+' ,acesso_adm = True'
    else
      cmd:=cmd+' ,acesso_adm = False';


    if CB_Mensagem_Tela_Principal.Checked = True then
      cmd:=cmd+' ,aviso_tela_principal = True'
    else
      cmd:=cmd+' ,aviso_tela_principal = False';


    cmd:=cmd+' where codigo = ' +QuotedStr(Modulo1.Q_Usuarios.FieldByName('codigo').AsString);
    Exec_SQL(cmd);


    ShowMessage('Alteração realizada com sucesso!');

    BB_Salvar.Caption := 'Salvar';

    ED_Nome_Consulta.Clear;
    ED_Usuario_Consulta.Clear;

    Notebook1.PageIndex := 0;

    Application.ProcessMessages;
    pesquisa;
end;

procedure TFR_Usuario.carregar_dados;
begin
    ED_Nome.Text := Modulo1.Q_Usuarios.FieldByName('nome').AsString;

    MSK_Tel1.Text := Modulo1.Q_Usuarios.FieldByName('telefone1').AsString;
    MSK_Tel2.Text := Modulo1.Q_Usuarios.FieldByName('telefone2').AsString;
    MSK_Celular.Text := Modulo1.Q_Usuarios.FieldByName('celular').AsString;
    ED_Email.Text := Modulo1.Q_Usuarios.FieldByName('email').AsString;

    ED_Usuario.Text := Modulo1.Q_Usuarios.FieldByName('usuario').AsString;
    ED_Senha.Text := Modulo1.Q_Usuarios.FieldByName('senha').AsString;

    if Modulo1.Q_Usuarios.FieldByName('acesso_adm').AsBoolean = True then
      CB_Administrador.Checked := True
    else
      CB_Administrador.Checked := False;

    if Modulo1.Q_Usuarios.FieldByName('aviso_tela_principal').AsBoolean = True then
      CB_Mensagem_Tela_Principal.Checked := True
    else
      CB_Mensagem_Tela_Principal.Checked := False;
end;

end.
