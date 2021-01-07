unit u_CrudCad;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Objects, FMX.ListView, FMX.TabControl, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Layouts, FMX.Edit, FMX.SearchBox, u_DM, u_Library,
  FMX.EditBox, FMX.NumberBox, MidasLib;

type
  TFrmCrud = class(TForm)
    Layout2: TLayout;
    tab_Crud: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    Layout3: TLayout;
    Layout4: TLayout;
    lay_Principal: TLayout;
    Rectangle2: TRectangle;
    lay_error: TLayout;
    Rectangle3: TRectangle;
    lbl_Erro: TLabel;
    ed_pesq: TEdit;
    ClearEditButton1: TClearEditButton;
    lay_listVazia: TLayout;
    Image1: TImage;
    Label2: TLabel;
    img_selecionado: TImage;
    Rectangle1: TRectangle;
    Label1: TLabel;
    Rectangle6: TRectangle;
    lbl_tela: TLabel;
    Rectangle7: TRectangle;
    lst_Principal: TListView;
    lay_menubtn: TLayout;
    rct_menuboton: TRectangle;
    Img_BtnNovo: TImage;
    lay_bottonmenu: TLayout;
    rct_bottonmenu: TRectangle;
    Layout6: TLayout;
    Img_BtnSalvar: TImage;
    Img_BtnExcluir: TImage;
    Img_BtnEditar: TImage;
    Img_BtnCancelar: TImage;
    Img_BtnVoltar: TImage;
    lbl_tela1: TLabel;
    procedure Img_BtnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Img_BtnEditarClick(Sender: TObject);
    procedure Img_BtnCancelarClick(Sender: TObject);
    procedure ed_pesqChangeTracking(Sender: TObject);
    procedure lst_PrincipalItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Img_BtnExcluirClick(Sender: TObject);
    procedure Img_BtnVoltarClick(Sender: TObject);
    procedure lst_PrincipalPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);

  private
    sb: TSearchBox;


  public

    procedure LimpaCampos;
    procedure DesabilitaCampos;
    procedure HabilitaCampos;
    procedure PoderUser;
  end;

var
  FrmCrud: TFrmCrud;

implementation

uses
  FireDAC.Comp.Client, Winapi.Windows, FMX.ComboEdit, FMX.DateTimeCtrls,
  FMX.ListBox;

{$R *.fmx}

procedure TFrmCrud.ed_pesqChangeTracking(Sender: TObject);
begin
  sb.Text := ed_pesq.Text;
end;

procedure TFrmCrud.FormCreate(Sender: TObject);
var
  I: integer;
begin
  img_selecionado.Visible := false;
  lst_Principal.SearchVisible := true;
  for I := 0 to lst_Principal.Controls.Count - 1 do
    if lst_Principal.Controls[I].ClassType = TSearchBox then
    begin
      sb := TSearchBox(lst_Principal.Controls[I]);
      Break;
    end;
  sb.Height := 0;
//  PoderUser;

  lay_error.Visible := false;
  tab_Crud.ActiveTab := TabItem1;
    lbl_tela.Text := Self.Caption;
  lbl_tela1.Text := Self.Caption;
end;

procedure TFrmCrud.Img_BtnNovoClick(Sender: TObject);
begin

  LimpaCampos;
  Img_BtnCancelar.Visible := True;
  Img_BtnSalvar.Visible := True;
  Img_BtnEditar.Visible := false;
  Img_BtnExcluir.Visible := false;
  Img_BtnVoltar.Visible := false;
  tab_Crud.ActiveTab := TabItem2;
  Acao := 0;
  HabilitaCampos;  //DESABILITEI ESSA FUNÇÃO PARA CRIAR UM FLUXO NOS CADASTROS
  // PELO QUE VI NÃO ALTERA A FUNCIONALIDADE DO QUE JÁ FOI FEITO.
end;

procedure TFrmCrud.Img_BtnVoltarClick(Sender: TObject);
begin
  tab_Crud.ActiveTab := TabItem1;
  LimpaCampos;
  HabilitaCampos;
  Img_BtnVoltar.Visible := false;
  Img_BtnCancelar.Visible := true;
  Img_BtnSalvar.Visible := true;
end;

procedure TFrmCrud.PoderUser;
const
  _SQLpoderUser = 'SELECT Tipo_Usuario FROM agrojun.usuarios where ID = :cod';
var
  x: integer;
  QTipoUser: TFDQuery;
