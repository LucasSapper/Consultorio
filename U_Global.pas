unit U_Global;

interface

Uses Windows, Messages, SysUtils, Variants, Classes, Controls, Forms, Dialogs, ZDataset, Registry;


function RemoveCaracteres(s: string):string;
function VirgToPont1(valor : string):string;

procedure AcessaRegistro;

procedure QRefresh(component:TZQuery;Sql1:string);overload;
Procedure Exec_SQL(Sql : String);


Var

  Reg: TRegistry;

  cmd : WideString;

  CaminhoIMP, EnderecoIP : string;

  glUsuario : string;

  glAcesso_Adm, glAvisoTelaPrincipal : boolean;


implementation

Uses U_Modulo1;

function RemoveCaracteres(s: string):string;
var
   i : integer;
   l : string;
begin
     l:='';
     for i:=1 to length(s) do
     begin
          if (s[i]<>'.') and (s[i]<>'-') and (s[i]<>' ') and (s[i]<>',') and (s[i]<>'/') and (s[i]<>'(') and (s[i]<>')') then
             l := l + s[i];
     end;
     result := l;
end;

function VirgToPont1(valor : string):string;
var
   i :integer;
begin
     for i:=1 to Length(valor) do
     begin
          if valor[i]='.' then valor[i]:=',';
          if valor[i]=',' then valor[i]:='.';
     end;
     VirgToPont1:=valor;
end;

Procedure AcessaRegistro;
begin
     Reg := TRegistry.Create;
     Reg.RootKey:=HKEY_LOCAL_MACHINE;

     If Reg.KeyExists('\Software\Software Consultorio') then
     Begin
          Reg.OpenKey('\Software\Software Consultorio',True);
     end
     else
     begin
          if InputQuery('Endereço IP', 'Insira o endereco IP do Banco de Dados', EnderecoIP) then
          begin
              Reg.CreateKey('\Software\Software Consultorio');
              Reg.OpenKey('\Software\Software Consultorio',True);
              Reg.WriteString('VarLPT','LPT1');
              Reg.WriteString('VarIP',EnderecoIP);
          end
          else Application.Terminate;
     end;

     EnderecoIP:=Reg.ReadString('VarIP');
     CaminhoIMP:=Reg.ReadString('VarLPT');
End;

procedure QRefresh(component:TZQuery;Sql1:string);
begin
    with component do
    begin
        Close;
        Sql.Clear;
        Sql.Add(Sql1);
        Open;
    end;
end;

Procedure Exec_SQL(Sql : String);
Begin
     Modulo1.Q_Exec_SQL.Close;
     Modulo1.Q_Exec_Sql.SQL.Clear;
     Modulo1.Q_Exec_Sql.SQL.Add(Sql);
     Modulo1.Q_Exec_Sql.ExecSQL;
End;




end.
