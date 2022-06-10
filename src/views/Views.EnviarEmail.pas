unit Views.EnviarEmail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Views.Base, Vcl.ExtCtrls, Vcl.StdCtrls, Providers.Mensagem,
  Providers.Mail, Services.CadastroClientes, System.ImageList, Vcl.ImgList,
  Providers.Wait;

type
  TFrmEnviarEmail = class(TFrmBase)
    Panel1: TPanel;
    pnlHeaderEmailConfiguration: TPanel;
    Label4: TLabel;
    edtNameFrom: TEdit;
    Label3: TLabel;
    edtFrom: TEdit;
    cbCriptocrafia: TComboBox;
    Label7: TLabel;
    Label5: TLabel;
    edtHost: TEdit;
    edtPort: TEdit;
    Label6: TLabel;
    Label1: TLabel;
    cbAuth: TComboBox;
    Label17: TLabel;
    edtPassword: TEdit;
    edtUser: TEdit;
    Label16: TLabel;
    Panel2: TPanel;
    btnSend: TButton;
    Button1: TButton;
    ImageList: TImageList;
    procedure Button1Click(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
  private
    FDataModule: TDMCadastroClientes;
    { Private declarations }
  public
    { Public declarations }
    property DataModule: TDMCadastroClientes read FDataModule write FDataModule;
  end;

implementation

{$R *.dfm}

procedure TFrmEnviarEmail.btnSendClick(Sender: TObject);
var
  LMail: IMail;
begin
  inherited;
  TWait.Create('Enviando e-mail...').Start(
    procedure
    begin
      LMail := TMail.New
        .From(edtFrom.Text, edtNameFrom.Text)
        .SSL(cbCriptocrafia.ItemIndex = 0)
        .Host(edtHost.Text)
        .Port(StrToInt(edtPort.Text))
        .Auth(cbAuth.ItemIndex = 1)
        .UserName(edtUser.Text)
        .Password(edtPassword.Text)
        .ReceiptRecipient(False)
        .AddCC(EmptyStr, EmptyStr)
        .AddBCC(EmptyStr, EmptyStr)
        .AddTo(FDataModule.cdsCadastro.FieldByName('Email').AsString, FDataModule.cdsCadastro.FieldByName('Nome').AsString)
        .Subject('Dados cadastrais do cliente');
      FDataModule.GetBody(LMail);

      if FileExists(ExtractFilePath(Application.ExeName) + 'Cadastro_Cliente.xml') then begin
        LMail.AddAttachment(ExtractFilePath(Application.ExeName) + 'Cadastro_Cliente.xml');
      end;

      if LMail.SendMail then begin
        mostraMensagem(tpSucesso, 'Email enviado com sucesso');
      end;
    end);
end;

procedure TFrmEnviarEmail.Button1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
