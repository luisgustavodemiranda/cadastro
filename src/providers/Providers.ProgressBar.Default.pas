unit Providers.ProgressBar.Default;

interface

uses Providers.ProgressBar.Intf, Vcl.Samples.Gauges;

type
  TProgressBarDefault = class(TInterfacedObject, IProgressBar)
  private
    FProgressBar: TGauge;
    function Max: Integer;
    function Position: Integer;
    function SetMax(const Value: Integer): IProgressBar;
    function Step(const Value: Integer = 1): IProgressBar;
    function SetPosition(const Position: Integer): IProgressBar;
    function Show: IProgressBar;
    function Hide: IProgressBar;
  public
    constructor Create(const ProgressBar: TGauge);
    destructor Destroy; override;
  end;

implementation

uses System.Classes;

constructor TProgressBarDefault.Create(const ProgressBar: TGauge);
begin
  Self.FProgressBar := ProgressBar;
  Self.FProgressBar.Progress := 0;
end;

destructor TProgressBarDefault.Destroy;
begin
  Self.FProgressBar := nil;
  inherited;
end;

function TProgressBarDefault.Max: Integer;
begin
  Result := Self.FProgressBar.MaxValue;
end;

function TProgressBarDefault.SetMax(const Value: Integer): IProgressBar;
begin
  Result := Self;
  TThread.Synchronize(TThread.Current,
    procedure
    begin
      Self.FProgressBar.MaxValue := Value;
      Self.FProgressBar.Update;
    end);
end;

function TProgressBarDefault.SetPosition(const Position: Integer): IProgressBar;
begin
  Result := Self;
  TThread.Synchronize(TThread.Current,
    procedure
    begin
      Self.FProgressBar.Progress := Position;
      Self.FProgressBar.Update;
    end);
end;

function TProgressBarDefault.Step(const Value: Integer = 1): IProgressBar;
begin
  Result := Self;
  TThread.Synchronize(TThread.Current,
    procedure
    begin
      if not Self.FProgressBar.Visible then
        Self.Show;	
      Self.FProgressBar.Progress := Self.FProgressBar.Progress + Value;
      Self.FProgressBar.Update;
    end);
end;

function TProgressBarDefault.Position: Integer;
begin
  Result := Self.FProgressBar.Progress;
end;

function TProgressBarDefault.Show: IProgressBar;
begin
  Result := Self;
  TThread.Synchronize(TThread.Current,
    procedure
    begin
      Self.FProgressBar.Visible := True;
      Self.FProgressBar.Update;
    end);
end;

function TProgressBarDefault.Hide: IProgressBar;
begin
  Result := Self;
  TThread.Synchronize(TThread.Current,
    procedure
    begin
      Self.FProgressBar.Visible := False;
      Self.FProgressBar.Update;
    end);
end;

end.
