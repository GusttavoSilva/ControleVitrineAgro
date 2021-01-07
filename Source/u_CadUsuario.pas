unit u_CadUsuario;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  u_CrudCad, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.Edit, FMX.Objects, FMX.ListView,
  FMX.TabControl, FMX.Controls.Presentation, FMX.Layouts, FMX.ComboEdit,
  u_Library, u_DM, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmCadUsuario = class(TFrmCrud)
    Layout5: TLayout;
    ed_Senha: TEdit;
    ed_NomeUsuario: TEdit;
    ed_ConfirmaSenha: TEdit;
    cbx_TipoUsuario: TComboEdit;
    ed_Usuario: TEdit;
    lst_Telas: TListView;
    cds_Telas: TFDMemTable;
    cds_Telascodigo: TIntegerField;
    cds_Telasnome_tela: TStringField;
    cds_Telasselecionado: TIntegerField;
    PasswordEditButton1: TPasswordEditButton;
    PasswordEditButton2: TPasswordEditButton;
    lay_lstTela: TLayout;
    Label3: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    cbx_ativo: TComboEdit;
    Label4: TLabel;
    procedure cbx_TipoUsuarioChangeTracking(Sender: TObject);
    procedure lst_TelasItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure ed_UsuarioExit(Sender: TObject);
    procedure ed_ConfirmaSenhaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Img_BtnSalvarClick(Sender: TObject);
    procedure lst_PrincipalItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure Img_BtnEditarClick(Sender: TObject);
    procedure Img_BtnExcluirClick(Sender: TObject);
  private
    procedure Validar(cod_vali: integer);
    procedure populaLstTelas;
    procedure Consultausuarios;
  public
    { Public declarations }
  end;

var
  FrmCadUsuario: TFrmCadUsuario;
  usuario, Cod_Selecao: integer;

implementation

{$R *.fmx}

procedure TFrmCadUsuario.Consultausuarios;
const
  SQLUser = ' select LPAD(id, 4, ''0'') as id, nome, login, ' + ' case Tipo_Usuario ' +
    ' when 1 then ''ADMINISTRADOR (ACESSO TOTAL AO SISTEMA)'' ' + ' when 2 then ''GERENTE (CRIAR, EDITAR, EXCLUIR)'' ' +
    ' else ''USUARIO (CRIAR)'' end as	Tipo_Usuario, ' + ' case  ativo ' + ' when 1 then ''ATIVO'' ' + ' else ''INATIVO'' end as	ativo ' +
    ' from usuarios ';

var
  x: integer;
  Quser: TFDQuery;
  item: TListViewItem;
  txt: TListItemText;
begin

  try
    Quser := TFDQuery.Create(self);
    Quser.Connection := dm.FDConnection;
    quser.FetchOptions.RowsetSize := 50000;
    Quser.Active := false;
    Quser.SQL.Clear;
    Quser.SQL.Add(SQLUser);
    Quser.Active := true;
    Quser.First;

    if (Quser.RecordCount = 0) then
    begin
      lay_listVazia.Visible := true;
    end
    else
    begin
      lay_listVazia.Visible := false;
    end;

    lst_Principal.Items.Clear;
    lst_Principal.BeginUpdate;

    for x := 1 to 1 do
    begin
      item := lst_Principal.Items.Add;

      with item do
      begin
        txt := TListItemText(Objects.FindDrawable('lay_cod'));
        txt.Text := 'CÓDIGO';
        txt.TagString := '0';

        txt := TListItemText(Objects.FindDrawable('lay_nome'));
        txt.Text := 'NOME';

        txt := TListItemText(Objects.FindDrawable('lay_usuario'));
        txt.Text := 'USUARIO';

        txt := TListItemText(Objects.FindDrawable('lay_tipousuario'));
        txt.Text := 'TIPO DE USUARIO';

        txt := TListItemText(Objects.FindDrawable('lay_ativo'));
        txt.Text := 'STATUS';
      end;
    end;

    for x := 1 to Quser.RecordCount do
    begin

      item := lst_Principal.Items.Add;

      with item do
      begin
        txt := TListItemText(Objects.FindDrawable('codigo'));
        txt.Text := formatfloat('0000', Quser.FieldByName('id').AsFloat);
        txt.TagString := Quser.FieldByName('id').AsString;

        txt := TListItemText(Objects.FindDrawable('nome'));
        txt.Text := Quser.FieldByName('nome').AsString;

        txt := TListItemText(Objects.FindDrawable('usuario'));
        txt.Text := Quser.FieldByName('login').AsString;

        txt := TListItemText(Objects.FindDrawable('tipo_usuario'));
        txt.Text := Quser.FieldByName('Tipo_Usuario').AsString;

        txt := TListItemText(Objects.FindDrawable('status'));
        txt.Text := Quser.FieldByName('ativo').AsString;
      end;

      Quser.Next
    end;
  finally
    lst_Principal.EndUpdate;
    FreeAndNil(Quser);
  end;
