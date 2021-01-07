unit u_Login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Effects,
  FMX.Objects, FMX.Edit, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, u_DM, u_Principal, u_Library;

type
  TFrmLogin = class(TForm)
    lay_Top: TLayout;
    lay_buttom: TLayout;
    Rectangle1: TRectangle;
    ShadowEffect1: TShadowEffect;
    img_BtnFechaSistema: TImage;
    lbl_VersaoSistema: TLabel;
    ed_Login: TEdit;
    ed_Senha: TEdit;
    img_BtnEntrar: TImage;
    img_BtnInfoMG: TImage;
    lay_InfoMG: TLayout;
    Rectangle2: TRectangle;
    Label2: TLabel;
    Layout3: TLayout;
    Line1: TLine;
    img_LogoAgrojun: TImage;
    lbl_ErroLogin: TLabel;
    FDQuery1: TFDQuery;
    rct_ErroLogin: TRectangle;
    PasswordEditButton1: TPasswordEditButton;
    procedure img_BtnFechaSistemaClick(Sender: TObject);
    procedure img_BtnInfoMGClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ed_SenhaEnter(Sender: TObject);
    procedure img_BtnEntrarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
  private
    procedure Validar(cod_vali: integer);
  public
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.fmx}

procedure TFrmLogin.ed_SenhaEnter(Sender: TObject);
begin
  if (ed_Login.Text = '') then
    ed_Login.SetFocus;
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  rct_ErroLogin.Visible := False;
  ed_Login.SetFocus;
end;

procedure TFrmLogin.FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = 13 then
    img_BtnEntrarClick(self);
end;

procedure TFrmLogin.img_BtnEntrarClick(Sender: TObject);
var
  Query: TFDQuery;
  senha: String;
begin
  Validar(0);
  try
    Query            := TFDQuery.Create(self);
    Query.Connection := dm.FDConnection;
    Query.FetchOptions.RowsetSize := 50000;
    Query.Connection.Connected;
    Query.Close;
    Query.sql.Clear;
    Query.sql.Add('select * from agrojun.usuarios where ativo = 1');
    Query.Open;

    if Query.Locate('login', ed_Login.Text, []) then
      senha := DesCriptografa(Query.FieldByName('senha').AsString);

    if ed_Senha.Text = senha then
    begin
      Cod_User := Query.FieldByName('ID').AsInteger;
      FrmLogin.Visible := false;
      if not assigned(FrmPrincipal) then
        FrmPrincipal := TFrmPrincipal.Create(Application);
      FrmPrincipal.Show;
    end
    else
    begin
      Validar(1);
    end;

  finally
    FreeAndNil(Query);
  end;
end;

procedure TFrmLogin.img_BtnFechaSistemaClick(Sender: TObject);
begin
  Halt(0);
end;

procedure TFrmLogin.img_BtnInfoMGClick(Sender: TObject);
begin
  if (lay_InfoMG.Visible) then
    lay_InfoMG.Visible := False
  else
    lay_InfoMG.Visible := True;
end;

procedure TFrmLogin.Validar(cod_vali: integer);
begin
  case cod_vali of
    0:
      begin

        if (ed_Login.Text = EmptyStr) then
        begin
          rct_ErroLogin.Visible := True;
          lbl_ErroLogin.Text    := 'Erro 1001: ' + sLineBreak + 'Informe um Usuario Valido!';
          abort;
        end;

        if (ed_Senha.Text = EmptyStr) then
        begin
          rct_ErroLogin.Visible := True;
          lbl_ErroLogin.Text    := 'Erro 1002: ' + sLineBreak + 'Informe uma Senha Valido!';
          abort;
        end;
      end;

    1:
      begin
        rct_ErroLogin.Visible := True;
        lbl_ErroLogin.Text    := 'Erro 1003: ' + sLineBreak + 'Usuario ou senha invalida!';
        abort;
      end;
  end;
end;

end.
