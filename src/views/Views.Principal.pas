unit Views.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.WinXCtrls, System.ImageList,
  Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.CategoryButtons, Views.CadastroClientes, Vcl.Imaging.pngimage;

type
  TFrmPrincipal = class(TForm)
    pnlToolBar: TPanel;
    imgMenu: TImage;
    lblTitle: TLabel;
    SplitView: TSplitView;
    ImageList: TImageList;
    ActionList: TActionList;
    actClientes: TAction;
    CategoryButtons: TCategoryButtons;
    procedure imgMenuClick(Sender: TObject);
    procedure actClientesExecute(Sender: TObject);
  private
    procedure ShowForm(const AFormClass: TComponentClass; var AForm);
  end;

implementation

{$R *.dfm}

procedure TFrmPrincipal.actClientesExecute(Sender: TObject);
var
  LForm: TFrmCadastroClientes;
begin
  ShowForm(TFrmCadastroClientes, LForm);
end;

procedure TFrmPrincipal.imgMenuClick(Sender: TObject);
begin
  if SplitView.Opened then
  begin
    SplitView.Close;
    CategoryButtons.ButtonOptions := CategoryButtons.ButtonOptions - [boShowCaptions];
  end
  else
  begin
    SplitView.Open;
    CategoryButtons.ButtonOptions := CategoryButtons.ButtonOptions + [boShowCaptions];
  end;
end;

procedure TFrmPrincipal.ShowForm(const AFormClass: TComponentClass; var AForm);
begin
  Application.CreateForm(AFormClass, AForm);
  TForm(AForm).Parent := Self;
  TForm(AForm).Align := TAlign.alClient;
  TForm(AForm).WindowState := TWindowState.wsMaximized;
  TForm(AForm).Show;
end;

end.
