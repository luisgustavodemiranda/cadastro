unit Views.CadastroClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Views.Base.Form, Vcl.Menus, Data.DB, System.ImageList, Vcl.DBCtrls,
  Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Providers.Mensagem, Vcl.Mask,
  Services.CadastroClientes, Services.BuscaCep, Vcl.Buttons, Views.EnviarEmail;

type
  TFrmCadastroClientes = class(TFrmCadastroBase)
    Label4: TLabel;
    edtCPF: TDBEdit;
    DBEdit8: TDBEdit;
    Label5: TLabel;
    Label8: TLabel;
    edtNome: TDBEdit;
    Label11: TLabel;
    edtTelefone: TDBEdit;
    EdtEmail: TDBEdit;
    Label12: TLabel;
    Label3: TLabel;
    edtLogradouro: TDBEdit;
    Label1: TLabel;
    edtNumero: TDBEdit;
    Label6: TLabel;
    edtComplemento: TDBEdit;
    Label7: TLabel;
    edtCep: TDBEdit;
    Label2: TLabel;
    edtBairro: TDBEdit;
    Label9: TLabel;
    edtCidade: TDBEdit;
    Label10: TLabel;
    edtEstado: TDBEdit;
    Label13: TLabel;
    edtPais: TDBEdit;
    btnEnviarEmail: TButton;
    btnBuscaCep: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirRegistroClick(Sender: TObject);
    procedure btnAlterarRegistroClick(Sender: TObject);
    procedure edtCPFExit(Sender: TObject);
    procedure btnBuscaCepClick(Sender: TObject);
    procedure btnVisualizarRegistroClick(Sender: TObject);
    procedure btnConfirmarOperacaoClick(Sender: TObject);
    procedure btnCancelarOperacaoClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnEnviarEmailClick(Sender: TObject);
    procedure EdtEmailExit(Sender: TObject);
    procedure edtTelefoneExit(Sender: TObject);
  private
    { Private declarations }
    procedure GerarArquivoXml;
  public
    { Public declarations }
  end;

implementation

uses
  Xml.XMLDoc, Xml.XMLIntf;

{$R *.dfm}

procedure TFrmCadastroClientes.btnAlterarRegistroClick(Sender: TObject);
begin
  inherited;
  if pclManutencao.ActivePage = tabManutencao then begin
    edtCPF.SetFocus;
  end;
  btnEnviarEmail.Enabled := (pclManutencao.ActivePage = tabPesquisa);
end;

procedure TFrmCadastroClientes.btnBuscaCepClick(Sender: TObject);
begin
  inherited;
  if (TDMCadastroClientes(FDataModule).ConsultaCep(SomenteNumero(edtCep.Text)))then begin
    edtNumero.SetFocus;
  end else begin
    mostraMensagem(tpErro, 'CEP inválido');
    edtCep.SetFocus;
  end;
end;

procedure TFrmCadastroClientes.btnCancelarOperacaoClick(Sender: TObject);
begin
  inherited;
  btnEnviarEmail.Enabled := (pclManutencao.ActivePage = tabPesquisa);
end;

procedure TFrmCadastroClientes.btnConfirmarOperacaoClick(Sender: TObject);
begin
  inherited;
  btnEnviarEmail.Enabled := (pclManutencao.ActivePage = tabPesquisa);
end;

procedure TFrmCadastroClientes.btnEnviarEmailClick(Sender: TObject);
var
  Form: TFrmEnviarEmail;
begin
  inherited;
  if(dsCadastro.DataSet.FieldByName('Email').AsString.IsEmpty)then begin

    mostraMensagem(tpInformacao, 'O E-mail do cliente precisa ser informado, para o envio do E-mail.');
    Exit;
  end;

  GerarArquivoXml;
  Form := TFrmEnviarEmail.Create(Self);
  try
    Form.DataModule := TDMCadastroClientes(FDataModule);
    Form.ShowModal;
  finally
    FreeAndNil(Form);
  end;
