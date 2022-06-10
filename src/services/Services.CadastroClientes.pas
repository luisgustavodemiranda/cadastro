unit Services.CadastroClientes;

interface

uses
  System.SysUtils, System.Classes, Services.Base.Cadastro, Data.DB, Datasnap.DBClient, Services.BuscaCep,
  Providers.Mascara, Providers.Mail;

type
  TDMCadastroClientes = class(TDMCadastroBase)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    Mascara: TMascara;
  public
    { Public declarations }
    function ConsultaCep(const AValue: String): Boolean;
    function GetBody(const Mail: IMail): string;
    procedure FormatarDocumento(const AValue: String);
    procedure FormatarTelefone(const AValue: String);

  end;

implementation

{$R *.dfm}

function TDMCadastroClientes.ConsultaCep(const AValue: String): Boolean;
var
  BuscaCep: TDMBuscaCep;
begin
  Result := True;
  BuscaCep := TDMBuscaCep.Create(Self);

  try
    if BuscaCep.ValidaCep(AValue) then begin
      BuscaCep.Get(AVAlue);

      cdsCadastro.FieldByName('Cep').AsString := BuscaCep.CEP;
      cdsCadastro.FieldByName('Logradouro').AsString := BuscaCep.Logradouro;
      cdsCadastro.FieldByName('Complemento').AsString := BuscaCep.Complemento;
      cdsCadastro.FieldByName('Bairro').AsString := BuscaCep.Bairro;
      cdsCadastro.FieldByName('Cidade').AsString := BuscaCep.Localidade;
      cdsCadastro.FieldByName('Estado').AsString := BuscaCep.UF;
      cdsCadastro.FieldByName('Pais').AsString := 'Brasil';
    end else begin
      Result := False;
    end;
  finally
    BuscaCep.Free;
  end;
end;

procedure TDMCadastroClientes.DataModuleCreate(Sender: TObject);
begin
  inherited;
  cdsCadastro.Close;
  cdsCadastro.FieldDefs.Clear;
  cdsCadastro.FieldDefs.Add('Nome', ftString, 60);
  cdsCadastro.FieldDefs.Add('Identidade', ftString, 15);
  cdsCadastro.FieldDefs.Add('CPF', ftString, 14);
  cdsCadastro.FieldDefs.Add('Telefone', ftString, 20);
  cdsCadastro.FieldDefs.Add('Email', ftString, 100);
  cdsCadastro.FieldDefs.Add('Cep', ftString, 20);
  cdsCadastro.FieldDefs.Add('Logradouro', ftString, 60);
  cdsCadastro.FieldDefs.Add('Numero', ftInteger);
  cdsCadastro.FieldDefs.Add('Complemento', ftString, 50);
  cdsCadastro.FieldDefs.Add('Bairro', ftString, 50);
  cdsCadastro.FieldDefs.Add('Cidade', ftString, 60);
  cdsCadastro.FieldDefs.Add('Estado', ftString, 2);
  cdsCadastro.FieldDefs.Add('Pais', ftString, 50);
  cdsCadastro.CreateDataSet;

  cdsCadastro.Open;

  Mascara := TMascara.Create;
end;

procedure TDMCadastroClientes.DataModuleDestroy(Sender: TObject);
begin
  inherited;
  cdsCadastro.Close;
  Mascara.Free;
end;

procedure TDMCadastroClientes.FormatarDocumento(const AValue: String);
begin
  if cdsCadastro.State in [dsInsert, dsEdit] then
    cdsCadastro.FieldByName('CPF').AsString := Mascara.FormatarCPF(AValue);
end;

procedure TDMCadastroClientes.FormatarTelefone(const AValue: String);
begin
  if cdsCadastro.State in [dsInsert, dsEdit] then
    cdsCadastro.FieldByName('Telefone').AsString := Mascara.FormatarTelefone(AValue);
end;

function TDMCadastroClientes.GetBody(const Mail: IMail): string;
begin
  Mail
    .AddBody('<html> ')
    .AddBody('<head> ')
    .AddBody('    <!-- HTML 4 --> ')
    .AddBody('    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">')
    .AddBody('    <!-- HTML5 -->')
    .AddBody('    <meta charset="utf-8"/>')
    .AddBody('</head> ')
    .AddBody('<body> ')
    .AddBody('    <h3> Enviando e-mail</h3>')
    .AddBody('    <img src="https://img.icons8.com/cotton/48/000000/paper-plane--v2.png" align="left"/><br><br><br>')
    .AddBody('		<div style="width:650px; text-align:left;"> ')
    .AddBody('	      <font size="4"> Nome: ' + cdsCadastro.FieldByName('Nome').AsString + '</font><br>')
    .AddBody('	      <font size="4"> Identidade: ' + cdsCadastro.FieldByName('Identidade').AsString + '</font><br>')
    .AddBody('		    <font size="4"> CPF: ' + cdsCadastro.FieldByName('CPF').AsString + '</font><br>')
    .AddBody('		    <font size="4"> Telefone: ' + cdsCadastro.FieldByName('Telefone').AsString + '</font><br>')
    .AddBody('		    <font size="4"> E-mail: ' + cdsCadastro.FieldByName('Email').AsString + '</font><br>')
    .AddBody('		    <font size="4"> Cep: ' + cdsCadastro.FieldByName('Cep').AsString + '</font><br>')
    .AddBody('		    <font size="4"> Logradouro: ' + cdsCadastro.FieldByName('Logradouro').AsString + '</font><br>')
    .AddBody('		    <font size="4"> Numero: ' + cdsCadastro.FieldByName('Numero').AsString + '</font><br>')
    .AddBody('		    <font size="4"> Complemento: ' + cdsCadastro.FieldByName('Complemento').AsString + '</font><br>')
    .AddBody('		    <font size="4"> Bairro: ' + cdsCadastro.FieldByName('Bairro').AsString + '</font><br>')
    .AddBody('		    <font size="4"> Cidade: ' + cdsCadastro.FieldByName('Cidade').AsString + '</font><br>')
    .AddBody('		    <font size="4"> Estado: ' + cdsCadastro.FieldByName('Estado').AsString + '</font><br>')
    .AddBody('		    <font size="4"> Pais: ' + cdsCadastro.FieldByName('Pais').AsString + '</font><br>')
    .AddBody('		</div> ')
    .AddBody('</body> ')
    .AddBody('</html>');
end;

end.
