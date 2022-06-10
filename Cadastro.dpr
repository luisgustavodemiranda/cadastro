program Cadastro;

uses
  Vcl.Forms,
  Views.Base in 'src\views\Views.Base.pas' {FrmBase},
  Services.Base.Cadastro in 'src\services\Services.Base.Cadastro.pas' {DMCadastroBase: TDataModule},
  Providers.Mensagem in 'src\providers\Providers.Mensagem.pas',
  Views.Mensagem in 'src\views\Views.Mensagem.pas' {FrmMensagem},
  Views.Base.Form in 'src\views\Views.Base.Form.pas' {FrmCadastroBase},
  Services.CadastroClientes in 'src\services\Services.CadastroClientes.pas' {DMCadastroClientes: TDataModule},
  Services.BuscaCep in 'src\services\Services.BuscaCep.pas' {DMBuscaCep: TDataModule},
  Providers.Mascara in 'src\providers\Providers.Mascara.pas',
  Providers.Mail.Intf in 'src\providers\Providers.Mail.Intf.pas',
  Providers.Mail in 'src\providers\Providers.Mail.pas',
  Views.CadastroClientes in 'src\views\Views.CadastroClientes.pas' {FrmCadastroClientes},
  Views.EnviarEmail in 'src\views\Views.EnviarEmail.pas' {FrmEnviarEmail},
  Views.Principal in 'src\views\Views.Principal.pas' {FrmPrincipal},
  View.Wait in 'src\views\View.Wait.pas' {FrmWait},
  Providers.ProgressBar.Default in 'src\providers\Providers.ProgressBar.Default.pas',
  Providers.ProgressBar.Intf in 'src\providers\Providers.ProgressBar.Intf.pas',
  Providers.Wait in 'src\providers\Providers.Wait.pas',
  Providers.BlockUI.Intf in 'src\providers\Providers.BlockUI.Intf.pas',
  Providers.BlockUI in 'src\providers\Providers.BlockUI.pas';

{$R *.res}

var
  FrmPrincipal: TFrmPrincipal;
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