end;

procedure TFrmCadastroClientes.btnIncluirRegistroClick(Sender: TObject);
begin
  inherited;
  btnEnviarEmail.Enabled := (pclManutencao.ActivePage = tabPesquisa);
  edtCPF.SetFocus;
end;

procedure TFrmCadastroClientes.btnVisualizarRegistroClick(Sender: TObject);
begin
  inherited;
  btnEnviarEmail.Enabled := (pclManutencao.ActivePage = tabPesquisa);
end;

procedure TFrmCadastroClientes.btnVoltarClick(Sender: TObject);
begin
  inherited;
  btnEnviarEmail.Enabled := (pclManutencao.ActivePage = tabPesquisa);
end;

procedure TFrmCadastroClientes.edtTelefoneExit(Sender: TObject);
begin
  inherited;
   TDMCadastroClientes(FDataModule).FormatarTelefone(edtTelefone.Text);
end;

procedure TFrmCadastroClientes.EdtEmailExit(Sender: TObject);
begin
  inherited;
  if(EdtEmail.Text = EmptyStr)then begin
    mostraMensagem(tpInformacao, 'E-mail precisa ser informado para o envio dos dados do cliente.');
  end;

end;

procedure TFrmCadastroClientes.edtCPFExit(Sender: TObject);
begin
  inherited;
   TDMCadastroClientes(FDataModule).FormatarDocumento(edtCPF.Text);
end;

procedure TFrmCadastroClientes.FormCreate(Sender: TObject);
begin
  inherited;
  FDataModule := TDMCadastroClientes.Create(Self);
  dsCadastro.DataSet := FDataModule.cdsCadastro;
end;

procedure TFrmCadastroClientes.GerarArquivoXml;
var
  XMLDocument: TXMLDocument;
  NodeTabela, NodeRegistro, NodeEndereco: IXMLNode;
begin
  inherited;
  XMLDocument := TXMLDocument.Create(Self);
  try
    XMLDocument.Active := True;
    NodeTabela := XMLDocument.AddChild('Cliente');
    NodeRegistro := NodeTabela.AddChild('Registro');
    NodeRegistro.ChildValues['Nome'] := dsCadastro.DataSet.FieldByName('Nome').AsString;
    NodeRegistro.ChildValues['Identidade'] := dsCadastro.DataSet.FieldByName('Identidade').AsString;
    NodeRegistro.ChildValues['CPF'] := dsCadastro.DataSet.FieldByName('CPF').AsString;
    NodeRegistro.ChildValues['Telefone'] := dsCadastro.DataSet.FieldByName('Telefone').AsString;
    NodeRegistro.ChildValues['Email'] := dsCadastro.DataSet.FieldByName('Email').AsString;

    NodeEndereco := NodeRegistro.AddChild('Endereco');
    NodeEndereco.ChildValues['Cep'] := dsCadastro.DataSet.FieldByName('Cep').AsString;
    NodeEndereco.ChildValues['Logradouro'] := dsCadastro.DataSet.FieldByName('Logradouro').AsString;
    NodeEndereco.ChildValues['Numero'] := dsCadastro.DataSet.FieldByName('Numero').AsString;
    NodeEndereco.ChildValues['Complemento'] := dsCadastro.DataSet.FieldByName('Complemento').AsString;
    NodeEndereco.ChildValues['Bairro'] := dsCadastro.DataSet.FieldByName('Bairro').AsString;
    NodeEndereco.ChildValues['Cidade'] := dsCadastro.DataSet.FieldByName('Cidade').AsString;
    NodeEndereco.ChildValues['Estado'] := dsCadastro.DataSet.FieldByName('Estado').AsString;
    NodeEndereco.ChildValues['Pais'] := dsCadastro.DataSet.FieldByName('Pais').AsString;
    XMLDocument.SaveToFile(ExtractFilePath(Application.ExeName) + 'Cadastro_Cliente.xml');
  finally
    XMLDocument.Free;
  end;
end;

end.
