unit Services.Base.Cadastro;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient, System.Generics.Collections, Providers.Mensagem;

type
  TDMCadastroBase = class(TDataModule)
    cdsCadastro: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
    function Alterar(const cdsCadastro: TDataSet): Boolean;
    function Cancelar(const cdsCadastro: TDataSet): Boolean;
    function Gravar(const cdsCadastro: TDataSet): Boolean;
    function Incluir(const cdsCadastro: TDataSet): Boolean;
    procedure Excluir(const cdsCadastro: TDataSet);
    procedure FiltroGrid(const Value: string; const Fields: TList<string>; const DataSet: TDataSet); virtual;
  end;

implementation

{$R *.dfm}

{ TDMCadastroBase }

function TDMCadastroBase.Alterar(const cdsCadastro: TDataSet): Boolean;
begin
  Result := False;
  try
    if not(cdsCadastro.Active) or (cdsCadastro.IsEmpty) then
      Exit
    else begin
      cdsCadastro.Edit;
      Result := True;
    end;
  except
    on E: Exception do begin
      mostraMensagem(tpErro,'Erro ao tentar alterar o registro. O seguinte erro ocorreu: ' + sLineBreak + E.Message);
      Result := False;
    end;
  end;
end;

function TDMCadastroBase.Cancelar(const cdsCadastro: TDataSet): Boolean;
begin
  Result := False;
  try
    if not(cdsCadastro.State in dsEditModes) then
      Exit
    else if mostraMensagem(tpConfirmacao ,'Deseja cancelar a operação?') = retSim then begin
      cdsCadastro.Cancel;
      Result := True;
    end;
  except
    on E: Exception do begin
      mostraMensagem(tpErro, 'Erro ao tentar cancelar a operação. O seguinte erro ocorreu: ' + sLineBreak + E.Message);
      Result := False;
    end;
  end;
end;

procedure TDMCadastroBase.Excluir(const cdsCadastro: TDataSet);
begin
  try
    if not(cdsCadastro.Active) or (cdsCadastro.IsEmpty) then
      Exit
    else if mostraMensagem(tpConfirmacao ,'Deseja excluir o registro selecionado?') = retSim then
      cdsCadastro.Delete;
  except
    on E: Exception do
      mostraMensagem(tpErro, 'Erro ao tentar excluir o registro. O seguinte erro ocorreu: ' + sLineBreak + E.Message);
  end;
end;

procedure TDMCadastroBase.FiltroGrid(const Value: string; const Fields: TList<string>; const DataSet: TDataSet);
var
  I: Integer;
begin
  if not Assigned(DataSet) then
    Exit;
  cdsCadastro.Filtered := False;
  if not cdsCadastro.Active then
    cdsCadastro.Open;

  if (Fields.Count = 0) or (Trim(Value) = '') then
    Exit;
  cdsCadastro.Filter := EmptyStr;
  for I := 0 to Pred(Fields.Count) do
  begin
    if I > 0 then
      cdsCadastro.Filter := cdsCadastro.Filter + ' OR';
      cdsCadastro.Filter := cdsCadastro.Filter + ' (upper(' + Fields.Items[I] + ') like ' + QuotedStr('%' +
                            UpperCase(Value) + '%') + ')';
  end;
  cdsCadastro.Filtered := True;
end;

function TDMCadastroBase.Gravar(const cdsCadastro: TDataSet): Boolean;
begin
  Result := True;
  try
    if cdsCadastro.State in dsEditModes then
      cdsCadastro.Post();
  except
    on E: Exception do begin
      mostraMensagem(tpErro, 'Erro ao salvar o registro. O seguinte erro ocorreu: ' + sLineBreak + E.Message);
      Result := False;
    end;
  end;
end;

function TDMCadastroBase.Incluir(const cdsCadastro: TDataSet): Boolean;
begin
  Result := True;
  try
    if not cdsCadastro.Active then
      cdsCadastro.Open();
    cdsCadastro.Append;
  except
    on E: Exception do begin
      mostraMensagem(tpErro, 'Erro ao tentar incluir registro. O seguinte erro ocorreu: ' + sLineBreak + E.Message);
      Result := False;
    end;
  end;
end;

end.