begin

  try
    QTipoUser := TFDQuery.Create(self);
    QTipoUser.Connection := dm.FDConnection;
    QTipoUser.FetchOptions.RowsetSize := 50000;
    QTipoUser.Active := false;
    QTipoUser.SQL.Clear;
    QTipoUser.SQL.Add(_SQLpoderUser);
    QTipoUser.ParamByName('cod').AsInteger := Cod_User;
    QTipoUser.Active := true;
    QTipoUser.First;
    case QTipoUser.FieldByName('Tipo_Usuario').AsInteger of
      1:
        begin
          Img_BtnNovo.Enabled := true;
          Img_BtnSalvar.Enabled := true;
          Img_BtnCancelar.Enabled := true;
          Img_BtnEditar.Enabled := true;
          Img_BtnExcluir.Enabled := true;
          lst_Principal.Enabled := true;
        end;

      2:
        begin
          Img_BtnNovo.Enabled := false;
          Img_BtnSalvar.Enabled := false;
          Img_BtnCancelar.Enabled := true;
          Img_BtnEditar.Enabled := false;
          Img_BtnExcluir.Enabled := false;
          lst_Principal.Enabled := true;
        end;
    end;

  finally
    FreeAndNil(QTipoUser);
  end;

end;

procedure TFrmCrud.Img_BtnEditarClick(Sender: TObject);
begin
  if mensagemConfirmacao('Deseja editar esse registro?') = mrYes then
  begin
    Acao := 1;
    HabilitaCampos;
    Img_BtnSalvar.Visible := true;
    Img_BtnCancelar.Visible := true;
    Img_BtnEditar.Visible := false;
    Img_BtnExcluir.Visible := false;
    Img_BtnVoltar.Visible := false;
  end;
end;

procedure TFrmCrud.Img_BtnExcluirClick(Sender: TObject);
begin
  if mensagemConfirmacao('Deseja excluir esse registro?') = mrYes then
    Acao := 2
  else
    abort;
end;

procedure TFrmCrud.Img_BtnCancelarClick(Sender: TObject);
begin
  if mensagemConfirmacao('Deseja cancelar?') = mrYes then
  begin
    DesabilitaCampos;
    if Acao = 0 then
    begin
      tab_Crud.ActiveTab := TabItem1;
      Img_BtnEditar.Visible := true;
      Img_BtnExcluir.Visible := true;
    end
    else if Acao = 1 then
    begin
      //DesabilitaCampos;
      Img_BtnCancelar.Visible := false;
      Img_BtnSalvar.Visible := false;
      Img_BtnEditar.Visible := true;
      Img_BtnExcluir.Visible := true;
      Img_BtnVoltar.Visible := true;
    end;
  end;
  // tab_Crud.ActiveTab := TabItem1;
  // LimpaCampos;
end;

procedure TFrmCrud.lst_PrincipalItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  DesabilitaCampos;

  Img_BtnSalvar.Visible := false;
  Img_BtnCancelar.Visible := false;
  Img_BtnVoltar.Visible := true;
  Img_BtnEditar.Visible := true;
  Img_BtnExcluir.Visible := true;
end;

procedure TFrmCrud.lst_PrincipalPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
begin
  Canvas.Fill.Color := $FF0a0a0a+ 255;
    Canvas.FillRect(ARect, 0, 0, AllCorners, 0.2);
end;

procedure TFrmCrud.LimpaCampos;
var
  cont: integer;
begin
  for cont := 0 To ComponentCount - 1 Do
  begin
    If Components[cont] Is TEdit Then
      TEdit(Components[cont]).Text := EmptyStr;

    If Components[cont] Is TComboEdit Then
      TComboEdit(Components[cont]).ItemIndex := 0;

    If Components[cont] Is TCheckBox Then
      TCheckBox(Components[cont]).IsChecked := false;

    If Components[cont] Is TNumberBox Then
      TNumberBox(Components[cont]).Text := EmptyStr;

  end;

end;

procedure TFrmCrud.HabilitaCampos;
var
  cont: integer;
begin
  for cont := 0 To ComponentCount - 1 Do
  begin
    If Components[cont] Is TEdit Then
      TEdit(Components[cont]).Enabled := true;

    If Components[cont] Is TComboEdit Then
      TComboEdit(Components[cont]).Enabled := true;

    If Components[cont] Is TCheckBox Then
      TCheckBox(Components[cont]).Enabled := true;

    If Components[cont] Is TNumberBox Then
      TNumberBox(Components[cont]).Enabled := true;

    If Components[cont] Is TDateEdit Then
      TDateEdit(Components[cont]).Enabled := true;


           If Components[cont] Is TComboBox Then
      TComboBox(Components[cont]).Enabled := true;


  end;

end;

procedure TFrmCrud.DesabilitaCampos;
var
  cont: integer;
begin
  for cont := 0 To ComponentCount - 1 Do
  begin
    If Components[cont] Is TEdit Then
      TEdit(Components[cont]).Enabled := false;

    If Components[cont] Is TComboEdit Then
      TComboEdit(Components[cont]).Enabled := false;

    If Components[cont] Is TCheckBox Then
      TCheckBox(Components[cont]).Enabled := false;

    If Components[cont] Is TNumberBox Then
      TNumberBox(Components[cont]).Enabled := false;

    If Components[cont] Is TDateEdit Then
      TDateEdit(Components[cont]).Enabled := false;


           If Components[cont] Is TComboBox Then
      TComboBox(Components[cont]).Enabled := false;



  end;

end;

end.

