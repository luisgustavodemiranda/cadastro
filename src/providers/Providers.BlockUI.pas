unit Providers.BlockUI;

interface

uses Providers.BlockUI.Intf, Vcl.Controls, Vcl.Forms;

type
  TBlockUI = class(TInterfacedObject, IBlockUI)
  private
    FLockedForm: TForm;
    FLockedComponent: TWinControl;
    procedure Block;
    procedure Unlock;
  public
    constructor Create; overload;
    constructor Create(const Component: TWinControl); overload;
    destructor Destroy; override;
  end;

implementation

uses Vcl.Graphics, System.SysUtils;

procedure TBlockUI.Block;
begin
  if Assigned(FLockedForm) or (not Assigned(FLockedComponent)) then
    Exit;
  FLockedForm := TForm.Create(Application);
  FLockedForm.Position := poDesigned;
  FLockedForm.BorderStyle := bsNone;
  FLockedForm.AlphaBlendValue := 110;
  FLockedForm.AlphaBlend := True;
  FLockedForm.Color := clBlack;
  FLockedForm.Left := FLockedComponent.Left;
  FLockedForm.Top := FLockedComponent.Top;
  FLockedForm.Height := FLockedComponent.Height;
  FLockedForm.Width := FLockedComponent.Width;
  FLockedForm.Enabled := False;
  if FLockedComponent <> Application.MainForm then
    FLockedForm.Parent := FLockedComponent;    
  FLockedForm.Show;
end;

constructor TBlockUI.Create(const Component: TWinControl);
begin
  if Assigned(Component) then
    FLockedComponent := Component
  else if Assigned(Application.MainForm) then
    FLockedComponent := Application.MainForm;
  Self.Block;
end;

constructor TBlockUI.Create;
begin
  Create(nil);
end;

procedure TBlockUI.Unlock;
begin
  if Assigned(FLockedForm) then
    FreeAndNil(FLockedForm);
end;

destructor TBlockUI.Destroy;
begin
  Self.Unlock;
  FLockedComponent := nil;
  inherited;
end;

end.