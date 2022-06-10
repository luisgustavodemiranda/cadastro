unit Providers.ProgressBar.Intf;

interface

type
  IProgressBar = interface
    ['{167DEF94-F49D-4FBA-A274-771A1F4A1656}']
    function Max: Integer;
    function Position: Integer;
    function SetMax(const Value: Integer): IProgressBar;
    function Step(const Value: Integer = 1): IProgressBar;
    function SetPosition(const Position: Integer): IProgressBar;
    function Show: IProgressBar;
    function Hide: IProgressBar;
  end;

implementation

end.
