unit u_CadContaBanco;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  u_CrudCad, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.Objects, FMX.ListView, FMX.TabControl,
  FMX.Controls.Presentation, FMX.Layouts, FMX.ComboEdit, FMX.Edit,
  u_DM, Data.DB, Datasnap.DBClient, u_Library, FMX.EditBox, FMX.NumberBox,
  MidasLib, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.SearchBox,
  FMX.DateTimeCtrls, FireDAC.Stan.Async, FireDAC.DApt;

type
  TFrmCadContaBanco = class(TFrmCrud)
    Layout5: TLayout;
    ed_conta: TEdit;
    ed_Titular: TEdit;
    ed_descricao: TEdit;
    ed_Agencia: TEdit;
    cbx_TipoConta: TComboEdit;
    ed_saldo: TEdit;
    cds_log: TFDMemTable;
    cds_logtitular: TStringField;
    cds_logcpf_titular: TStringField;
    cds_logconta: TStringField;
    cds_logagencia: TStringField;
    cds_logbanco: TStringField;
    cds_logtipo_conta: TStringField;
    cds_logdescricao: TStringField;
    cds_logsaldo: TStringField;
    cds_logid: TStringField;
    ed_cpf: TEdit;
    TabItem3: TTabItem;
    Layout7: TLayout;
    Layout9: TLayout;
    lay_error2: TLayout;
    Rectangle4: TRectangle;
    lbl_error2: TLabel;
    cds_log2: TFDMemTable;
    cds_log2QtdAnteriorRemetente: TStringField;
    cds_log2QtdAnteriorDest: TStringField;
    cds_log2ValorTransf: TStringField;
    cds_log2QtdAtualRem: TStringField;
    cds_log2QtdAtualDest: TStringField;
    cds_log2idRemetente: TIntegerField;
    cds_log2idDestinatario: TIntegerField;
    cds_log2idUser: TIntegerField;
    TabItem4: TTabItem;
    Layout14: TLayout;
    Layout16: TLayout;
    lay_error3: TLayout;
    Rectangle5: TRectangle;
    lbl_error3: TLabel;
    cds_log3: TFDMemTable;
    IntegerField3: TIntegerField;
    cds_log3idConta: TIntegerField;
    cds_log3QtdAtual: TStringField;
    cds_log3QtdAnterior: TStringField;
    cds_log3Valor: TStringField;
    TabBancos: TTabItem;
    Layout20: TLayout;
    ed_PesquisaBanco: TEdit;
    ClearEditButton2: TClearEditButton;
    lytInfoPessoa: TLayout;
    ListViewBanco: TListView;
    lay_lstvazia: TLayout;
    Image4: TImage;
    Label21: TLabel;
    ed_Banco: TEdit;
    ClearEditButton3: TClearEditButton;
    cds_log3descricao: TStringField;
    cds_log2descricao: TStringField;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Rectangle8: TRectangle;
    Rectangle9: TRectangle;
    Rectangle10: TRectangle;
    Rectangle11: TRectangle;
    QBanco: TFDQuery;
    Label28: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label29: TLabel;
    Image2: TImage;
    Image7: TImage;
    Layout1: TLayout;
    Rectangle12: TRectangle;
    Layout24: TLayout;
    Rectangle13: TRectangle;
    Layout26: TLayout;
    Rectangle14: TRectangle;
    Layout27: TLayout;
    Image20: TImage;
    Layout8: TLayout;
    Img_Salvar: TImage;
    Img_Cancelar: TImage;
    Layout23: TLayout;
    Image5: TImage;
    Image6: TImage;
    Label8: TLabel;
    cbx_Remetente: TComboEdit;
    cbx_Destinatario: TComboEdit;
    Label13: TLabel;
    DateEditTransf: TDateEdit;
    Label30: TLabel;
    ed_Qtd: TEdit;
    Label31: TLabel;
    ed_ObsTransf: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    cbx_Contas: TComboEdit;
    ed_Obs: TEdit;
    ed_Valor: TEdit;
    DateEditDeposito: TDateEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Img_BtnSalvarClick(Sender: TObject);
    procedure ed_cpfExit(Sender: TObject);
    procedure ed_saldoKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure cbx_BancoExit(Sender: TObject);
    procedure lst_PrincipalItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Img_BtnExcluirClick(Sender: TObject);
    procedure Img_BtnEditarClick(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Img_CancelarClick(Sender: TObject);
    procedure ed_QtdKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure cbx_RemetenteChange(Sender: TObject);
    procedure cbx_DestinatarioChange(Sender: TObject);
    procedure Img_SalvarClick(Sender: TObject);
    procedure img_CancelarDepClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure ed_ValorKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure Img_SalvarDepClick(Sender: TObject);
    procedure ed_BancoEnter(Sender: TObject);
    procedure ed_PesquisaBancoChangeTracking(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure ListViewBancoItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure cbx_ContasChange(Sender: TObject);
    procedure Image5Click(Sender: TObject);
  private
    sbBanco : TSearchBox;
    procedure Validar(cod_vali: integer);
    procedure BuscarBanco;
    procedure ConsultaBanco;
    procedure LogContaBanco;
    procedure ValidarTransferencia;
    procedure ConsultaContaRemetente;
    procedure ConsultaContaDestinaria(remetente: string);
    function BuscarSaldo(id: integer): double;
    function AlteraSaldo(id: integer; saldo: double): integer;
    procedure LogTransBancaria;
    procedure ConsultaContaDep;
    procedure ValidarDep;
    procedure LogDep;
    procedure ConsultaBancos;
  public
    { Public declarations }
  end;

var
  FrmCadContaBanco: TFrmCadContaBanco;
  Cod_Selecao: integer;

implementation

uses
  Winapi.Windows, System.DateUtils;

{$R *.fmx}
{ TFrmCadContaBanco }

procedure TFrmCadContaBanco.ConsultaBanco;
const
  _SQLbanco =
    'SELECT cb.*, b.banco FROM agrojun.contas_bancarias cb left outer join bancos b on (cb.cod_banco = b.cod) ';
var
  x: integer;
  QBanco: TFDQuery;
  item: TListViewItem;
  txt: TListItemText;
begin

  try
    QBanco := TFDQuery.Create(self);
    QBanco.Connection := dm.FDConnection;
    QBanco.FetchOptions.RowsetSize := 50000;
    QBanco.Active := false;
    QBanco.SQL.Clear;
    QBanco.SQL.Add(_SQLbanco);
    QBanco.Active := true;
    QBanco.First;

    if (QBanco.RecordCount = 0) then
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
        txt := TListItemText(Objects.FindDrawable('lbl_codigo'));
        txt.Text := 'CÓDIGO';
        txt.TagString := '0';

        txt := TListItemText(Objects.FindDrawable('lbl_banco'));
        txt.Text := 'BANCO';

        txt := TListItemText(Objects.FindDrawable('lbl_conta'));
        txt.Text := 'CONTA';

        txt := TListItemText(Objects.FindDrawable('lbl_agencia'));
        txt.Text := 'AGÊNCIA';

        txt := TListItemText(Objects.FindDrawable('lbl_saldo'));
        txt.Text := 'SALDO';
      end;
    end;

    for x := 1 to QBanco.RecordCount do
    begin

      item := lst_Principal.Items.Add;

      with item do
      begin
        txt := TListItemText(Objects.FindDrawable('codigo'));
        txt.Text := formatfloat('0000', QBanco.FieldByName('id').AsFloat);
        txt.TagString := QBanco.FieldByName('id').AsString;

        txt := TListItemText(Objects.FindDrawable('banco'));
        txt.Text := QBanco.FieldByName('banco').AsString;

        txt := TListItemText(Objects.FindDrawable('agencia'));
        txt.Text := QBanco.FieldByName('agencia').AsString;

        txt := TListItemText(Objects.FindDrawable('conta'));
        txt.Text := QBanco.FieldByName('conta').AsString;

        txt := TListItemText(Objects.FindDrawable('saldo'));
        txt.Text := 'R$' + formatfloat('#,##0.00',
          QBanco.FieldByName('saldo').AsFloat);
      end;

      QBanco.Next
    end;
  finally
    lst_Principal.EndUpdate;
    FreeAndNil(QBanco);
  end;
end;

procedure TFrmCadContaBanco.ConsultaBancos;
const
  _SQLbanco = 'select cod, banco from agrojun.bancos order by utilizado desc ';
var
  x,i: integer;
//  QBanco: TFDQuery;
  item: TListViewItem;
  txt: TListItemText;
begin

//    QBanco := TFDQuery.Create(self);
//    QBanco.Connection := dm.FDConnection;
////    QBanco.
//    QBanco.Active := false;
    QBanco.SQL.Clear;
    QBanco.SQL.Add(_SQLbanco);
    QBanco.Active := true;
    QBanco.First;

    if (QBanco.RecordCount = 0) then
    begin
      lay_lstvazia.Visible := true;
      lytInfoPessoa.Visible := false;
    end
    else
    begin
      lay_lstvazia.Visible := false;
      lytInfoPessoa.Visible := true;
    end;

    ListViewBanco.Items.Clear;
    ListViewBanco.BeginUpdate;

    for x := 1 to 1 do
    begin
      item := ListViewBanco.Items.Add;

      with item do
      begin
        txt := TListItemText(Objects.FindDrawable('lbl_codigo'));
        txt.Text := 'CÓDIGO';
        txt.TagString := '0';

        txt := TListItemText(Objects.FindDrawable('lbl_banco'));
        txt.Text := 'NOME';

      end;
    end;

    for i := 1 to QBanco.RecordCount do
    begin

      item := ListViewBanco.Items.Add;

      with item do
      begin
        txt := TListItemText(Objects.FindDrawable('codigo'));
        txt.Text := formatfloat('0000', QBanco.FieldByName('cod').AsFloat);
        txt.TagString := QBanco.FieldByName('cod').AsString;

        txt := TListItemText(Objects.FindDrawable('banco'));
        txt.Text := QBanco.FieldByName('banco').AsString;
      end;

      QBanco.Next
    end;
    ListViewBanco.EndUpdate;

end;

procedure TFrmCadContaBanco.ConsultaContaDep;
const
  _SQL = 'SELECT id, conta FROM agrojun.contas_bancarias';
var
  vCampo, cont: integer;
  vResultado: TStringList;
  valid: string;
begin
  dm.QAux := TFDQuery.Create(nil);
  dm.QAux.Connection := dm.FDConnection;
  vResultado := TStringList.Create;
  vResultado.Clear;
  try
    dm.QAux.Active := false;
    dm.QAux.SQL.Clear;
    dm.QAux.SQL.Text := _SQL;
    dm.QAux.Active := true;
    try
      vResultado.BeginUpdate;
      if not dm.QAux.IsEmpty then
      begin
        dm.QAux.First;
        vCampo := 0;
        // cont := 1;
        vResultado.Add('INFORME A CONTA...');
        while vCampo < dm.QAux.RecordCount do
        begin
          vResultado.Add(formatfloat('00000', dm.QAux.FieldByName('id').AsFloat)
            + ' - Conta: ' + dm.QAux.FieldByName('conta').AsString);
          dm.QAux.Next;
          // cont := cont + 1;
          vCampo := vCampo + 1;
        end;
      end;
      vResultado.EndUpdate;

      cbx_Contas.Items := vResultado;
    except
      //
    end;
  finally
    if dm.QAux.Active then
      FreeAndNil(dm.QAux);
  end;
end;

procedure TFrmCadContaBanco.ConsultaContaDestinaria(remetente: string);
const
  _SQL = 'SELECT id, conta FROM agrojun.contas_bancarias';
var
  vCampo, cont: integer;
  vResultado: TStringList;
  valid: string;
begin
  dm.QAux := TFDQuery.Create(nil);
  dm.QAux.Connection := dm.FDConnection;
  vResultado := TStringList.Create;
  vResultado.Clear;
  try
    dm.QAux.Active := false;
    dm.QAux.SQL.Clear;
    dm.QAux.SQL.Text := _SQL;
    dm.QAux.Active := true;
    try
      vResultado.BeginUpdate;
      if not dm.QAux.IsEmpty then
      begin
        dm.QAux.First;
        vCampo := 0;
        vResultado.Add('INFORME O DESTINATÁRIO...');
        while vCampo < dm.QAux.RecordCount do
        begin
          if dm.QAux.FieldByName('id').AsInteger <> StrToInt(remetente) then
            vResultado.Add(formatfloat('00000', dm.QAux.FieldByName('id')
              .AsFloat) + ' - Conta: ' + dm.QAux.FieldByName('conta').AsString);
          dm.QAux.Next;
          vCampo := vCampo + 1;
        end;
      end;
      vResultado.EndUpdate;

      cbx_Destinatario.Items := vResultado;
    except
      //
    end;
  finally
    if dm.QAux.Active then
      FreeAndNil(dm.QAux);
  end;
end;

procedure TFrmCadContaBanco.ConsultaContaRemetente;
const
  _SQL = 'SELECT id, conta FROM agrojun.contas_bancarias';
var
  vCampo, cont: integer;
  vResultado: TStringList;
  valid: string;
begin
  dm.QAux := TFDQuery.Create(nil);
  dm.QAux.Connection := dm.FDConnection;
  vResultado := TStringList.Create;
  vResultado.Clear;
  try
    dm.QAux.Active := false;
    dm.QAux.SQL.Clear;
    dm.QAux.SQL.Text := _SQL;
    dm.QAux.Active := true;
    try
      vResultado.BeginUpdate;
      if not dm.QAux.IsEmpty then
      begin
        dm.QAux.First;
        vCampo := 0;
        // cont := 1;
        vResultado.Add('INFORME O REMETENTE...');
        while vCampo < dm.QAux.RecordCount do
        begin
          vResultado.Add(formatfloat('00000', dm.QAux.FieldByName('id').AsFloat)
            + ' - Conta: ' + dm.QAux.FieldByName('conta').AsString);
          dm.QAux.Next;
          // cont := cont + 1;
          vCampo := vCampo + 1;
        end;
      end;
      vResultado.EndUpdate;

      cbx_Remetente.Items := vResultado;
    except
      //
    end;
  finally
    if dm.QAux.Active then
      FreeAndNil(dm.QAux);
  end;
end;



function TFrmCadContaBanco.AlteraSaldo(id: integer; saldo: double): integer;
const
  SQL = 'UPDATE agrojun.contas_bancarias SET saldo = :saldo WHERE id = :id';
var
  Query: TFDQuery;
begin
  try
    try
      Query := TFDQuery.Create(self);
      Query.Connection := dm.FDConnection;
      Query.FetchOptions.RowsetSize := 50000;
      Query.Active := false;
      Query.SQL.Clear;
      Query.SQL.Add(SQL);
      Query.ParamByName('saldo').AsFloat := saldo;
      Query.ParamByName('id').AsInteger := id;
      Query.ExecSQL;
      Result := 1;
    except
      Result := 0;
    end;
  finally
    FreeAndNil(Query);
  end;
end;

procedure TFrmCadContaBanco.BuscarBanco;
const
  _SQLVend = 'select banco from bancos';
var
  x: integer;
  QCbxBanco: TFDQuery;
begin

  try
    QCbxBanco := TFDQuery.Create(self);
    QCbxBanco.Connection := dm.FDConnection;
    QCbxBanco.FetchOptions.RowsetSize := 50000;
    QCbxBanco.Active := false;
    QCbxBanco.SQL.Clear;
    QCbxBanco.SQL.Add(_SQLVend);
    QCbxBanco.Active := true;
    QCbxBanco.First;

    for x := 1 to QCbxBanco.RecordCount do
    begin
      //cbx_Banco.Items.Add(QCbxBanco.FieldByName('banco').AsString);
      QCbxBanco.Next;
    end;

  finally
    FreeAndNil(QCbxBanco);
  end;
end;

function TFrmCadContaBanco.BuscarSaldo(id: integer): double;
const
  SQL = 'SELECT saldo from agrojun.contas_bancarias where id = :id';
var
  Query: TFDQuery;
begin
  try
    Query := TFDQuery.Create(self);
    Query.Connection := dm.FDConnection;
    Query.FetchOptions.RowsetSize := 50000;
    Query.Active := false;
    Query.SQL.Clear;
    Query.SQL.Add(SQL);
    Query.ParamByName('id').AsInteger := id;
    Query.Active := true;
    Result := Query.FieldByName('saldo').AsFloat;
  finally
    FreeAndNil(Query);
  end;
end;

procedure TFrmCadContaBanco.cbx_BancoExit(Sender: TObject);
begin
  inherited;
//  if (cbx_Banco.ItemIndex < 0) then
//    Validar(8)
end;

procedure TFrmCadContaBanco.cbx_ContasChange(Sender: TObject);
begin
  inherited;
  inherited;
  if cbx_Contas.ItemIndex <> 0 then
  begin
    ed_Valor.Enabled := true;
    ed_Obs.Enabled := true;
    DateEditDeposito.Enabled := true;
  end
  else
  begin
    DateEditDeposito.Enabled := false;
    ed_Valor.Enabled := false;
    ed_Obs.Enabled := false;
  end;
end;

procedure TFrmCadContaBanco.cbx_DestinatarioChange(Sender: TObject);
begin
  inherited;
  if cbx_Remetente.ItemIndex <> 0 then
  begin
    ed_Qtd.Enabled := true;
    ed_ObsTransf.Enabled := true;
    DateEditTransf.Enabled := true;
  end
  else
  begin
    ed_Qtd.Enabled := false;
    ed_ObsTransf.Enabled := false;
    DateEditTransf.Enabled := false;
  end;
end;

procedure TFrmCadContaBanco.cbx_RemetenteChange(Sender: TObject);
begin
  inherited;
  if cbx_Remetente.ItemIndex <> 0 then
  begin
    ConsultaContaDestinaria(copy(cbx_Remetente.Items[cbx_Remetente.ItemIndex], 0, 5));
    cbx_Destinatario.Enabled := true;
    cbx_Destinatario.ItemIndex := 0
  end
end;

procedure TFrmCadContaBanco.ed_BancoEnter(Sender: TObject);
var
  I: integer;
begin
  inherited;
  if ed_Banco.Text.IsEmpty then
  begin
    ConsultaBancos;
    ListViewBanco.SearchVisible := true;
    for I := 0 to ListViewBanco.Controls.Count - 1 do
      if ListViewBanco.Controls[I].ClassType = TSearchBox then
      begin
        sbBanco := TSearchBox(ListViewBanco.Controls[I]);
        Break;
      end;
    sbBanco.Height := 0;
    //Tipo_Busca := 0;
    tab_Crud.ActiveTab := TabBancos;
  end;
end;

procedure TFrmCadContaBanco.ed_cpfExit(Sender: TObject);
begin
  inherited;
  if (length(ed_cpf.Text) = 11) or (length(ed_cpf.Text) = 14) then
  begin
    if (length(ed_cpf.Text) = 11) then
      ed_cpf.Text := formacpf(ed_cpf.Text)
    else
      ed_cpf.Text := formacnpj(ed_cpf.Text);
  end
end;

procedure TFrmCadContaBanco.ed_PesquisaBancoChangeTracking(Sender: TObject);
begin
  inherited;
  sbBanco.Text := ed_PesquisaBanco.Text;
end;


procedure TFrmCadContaBanco.ed_QtdKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  FormatarMoeda(ed_Qtd, KeyChar);
end;

procedure TFrmCadContaBanco.ed_saldoKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  FormatarMoeda(ed_saldo, KeyChar);
end;

procedure TFrmCadContaBanco.ed_ValorKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  FormatarMoeda(ed_Valor, KeyChar)
end;

procedure TFrmCadContaBanco.FormCreate(Sender: TObject);
begin
  inherited;
  BuscarBanco;
  ConsultaBanco;
end;

procedure TFrmCadContaBanco.img_CancelarDepClick(Sender: TObject);
begin
  inherited;
  if mensagemConfirmacao('Deseja cancelar a tranferência?') = mrYes then
  begin
    tab_Crud.ActiveTab := TabItem1;
    cbx_Contas.ItemIndex := 0;
    ed_Valor.Text := EmptyStr;
    ed_Valor.Enabled := false;
    ed_Obs.Text := EmptyStr;
    ed_Obs.Enabled := false;
    DateEditDeposito.Date := Now;
    DateEditDeposito.Enabled := false;
  end;
end;

procedure TFrmCadContaBanco.Image2Click(Sender: TObject);
begin
  inherited;
  Acao := 5;
  ConsultaContaDep;
  cbx_Contas.ItemIndex := 0;
  tab_Crud.ActiveTab := TabItem4;
end;

procedure TFrmCadContaBanco.Image3Click(Sender: TObject);
begin
  inherited;
  ListViewBanco.Items.Clear;
  ed_PesquisaBanco.Text := EmptyStr;
  tab_Crud.ActiveTab := TabItem2;
end;

procedure TFrmCadContaBanco.Image5Click(Sender: TObject);
begin
  inherited;
  tab_Crud.ActiveTab := TabItem2;
end;

procedure TFrmCadContaBanco.Image7Click(Sender: TObject);
begin
  inherited;
  Acao := 4;
  ConsultaContaRemetente;
  cbx_Remetente.ItemIndex := 0;
  tab_Crud.ActiveTab := TabItem3;
end;

procedure TFrmCadContaBanco.Img_BtnEditarClick(Sender: TObject);
begin
  inherited;
  //
end;

procedure TFrmCadContaBanco.Img_BtnExcluirClick(Sender: TObject);

var
  x: integer;
  QDelete: TFDQuery;
begin
  inherited;

  try
    QDelete := TFDQuery.Create(self);
    QDelete.Connection := dm.FDConnection;
    QDelete.FetchOptions.RowsetSize := 50000;
    QDelete.Active := false;
    QDelete.SQL.Clear;
    QDelete.SQL.Add('DELETE FROM agrojun.contas_bancarias WHERE id = ' +
      IntToStr(Cod_Selecao));
    QDelete.ExecSQL;

  finally
    LogContaBanco;
    ConsultaBanco;
    tab_Crud.ActiveTab := TabItem1;
    FreeAndNil(QDelete);
  end;
end;

procedure TFrmCadContaBanco.Img_BtnSalvarClick(Sender: TObject);
const
  SQLInsert = 'INSERT INTO `agrojun`.`contas_bancarias` ' + '(`cod_banco`, ' +
    '`agencia`, ' + '`conta`, ' + '`tipo_conta`, ' +
    '`titular`, ' + '`cpf_titular`, ' + '`saldo`, ' + '`saldo_inicial`, ' + '`descricao`) ' +
    'VALUES ' + '(:cod_banco , ' + ':agencia, ' + ':conta, ' + ':tipo_conta, ' +
     ':titular, ' + ':cpf_titular, ' + ':saldo, ' + ':saldo_inicial, ' +
    ':descricao) ';

  SQLUpdate = 'UPDATE `agrojun`.`contas_bancarias` ' + 'SET ' +
    '`cod_banco` = :cod_banco, ' + '`agencia` = :agencia, ' +
    '`conta` = :conta, ' + '`tipo_conta` = :tipo_conta, ' +
    '`titular` = :titular, ' +
    '`cpf_titular` = :cpf_titular, ' + '`descricao` = :descricao, ' +
    '`saldo` = :saldo ' + 'WHERE `Id` = :cod ';

var
  Query: TFDQuery;
begin
  inherited;
  Validar(0);

  try
    Query := TFDQuery.Create(self);
    Query.Connection := dm.FDConnection;
    Query.FetchOptions.RowsetSize := 50000;
    Query.Close;
    Query.SQL.Clear;
    if Acao = 0 then
      Query.SQL.Add(SQLInsert)
    else
    begin
      Query.SQL.Add(SQLUpdate);
      Query.ParamByName('cod').AsInteger := Cod_Selecao;
    end;
    Query.ParamByName('cod_banco').AsInteger :=
      StrToInt(copy(ed_Banco.Text, 0, 3));
    Query.ParamByName('agencia').AsString := ed_Agencia.Text;
    Query.ParamByName('conta').AsString := ed_conta.Text;
    Query.ParamByName('tipo_conta').AsInteger := cbx_TipoConta.ItemIndex;
    Query.ParamByName('titular').AsString := ed_Titular.Text;
    Query.ParamByName('cpf_titular').AsString := ed_cpf.Text;
    Query.ParamByName('saldo').AsFloat :=
      strtofloat(StringReplace(ed_saldo.Text, '.', '', [rfReplaceAll]));
    if(Acao = 0) then
      Query.ParamByName('saldo_inicial').AsFloat :=
        strtofloat(StringReplace(ed_saldo.Text, '.', '', [rfReplaceAll]));
    Query.ParamByName('descricao').AsString := ed_descricao.Text;

    Query.ExecSQL;
    LogContaBanco;

  finally
    LimpaCampos;
    ConsultaBanco;
    tab_Crud.ActiveTab := TabItem1;
    if Acao = 0 then
    begin
      ShowMessage('Cadastro realizado com sucesso!');
      Img_BtnCancelar.Visible := true;
      Img_BtnSalvar.Visible := true;
    end
    else
    begin
      Img_BtnCancelar.Visible := false;
      Img_BtnSalvar.Visible := false;
      Img_BtnEditar.Visible := true;
      Img_BtnExcluir.Visible := true;
      ShowMessage('Cadastro alterado com sucesso!');
    end;
    ed_pesq.Enabled := true;
    lay_error.Visible := false;
    FreeAndNil(Query);
  end;

end;

procedure TFrmCadContaBanco.Img_CancelarClick(Sender: TObject);
begin
  inherited;
  if mensagemConfirmacao('Deseja cancelar a tranferência?') = mrYes then
  begin
    tab_Crud.ActiveTab := TabItem1;
    cbx_Remetente.ItemIndex := 0;
    cbx_Destinatario.ItemIndex := 0;
    cbx_Destinatario.Enabled := false;
    DateEditTransf.Date := Now;
    DateEditTransf.Enabled := false;
    ed_ObsTransf.Text := EmptyStr;
    ed_ObsTransf.Enabled := false;
    ed_Qtd.Text := EmptyStr;
    ed_Qtd.Enabled := false;
  end;
end;

procedure TFrmCadContaBanco.Img_SalvarClick(Sender: TObject);
var
  QtdR, QtdD, QtdFinalR, QtdFinalD: double;
begin
  inherited;
  ValidarTransferencia;
  if BuscarSaldo(StrToInt(copy(cbx_Remetente.Items[cbx_Remetente.ItemIndex], 0,
    5))) < strtofloat(StringReplace(ed_Qtd.Text, '.', '', [rfReplaceAll])) then
    ShowMessage
      ('A conta remetente não tem saldo suficiente para fazer essa transferência!')
  else
  begin
    try
      QtdR := BuscarSaldo
        (StrToInt(copy(cbx_Remetente.Items[cbx_Remetente.ItemIndex], 0, 5)));
      QtdD := BuscarSaldo
        (StrToInt(copy(cbx_Destinatario.Items
        [cbx_Destinatario.ItemIndex], 0, 5)));

      QtdFinalR := QtdR - strtofloat(StringReplace(ed_Qtd.Text, '.', '', [rfReplaceAll]));
      QtdFinalD := QtdD + strtofloat(StringReplace(ed_Qtd.Text, '.', '', [rfReplaceAll]));

      cds_log2.Active := false;
      cds_log2.Active := true;
      cds_log2.EmptyDataSet;
      cds_log2.insert;
      cds_log2.FieldByName('idUser').AsInteger := Cod_User;
      cds_log2.FieldByName('idRemetente').AsInteger :=
        StrToInt(copy(cbx_Remetente.Items[cbx_Remetente.ItemIndex], 0, 5));
      cds_log2.FieldByName('idDestinatario').AsInteger :=
        StrToInt(copy(cbx_Destinatario.Items
        [cbx_Destinatario.ItemIndex], 0, 5));
      cds_log2.FieldByName('QtdAnteriorRemetente').AsString := FloatToStr(QtdR);
      cds_log2.FieldByName('QtdAnteriorDest').AsString := FloatToStr(QtdD);
      cds_log2.FieldByName('ValorTransf').AsString := ed_Qtd.Text;
      cds_log2.FieldByName('QtdAtualRem').AsString := FloatToStr(QtdFinalR);
      cds_log2.FieldByName('QtdAtualDest').AsString := FloatToStr(QtdFinalD);
      cds_log2.FieldByName('descricao').AsString := ed_ObsTransf.Text;
      cds_log2.Post;

      LogTransBancaria;

      AlteraSaldo(StrToInt(copy(cbx_Remetente.Items[cbx_Remetente.ItemIndex], 0,
        5)), QtdFinalR);
      AlteraSaldo
        (StrToInt(copy(cbx_Destinatario.Items[cbx_Destinatario.ItemIndex], 0, 5)
        ), QtdFinalD);

    finally
      cbx_Remetente.ItemIndex := 0;
      cbx_Destinatario.ItemIndex := 0;
      cbx_Destinatario.Enabled := false;
      ed_Qtd.Text := EmptyStr;
      ed_Qtd.Enabled := false;
      ConsultaBanco;
      tab_Crud.ActiveTab := TabItem1;
      ShowMessage('Transferência feita com sucesso!');
    end;
  end;
end;

procedure TFrmCadContaBanco.Img_SalvarDepClick(Sender: TObject);
var
  QtdR, QtdFinalR: double;
begin
  inherited;
  ValidarDep;
  try
    QtdR := BuscarSaldo
      (StrToInt(copy(cbx_Contas.Items[cbx_Contas.ItemIndex], 0, 5)));

    QtdFinalR := QtdR + strtofloat(StringReplace(ed_Valor.Text, '.', '', [rfReplaceAll]));

    cds_log3.Active := false;
    cds_log3.Active := true;
    cds_log3.EmptyDataSet;
    cds_log3.insert;
    cds_log3.FieldByName('idUser').AsInteger := Cod_User;
    cds_log3.FieldByName('idConta').AsInteger :=
      StrToInt(copy(cbx_Contas.Items[cbx_Contas.ItemIndex], 0, 5));
    cds_log3.FieldByName('QtdAnterior').AsString := FloatToStr(QtdR);
    cds_log3.FieldByName('Valor').AsString := ed_Valor.Text;
    cds_log3.FieldByName('QtdAtual').AsString := FloatToStr(QtdFinalR);
    cds_log3.FieldByName('descricao').AsString := ed_Obs.Text;
    cds_log3.Post;

    AlteraSaldo(StrToInt(copy(cbx_Contas.Items[cbx_Contas.ItemIndex], 0,
      5)), QtdFinalR);

    LogDep;
  finally
    cbx_Contas.ItemIndex := 0;
    ed_Valor.Text := EmptyStr;
    ed_Valor.Enabled := false;
    ConsultaBanco;
    tab_Crud.ActiveTab := TabItem1;
    ShowMessage('Deposito feito com sucesso!');
  end;
end;

procedure TFrmCadContaBanco.ListViewBancoItemClick(const Sender: TObject;
  const AItem: TListViewItem);
const
  _SQLView =
    'select * from agrojun.bancos where cod = :id';
var
  txt: TListItemText;
  Query: TFDQuery;
  id: string;
begin
  inherited;
  ed_PesquisaBanco.Enabled := true;
  with AItem do
  begin
    txt := TListItemText(Objects.FindDrawable('lbl_codigo'));
    id := txt.TagString;
  end;
  if id.IsEmpty then
  begin
    try
      Query := TFDQuery.Create(self);
      Query.Connection := dm.FDConnection;
      Query.FetchOptions.RowsetSize := 50000;
      with AItem do
      begin

        txt := TListItemText(Objects.FindDrawable('codigo'));
        Cod_Selecao := txt.TagString.ToInteger;
        Query.Active := false;
        Query.SQL.Clear;
        Query.SQL.Add(_SQLView);
        Query.ParamByName('id').AsInteger := txt.TagString.ToInteger;
        Query.Active := true;

        if Query.RecordCount > 0 then
        begin
          ed_Banco.Text := Query.FieldByName('banco').AsString;
          tab_Crud.ActiveTab := TabItem2;
        end
        else
        begin
          ShowMessage
            ('Não foi possível carregar o dados desse banco. Tente outra vez.');
          tab_Crud.ActiveTab := TabItem2;
        end;
      end;
    finally
      FreeAndNil(Query);
      ed_PesquisaBanco.Text := EmptyStr;
    end;
  end
  else
    exit
end;

procedure TFrmCadContaBanco.LogContaBanco;
begin

  if Acao = 0 then
  begin

    log(0002, MaxCod('contas_bancarias'), '',
     ' cpf_titular: ' + ed_cpf.Text +
      ' conta: ' + ed_conta.Text + ' titular: ' + ed_Titular.Text +
      ' descricao: ' + ed_descricao.Text + ' agencia: ' + ed_Agencia.Text +
      ' saldo: ' + ed_saldo.Text +  ' tipo_conta: ' +
      cbx_TipoConta.ItemIndex.ToString + ' banco: ' +
      copy(ed_Banco.Text, 0, 3));
  end;

  if Acao = 1 then
  begin

    log(0002, cds_log.FieldByName('id').AsInteger,
      ' cpf_titular: ' + cds_log.FieldByName('cpf_titular').AsString +
      ' conta: ' + cds_log.FieldByName('conta').AsString + ' titular: ' +
      cds_log.FieldByName('titular').AsString + ' descricao: ' +
      cds_log.FieldByName('descricao').AsString + ' agencia: ' +
      cds_log.FieldByName('agencia').AsString + ' saldo: ' +
      cds_log.FieldByName('saldo').AsString + ' tipo_conta: '
      + cds_log.FieldByName('tipo_conta').AsString + ' banco: ' +
      cds_log.FieldByName('banco').AsString,

      ' cpf_titular: ' + ed_cpf.Text + ' conta: ' + ed_conta.Text + ' titular: '
      + ed_Titular.Text + ' descricao: ' + ed_descricao.Text + ' agencia: ' +
      ed_Agencia.Text + ' saldo: ' + ed_saldo.Text + ' tipo_conta: ' +
      cbx_TipoConta.ItemIndex.ToString + ' banco: ' +
      copy(ed_Banco.Text, 0, 3));
  end;

  if Acao = 2 then
  begin
    log(0002, cds_log.FieldByName('id').AsInteger,
      ' cpf_titular: ' + cds_log.FieldByName('cpf_titular').AsString +
      ' conta: ' + cds_log.FieldByName('conta').AsString + ' titular: ' +
      cds_log.FieldByName('titular').AsString + ' descricao: ' +
      cds_log.FieldByName('descricao').AsString + ' agencia: ' +
      cds_log.FieldByName('agencia').AsString + ' saldo: ' +
      cds_log.FieldByName('saldo').AsString +  ' tipo_conta: '
      + cds_log.FieldByName('tipo_conta').AsString + ' banco: ' +
      cds_log.FieldByName('banco').AsString, '')
  end;

end;

procedure TFrmCadContaBanco.LogDep;
const
  SQL = 'INSERT INTO agrojun.deposito ( id_conta, id_usuario, saldo_anterior, valor, saldo_atual, data_deposito, descricao)   '
    + ' VALUES  (:id_conta, :id_usuario, :saldo_anterior, :valor, :saldo_atual, :data_deposito, :descricao)';
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.Create(self);
    qry.Connection := dm.FDConnection;
    Qry.FetchOptions.RowsetSize := 50000;
    qry.Close;
    qry.SQL.Clear;

    qry.SQL.Add(SQL);

    qry.ParamByName('id_conta').AsInteger :=
      cds_log3.FieldByName('idConta').AsInteger;
    qry.ParamByName('id_usuario').AsInteger := cds_log3.FieldByName('idUser')
      .AsInteger;
    qry.ParamByName('saldo_anterior').AsFloat :=
      strtofloat(StringReplace(cds_log3.FieldByName('QtdAnterior')
      .AsString, '.', '', [rfReplaceAll]));
    qry.ParamByName('valor').AsFloat :=
      strtofloat(StringReplace(cds_log3.FieldByName('Valor').AsString,
      '.', '', [rfReplaceAll]));
    qry.ParamByName('saldo_atual').AsFloat :=
      strtofloat(StringReplace(cds_log3.FieldByName('QtdAtual').AsString,
      '.', '', [rfReplaceAll]));
    qry.ParamByName('data_deposito').AsDateTime := DateEditDeposito.Date;
    qry.ParamByName('descricao').AsString :=
      cds_log3.FieldByName('descricao').AsString;

    qry.ExecSQL;

  finally
    FreeAndNil(qry);
  end;
end;

procedure TFrmCadContaBanco.LogTransBancaria;
const
  SQL = 'INSERT INTO agrojun.transferencia_bancaria ( id_remetente, id_destinatario, qtd_anterior_remet, qtd_anterior_dest, qtd_transferida, qtd_atual_remet, qtd_atual_dest, id_usuario, data_transferencia, descricao)   '
    + ' VALUES  (:id_remetente, :id_destinatario, :qtd_anterior_remet, :qtd_anterior_dest, :qtd_transferida, :qtd_atual_remet, :qtd_atual_dest, :id_usuario, :data_transferencia, :descricao)';
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.Create(self);
    qry.Connection := dm.FDConnection;
    Qry.FetchOptions.RowsetSize := 50000;
    qry.Close;
    qry.SQL.Clear;

    qry.SQL.Add(SQL);

    qry.ParamByName('id_remetente').AsInteger :=
      cds_log2.FieldByName('idRemetente').AsInteger;
    qry.ParamByName('id_destinatario').AsInteger :=
      cds_log2.FieldByName('idDestinatario').AsInteger;
    qry.ParamByName('id_usuario').AsInteger := cds_log2.FieldByName('idUser')
      .AsInteger;
    qry.ParamByName('qtd_anterior_remet').AsFloat :=
      strtofloat(StringReplace(cds_log2.FieldByName('QtdAnteriorRemetente')
      .AsString, '.', '', [rfReplaceAll]));
    qry.ParamByName('qtd_anterior_dest').AsFloat :=
      strtofloat(StringReplace(cds_log2.FieldByName('QtdAnteriorDest').AsString,
      '.', '', [rfReplaceAll]));
    qry.ParamByName('qtd_transferida').AsFloat :=
      strtofloat(StringReplace(cds_log2.FieldByName('ValorTransf').AsString,
      '.', '', [rfReplaceAll]));
    qry.ParamByName('qtd_atual_remet').AsFloat :=
      strtofloat(StringReplace(cds_log2.FieldByName('QtdAtualRem').AsString,
      '.', '', [rfReplaceAll]));
    qry.ParamByName('qtd_atual_dest').AsFloat :=
      strtofloat(StringReplace(cds_log2.FieldByName('QtdAtualDest').AsString,
      '.', '', [rfReplaceAll]));
    qry.ParamByName('data_transferencia').AsDateTime := DateEditTransf.Date;
    qry.ParamByName('descricao').AsString :=
      cds_log2.FieldByName('descricao').AsString;
    qry.ExecSQL;

  finally
    FreeAndNil(qry);
  end;
end;

procedure TFrmCadContaBanco.lst_PrincipalItemClick(const Sender: TObject;
  const AItem: TListViewItem);
const
  _SQLView =
    'SELECT cb.*, b.banco FROM agrojun.contas_bancarias cb left outer join bancos b on (cb.cod_banco = b.cod) where cb.id = :cod';
var
  txt: TListItemText;
  Query: TFDQuery;
  id: string;
begin
  inherited;
  with AItem do
  begin
    txt := TListItemText(Objects.FindDrawable('lbl_codigo'));
    id := txt.TagString;
  end;

  if id.IsEmpty then
  begin
    try
      Query := TFDQuery.Create(self);
      Query.Connection := dm.FDConnection;
      Query.FetchOptions.RowsetSize := 50000;
      tab_Crud.ActiveTab := TabItem2;
      with AItem do
      begin

        txt := TListItemText(Objects.FindDrawable('codigo'));
        Cod_Selecao := txt.TagString.ToInteger;
        Query.Active := false;
        Query.SQL.Clear;
        Query.SQL.Add(_SQLView);
        Query.ParamByName('cod').AsInteger := Cod_Selecao;
        Query.Active := true;

        cds_log.Active := false;
        cds_log.Active := true;
        cds_log.EmptyDataSet;
        cds_log.insert;
        cds_log.FieldByName('id').AsString := IntToStr(Cod_Selecao);
        cds_log.FieldByName('cpf_titular').AsString :=
          Query.FieldByName('cpf_titular').AsString;
        cds_log.FieldByName('conta').AsString := Query.FieldByName('conta')
          .AsString;;
        cds_log.FieldByName('titular').AsString :=
          Query.FieldByName('titular').AsString;
        cds_log.FieldByName('descricao').AsString :=
          Query.FieldByName('descricao').AsString;
        cds_log.FieldByName('agencia').AsString :=
          Query.FieldByName('agencia').AsString;
        cds_log.FieldByName('saldo').AsString :=
          Query.FieldByName('saldo').AsString;
        cds_log.FieldByName('tipo_conta').AsString :=
          Query.FieldByName('tipo_conta').AsString;
        cds_log.FieldByName('banco').AsString :=
          Query.FieldByName('banco').AsString;
        cds_log.Post;

        if Query.RecordCount > 0 then
        begin
          ed_cpf.Text := Query.FieldByName('cpf_titular').AsString;
          ed_conta.Text := Query.FieldByName('conta').AsString;
          ed_Titular.Text := Query.FieldByName('titular').AsString;
          ed_descricao.Text := Query.FieldByName('descricao').AsString;
          ed_Agencia.Text := Query.FieldByName('agencia').AsString;
          ed_saldo.Text := Query.FieldByName('saldo').AsString;

          cbx_TipoConta.ItemIndex := Query.FieldByName('tipo_conta').AsInteger;
          ed_Banco.Text := Query.FieldByName('banco').AsString;
        end
        else
        begin
          tab_Crud.ActiveTab := TabItem1;
          Validar(2);
        end;
      end;
    finally
      FreeAndNil(Query);
    end;
  end
  else
    exit

end;

procedure TFrmCadContaBanco.Validar(cod_vali: integer);
begin
  // if (cod_vali = 1) then
  // begin
  // lay_error.Visible := true;
  // lbl_Erro.Text := 'Erro 2001 : ' + sLineBreak +
  // 'Informe um CPF/CNPJ Valido!';
  // ed_cpf.SetFocus;
  // abort;
  // end;
  if (ed_cpf.Text = EmptyStr) or ((ed_cpf.Text.length <> 14) and
    (ed_cpf.Text.length <> 18)) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 2001 : ' + sLineBreak + 'Informe o CPF/CNPJ válido!';
    ed_cpf.SetFocus;
    abort;
  end;

  if (ed_conta.Text = EmptyStr) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 2002 : ' + sLineBreak + 'Informe uma Conta Valida!';
    ed_conta.SetFocus;
    abort;
  end;

  if (ed_Titular.Text = EmptyStr) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 2003: ' + sLineBreak + 'Informe um Titular Valido!';
    ed_Titular.SetFocus;
    abort;
  end;

  if (ed_Agencia.Text = EmptyStr) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 2004: ' + sLineBreak + 'Informe uma Agencia Valida!';
    ed_Agencia.SetFocus;
    abort;
  end;

  if (ed_saldo.Text = EmptyStr) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 2005: ' + sLineBreak +
      'Informe um Saldo para a conta!';
    ed_Agencia.SetFocus;
    abort;
  end;



  if (cbx_TipoConta.ItemIndex < 0) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 2007: ' + sLineBreak + 'Informe o Tipo da Conta!';
    cbx_TipoConta.SetFocus;
    abort;
  end;

  if (ed_Banco.Text.IsEmpty) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 2008: ' + sLineBreak + 'Informe o Banco da Conta!';
    ed_Banco.SetFocus;
    abort;
  end;

  if (cod_vali = 2) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 2009 : ' + sLineBreak +
      'Conta Bancaria não encontrada!!';
    abort;
  end;

end;

procedure TFrmCadContaBanco.ValidarDep;
begin
  if (cbx_Contas.ItemIndex = 0) or (cbx_Contas.ItemIndex = -1) then
  begin
    lay_error3.Visible := true;
    lbl_error2.Text := 'Erro 2010 : ' + sLineBreak + 'Informe uma CONTA!';
    cbx_Contas.SetFocus;
    abort;
  end;

  if (ed_Valor.Text = EmptyStr) then
  begin
    lay_error3.Visible := true;
    lbl_error3.Text := 'Erro 2011 : ' + sLineBreak +
      'Informe um VALOR a ser depositado!';
    ed_Valor.SetFocus;
    abort;
  end;
end;

procedure TFrmCadContaBanco.ValidarTransferencia;
begin
  if (cbx_Destinatario.ItemIndex = 0) or (cbx_Destinatario.ItemIndex = -1) then
  begin
    lay_error2.Visible := true;
    lbl_error2.Text := 'Erro 2010 : ' + sLineBreak + 'Informe o DESTINATÁRIO!';
    cbx_Destinatario.SetFocus;
    abort;
  end;

  if (ed_Qtd.Text = EmptyStr) then
  begin
    lay_error2.Visible := true;
    lbl_error2.Text := 'Erro 2011 : ' + sLineBreak +
      'Informe um VALOR a ser transferido!';
    ed_Qtd.SetFocus;
    abort;
  end;
end;

end.
