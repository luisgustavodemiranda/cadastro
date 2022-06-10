unit Views.Mensagem;

interface

uses Vcl.StdCtrls, System.ImageList, Vcl.ImgList, Vcl.Controls, Vcl.ExtCtrls, System.Classes,
  Vcl.Forms, Providers.Mensagem;

type
  TFrmMensagem = class(TForm)
    imlMensagem: TImageList;
    Panel2: TPanel;
    imgMensagem: TImage;
    lblTitulo: TLabel;
    lblMensagem: TLabel;
    btnSim: TButton;
    btnOk: TButton;
    btnNao: TButton;
    procedure btnNaoClick(Sender: TObject);
    procedure btnSimClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public
    vRetorno:  TRetornoMensagem;
    vFBotao:   TBotaoFocus;
    vTipoMsg:  TTipoMensagem;
  end;

implementation

{$R *.dfm}

{ TfrmMensagem }

procedure TFrmMensagem.btnNaoClick(Sender: TObject);
begin
  vRetorno := retNao;
  Close;
end;

procedure TFrmMensagem.btnOkClick(Sender: TObject);
begin
  vRetorno := retOk;
  Close;
end;

procedure TFrmMensagem.btnSimClick(Sender: TObject);
begin
  vRetorno := retSim;
  Close;
end;

procedure TFrmMensagem.FormShow(Sender: TObject);
begin
  if (vTipoMsg = tpConfirmacao) then
  begin
    case vFBotao of
      bfSim: btnSim.SetFocus;
      bfNao: BtnNao.SetFocus;
    end;
  end;

  vRetorno := retNull;
end;

end.
