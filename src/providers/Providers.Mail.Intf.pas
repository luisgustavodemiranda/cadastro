unit Providers.Mail.Intf;

interface

uses
  System.Classes;

type
  IMail = interface
    ['{A63918AD-EA2C-4CB9-98C5-90C3BAB95144}']
    function AddTo(const AMail: string; const AName: string = ''): IMail;
    function From(const AMail: string; const AName: string = ''): IMail;
    function ReceiptRecipient(const AValue: Boolean): IMail;
    function Subject(const ASubject: string): IMail;
    function AddReplyTo(const AMail: string; const AName: string = ''): IMail;
    function AddCC(const AMail: string; const AName: string = ''): IMail;
    function AddBCC(const AMail: string; const AName: string = ''): IMail;
    function AddBody(const ABody: string): IMail;
    function ClearBody: IMail;
    function ClearAttachments: IMail;
    function Host(const AHost: string): IMail;
    function UserName(const AUserName: string): IMail;
    function Password(const APassword: string): IMail;
    function Port(const APort: Integer): IMail;
    function AddAttachment(const AFile: string; ATemporaryFile: Boolean = False): IMail; overload;
    function AddAttachment(const AStream: TStream; const AFileName: string; const AContentType: string = ''): IMail; overload;
    function Auth(const AValue: Boolean): IMail;
    function SSL(const AValue: Boolean): IMail;
    function ContentType(const AValue: string): IMail;
    function ConnectTimeout(const ATimeout: Integer): IMail;
    function ReadTimeout(const ATimeout: Integer): IMail;
    function Clear: IMail;
    function SendMail: Boolean;
    function SetUpEmail: Boolean;
    function Connect: Boolean;
    function Disconnect: Boolean;
  end;

implementation

end.
