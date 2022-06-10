unit Providers.Mensagem;

interface

uses Forms, SysUtils;

type
  TTipoMensagem = (tpErro, tpInformacao, tpConfirmacao, tpSucesso, tpAtencao);
  TRetornoMensagem = (retNull, retSim, retNao, retOk);
  TBotaoFocus = (bfSim, bfNao);


function mostraMensagem(pTipoMensagem: TTipoMensagem; pMensagem: String;
  pTitulo: String = ''; pBotao: TBotaoFocus = bfSim; pCaption: String = ''): TRetornoMensagem;

implementation

uses
  Views.Mensagem;

var
FMensagem: TFrmMensagem;

function mostraMensagem(pTipoMensagem: TTipoMensagem; pMensagem: String;
  pTitulo: String = ''; pBotao: TBotaoFocus = bfSim; pCaption: String = ''): TRetornoMensagem;
begin
  FMensagem := TFrmMensagem.Create(Application);
  try
    case (pTipoMensagem) of
      tpErro       : begin
                       Result := retOk;
                       FMensagem.imlMensagem.GetBitmap(0, FMensagem.imgMensagem.Picture.Bitmap);
                       FMensagem.btnOk.Visible := True;
                       FMensagem.lblTitulo.Caption := 'Erro';
                       FMensagem.Caption := pCaption;
                     end;

      tpInformacao : begin
                       Result := retOk;
                       FMensagem.btnOk.Visible := True;
                       FMensagem.imlMensagem.GetBitmap(1, FMensagem.imgMensagem.Picture.Bitmap);
                       FMensagem.lblTitulo.Caption := 'Informação';
                       FMensagem.Caption := pCaption;
                     end;

      tpConfirmacao: begin
                       Result := retNao;
                       FMensagem.btnSim.Visible := True;
                       FMensagem.btnNao.Visible := True;
                       FMensagem.imlMensagem.GetBitmap(2, FMensagem.imgMensagem.Picture.Bitmap);
                       FMensagem.lblTitulo.Caption := 'Confirmação';
                       FMensagem.vFBotao := pBotao;
                       FMensagem.Caption := pCaption;
                     end;

      tpSucesso    : begin
                       Result := retOk;
                       FMensagem.btnOk.Visible := True;
                       FMensagem.imlMensagem.GetBitmap(3, FMensagem.imgMensagem.Picture.Bitmap);
                       FMensagem.lblTitulo.Caption := 'Sucesso';
                       FMensagem.Caption := pCaption;
                     end;

      tpAtencao    : begin
                       Result := retOk;
                       FMensagem.btnOk.Visible := True;
                       FMensagem.imlMensagem.GetBitmap(4, FMensagem.imgMensagem.Picture.Bitmap);
                       FMensagem.lblTitulo.Caption := 'Atenção';
                       FMensagem.Caption := pCaption;
                     end;
    end;

    if (pTitulo <> '') then
      FMensagem.lblTitulo.Caption := pTitulo;

    FMensagem.lblMensagem.Caption := pMensagem;
    FMensagem.vTipoMsg            := pTipoMensagem;
    FMensagem.ShowModal;

    if (FMensagem.vRetorno <> retNull) then
      Result := FMensagem.vRetorno;

  finally
    FMensagem.Free;
  end;

end;

end.
