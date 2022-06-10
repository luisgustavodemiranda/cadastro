unit Providers.Wait;

interface

uses Providers.BlockUI.Intf, VCL.Forms, VCL.Controls, Providers.BlockUI, VCL.ExtCtrls, System.Classes, Providers.ProgressBar.Intf,
  View.Wait, System.SysUtils, System.Threading;

type
  TWait = class
  private
    FBlockUI: IBlockUI;
    FProgressBar: IProgressBar;
    FWaitForm: TFrmWait;
    FBlockControl: TWinControl;
    FMainProcess: TProc;
    FFinnalyProcess: TProc;
    FShowScreen: Boolean;
    procedure ShowWaitForm;
  public
    constructor Create(const ATitle: string = '');
    function Content: string;
    function SetBlockControl(const AWinControl: TWinControl): TWait;
    function SetTitle(const ATitle: string): TWait;
    function SetWidth(const AWidth: Integer): TWait;
    function SetAlphaBlendValue(const AValue: Integer): TWait;
    function SetSubTitle(const ASubTitle: string): TWait;
    function HideSubTitle: TWait;
    function ProgressBar: IProgressBar;
    function SetMainProcess(const AMainProcedure: TProc): TWait;
    function SetFinallyProcess(const AFinnalyProcedure: TProc): TWait;
    function SetShowScreen(const AValue: Boolean): TWait;
    function Start(const AProcess: TProc = nil): TWait;
    class procedure Synchronize(const AProcess: TThreadMethod);
    destructor Destroy; override;
  end;

implementation

uses Providers.ProgressBar.Default;

function TWait.ProgressBar: IProgressBar;
begin
  Result := Self.FProgressBar;
end;

constructor TWait.Create(const ATitle: string = '');
begin
  Self.FWaitForm := TFrmWait.Create(Application);
  Self.FProgressBar := TProgressBarDefault.Create(Self.FWaitForm.pbWait);
  Self.SetTitle(ATitle);
  Self.SetShowScreen(True)
end;

destructor TWait.Destroy;
begin
  FBlockUI := nil;
  FProgressBar := nil;
  if (Assigned(FWaitForm)) then
  begin
    FWaitForm.Close;
    FWaitForm := nil;
  end;
  inherited;
end;

function TWait.HideSubTitle: TWait;
begin
  Result := Self;
  TThread.Synchronize(TThread.CurrentThread,
    procedure
    begin
      Self.FWaitForm.HideSubTitle;
    end);
end;

function TWait.Content: string;
begin
  Result := Self.FWaitForm.lblTitle.Caption;
end;

function TWait.SetAlphaBlendValue(const AValue: Integer): TWait;
begin
  Result := Self;
  TThread.Synchronize(TThread.CurrentThread,
    procedure
    begin
      Self.FWaitForm.AlphaBlendValue := AValue;
    end);
end;

function TWait.SetBlockControl(const AWinControl: TWinControl): TWait;
begin
  Result := Self;
  FBlockControl := AWinControl;
end;

function TWait.SetFinallyProcess(const AFinnalyProcedure: TProc): TWait;
begin
  FFinnalyProcess := AFinnalyProcedure;
  Result := Self;
end;

function TWait.SetMainProcess(const AMainProcedure: TProc): TWait;
begin
  FMainProcess := AMainProcedure;
  Result := Self;
end;

function TWait.SetShowScreen(const AValue: Boolean): TWait;
begin
  FShowScreen := AValue;
  Result := Self;
end;

function TWait.SetSubTitle(const ASubTitle: string): TWait;
begin
  Result := Self;
  TThread.Synchronize(TThread.CurrentThread,
    procedure
    begin
      Self.FWaitForm.lblSubTitle.Caption := ASubTitle;
      Self.FWaitForm.lblSubTitle.Update;
      Self.FWaitForm.ShowSubTitle;
    end);
end;

function TWait.SetTitle(const ATitle: string): TWait;
begin
  Result := Self;
  TThread.Synchronize(TThread.CurrentThread,
    procedure
    begin
      Self.FWaitForm.lblTitle.Caption := ATitle;
      Self.FWaitForm.lblTitle.Update;
    end);
end;

function TWait.SetWidth(const AWidth: Integer): TWait;
begin
  Result := Self;
  TThread.Synchronize(TThread.CurrentThread,
    procedure
    begin
      if Self.FWaitForm.Width > AWidth then
        Self.FWaitForm.Left := Self.FWaitForm.Left + ((Self.FWaitForm.Width - AWidth) div 2)
      else
        Self.FWaitForm.Left := Self.FWaitForm.Left - ((AWidth - Self.FWaitForm.Width) div 2);
      Self.FWaitForm.Width := AWidth;
    end);
end;

procedure TWait.ShowWaitForm;
begin
  Self.FWaitForm.HideSubTitle;
  if Assigned(FBlockControl) then
  begin
    Self.FWaitForm.Parent := FBlockControl;
    Self.FWaitForm.Show;
    Self.FWaitForm.Left := (FBlockControl.Width - Self.FWaitForm.Width) div 2;
    Self.FWaitForm.Top := (FBlockControl.Height - Self.FWaitForm.Height) div 2;
  end
  else
    Self.FWaitForm.ShowModal;
end;

function TWait.Start(const AProcess: TProc = nil): TWait;
var
  FTask: ITask;
begin
  Result := Self;
  if FShowScreen then  
    Self.FBlockUI := TBlockUI.Create(FBlockControl);
  FTask := TTask.Create(
    procedure
    begin
      try
        try
          if Assigned(FMainProcess) then
            FMainProcess
          else if Assigned(AProcess) then
            AProcess;
        except on E:Exception do
          Application.ShowException(E);
        end;
      finally
        TThread.Synchronize(TThread.CurrentThread,
          procedure
          begin
            if FShowScreen then
            begin
              FWaitForm.Close;
              FBlockUI := nil;
            end;
            if Assigned(FFinnalyProcess) then
              FFinnalyProcess;
            Self.Destroy;
          end);
      end;
    end);
  FTask.Start;
  if FShowScreen then
    ShowWaitForm;
end;

class procedure TWait.Synchronize(const AProcess: TThreadMethod);
begin
  TThread.Synchronize(TThread.CurrentThread, AProcess);
end;

end.