unit Providers.Mascara;

interface

uses
  System.SysUtils, System.MaskUtils;

type
  TMascara = class
  public
    function FormatarCPF(const ATexto: string): string;
    function FormatarTelefone(Telefone : String):String;
    function GetMascara: string;
  end;

implementation


function TMascara.FormatarCPF(const ATexto: string): string;
begin
  Result := ATexto;
  if (ATexto.Trim.Length = 11) then
  begin
    Result :=
      ATexto[1] + ATexto[2] + ATexto[3] + '.' +
      ATexto[4] + ATexto[5] + ATexto[6] + '.' +
      ATexto[7] + ATexto[8] + ATexto[9] + '-' +
      ATexto[10] + ATexto[11];
  end;
end;

function TMascara.FormatarTelefone(Telefone: String): String;
var sTelefone : String;
    bZero : Boolean;
    iDigitos, Index : Integer;
begin
    for Index := 0 to Length(Telefone) - 1 do
    begin
        if (Telefone.Chars[Index] In ['0'..'9']) then
          sTelefone := sTelefone + Telefone.Chars[Index];
    end;

   if sTelefone.IsEmpty then begin
    Result := EmptyStr;
   end else  begin
     if sTelefone[1] = '0' then
     begin
       bZero:= True;
       sTelefone := Trim( copy(sTelefone,2,Length(sTelefone)) );
     end
     else
       bZero := False;
     iDigitos := Length(sTelefone);

     case iDigitos of
       8 : Result := FormatMaskText('9999-9999;0;_',sTelefone);
       9 : Result := FormatMaskText('9 9999-9999;0;_',sTelefone);
      10 : Result := FormatMaskText('(99) 9999-9999;0;_',sTelefone);
      11 : Result := FormatMaskText('(99) 9 9999-9999;0;_',sTelefone);
      12 : Result := FormatMaskText('99(99)9999-9999;0;_',sTelefone);
      13 : Result := FormatMaskText('99(99)9 9999-9999;0;_',sTelefone);
     else
       Result := Telefone;
     end;
     if bZero then
       Result := '0' + Result;
   end;
end;

function TMascara.GetMascara: string;
begin
  Result := '999.999.999-99';
end;

end.