end;

procedure TFrmCadUsuario.cbx_TipoUsuarioChangeTracking(Sender: TObject);
var
  Query: TFDQuery;
  x: integer;
begin

  if (cbx_TipoUsuario.ItemIndex > 1) then
  begin
    try
      Query := TFDQuery.Create(self);
      Query.Connection := dm.FDConnection;
      Query.FetchOptions.RowsetSize := 50000;
      Query.Connection.Connected;
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('select * from agrojun.telas');
      Query.SQL.Add('where acesso = 0');
      Query.Open;
      lay_lstTela.Visible := false;
      cds_Telas.Active := false;
      cds_Telas.Active := true;
      for x := 1 to Query.RecordCount do
      begin

        cds_Telas.insert;
        cds_Telas.FieldByName('codigo').AsInteger := Query.FieldByName('cod_tela').AsInteger;
        cds_Telas.FieldByName('nome_tela').AsString := Query.FieldByName('nome_tela').AsString;
        cds_Telas.FieldByName('selecionado').AsInteger := 0;
        cds_Telas.Post;

        Query.Next
      end;

    finally
      if (cds_Telas.RecordCount <> 0) then
        populaLstTelas;
      FreeAndNil(Query);
    end;
  end
  else
    lay_lstTela.Visible := false;

end;

procedure TFrmCadUsuario.ed_ConfirmaSenhaExit(Sender: TObject);
begin
  inherited;
  if not(ed_Senha.Text = ed_ConfirmaSenha.Text) then
    Validar(1)
  else
    lay_error.Visible := false;
end;

procedure TFrmCadUsuario.ed_UsuarioExit(Sender: TObject);
var
  Query: TFDQuery;
begin
  try
    Query := TFDQuery.Create(self);
    Query.Connection := dm.FDConnection;
    Query.FetchOptions.RowsetSize := 50000;
    Query.Connection.Connected;
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('select * from agrojun.usuarios');
    Query.SQL.Add('where login = ' + QuotedStr(ed_Usuario.Text));
    Query.Open;

    if (Query.RecordCount <> 0) or (ed_Usuario.Text = EmptyStr) then
      Validar(0)
    else
    begin
      ed_Senha.SetFocus;
      lay_error.Visible := false;
    end;
  finally
    FreeAndNil(Query);
  end;

end;

procedure TFrmCadUsuario.FormCreate(Sender: TObject);
begin
  inherited;
  poderUser;
  lay_lstTela.Visible := false;
  Consultausuarios;
end;

procedure TFrmCadUsuario.Img_BtnEditarClick(Sender: TObject);
begin
  inherited;
  lst_Telas.Enabled := false;
  ed_NomeUsuario.Enabled := false;
  ed_Usuario.Enabled := false;
end;

procedure TFrmCadUsuario.Img_BtnExcluirClick(Sender: TObject);
var
  x: integer;
  QDelete: TFDQuery;
begin
  inherited;

  try
    QDelete := TFDQuery.Create(self);
    QDelete.Connection := dm.FDConnection;
    QDelete.Active := false;
    QDelete.SQL.Clear;
    QDelete.SQL.Add('DELETE FROM agrojun.usuarios WHERE id = ' + IntToStr(Cod_Selecao));
    QDelete.ExecSQL;

  finally
    Consultausuarios;;
    tab_Crud.ActiveTab := TabItem1;
    FreeAndNil(QDelete);
  end;
end;

procedure TFrmCadUsuario.Img_BtnSalvarClick(Sender: TObject);
const
  SqlInsetUser = 'INSERT INTO `agrojun`.`usuarios` ' + '( `nome`, ' + '`login`, ' + '`senha`, ' + '`Tipo_Usuario`, ' + '`ativo`) ' +
    'VALUES ' + ' ' + '(:nome, ' + ':login, ' + ':senha, ' + ':Tipo_Usuario, ' + ':ativo); ';

  SQLInsetPermissao = 'INSERT INTO `agrojun`.`permissao_usuario` ' + '(`Cod_Tela`,`Cod_Usuario`) ' + 'VALUES ' +
    '( :Cod_Tela, :Cod_Usuario); ';
