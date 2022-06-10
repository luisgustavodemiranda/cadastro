unit View.Wait;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.WinXCtrls, Vcl.Samples.Gauges;

type
  TFrmWait = class(TForm)
    lblTitle: TLabel;
    ActivityIndicator: TActivityIndicator;
    pbWait: TGauge;
    lblSubTitle: TLabel;
  public
    procedure HideSubTitle;
    procedure ShowSubTitle;
  end;

implementation

{$R *.dfm}

{ TFrmWait }

procedure TFrmWait.HideSubTitle;
begin
  lblSubTitle.Hide;
  lblTitle.Font.Size := 12;
  lblTitle.Height := 48;
end;

procedure TFrmWait.ShowSubTitle;
begin
  lblSubTitle.Show;
  lblTitle.Font.Size := 11;
  lblTitle.Height := 20;
end;

end.
