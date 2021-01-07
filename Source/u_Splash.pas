unit u_Splash;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects;

type
  TfrmSplash = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.fmx}

uses u_Principal;

procedure TfrmSplash.FormCreate(Sender: TObject);
begin
Timer1.Enabled:= true;
end;

procedure TfrmSplash.Timer1Timer(Sender: TObject);
begin
   if not assigned(FrmPrincipal) then
        FrmPrincipal := TFrmPrincipal.Create(Application);
      FrmPrincipal.Show;
end;

end.