var
  Query: TFDQuery;
  x, cod_NewUser: integer;
begin
  if Acao = 0 then
  begin
    Validar(2);
    Validar(3);

    cod_NewUser := MaxCod('usuarios');
    try
      Query := TFDQuery.Create(self);
      Query.Connection := dm.FDConnection;
      Query.FetchOptions.RowsetSize := 50000;
      Query.Connection.Connected;
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add(SqlInsetUser);
      Query.ParamByName('nome').AsString := ed_NomeUsuario.Text;
      Query.ParamByName('login').AsString := ed_Usuario.Text;
      Query.ParamByName('senha').AsString := Criptografa(ed_Senha.Text);
      Query.ParamByName('Tipo_Usuario').AsInteger := cbx_TipoUsuario.ItemIndex;
      Query.ParamByName('ativo').AsInteger := cbx_ativo.ItemIndex;
      Query.ExecSQL;

    finally
      FreeAndNil(Query);
    end;

    if (cbx_TipoUsuario.ItemIndex > 1) then
    begin
      try
        Query := TFDQuery.Create(self);
        Query.Connection := dm.FDConnection;
        Query.FetchOptions.RowsetSize := 50000;
        Query.Connection.Connected;

        Query.Close;
        Query.SQL.Clear;
        Query.SQL.Add(SQLInsetPermissao);
        Query.ParamByName('cod_usuario').AsInteger := cod_NewUser;
        for x := 1 to cds_Telas.RecordCount do
        begin
          Query.ParamByName('Cod_Tela').AsInteger := cds_Telas.FieldByName('codigo').AsInteger;
          Query.ExecSQL;

          cds_Telas.Next
        end;
      finally
        FreeAndNil(Query);
      end;
    end;
  end
  else
  begin
    try
       Validar(3);
      Query := TFDQuery.Create(self);
      Query.Connection := dm.FDConnection;
      Query.FetchOptions.RowsetSize := 50000;
      Query.Connection.Connected;
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('UPDATE agrojun.usuarios SET ativo = :ativo, senha = :senha, Tipo_Usuario = :Tipo_Usuario where id = :id');
      Query.ParamByName('id').AsInteger := Cod_Selecao;
      Query.ParamByName('senha').AsString := Criptografa(ed_Senha.Text);
      Query.ParamByName('Tipo_Usuario').AsInteger := cbx_TipoUsuario.ItemIndex;
      Query.ParamByName('ativo').AsInteger := cbx_ativo.ItemIndex;
      Query.ExecSQL;

    finally
      FreeAndNil(Query);
    end;
  end;

  LimpaCampos;
  Consultausuarios;
  tab_Crud.ActiveTab := TabItem1;

end;

procedure TFrmCadUsuario.lst_PrincipalItemClick(const Sender: TObject; const AItem: TListViewItem);
const
  SQLUserPopula = ' select id, nome, login, senha, ' + ' Tipo_Usuario, ativo from usuarios where id = :cod';
var
  x: integer;
  txt: TListItemText;
  Quser1: TFDQuery;
begin
  inherited;
  lst_Telas.Enabled := false;
  with AItem do
  begin
    txt := TListItemText(Objects.FindDrawable('codigo'));
    Cod_Selecao := txt.TagString.ToInteger;

    try
      Quser1 := TFDQuery.Create(self);
      Quser1.Connection := dm.FDConnection;
      quser1.FetchOptions.RowsetSize := 50000;
      Quser1.Active := false;
      Quser1.SQL.Clear;
      Quser1.SQL.Add(SQLUserPopula);
      Quser1.ParamByName('cod').AsString := txt.TagString;
      Quser1.Active := true;

      tab_Crud.TabIndex := 1;

      usuario := Quser1.FieldByName('id').AsInteger;
      ed_NomeUsuario.Text := Quser1.FieldByName('nome').AsString;
      ed_Usuario.Text := Quser1.FieldByName('login').AsString;
      ed_Senha.Text := DesCriptografa(Quser1.FieldByName('senha').AsString);
      ed_ConfirmaSenha.Text := DesCriptografa(Quser1.FieldByName('senha').AsString);
      cbx_TipoUsuario.ItemIndex := Quser1.FieldByName('Tipo_Usuario').AsInteger;
      cbx_ativo.ItemIndex := Quser1.FieldByName('ativo').AsInteger;


      // tira essa bosta depois
      // cbx_TipoUsuarioChangeTracking(self);
      // populaLstTelas;

    finally
      FreeAndNil(Quser1);
    end;

  end;
end;

