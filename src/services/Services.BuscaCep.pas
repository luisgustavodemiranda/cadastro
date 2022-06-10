unit Services.BuscaCep;

interface

uses
  System.SysUtils, System.Classes, Services.Base.Cadastro, Data.DB, Datasnap.DBClient, REST.Types,
  REST.Response.Adapter, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, Providers.Mensagem;

type
  TDMBuscaCep = class(TDMCadastroBase)
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    RESTResponseDataSetAdapter: TRESTResponseDataSetAdapter;
  private
    { Private declarations }
    FLogradouro: string;
    FIBGE: string;
    FBairro: string;
    FUF: string;
    FCEP: string;
    FLocalidade: string;
    FUnidade: string;
    FComplemento: string;
    FGIA: string;
    procedure SetBairro(const Value: string);
    procedure SetCEP(const Value: string);
    procedure SetComplemento(const Value: string);
    procedure SetGIA(const Value: string);
    procedure SetIBGE(const Value: string);
    procedure SetLocalidade(const Value: string);
    procedure SetLogradouro(const Value: string);
    procedure SetUF(const Value: string);
    procedure SetUnidade(const Value: string);
  public
    { Public declarations }
    function ValidaCep(const ACep: string): Boolean;
    procedure Get(const ACep: string);
    property CEP: string read FCEP write SetCEP;
    property Logradouro: string read FLogradouro write SetLogradouro;
    property Complemento: string read FComplemento write SetComplemento;
    property Bairro: string read FBairro write SetBairro;
    property Localidade: string read FLocalidade write SetLocalidade;
    property UF: string read FUF write SetUF;
    property Unidade: string read FUnidade write SetUnidade;
    property IBGE: string read FIBGE write SetIBGE;
    property GIA: string read FGIA write SetGIA;
  end;

implementation

{$R *.dfm}

{ TDMCadastroBase1 }

procedure TDMBuscaCep.Get(const ACep: string);
begin
  RESTRequest.Resource := ACep.Trim + '/json';
  RESTRequest.Execute;

  if (RESTRequest.Response.StatusCode = 200) then begin

    if RESTRequest.Response.Content.IndexOf('erro') > 0 then begin
      mostraMensagem(tpErro, 'CEP não encontrado');
    end else begin
      CEP := cdsCadastro.FieldByName('cep').AsString;
      Logradouro := cdsCadastro.FieldByName('logradouro').AsString;
      Complemento := cdsCadastro.FieldByName('complemento').AsString;
      Bairro := cdsCadastro.FieldByName('bairro').AsString;
      Localidade := cdsCadastro.FieldByName('localidade').AsString;
      UF := cdsCadastro.FieldByName('uf').AsString;
    end;
  end;
end;

procedure TDMBuscaCep.SetBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TDMBuscaCep.SetCEP(const Value: string);
begin
  FCEP := Value;
end;

procedure TDMBuscaCep.SetComplemento(const Value: string);
begin
  FComplemento := Value;
end;

procedure TDMBuscaCep.SetGIA(const Value: string);
begin
  FGIA := Value;
end;

procedure TDMBuscaCep.SetIBGE(const Value: string);
begin
  FIBGE := Value;
end;

procedure TDMBuscaCep.SetLocalidade(const Value: string);
begin
  FLocalidade := Value;
end;

procedure TDMBuscaCep.SetLogradouro(const Value: string);
begin
  FLogradouro := Value;
end;

procedure TDMBuscaCep.SetUF(const Value: string);
begin
  FUF := Value;
end;

procedure TDMBuscaCep.SetUnidade(const Value: string);
begin
  FUnidade := Value;
end;

function TDMBuscaCep.ValidaCep(const ACep: string): Boolean;
const
  INVALID_CHARACTER = -1;
begin
  Result := True;
  if ACep.Trim.Length <> 8 then
    Exit(False);
  if StrToIntDef(ACep, INVALID_CHARACTER) = INVALID_CHARACTER then
    Exit(False);
end;

end.
