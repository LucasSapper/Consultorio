unit U_Senha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, jpeg, Vcl.Imaging.pngimage;

type
  TFR_Senha = class(TForm)
    Panel1: TPanel;
    ED_Usuario: TEdit;
    ED_Senha: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    CB_base: TComboBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ED_UsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure ED_SenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Verifica_Acesso;
  public
    { Public declarations }

     OK:boolean;

     Procedure LeServidores;
  end;

var
  FR_Senha: TFR_Senha;

  vcb_base:array[1..20] of string;
  vcb_IP:array[1..20] of string;
  vcb_nomeAmigavel:array[1..20] of string;
  vcb_tipoAmb : array[1..20] of string;

  prCaminho : string;

implementation

uses U_Principal, U_Global, U_Modulo1;

{$R *.DFM}

Procedure TFR_Senha.LeServidores;
var arq:TextFile;
   i:integer;
begin
   AssignFile(arq,'sistema.cfg');
   Reset(arq);
   readln(arq,vcb_base[1]);
   readln(arq,prCaminho);

   i:=1;

   while not eof(arq) do
   begin
      readln(arq,vcb_base[i]);
      readln(arq,vcb_IP[i]);
      Readln(arq,vcb_tipoAmb[i]);
      readln(arq,vcb_nomeAmigavel[i]);

      vcb_base[i]:=trim(vcb_base[i]);
      vcb_IP[i]:=trim(vcb_IP[i]);
      vcb_tipoAmb[i]:=trim(vcb_tipoAmb[i]);

      CB_base.Items.Add(vcb_nomeAmigavel[i]);
      inc(i);
   end;

   CloseFile(arq);

   CB_base.ItemIndex:=0;
end;

procedure TFR_Senha.BitBtn2Click(Sender: TObject);
begin
    if Application.MessageBox('Deseja finalizar o sistema?', PChar(Application.Title), 36 + 256) = IDYES then
    begin
        FR_Senha.Close;
    end;
end;

procedure TFR_Senha.Verifica_Acesso;
Begin
     //conectando no banco de dados
     with Modulo1.ZConnection do
     begin
         Disconnect;
         HostName:= vcb_IP[CB_base.itemIndex+1];
         Database:= vcb_Base[CB_base.itemIndex+1];
         Connect;
     end;


     cmd:='select * from usuarios '
         +' where usuario='+quotedstr(ED_Usuario.Text);
     QRefresh(Modulo1.Q_Usuarios,cmd);

     if (Modulo1.Q_Usuarios.FieldByname('senha').AsString = ED_Senha.text) and
        (Ed_Usuario.Text<>'') and
        (Ed_Senha.Text<>'') then
     begin
         glUsuario            := Modulo1.Q_Usuarios.FieldByName('codigo').AsString;
         glAcesso_Adm         := Modulo1.Q_Usuarios.FieldByName('acesso_adm').AsBoolean;
         glAvisoTelaPrincipal := Modulo1.Q_Usuarios.FieldByName('aviso_tela_principal').AsBoolean;

         OK:=true;

         FR_Senha.Hide;
         FR_Principal.showmodal;
     end
     else
     begin
          Showmessage('Acesso negado. Por favor verifique se usuário e senha estão corretos.');

          Ed_Senha.Clear;
          Ed_Usuario.SetFocus;
     end;
End;

procedure TFR_Senha.BitBtn1Click(Sender: TObject);
begin
     Verifica_Acesso;
end;

procedure TFR_Senha.ED_UsuarioKeyPress(Sender: TObject; var Key: Char);
begin
    if Key =#13 then
    begin
        Key := #0;
        SelectNext(Sender as tWinControl, True, True);
    end;
end;

procedure TFR_Senha.ED_SenhaKeyPress(Sender: TObject; var Key: Char);
begin
    if Key =#13 then
      Verifica_Acesso;
end;

procedure TFR_Senha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Modulo1.ZConnection.Disconnect;
     Action := CaNone;
     Application.Terminate;
end;

procedure TFR_Senha.FormActivate(Sender: TObject);
begin
     Application.ProcessMessages;

     LeServidores;
end;

procedure TFR_Senha.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#13 then
     begin
        Perform(WM_NEXTDLGCTL,0,0);
     end;
end;

end.