procedure TFrmCadUsuario.lst_TelasItemClick(const Sender: TObject; const AItem: TListViewItem);
var
  x: integer;
  txt: TListItemText;
begin
  inherited;
  with AItem do
  begin
    txt := TListItemText(Objects.FindDrawable('codigo'));

    if cds_Telas.Locate('codigo', txt.TagString, []) then

      cds_Telas.Edit;
    case cds_Telas.FieldByName('selecionado').AsInteger of
      0:
        cds_Telas.FieldByName('selecionado').AsInteger := 1;
      1:
        cds_Telas.FieldByName('selecionado').AsInteger := 0;
    end;
    cds_Telas.Post;
    populaLstTelas;

  end;
end;

procedure TFrmCadUsuario.populaLstTelas;

var
  item: TListViewItem;
  txt: TListItemText;
  img: TListItemImage;
  x, I: integer;
  Quser2: TFDQuery;
begin

  cds_Telas.First;

  lst_Telas.Items.Clear;
  lst_Telas.BeginUpdate;

  for x := 1 to cds_Telas.RecordCount do
  begin

    item := lst_Telas.Items.Add;
    with item do
    begin
      txt := TListItemText(Objects.FindDrawable('codigo'));
      txt.Text := formatfloat('0000', cds_Telas.FieldByName('codigo').AsFloat);
      txt.TagString := cds_Telas.FieldByName('codigo').AsString;

      txt := TListItemText(Objects.FindDrawable('nome_tela'));
      txt.Text := cds_Telas.FieldByName('nome_tela').AsString;

      img := TListItemImage(Objects.FindDrawable('selecionado'));
      if cds_Telas.FieldByName('selecionado').AsInteger = 1 then
        img.Bitmap := img_selecionado.Bitmap;

    end;
    cds_Telas.Next;
  end;
  lst_Telas.EndUpdate;

end;

procedure TFrmCadUsuario.Validar(cod_vali: integer);
begin
  if (cod_vali = 0) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 3001: ' + sLineBreak + 'Este Usuario já existe!';
    ed_Usuario.SetFocus;
    abort;
  end;

  if (cod_vali = 3) then
  begin
  if not(ed_Senha.Text = ed_ConfirmaSenha.Text) then
  begin
     lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 3002: ' + sLineBreak + 'As senhas não conferem!';
    ed_Senha.Text := EmptyStr;
    ed_ConfirmaSenha.Text := EmptyStr;
    ed_Senha.SetFocus;
    abort;
  end
  else
    lay_error.Visible := false;

  end;

  if (cod_vali = 2) then
  begin
    if (cbx_TipoUsuario.ItemIndex = 0) then
    begin
      lay_error.Visible := true;
      lbl_Erro.Text := 'Erro 3003: ' + sLineBreak + 'Informe um tipo de usuario valido!';
      cbx_TipoUsuario.SetFocus;
      abort;
    end;
  end;

  if (cod_vali = 2) then
  begin
    if (cbx_ativo.ItemIndex = 0) then
    begin
      lay_error.Visible := true;
      lbl_Erro.Text := 'Erro 3004: ' + sLineBreak + 'Informe o status do usuario!';
      cbx_ativo.SetFocus;
      abort;
    end;
  end;

  if (cod_vali = 2) then
  begin
    if (ed_Usuario.Text = EmptyStr) then
    begin
      lay_error.Visible := true;
      lbl_Erro.Text := 'Erro 3005: ' + sLineBreak + 'Informe o usuario para login!';
      ed_Usuario.SetFocus;
      abort;
    end;
  end;

  if (cod_vali = 2) then
  begin
    if (ed_NomeUsuario.Text = EmptyStr) then
    begin
      lay_error.Visible := true;
      lbl_Erro.Text := 'Erro 3006: ' + sLineBreak + 'Informe o nome do usuario!';
      ed_NomeUsuario.SetFocus;
      abort;
    end;
  end;
  if (cod_vali = 2) then
  begin
    if (ed_Senha.Text = EmptyStr) then
    begin
      lay_error.Visible := true;
      lbl_Erro.Text := 'Erro 3007: ' + sLineBreak + 'Informe uma senha!';
      ed_Senha.SetFocus;
      abort;
    end;
  end;

  if (cod_vali = 2) then
  begin
    if (ed_ConfirmaSenha.Text = EmptyStr) then
    begin
      lay_error.Visible := true;
      lbl_Erro.Text := 'Erro 3008: ' + sLineBreak + 'Por favor Confira sua senha!';
      ed_ConfirmaSenha.SetFocus;
      abort;
    end;
  end;

end;

end.
