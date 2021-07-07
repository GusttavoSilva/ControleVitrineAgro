unit u_CadCompra;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  u_CrudCad, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.Edit, FMX.Objects, FMX.ListView,
  FMX.TabControl, FMX.Controls.Presentation, FMX.Layouts, FMX.ComboEdit,
  FMX.DateTimeCtrls, FMX.TMSCustomEdit, FMX.TMSEdit, FMX.SearchBox,
  FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet;

type
  TFrmCadCompra = class(TFrmCrud)
    lytInfo: TLayout;
    Layout7: TLayout;
    lytData: TLayout;
    Label3: TLabel;
    DateEditCompra: TDateEdit;
    lytFornecedor: TLayout;
    Label5: TLabel;
    lytConta: TLayout;
    Label6: TLabel;
    lytLote: TLayout;
    Label7: TLabel;
    Layout14: TLayout;
    lytObs: TLayout;
    ed_Obs: TEdit;
    lytMotorista: TLayout;
    Label8: TLabel;
    Label9: TLabel;
    lytTipoAnimal: TLayout;
    cbx_TipoAnimal: TComboEdit;
    Label10: TLabel;
    lytSexoAnimal: TLayout;
    cbx_SexoAnimal: TComboEdit;
    Label11: TLabel;
    lytIdadeAnimal: TLayout;
    cbx_IdadeAnimal: TComboEdit;
    Label12: TLabel;
    lytValorTotalAnimal: TLayout;
    ed_ValorTotalAnimal: TEdit;
    Label13: TLabel;
    lytValorPorAnimal: TLayout;
    ed_ValorPorAnimal: TEdit;
    lytEtiqueta: TLayout;
    ed_Etiqueta: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Layout5: TLayout;
    lytTipoCaminhao: TLayout;
    Label24: TLabel;
    cbx_TipoCaminhao: TComboEdit;
    Layout8: TLayout;
    ed_PlacaCaminhao: TEdit;
    Label25: TLabel;
    lytTotalFrete: TLayout;
    ed_ValorTotalFrete: TEdit;
    Label26: TLabel;
    Label27: TLabel;
    lytFretePorAnimal: TLayout;
    ed_ValorFretePorAnimal: TEdit;
    Label28: TLabel;
    lytCorretor: TLayout;
    Label29: TLabel;
    lytValorTotalComissao: TLayout;
    ed_ValorTotalComissao: TEdit;
    Label30: TLabel;
    Label31: TLabel;
    Layout10: TLayout;
    ed_ValorComisPorAnimal: TEdit;
    Label32: TLabel;
    Label33: TLabel;
    Layout11: TLayout;
    lytQuantidade: TLayout;
    ed_Quantidade: TEdit;
    Label4: TLabel;
    Label34: TLabel;
    lytFiltros: TLayout;
    ComboEditFiltros: TComboEdit;
    lytEntradaFiltros: TLayout;
    lytFiltroData: TLayout;
    DateEditData1: TDateEdit;
    DateEditData2: TDateEdit;
    Label35: TLabel;
    Label36: TLabel;
    lytFiltroOutros: TLayout;
    ed_Filtro: TTMSFMXEdit;
    lytValorTotalCompra: TLayout;
    ed_ValorTotalCompra: TEdit;
    Label37: TLabel;
    lytValorTotalCompraAnimal: TLayout;
    ed_valorporcbs_compra: TEdit;
    Label38: TLabel;
    cds_log: TFDMemTable;
    cds_logid: TStringField;
    cds_logdata_compra: TDateTimeField;
    cds_loglote: TStringField;
    cds_logfornecedor: TStringField;
    cds_logconta_bancaria: TStringField;
    cds_logquantidade_cbs: TStringField;
    cds_logvalortotal_compra: TStringField;
    cds_logvalorporcbs_compra: TStringField;
    cds_logidade_animal: TStringField;
    cds_logsexo_animal: TStringField;
    cds_lograca_animal: TStringField;
    cds_logetiqueta: TStringField;
    cds_logtipo_caminhao: TStringField;
    cds_logplaca_caminhao: TStringField;
    cds_logmotorista: TStringField;
    cds_logvalortotal_frete: TStringField;
    cds_logvalorporcbs_frete: TStringField;
    cds_logcorretor: TStringField;
    cds_logvalortotal_comissao: TStringField;
    cds_logvalorporcbs_comissao: TStringField;
    cds_logdescricao: TStringField;
    cds_logvalortotal_animais: TStringField;
    cds_logvalorporcbs_animais: TStringField;
    TabLote: TTabItem;
    Layout9: TLayout;
    Image7: TImage;
    ed_PesquisaLote: TEdit;
    ClearEditButton7: TClearEditButton;
    lay_lstvaziaLote: TLayout;
    Image6: TImage;
    Label39: TLabel;
    ListViewLote: TListView;
    lytInfoLote: TLayout;
    Label40: TLabel;
    ed_Lote: TEdit;
    ClearEditButton2: TClearEditButton;
    TabPessoa: TTabItem;
    lay_lstvaziaPessoa: TLayout;asdasdasdad
    Image3: TImage;
    Label41: TLabel;
    Layout1: TLayout;
    Image2: TImage;
    ed_PesquisaPessoa: TEdit;
    ClearEditButton3: TClearEditButton;
    ListViewPessoa: TListView;
    lytInfoPessoa: TLayout;
    Label42: TLabel;
    ed_Pessoa: TEdit;
    ClearEditButton4: TClearEditButton;
    ed_Motorista: TEdit;
    ClearEditButton5: TClearEditButton;
    ed_Corretor: TEdit;
    ClearEditButton6: TClearEditButton;
    TabConta: TTabItem;
    lay_lstvaziaConta: TLayout;
    Image4: TImage;
    Label43: TLabel;
    Layout12: TLayout;
    ed_PesquisaConta: TEdit;
    ClearEditButton8: TClearEditButton;
    ListViewConta: TListView;
    lytInfoConta: TLayout;
    Label44: TLabel;
    ed_Conta: TEdit;
    ClearEditButton9: TClearEditButton;
    ckbCadNow1: TCheckBox;
    ckbCadNow2: TCheckBox;
    ckbCadNow3: TCheckBox;
    rbFisica1: TCheckBox;
    rbJuridica1: TCheckBox;
    rbFisica2: TCheckBox;
    rbJuridica2: TCheckBox;
    rbFisica3: TCheckBox;
    rbJuridica3: TCheckBox;
    Layout13: TLayout;
    cbx_FormaPagto: TComboEdit;
    Label45: TLabel;
    lblFormaPagto: TLabel;
    procedure ed_ValorTotalAnimalKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure ed_ValorTotalFreteKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure ed_ValorTotalComissaoKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure Img_BtnNovoClick(Sender: TObject);
    procedure ed_ValorTotalAnimalExit(Sender: TObject);
    procedure ed_ValorPorAnimalChange(Sender: TObject);
    procedure ed_ValorTotalFreteExit(Sender: TObject);
    procedure ed_ValorTotalComissaoExit(Sender: TObject);
    procedure ed_ValorFretePorAnimalChange(Sender: TObject);
    procedure ed_ValorComisPorAnimalChange(Sender: TObject);
    procedure Img_BtnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lst_PrincipalItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Img_BtnEditarClick(Sender: TObject);
    procedure Img_BtnCancelarClick(Sender: TObject);
    procedure Img_BtnExcluirClick(Sender: TObject);
    procedure ComboEditFiltrosChange(Sender: TObject);
    procedure BtnFiltroClick(Sender: TObject);
    procedure ed_LoteEnter(Sender: TObject);
    procedure ListViewLoteItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Image7Click(Sender: TObject);
    procedure ed_PesquisaLoteChangeTracking(Sender: TObject);
    procedure ed_PesquisaPessoaChangeTracking(Sender: TObject);
    procedure ed_PessoaEnter(Sender: TObject);
    procedure ListViewPessoaItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ed_MotoristaEnter(Sender: TObject);
    procedure ed_CorretorEnter(Sender: TObject);
    procedure ed_PesquisaContaChangeTracking(Sender: TObject);
    procedure ed_ContaEnter(Sender: TObject);
    procedure ListViewContaItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ckbCadNow1Change(Sender: TObject);
    procedure ckbCadNow2Change(Sender: TObject);
    procedure ckbCadNow3Change(Sender: TObject);
    procedure rbFisica1Change(Sender: TObject);
    procedure rbJuridica1Change(Sender: TObject);
    procedure rbFisica2Change(Sender: TObject);
    procedure rbFisica3Change(Sender: TObject);
    procedure rbJuridica2Change(Sender: TObject);
    procedure rbJuridica3Change(Sender: TObject);
    procedure ed_LoteKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    sbCompra: TSearchBox;
    sbLote: TSearchBox;
    Cod_Selecao: integer;
    sbPessoa: TSearchBox;
    sbConta: TSearchBox;
    { Private declarations }
    procedure Validar(cod_vali: integer);
    procedure CalcValorPorAnimal;
    function RetornaIdPessoa(nome: string): integer;
    function RetornaIdConta(conta: string): integer;
    function RetornaIdLote(numero: string): integer;
    procedure ConsultaIdadeAnimal;
    procedure ConsultaRacaAnimal;
    procedure ConsultaTipoCaminhao;
    function AlteraSaldo(id: integer; saldo: double): integer;
    function BuscarSaldo(id: integer): double;
    procedure ConsultaCompras;
    procedure PopularCampos(Query: TFDQuery);
    procedure PopulaListFiltros(QBanco: TFDQuery);
    procedure CalcValorTotal;
    procedure LogCompras;
    function AlteraQtdAnimaisLote(id: integer; saldo: double): integer;
    function BuscarQtdAnimaisLote(id: integer): double;
    procedure AddInfoLotes(id: integer; id_compra: integer; status: integer);
    procedure RemoveInfoLotes(id: integer);
    procedure ConsultaBancoLotes;
    procedure ConsultaBancoPessoas;
    procedure ConsultaConta;
    function ValidarPessoa( nome : string) : integer;
    procedure SalvarPessoa ( nome: string; tipo_pessoa : integer);
    function SalvarLote(numero :integer) : integer;
    procedure ConsultaFormaPagto;
  public
    { Public declarations }
  end;

var
  FrmCadCompra: TFrmCadCompra;
  ValorTotal: double;
  QtdAnimais: integer;
  Tipo_Busca: integer;

implementation

{$R *.fmx}

uses u_Library, u_DM;

{ TFrmCadCompra }

procedure TFrmCadCompra.AddInfoLotes(id: integer; id_compra: integer;
  status: integer);
const
  SQL = 'UPDATE agrojun.lotes SET id_compra =  :id_compra, status = :status WHERE id = :id';
var
  Query: TFDQuery;
begin
  try
    if id <> 0 then
    begin
      Query := TFDQuery.Create(self);
      Query.Connection := dm.FDConnection;
      Query.Active := false;
      Query.SQL.Clear;
      Query.SQL.Add(SQL);
      Query.ParamByName('id_compra').AsFloat := id_compra;
      Query.ParamByName('status').AsInteger := status;
      Query.ParamByName('id').AsInteger := id;
      Query.ExecSQL;
    end;
  finally
    FreeAndNil(Query);
  end;
end;

function TFrmCadCompra.AlteraQtdAnimaisLote(id: integer; saldo: double)
  : integer;
const
  SQL = 'UPDATE agrojun.lotes SET qtd_animais = :qtd_animais WHERE id = :id';
var
  Query: TFDQuery;
begin
  try
    try
      if id <> 0 then
      begin
        Query := TFDQuery.Create(self);
        Query.Connection := dm.FDConnection;
        Query.Active := false;
        Query.SQL.Clear;
        Query.SQL.Add(SQL);
        Query.ParamByName('qtd_animais').AsFloat := saldo;
        Query.ParamByName('id').AsInteger := id;
        Query.ExecSQL;
        Result := 1;
      end;
    except
      Result := 0;
    end;
  finally
    FreeAndNil(Query);
  end;
end;

function TFrmCadCompra.AlteraSaldo(id: integer; saldo: double): integer;
const
  SQL = 'UPDATE agrojun.contas_bancarias SET saldo = :saldo WHERE id = :id';
var
  Query: TFDQuery;
begin
  try
    try
      if id <> 0 then
      begin
        Query := TFDQuery.Create(self);
        Query.Connection := dm.FDConnection;
        Query.Active := false;
        Query.SQL.Clear;
        Query.SQL.Add(SQL);
        Query.ParamByName('saldo').AsFloat := saldo;
        Query.ParamByName('id').AsInteger := id;
        Query.ExecSQL;
        Result := 1;
      end;
    except
      Result := 0;
    end;
  finally
    FreeAndNil(Query);
  end;
end;

procedure TFrmCadCompra.BtnFiltroClick(Sender: TObject);
const
  _SQLData =
    ' select c.id, c.data_compra, c.quantidade_cbs, f.nome as fornecedor, cc.conta, l.numero as lote, c.valortotal_compra, c.valorporcbs_compra from compras as c '
    + ' left outer join pessoas as f on (f.id = c.fornecedor)                                                                                     '
    + ' left outer join contas_bancarias as cc on (cc.id = c.conta_bancaria)                                                                      '
    + ' left outer join lotes as l on (l.id = c.lote)                                                                                             '
    + ' where c.data_compra between :data1 and :data2 order by data_compra desc                                                     ';

  _SQLFornecedor =
    ' select c.id, c.data_compra, c.quantidade_cbs, f.nome as fornecedor, cc.conta, l.numero as lote, c.valortotal_compra, c.valorporcbs_compra from compras as c '
    + ' left outer join pessoas as f on (f.id = c.fornecedor)                                                                                     '
    + ' left outer join contas_bancarias as cc on (cc.id = c.conta_bancaria)                                                                      '
    + ' left outer join lotes as l on (l.id = c.lote)                                                                                             '
    + ' where c.fornecedor = :id order by data_compra desc                                                     ';

  _SQLConta =
    ' select c.id, c.data_compra, c.quantidade_cbs, f.nome as fornecedor, cc.conta, l.numero as lote, c.valortotal_compra, c.valorporcbs_compra from compras as c '
    + ' left outer join pessoas as f on (f.id = c.fornecedor)                                                                                     '
    + ' left outer join contas_bancarias as cc on (cc.id = c.conta_bancaria)                                                                      '
    + ' left outer join lotes as l on (l.id = c.lote)                                                                                             '
    + ' where c.conta_bancaria = :id order by data_compra desc                                                     ';

  _SQLLote =
    ' select c.id, c.data_compra, c.quantidade_cbs, f.nome as fornecedor, cc.conta, l.numero as lote, c.valortotal_compra, c.valorporcbs_compra from compras as c '
    + ' left outer join pessoas as f on (f.id = c.fornecedor)                                                                                     '
    + ' left outer join contas_bancarias as cc on (cc.id = c.conta_bancaria)                                                                      '
    + ' left outer join lotes as l on (l.id = c.lote)                                                                                             '
    + ' where c.lote = :id order by data_compra desc                                                     ';

  _SQLMotorista =
    ' select c.id, c.data_compra, c.quantidade_cbs, f.nome as fornecedor, cc.conta, l.numero as lote, c.valortotal_compra, c.valorporcbs_compra from compras as c '
    + ' left outer join pessoas as f on (f.id = c.fornecedor)                                                                                     '
    + ' left outer join contas_bancarias as cc on (cc.id = c.conta_bancaria)                                                                      '
    + ' left outer join lotes as l on (l.id = c.lote)                                                                                             '
    + ' where c.motorista = :id order by data_compra desc                                                     ';

  _SQLCorretor =
    ' select c.id, c.data_compra, c.quantidade_cbs, f.nome as fornecedor, cc.conta, l.numero as lote, c.valortotal_compra, c.valorporcbs_compra from compras as c '
    + ' left outer join pessoas as f on (f.id = c.fornecedor)                                                                                     '
    + ' left outer join contas_bancarias as cc on (cc.id = c.conta_bancaria)                                                                      '
    + ' left outer join lotes as l on (l.id = c.lote)                                                                                             '
    + ' where c.corretor = :id order by data_compra desc                                                     ';
var
  qry: TFDQuery;
begin
  inherited;
  if ComboEditFiltros.ItemIndex = 1 then
  begin
    qry := TFDQuery.Create(self);
    qry.Connection := dm.FDConnection;
    qry.Active := false;
    qry.SQL.Clear;
    qry.SQL.Add(_SQLData);
    qry.ParamByName('data1').AsDateTime := DateEditData1.Date;
    qry.ParamByName('data2').AsDateTime := DateEditData2.Date;
    qry.Active := true;
    qry.First;
    PopulaListFiltros(qry);
  end
  else if ComboEditFiltros.ItemIndex = 2 then
  begin
    qry := TFDQuery.Create(self);
    qry.Connection := dm.FDConnection;
    qry.Active := false;
    qry.SQL.Clear;
    qry.SQL.Add(_SQLFornecedor);
    qry.ParamByName('id').AsInteger := RetornaIdPessoa(ed_Filtro.Text);
    qry.Active := true;
    qry.First;
    PopulaListFiltros(qry);
  end
  else if ComboEditFiltros.ItemIndex = 3 then
  begin
    qry := TFDQuery.Create(self);
    qry.Connection := dm.FDConnection;
    qry.Active := false;
    qry.SQL.Clear;
    qry.SQL.Add(_SQLConta);
    qry.ParamByName('id').AsInteger := RetornaIdConta(ed_Filtro.Text);
    qry.Active := true;
    qry.First;
    PopulaListFiltros(qry);
  end
  else if ComboEditFiltros.ItemIndex = 4 then
  begin
    qry := TFDQuery.Create(self);
    qry.Connection := dm.FDConnection;
    qry.Active := false;
    qry.SQL.Clear;
    qry.SQL.Add(_SQLLote);
    qry.ParamByName('id').AsInteger := RetornaIdLote(ed_Filtro.Text);
    qry.Active := true;
    qry.First;
    PopulaListFiltros(qry);
  end
  else if ComboEditFiltros.ItemIndex = 5 then
  begin
    qry := TFDQuery.Create(self);
    qry.Connection := dm.FDConnection;
    qry.Active := false;
    qry.SQL.Clear;
    qry.SQL.Add(_SQLMotorista);
    qry.ParamByName('id').AsInteger := RetornaIdPessoa(ed_Filtro.Text);
    qry.Active := true;
    qry.First;
    PopulaListFiltros(qry);
  end
  else if ComboEditFiltros.ItemIndex = 6 then
  begin
    qry := TFDQuery.Create(self);
    qry.Connection := dm.FDConnection;
    qry.Active := false;
    qry.SQL.Clear;
    qry.SQL.Add(_SQLCorretor);
    qry.ParamByName('id').AsInteger := RetornaIdPessoa(ed_Filtro.Text);
    qry.Active := true;
    qry.First;
    PopulaListFiltros(qry);
  end;
end;

function TFrmCadCompra.BuscarQtdAnimaisLote(id: integer): double;
const
  SQL = 'SELECT qtd_animais from agrojun.lotes where id = :id';
var
  Query: TFDQuery;
begin
  try
    Query := TFDQuery.Create(self);
    Query.Connection := dm.FDConnection;
    Query.Active := false;
    Query.SQL.Clear;
    Query.SQL.Add(SQL);
    Query.ParamByName('id').AsInteger := id;
    Query.Active := true;
    Result := Query.FieldByName('qtd_animais').AsFloat;
  finally
    FreeAndNil(Query);
  end;
end;

function TFrmCadCompra.BuscarSaldo(id: integer): double;
const
  SQL = 'SELECT saldo from agrojun.contas_bancarias where id = :id';
var
  Query: TFDQuery;
begin
  try
    Query := TFDQuery.Create(self);
    Query.Connection := dm.FDConnection;
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

procedure TFrmCadCompra.CalcValorPorAnimal;
begin
  if not ed_Quantidade.Text.IsEmpty then
  begin

    if not ed_ValorTotalAnimal.Text.IsEmpty then
    begin
      ed_ValorPorAnimal.Text :=
        FloatToStr(strtofloat(StringReplace(ed_ValorTotalAnimal.Text, '.', '',
        [rfReplaceAll])) / StrToInt(ed_Quantidade.Text));
    end;

    if not ed_ValorTotalFrete.Text.IsEmpty then
    begin
      ed_ValorFretePorAnimal.Text :=
        FloatToStr(strtofloat(StringReplace(ed_ValorTotalFrete.Text, '.', '',
        [rfReplaceAll])) / StrToInt(ed_Quantidade.Text));
    end;

    if not ed_ValorTotalComissao.Text.IsEmpty then
    begin
      ed_ValorComisPorAnimal.Text :=
        FloatToStr(strtofloat(StringReplace(ed_ValorTotalComissao.Text, '.', '',
        [rfReplaceAll])) / StrToInt(ed_Quantidade.Text));
    end;

  end;
end;

procedure TFrmCadCompra.CalcValorTotal;
var
  vt: double;
begin
  if not ed_Quantidade.Text.IsEmpty and not ed_ValorTotalAnimal.Text.IsEmpty and
    not ed_ValorTotalFrete.Text.IsEmpty and not ed_ValorTotalComissao.Text.IsEmpty
  then
  begin
    vt := (strtofloat(StringReplace(ed_ValorTotalAnimal.Text, '.', '',
      [rfReplaceAll])) + strtofloat(StringReplace(ed_ValorTotalFrete.Text, '.',
      '', [rfReplaceAll])) +
      strtofloat(StringReplace(ed_ValorTotalComissao.Text, '.', '',
      [rfReplaceAll])));
    ed_ValorTotalCompra.Text := formatfloat('###,##0.00', vt);
    ed_valorporcbs_compra.Text := formatfloat('###,##0.00',
      vt / StrToInt(ed_Quantidade.Text));
  end;
end;

procedure TFrmCadCompra.ckbCadNow1Change(Sender: TObject);
begin
  inherited;
  if ckbCadNow1.IsChecked then
  begin
    lytFornecedor.Height := 70;
    rbFisica1.Visible := true;
    rbJuridica1.Visible := true;
  end
  else
  begin
    lytFornecedor.Height := 55;
    rbFisica1.Visible := false;
    rbJuridica1.Visible := false;
    rbFisica1.IsChecked := false;
    rbJuridica1.IsChecked := false;
  end;
end;

procedure TFrmCadCompra.ckbCadNow2Change(Sender: TObject);
begin
  inherited;
  if ckbCadNow2.IsChecked then
  begin
    lytMotorista.Height := 70;
    rbFisica2.Visible := true;
    rbJuridica2.Visible := true;
  end
  else
  begin
    lytMotorista.Height := 55;
    rbFisica2.Visible := false;
    rbJuridica2.Visible := false;
    rbFisica2.IsChecked := false;
    rbJuridica2.IsChecked := false;
  end;
end;

procedure TFrmCadCompra.ckbCadNow3Change(Sender: TObject);
begin
  inherited;
  inherited;
  if ckbCadNow3.IsChecked then
  begin
    lytCorretor.Height := 70;
    rbFisica3.Visible := true;
    rbJuridica3.Visible := true;
  end
  else
  begin
    lytCorretor.Height := 55;
    rbFisica3.Visible := false;
    rbJuridica3.Visible := false;
    rbFisica3.IsChecked := false;
    rbJuridica3.IsChecked := false;
  end;
end;

procedure TFrmCadCompra.ComboEditFiltrosChange(Sender: TObject);
begin
  inherited;
  if ComboEditFiltros.ItemIndex = 1 then
  begin
    lytFiltroOutros.Visible := false;
    lytFiltroData.Visible := true;
  end
  else if ComboEditFiltros.ItemIndex = 2 then
  begin
    lytFiltroData.Visible := false;
    ed_Filtro.Text := EmptyStr;
    ed_Filtro.TextPrompt := 'FORNECEDOR...';
    lytFiltroOutros.Visible := true;
    //ConsultaFornecedor(ed_Filtro);
  end
  else if ComboEditFiltros.ItemIndex = 3 then
  begin
    lytFiltroData.Visible := false;
    ed_Filtro.Text := EmptyStr;
    ed_Filtro.TextPrompt := 'CONTA...';
    lytFiltroOutros.Visible := true;
    //ConsultaConta(ed_Filtro);
  end
  else if ComboEditFiltros.ItemIndex = 4 then
  begin
    lytFiltroData.Visible := false;
    ed_Filtro.Text := EmptyStr;
    ed_Filtro.TextPrompt := 'LOTE...';
    lytFiltroOutros.Visible := true;
    //ConsultaLote(ed_Filtro);
    ed_Filtro.Lookup.NumChars := 1;
  end
  else if ComboEditFiltros.ItemIndex = 5 then
  begin
    lytFiltroData.Visible := false;
    ed_Filtro.Text := EmptyStr;
    ed_Filtro.TextPrompt := 'MOTORISTA...';
    lytFiltroOutros.Visible := true;
    //ConsultaMotorista(ed_Filtro);
  end
  else if ComboEditFiltros.ItemIndex = 6 then
  begin
    lytFiltroData.Visible := false;
    ed_Filtro.Text := EmptyStr;
    ed_Filtro.TextPrompt := 'CORRETOR...';
    lytFiltroOutros.Visible := true;
    //ConsultaCorretor(ed_Filtro);
  end
  else
  begin
    ed_Filtro.Text := EmptyStr;
    ed_Filtro.TextPrompt := EmptyStr;
    lytFiltroOutros.Visible := false;
    lytFiltroData.Visible := false;
    ConsultaCompras;
  end;
end;

procedure TFrmCadCompra.ConsultaBancoLotes;
const
  _SQLbanco = 'select id, numero, qtd_animais, nome from agrojun.lotes ';
var
  x: integer;
  QBanco: TFDQuery;
  item: TListViewItem;
  txt: TListItemText;
begin

  try
    QBanco := TFDQuery.Create(self);
    QBanco.Connection := dm.FDConnection;
    QBanco.Active := false;
    QBanco.SQL.Clear;
    QBanco.SQL.Add(_SQLbanco);
    QBanco.Active := true;
    QBanco.First;

    if (QBanco.RecordCount = 0) then
    begin
      lay_lstvaziaLote.Visible := true;
      lytInfoLote.Visible := false;
    end
    else
    begin
      lay_lstvaziaLote.Visible := false;
      lytInfoLote.Visible := true;
    end;

    ListViewLote.Items.Clear;
    ListViewLote.BeginUpdate;

    for x := 1 to 1 do
    begin
      item := ListViewLote.Items.Add;

      with item do
      begin
        txt := TListItemText(Objects.FindDrawable('lbl_codigo'));
        txt.Text := 'C�DIGO';
        txt.TagString := '0';

        txt := TListItemText(Objects.FindDrawable('lbl_numero'));
        txt.Text := 'N�MERO';

        txt := TListItemText(Objects.FindDrawable('lbl_quantidade'));
        txt.Text := 'QTD ANIMAIS';

        txt := TListItemText(Objects.FindDrawable('lbl_nome'));
        txt.Text := 'NOME DO LOTE';
      end;
    end;

    for x := 1 to QBanco.RecordCount do
    begin

      item := ListViewLote.Items.Add;

      with item do
      begin
        txt := TListItemText(Objects.FindDrawable('codigo'));
        txt.Text := formatfloat('0000', QBanco.FieldByName('id').AsFloat);
        txt.TagString := QBanco.FieldByName('id').AsString;

        txt := TListItemText(Objects.FindDrawable('numero'));
        txt.Text := QBanco.FieldByName('numero').AsString;

        txt := TListItemText(Objects.FindDrawable('quantidade'));
        txt.Text := QBanco.FieldByName('qtd_animais').AsString;

        txt := TListItemText(Objects.FindDrawable('nome'));
        txt.Text := QBanco.FieldByName('nome').AsString;
      end;

      QBanco.Next
    end;
  finally
    ListViewLote.EndUpdate;
    FreeAndNil(QBanco);
  end;
end;

procedure TFrmCadCompra.ConsultaBancoPessoas;
const
  _SQLbanco = 'select id, nome, cpf_pessoa, telefone from agrojun.pessoas';
var
  x: integer;
  QBanco: TFDQuery;
  item: TListViewItem;
  txt: TListItemText;
begin

  try
    QBanco := TFDQuery.Create(self);
    QBanco.Connection := dm.FDConnection;
    QBanco.Active := false;
    QBanco.SQL.Clear;
    QBanco.SQL.Add(_SQLbanco);
    QBanco.Active := true;
    QBanco.First;

    if (QBanco.RecordCount = 0) then
    begin
      lay_lstvaziaPessoa.Visible := true;
      lytInfoPessoa.Visible := false;
    end
    else
    begin
      lay_lstvaziaPessoa.Visible := false;
      lytInfoPessoa.Visible := true;
    end;

    ListViewPessoa.Items.Clear;
    ListViewPessoa.BeginUpdate;

    for x := 1 to 1 do
    begin
      item := ListViewPessoa.Items.Add;

      with item do
      begin
        txt := TListItemText(Objects.FindDrawable('lbl_codigo'));
        txt.Text := 'C�DIGO';
        txt.TagString := '0';

        txt := TListItemText(Objects.FindDrawable('lbl_nome'));
        txt.Text := 'NOME';

        txt := TListItemText(Objects.FindDrawable('lbl_cpf'));
        txt.Text := 'CPF/CNPJ';

        txt := TListItemText(Objects.FindDrawable('lbl_telefone'));
        txt.Text := 'TELEFONE';
      end;
    end;

    for x := 1 to QBanco.RecordCount do
    begin

      item := ListViewPessoa.Items.Add;

      with item do
      begin
        txt := TListItemText(Objects.FindDrawable('codigo'));
        txt.Text := formatfloat('0000', QBanco.FieldByName('id').AsFloat);
        txt.TagString := QBanco.FieldByName('id').AsString;

        txt := TListItemText(Objects.FindDrawable('nome'));
        txt.Text := QBanco.FieldByName('nome').AsString;

        txt := TListItemText(Objects.FindDrawable('cpf_pessoa'));
        txt.Text := QBanco.FieldByName('cpf_pessoa').AsString;

        txt := TListItemText(Objects.FindDrawable('telefone'));
        txt.Text := QBanco.FieldByName('telefone').AsString;
      end;

      QBanco.Next
    end;
  finally
    ListViewPessoa.EndUpdate;
    FreeAndNil(QBanco);
  end;
end;

procedure TFrmCadCompra.ConsultaCompras;
const
  _SQLbanco =
    ' select c.id, c.data_compra, c.quantidade_cbs, f.nome as fornecedor, cc.conta, l.numero as lote, c.valortotal_compra, c.valorporcbs_compra from compras as c '
    + ' left outer join pessoas as f on (f.id = c.fornecedor)                                                                                     '
    + ' left outer join contas_bancarias as cc on (cc.id = c.conta_bancaria)                                                                      '
    + ' left outer join lotes as l on (l.id = c.lote)                                                                                             '
    + ' where month(data_compra) = :mes and year(data_compra) = :ano order by data_compra desc                                                     ';
var
  x: integer;
  QBanco: TFDQuery;
  item: TListViewItem;
  txt: TListItemText;
begin

  try
    QBanco := TFDQuery.Create(self);
    QBanco.Connection := dm.FDConnection;
    QBanco.Active := false;
    QBanco.SQL.Clear;
    QBanco.SQL.Add(_SQLbanco);
    QBanco.ParamByName('mes').AsInteger := StrToInt(FormatDateTime('MM', Now));
    QBanco.ParamByName('ano').AsInteger :=
      StrToInt(FormatDateTime('YYYY', Now));
    QBanco.Active := true;
    QBanco.First;

    if (QBanco.RecordCount = 0) then
    begin
      lay_listvazia.Visible := true;
    end
    else
    begin
      lay_listvazia.Visible := false;
    end;

    lst_Principal.Items.Clear;
    lst_Principal.BeginUpdate;

    for x := 1 to 1 do
    begin
      item := lst_Principal.Items.Add;

      with item do
      begin
        txt := TListItemText(Objects.FindDrawable('lbl_codigo'));
        txt.Text := 'C�DIGO';
        txt.TagString := '0';

        txt := TListItemText(Objects.FindDrawable('lbl_data'));
        txt.Text := 'DATA';

        txt := TListItemText(Objects.FindDrawable('lbl_lote'));
        txt.Text := 'LOTE';

        txt := TListItemText(Objects.FindDrawable('lbl_fornecedor'));
        txt.Text := 'FORNECEDOR';

        txt := TListItemText(Objects.FindDrawable('lbl_conta'));
        txt.Text := 'CONTA BANC�RIA';

        txt := TListItemText(Objects.FindDrawable('lbl_quantidade'));
        txt.Text := 'QUANTIDADE';

        txt := TListItemText(Objects.FindDrawable('lbl_valorcbs'));
        txt.Text := 'VALOR P/ CBS';

        txt := TListItemText(Objects.FindDrawable('lbl_valorTotal'));
        txt.Text := 'VALOR TOTAL';

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

        txt := TListItemText(Objects.FindDrawable('data'));
        txt.Text := QBanco.FieldByName('data_compra').AsString;

        txt := TListItemText(Objects.FindDrawable('lote'));
        txt.Text := QBanco.FieldByName('lote').AsString;

        txt := TListItemText(Objects.FindDrawable('fornecedor'));
        txt.Text := QBanco.FieldByName('fornecedor').AsString;

        txt := TListItemText(Objects.FindDrawable('conta'));
        txt.Text := QBanco.FieldByName('conta').AsString;

        txt := TListItemText(Objects.FindDrawable('quantidade'));
        txt.Text := QBanco.FieldByName('quantidade_cbs').AsString;

        txt := TListItemText(Objects.FindDrawable('valorTotal'));
        txt.Text := 'R$' + formatfloat('#,##0.00',
          QBanco.FieldByName('valortotal_compra').AsFloat);

        txt := TListItemText(Objects.FindDrawable('valorcbs'));
        txt.Text := 'R$' + formatfloat('#,##0.00',
          QBanco.FieldByName('valorporcbs_compra').AsFloat);
      end;

      QBanco.Next
    end;
  finally
    lst_Principal.EndUpdate;
    FreeAndNil(QBanco);
  end;
end;

procedure TFrmCadCompra.ConsultaConta;
const
  _SQLbanco =
    'SELECT cb.*, b.banco FROM agrojun.contas_bancarias cb left outer join bancos b on (cb.cod_banco = b.cod) where cb.tipo_movimentacao = 1';
var
  x: integer;
  QBanco: TFDQuery;
  item: TListViewItem;
  txt: TListItemText;
begin

  try
    QBanco := TFDQuery.Create(self);
    QBanco.Connection := dm.FDConnection;
    QBanco.Active := false;
    QBanco.SQL.Clear;
    QBanco.SQL.Add(_SQLbanco);
    QBanco.Active := true;
    QBanco.First;

    if (QBanco.RecordCount = 0) then
    begin
      lay_lstvaziaConta.Visible := true;
      lytInfoConta.Visible := false;
    end
    else
    begin
      lay_lstvaziaConta.Visible := false;
      lytInfoConta.Visible := true;
    end;

    ListViewConta.Items.Clear;
    ListViewConta.BeginUpdate;

    for x := 1 to 1 do
    begin
      item := ListViewConta.Items.Add;

      with item do
      begin
        txt := TListItemText(Objects.FindDrawable('lbl_codigo'));
        txt.Text := 'C�DIGO';
        txt.TagString := '0';

        txt := TListItemText(Objects.FindDrawable('lbl_banco'));
        txt.Text := 'BANCO';

        txt := TListItemText(Objects.FindDrawable('lbl_conta'));
        txt.Text := 'CONTA';

        txt := TListItemText(Objects.FindDrawable('lbl_agencia'));
        txt.Text := 'AG�NCIA';

        txt := TListItemText(Objects.FindDrawable('lbl_movimentacao'));
        txt.Text := 'MOVIMENTA��O';

        txt := TListItemText(Objects.FindDrawable('lbl_saldo'));
        txt.Text := 'SALDO';
      end;
    end;

    for x := 1 to QBanco.RecordCount do
    begin

      item := ListViewConta.Items.Add;

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

        txt := TListItemText(Objects.FindDrawable('movimentacao'));
        case QBanco.FieldByName('tipo_movimentacao').AsInteger of
          0:
            txt.Text := 'ENTRADA';
          1:
            txt.Text := 'SA�DA';
        end;

        txt := TListItemText(Objects.FindDrawable('saldo'));
        txt.Text := 'R$' + formatfloat('#,##0.00',
          QBanco.FieldByName('saldo').AsFloat);
      end;

      QBanco.Next
    end;
  finally
    ListViewConta.EndUpdate;
    FreeAndNil(QBanco);
  end;
end;

procedure TFrmCadCompra.ConsultaFormaPagto;
const
  _SQL = 'SELECT id, forma_pagto FROM forma_pagamento';
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
        cont := 1;
        vResultado.Add('INFORME A FORMA De PAGAMENTO...');
        while vCampo < dm.QAux.RecordCount do
        begin
          vResultado.Add(formatfloat('000', dm.QAux.FieldByName('id')
              .AsFloat) + ' - ' + dm.QAux.FieldByName('forma_pagto').AsString);
          dm.QAux.Next;
          cont := cont + 1;
          vCampo := vCampo + 1;
        end;
      end;
      vResultado.EndUpdate;

      cbx_FormaPagto.Items := vResultado;
    except
      //
    end;
  finally
    if dm.QAux.Active then
      FreeAndNil(dm.QAux);
  end;
end;

procedure TFrmCadCompra.ConsultaIdadeAnimal;
const
  _SQL = 'SELECT idade_animal FROM idade_animal';
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
        cont := 1;
        vResultado.Add('INFORME IDADE DO (S) ANIMAL (AIS)...');
        while vCampo < dm.QAux.RecordCount do
        begin
          valid := IntToStr(cont);
          if valid.Length = 1 then
            valid := '00' + valid;
          if valid.Length = 2 then
            valid := '0' + valid;
          vResultado.Add(valid + ' - ' + dm.QAux.FieldByName('idade_animal')
            .AsString);
          dm.QAux.Next;
          cont := cont + 1;
          vCampo := vCampo + 1;
        end;
      end;
      vResultado.EndUpdate;

      cbx_IdadeAnimal.Items := vResultado;
    except
      //
    end;
  finally
    if dm.QAux.Active then
      FreeAndNil(dm.QAux);
  end;
end;

procedure TFrmCadCompra.ConsultaRacaAnimal;
const
  _SQL = 'SELECT raca FROM raca_animal';
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
        cont := 1;
        vResultado.Add('INFORME A RA�A DO (S) ANIMAL (AIS)...');
        while vCampo < dm.QAux.RecordCount do
        begin
          valid := IntToStr(cont);
          if valid.Length = 1 then
            valid := '00' + valid;
          if valid.Length = 2 then
            valid := '0' + valid;
          vResultado.Add(valid + ' - ' + dm.QAux.FieldByName('raca').AsString);
          dm.QAux.Next;
          cont := cont + 1;
          vCampo := vCampo + 1;
        end;
      end;
      vResultado.EndUpdate;

      cbx_TipoAnimal.Items := vResultado;
    except
      //
    end;
  finally
    if dm.QAux.Active then
      FreeAndNil(dm.QAux);
  end;
end;

procedure TFrmCadCompra.ConsultaTipoCaminhao;
const
  _SQL = 'SELECT tipo_caminhao FROM tipo_caminhao';
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
        cont := 1;
        vResultado.Add('INFORME O TIPO DO CAMINH�O...');
        while vCampo < dm.QAux.RecordCount do
        begin
          valid := IntToStr(cont);
          if valid.Length = 1 then
            valid := '00' + valid;
          if valid.Length = 2 then
            valid := '0' + valid;
          vResultado.Add(valid + ' - ' + dm.QAux.FieldByName('tipo_caminhao')
            .AsString);
          dm.QAux.Next;
          cont := cont + 1;
          vCampo := vCampo + 1;
        end;
      end;
      vResultado.EndUpdate;

      cbx_TipoCaminhao.Items := vResultado;
    except
      //
    end;
  finally
    if dm.QAux.Active then
      FreeAndNil(dm.QAux);
  end;
end;

procedure TFrmCadCompra.ed_ContaEnter(Sender: TObject);
var
  I: integer;
begin
  inherited;
  if ed_Conta.Text.IsEmpty then
  begin
    ConsultaConta;
    ListViewConta.SearchVisible := true;
    for I := 0 to ListViewConta.Controls.Count - 1 do
      if ListViewConta.Controls[I].ClassType = TSearchBox then
      begin
        sbConta := TSearchBox(ListViewConta.Controls[I]);
        Break;
      end;
    sbConta.Height := 0;
    Tipo_Busca := 0;
    tab_Crud.ActiveTab := TabConta;
  end;
end;

procedure TFrmCadCompra.ed_CorretorEnter(Sender: TObject);
var
  I: integer;
begin
  inherited;
  if ed_Corretor.Text.IsEmpty and ( not ckbCadNow3.IsChecked) then
  begin
    ConsultaBancoPessoas;
    ListViewPessoa.SearchVisible := true;
    for I := 0 to ListViewPessoa.Controls.Count - 1 do
      if ListViewPessoa.Controls[I].ClassType = TSearchBox then
      begin
        sbPessoa := TSearchBox(ListViewPessoa.Controls[I]);
        Break;
      end;
    sbPessoa.Height := 0;
    Tipo_Busca := 2;
    tab_Crud.ActiveTab := TabPessoa;
  end;
end;

procedure TFrmCadCompra.ed_LoteEnter(Sender: TObject);
var
  I: integer;
begin
  inherited;
//  if ed_Lote.Text.IsEmpty then
//  begin
//    ConsultaBancoLotes;
//    ListViewLote.SearchVisible := true;
//    for I := 0 to ListViewLote.Controls.Count - 1 do
//      if ListViewLote.Controls[I].ClassType = TSearchBox then
//      begin
//        sbLote := TSearchBox(ListViewLote.Controls[I]);
//        Break;
//      end;
//    sbLote.Height := 0;
//    Tipo_Busca := 0;
//    tab_Crud.ActiveTab := TabLote;
//  end;
end;

procedure TFrmCadCompra.ed_LoteKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  inherited;
  if (not(KeyChar in ['0'..'9'])) and (KeyChar <>#0) then
  begin
    ShowMessage('Somente n�meros!');
    KeyChar := #0;
  end;
end;

procedure TFrmCadCompra.ed_MotoristaEnter(Sender: TObject);
var
  I: integer;
begin
  inherited;
  if ed_Motorista.Text.IsEmpty and ( not ckbCadNow2.IsChecked) then
  begin
    ConsultaBancoPessoas;
    ListViewPessoa.SearchVisible := true;
    for I := 0 to ListViewPessoa.Controls.Count - 1 do
      if ListViewPessoa.Controls[I].ClassType = TSearchBox then
      begin
        sbPessoa := TSearchBox(ListViewPessoa.Controls[I]);
        Break;
      end;
    sbPessoa.Height := 0;
    Tipo_Busca := 1;
    tab_Crud.ActiveTab := TabPessoa;
  end;
end;

procedure TFrmCadCompra.ed_PesquisaContaChangeTracking(Sender: TObject);
begin
  inherited;
  sbConta.Text := ed_PesquisaConta.Text;
end;

procedure TFrmCadCompra.ed_PesquisaLoteChangeTracking(Sender: TObject);
begin
  inherited;
  sbLote.Text := ed_PesquisaLote.Text;
end;

procedure TFrmCadCompra.ed_PesquisaPessoaChangeTracking(Sender: TObject);
begin
  inherited;
  sbPessoa.Text := ed_PesquisaPessoa.Text;
end;

procedure TFrmCadCompra.ed_PessoaEnter(Sender: TObject);
var
  I: integer;
begin
  inherited;
  if ed_Pessoa.Text.IsEmpty and ( not ckbCadNow1.IsChecked) then
  begin
    ConsultaBancoPessoas;
    ListViewPessoa.SearchVisible := true;
    for I := 0 to ListViewPessoa.Controls.Count - 1 do
      if ListViewPessoa.Controls[I].ClassType = TSearchBox then
      begin
        sbPessoa := TSearchBox(ListViewPessoa.Controls[I]);
        Break;
      end;
    sbPessoa.Height := 0;
    Tipo_Busca := 0;
    tab_Crud.ActiveTab := TabPessoa;
  end;
end;

procedure TFrmCadCompra.ed_ValorComisPorAnimalChange(Sender: TObject);
begin
  inherited;
  ed_ValorComisPorAnimal.Text := formatfloat('###,##0.00',
    StrToFloat_Universal(ed_ValorComisPorAnimal.Text));
end;

procedure TFrmCadCompra.ed_ValorFretePorAnimalChange(Sender: TObject);
begin
  inherited;
  ed_ValorFretePorAnimal.Text := formatfloat('###,##0.00',
    StrToFloat_Universal(ed_ValorFretePorAnimal.Text));
end;

procedure TFrmCadCompra.ed_ValorPorAnimalChange(Sender: TObject);
begin
  inherited;
  ed_ValorPorAnimal.Text := formatfloat('###,##0.00',
    StrToFloat_Universal(ed_ValorPorAnimal.Text));
end;

procedure TFrmCadCompra.ed_ValorTotalComissaoExit(Sender: TObject);
begin
  inherited;
  CalcValorPorAnimal;
  CalcValorTotal;
end;

procedure TFrmCadCompra.ed_ValorTotalComissaoKeyDown(Sender: TObject;
  var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  FormatarMoeda(ed_ValorTotalComissao, KeyChar);
end;

procedure TFrmCadCompra.ed_ValorTotalAnimalExit(Sender: TObject);
begin
  inherited;
  CalcValorPorAnimal;
  CalcValorTotal;
end;

procedure TFrmCadCompra.ed_ValorTotalAnimalKeyDown(Sender: TObject;
  var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  FormatarMoeda(ed_ValorTotalAnimal, KeyChar);
end;

procedure TFrmCadCompra.ed_ValorTotalFreteExit(Sender: TObject);
begin
  inherited;
  CalcValorPorAnimal;
  CalcValorTotal;
end;

procedure TFrmCadCompra.ed_ValorTotalFreteKeyDown(Sender: TObject;
  var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  FormatarMoeda(ed_ValorTotalFrete, KeyChar);
end;

procedure TFrmCadCompra.FormCreate(Sender: TObject);
begin
  inherited;
  ConsultaCompras;
  ed_pesq.Enabled := true;
end;

procedure TFrmCadCompra.Image7Click(Sender: TObject);
begin
  inherited;
  ListViewPessoa.Items.Clear;
  ListViewConta.Items.Clear;
  ListViewLote.Items.Clear;
  ed_PesquisaPessoa.Text := EmptyStr;
  ed_PesquisaConta.Text := EmptyStr;
  ed_PesquisaLote.Text := EmptyStr;
  tab_Crud.ActiveTab := TabItem2;
end;

procedure TFrmCadCompra.Img_BtnCancelarClick(Sender: TObject);
const
  _SQLInicial =
    ' select c.id, c.data_compra, c.quantidade_cbs, c.valortotal_compra, c.valorporcbs_compra,                      '
    + '  c.idade_animal, c.sexo_animal, c.raca_animal, c.etiqueta, c.tipo_caminhao, c.placa_caminhao,                 '
    + '  c.valortotal_frete, c.valorporcbs_frete, c.valortotal_comissao, c.valorporcbs_comissao,                      '
    + '  c.valortotal_animais, c.valorporcbs_animais, c.descricao,  ' +
    '  f.nome as fornecedor, cc.conta, l.numero as lote, m.nome as motorista, co.nome as corretor from compras as c '
    + ' left outer join pessoas as f on (f.id = c.fornecedor)                                                         '
    + ' left outer join contas_bancarias as cc on (cc.id = c.conta_bancaria)                                          '
    + ' left outer join lotes as l on (l.id = c.lote)                                                                 '
    + ' left outer join pessoas as m on (m.id = c.motorista)                                                          '
    + ' left outer join pessoas as co on (co.id = c.corretor)                                                         '
    + ' where c.id = :id                                                                                             ';
var
  Query: TFDQuery;
begin
  inherited;
  if Acao = 1 then
  begin
    DesabilitaCampos;
    Query := TFDQuery.Create(self);
    Query.Connection := dm.FDConnection;
    try
      Query.Active := false;
      Query.SQL.Clear;
      Query.SQL.Add(_SQLInicial);
      Query.ParamByName('id').AsInteger := Cod_Selecao;
      Query.Active := true;
      PopularCampos(Query);
    finally
      FreeAndNil(Query);
    end;
  end
  else
    ed_pesq.Enabled := true;
  ComboEditFiltros.Enabled := true;
  ed_Filtro.Enabled := true;
  DateEditData1.Enabled := true;
  DateEditData2.Enabled := true;
end;

procedure TFrmCadCompra.Img_BtnEditarClick(Sender: TObject);
begin
  inherited;
  ValorTotal := (strtofloat(StringReplace(ed_ValorTotalAnimal.Text, '.', '',
    [rfReplaceAll])) + strtofloat(StringReplace(ed_ValorTotalFrete.Text, '.',
    '', [rfReplaceAll])) + strtofloat(StringReplace(ed_ValorTotalComissao.Text,
    '.', '', [rfReplaceAll])));
  QtdAnimais := StrToInt(ed_Quantidade.Text);
  // ConsultaLote(edTms_Lote);
  // ConsultaFornecedor(edTms_Fornecedor);
  // ConsultaConta(edTms_ContaBancaria);
  //ConsultaMotorista(edTms_Motorista);
  //ConsultaCorretor(edTms_Corretor);
  ed_ValorPorAnimal.Enabled := false;
  ed_ValorFretePorAnimal.Enabled := false;
  ed_ValorComisPorAnimal.Enabled := false;
  ed_ValorTotalCompra.Enabled := false;
  ed_valorporcbs_compra.Enabled := false;
end;

procedure TFrmCadCompra.Img_BtnExcluirClick(Sender: TObject);
const
  SQL = 'DELETE FROM agrojun.compras WHERE id = :id';
  SQLLote = 'DELETE FROM agrojun.lotes where id = :id';
var
  Query: TFDQuery;
begin
  inherited;
  // APAGAR REGISTROS
  try
    AlteraSaldo(StrToInt(copy(ed_Conta.Text, 0, 5)),
      BuscarSaldo(StrToInt(copy(ed_Conta.Text, 0, 5))) +
      (strtofloat(StringReplace(ed_ValorTotalCompra.Text, '.', '',
      [rfReplaceAll]))));
    AlteraQtdAnimaisLote(RetornaIdLote(ed_Lote.Text),
      BuscarQtdAnimaisLote(RetornaIdLote(ed_Lote.Text)) -
      StrToInt(ed_Quantidade.Text));
    RemoveInfoLotes(RetornaIdLote(ed_Lote.Text));
    Query := TFDQuery.Create(self);
    Query.Connection := dm.FDConnection;
    Query.Active := false;
    Query.SQL.Clear;
    Query.SQL.Add(SQLLote);
    Query.ParamByName('id').AsInteger := RetornaIdLote(ed_Lote.Text);
    Query.ExecSQL;
    Query.Active := false;
    Query.SQL.Clear;
    Query.SQL.Add(SQL);
    Query.ParamByName('id').AsInteger := Cod_Selecao;
    Query.ExecSQL;
  finally
    FreeAndNil(Query);
    LimpaCampos;
    ShowMessage('Registro exclu�do com sucesso!');
    ConsultaCompras;
    LogCompras;
    tab_Crud.ActiveTab := TabItem1;
  end;
end;

procedure TFrmCadCompra.Img_BtnNovoClick(Sender: TObject);
begin
  inherited;
  // ConsultaLote(edTms_Lote);
  // ConsultaFornecedor(edTms_Fornecedor);
  // ConsultaConta(edTms_ContaBancaria);
  //ConsultaMotorista(edTms_Motorista);
  //ConsultaCorretor(edTms_Corretor);
  ConsultaIdadeAnimal;
  ConsultaRacaAnimal;
  ConsultaTipoCaminhao;
  ConsultaFormaPagto;
  cbx_TipoCaminhao.ItemIndex := 0;
  ed_ValorPorAnimal.Enabled := false;
  ed_ValorFretePorAnimal.Enabled := false;
  ed_ValorComisPorAnimal.Enabled := false;
  ed_ValorTotalCompra.Enabled := false;
  ed_valorporcbs_compra.Enabled := false;
end;

procedure TFrmCadCompra.Img_BtnSalvarClick(Sender: TObject);
const
  SQLInsert =
    'INSERT INTO `agrojun`.`compras` (`data_compra`, `lote`, `fornecedor`, `conta_bancaria`, `quantidade_cbs`,        '
    + '               `valortotal_compra`, `valorporcbs_compra`, `idade_animal`, `sexo_animal`,                               '
    + '                `raca_animal`, `etiqueta`, `tipo_caminhao`, `placa_caminhao`, `motorista`,                             '
    + '                `valortotal_frete`, `valorporcbs_frete`, `corretor`, `valortotal_comissao`,                            '
    + '                `valorporcbs_comissao`, `descricao`, `valortotal_animais`, `valorporcbs_animais`, `forma_pagto`)                                                                   '
    + 'VALUES (:data_compra, :lote, :fornecedor, :conta_bancaria, :quantidade_cbs, :valortotal_compra,                        '
    + '    :valorporcbs_compra, :idade_animal, :sexo_animal, :raca_animal, :etiqueta, :tipo_caminhao,                         '
    + '        :placa_caminhao, :motorista, :valortotal_frete, :valorporcbs_frete, :corretor, :valortotal_comissao,           '
    + '        :valorporcbs_comissao, :descricao, :valortotal_animais, :valorporcbs_animais, :forma_pagto)                                                                            ';
  SQLUpdate =
    ' UPDATE `agrojun`.`compras`                                                                                                     '
    + ' SET `data_compra` = :data_compra, `lote` = :lote, `fornecedor` = :fornecedor, `conta_bancaria` = :conta_bancaria,              '
    + ' `quantidade_cbs` = :quantidade_cbs, `valortotal_compra` = :valortotal_compra, `valorporcbs_compra` = :valorporcbs_compra,      '
    + ' `idade_animal` = :idade_animal, `sexo_animal` = :sexo_animal, `raca_animal` = :raca_animal, `etiqueta` = :etiqueta,            '
    + ' `tipo_caminhao` = :tipo_caminhao, `placa_caminhao` = :placa_caminhao, `motorista` = :motorista,                                '
    + ' `valortotal_frete` = :valortotal_frete, `valorporcbs_frete` = :valorporcbs_frete, `corretor` = :corretor,                      '
    + ' `valortotal_comissao` = :valortotal_comissao, `valorporcbs_comissao` = :valorporcbs_comissao, `descricao` = :descricao,          '
    + ' `valortotal_animais` = :valortotal_animais, `valorporcbs_animais` = :valorporcbs_animais, `forma_pagto` = :forma_pagto '
    + ' WHERE `id` = :id                                                                                                              ';
var
  Query: TFDQuery;
  ValorTotalAtual: double;
  QtdAnimaisAtual: integer;
  status: integer;
begin
  inherited;
  Validar(0);
  try
    Query := TFDQuery.Create(self);
    Query.Connection := dm.FDConnection;
    Query.Close;
    Query.SQL.Clear;

    if Acao = 0 then
      Query.SQL.Add(SQLInsert)
    else
    begin
      Query.SQL.Add(SQLUpdate);
      Query.ParamByName('id').AsInteger := Cod_Selecao;
    end;

    try
      Query.ParamByName('data_compra').AsDateTime := DateEditCompra.Date;

      if ed_Lote.Text.IsEmpty then
      begin
        Validar(1);
        exit;
      end
      else
      begin
        if SalvarLote(StrToInt(ed_Lote.Text)) = 0 then
        begin
          Validar(9);
          exit
        end
        else
          Query.ParamByName('lote').AsInteger := RetornaIdLote(ed_Lote.Text);
      end;

      if (ed_Pessoa.Text.IsEmpty) then
      begin
        Validar(2);
        exit;
      end;
      if ckbCadNow1.IsChecked then
      begin
        if ValidarPessoa(ed_Pessoa.Text) = 1 then
        begin
          if mensagemConfirmacao('J� existe uma pessoa cadastrada com esse nome. Deseja continuar com o cadastro?') = mrYes then
          begin
            if rbFisica1.IsChecked then
              SalvarPessoa(ed_Pessoa.Text, 1)
            else if rbJuridica1.IsChecked then
              SalvarPessoa(ed_Pessoa.Text, 2)
            else
              Validar(8);

            Query.ParamByName('fornecedor').AsInteger := RetornaIdPessoa(ed_Pessoa.Text);
          end
          else
            exit
        end
        else
        begin
            if rbFisica1.IsChecked then
              SalvarPessoa(ed_Pessoa.Text, 1)
            else if rbJuridica1.IsChecked then
              SalvarPessoa(ed_Pessoa.Text, 2)
            else
              Validar(8);

          Query.ParamByName('fornecedor').AsInteger := RetornaIdPessoa(ed_Pessoa.Text);
        end;
      end
      else
        Query.ParamByName('fornecedor').AsInteger :=
          StrToInt(copy(ed_Pessoa.Text, 0, 5));

      if (not ed_Conta.Text.IsEmpty) and (StrToInt(copy(ed_Conta.Text, 0, 5)) = 0)
      then
      begin
        Validar(3);
        exit;
      end;
      Query.ParamByName('conta_bancaria').AsInteger :=
        StrToInt(copy(ed_Conta.Text, 0, 5));

      Query.ParamByName('quantidade_cbs').AsInteger :=
        StrToInt(ed_Quantidade.Text);
      Query.ParamByName('valortotal_animais').AsFloat :=
        strtofloat(StringReplace(ed_ValorTotalAnimal.Text, '.', '',
        [rfReplaceAll]));
      Query.ParamByName('valorporcbs_animais').AsFloat :=
        strtofloat(StringReplace(ed_ValorPorAnimal.Text, '.', '',
        [rfReplaceAll]));

      Query.ParamByName('idade_animal').AsInteger :=
        StrToInt(copy(cbx_IdadeAnimal.Items[cbx_IdadeAnimal.ItemIndex], 0, 3));
      Query.ParamByName('sexo_animal').AsInteger :=
        StrToInt(copy(cbx_SexoAnimal.Items[cbx_SexoAnimal.ItemIndex], 0, 3));
      Query.ParamByName('raca_animal').AsInteger :=
        StrToInt(copy(cbx_TipoAnimal.Items[cbx_TipoAnimal.ItemIndex], 0, 3));
      if ed_Etiqueta.Text.IsEmpty then
        Query.ParamByName('etiqueta').AsInteger := 0
      else
        Query.ParamByName('etiqueta').AsInteger := StrToInt(ed_Etiqueta.Text);

      if cbx_TipoCaminhao.ItemIndex <= 0 then
        Query.ParamByName('tipo_caminhao').AsInteger := 0
      else
        Query.ParamByName('tipo_caminhao').AsInteger :=
          StrToInt(copy(cbx_TipoCaminhao.Items
          [cbx_TipoCaminhao.ItemIndex], 0, 3));
      Query.ParamByName('placa_caminhao').AsString := ed_PlacaCaminhao.Text;

      if cbx_FormaPagto.ItemIndex <= 0 then
        Query.ParamByName('forma_pagto').AsInteger := 0
      else
        Query.ParamByName('forma_pagto').AsInteger := StrToInt(copy(cbx_FormaPagto.Items[cbx_FormaPagto.ItemIndex], 0, 3));

      if (ed_Motorista.Text.IsEmpty) and not ckbCadNow2.IsChecked then
      begin
        Query.ParamByName('motorista').AsInteger := 0;
      end;
      if ckbCadNow2.IsChecked and not ed_Motorista.Text.IsEmpty then
      begin
        if ValidarPessoa(ed_Motorista.Text) = 1 then
        begin
          if mensagemConfirmacao('J� existe uma pessoa cadastrada com esse nome. Deseja continuar com o cadastro?') = mrYes then
          begin
            if rbFisica2.IsChecked then
              SalvarPessoa(ed_Motorista.Text, 1)
            else if rbJuridica2.IsChecked then
              SalvarPessoa(ed_Motorista.Text, 2)
            else
              Validar(8);

            Query.ParamByName('motorista').AsInteger := RetornaIdPessoa(ed_Motorista.Text);
          end
          else
            exit
        end
        else
        begin
            if rbFisica2.IsChecked then
              SalvarPessoa(ed_Motorista.Text, 1)
            else if rbJuridica2.IsChecked then
              SalvarPessoa(ed_Motorista.Text, 2)
            else
              Validar(8);

          Query.ParamByName('motorista').AsInteger := RetornaIdPessoa(ed_Motorista.Text);
        end;
      end
      else if ckbCadNow2.IsChecked and ed_Motorista.Text.IsEmpty then
      begin
        Validar(4);
        exit
      end
      else if not ckbCadNow2.IsChecked and not ed_Motorista.Text.IsEmpty then
      begin
        Query.ParamByName('motorista').AsInteger :=
          StrToInt(copy(ed_Motorista.Text, 0, 5));
      end;

      Query.ParamByName('valortotal_frete').AsFloat :=
        strtofloat(StringReplace(ed_ValorTotalFrete.Text, '.', '',
        [rfReplaceAll]));
      Query.ParamByName('valorporcbs_frete').AsFloat :=
        strtofloat(StringReplace(ed_ValorFretePorAnimal.Text, '.', '',
        [rfReplaceAll]));

      if (ed_Corretor.Text.IsEmpty) and not ckbCadNow3.IsChecked then
      begin
        Query.ParamByName('corretor').AsInteger := 0;
      end;
      if ckbCadNow3.IsChecked and not ed_Corretor.Text.IsEmpty then
      begin
        if ValidarPessoa(ed_Corretor.Text) = 1 then
        begin
          if mensagemConfirmacao('J� existe uma pessoa cadastrada com esse nome. Deseja continuar com o cadastro?') = mrYes then
          begin
            if rbFisica3.IsChecked then
              SalvarPessoa(ed_Corretor.Text, 1)
            else if rbJuridica3.IsChecked then
              SalvarPessoa(ed_Corretor.Text, 2)
            else
              Validar(8);

            Query.ParamByName('corretor').AsInteger := RetornaIdPessoa(ed_Corretor.Text);
          end
          else
            exit
        end
        else
        begin
            if rbFisica3.IsChecked then
              SalvarPessoa(ed_Corretor.Text, 1)
            else if rbJuridica3.IsChecked then
              SalvarPessoa(ed_Corretor.Text, 2)
            else
              Validar(8);

          Query.ParamByName('corretor').AsInteger := RetornaIdPessoa(ed_Corretor.Text);
        end;
      end
      else if ckbCadNow3.IsChecked and ed_Corretor.Text.IsEmpty then
      begin
        Validar(5);
        exit
      end
      else if not ckbCadNow3.IsChecked and  not ed_Corretor.Text.IsEmpty then
      begin
        Query.ParamByName('corretor').AsInteger :=
          StrToInt(copy(ed_Corretor.Text, 0, 5));
      end;

      Query.ParamByName('valortotal_comissao').AsFloat :=
        strtofloat(StringReplace(ed_ValorTotalComissao.Text, '.', '',
        [rfReplaceAll]));
      Query.ParamByName('valorporcbs_comissao').AsFloat :=
        strtofloat(StringReplace(ed_ValorComisPorAnimal.Text, '.', '',
        [rfReplaceAll]));

      Query.ParamByName('descricao').AsString := ed_Obs.Text;
      Query.ParamByName('valortotal_compra').AsFloat :=
        strtofloat(StringReplace(ed_ValorTotalCompra.Text, '.', '',
        [rfReplaceAll]));
      Query.ParamByName('valorporcbs_compra').AsFloat :=
        strtofloat(StringReplace(ed_valorporcbs_compra.Text, '.', '',
        [rfReplaceAll]));

      if Acao = 0 then
      begin
        AlteraSaldo(StrToInt(copy(ed_Conta.Text, 0, 5)),
          BuscarSaldo(StrToInt(copy(ed_Conta.Text, 0, 5))) -
          (strtofloat(StringReplace(ed_ValorTotalCompra.Text, '.', '',
          [rfReplaceAll]))));
        AlteraQtdAnimaisLote(RetornaIdLote(ed_Lote.Text),
          BuscarQtdAnimaisLote(RetornaIdLote(ed_Lote.Text)) +
          StrToInt(ed_Quantidade.Text));
      end
      else
      begin
        ValorTotalAtual :=
          (strtofloat(StringReplace(ed_ValorTotalAnimal.Text, '.', '',
          [rfReplaceAll])) + strtofloat(StringReplace(ed_ValorTotalFrete.Text,
          '.', '', [rfReplaceAll])) +
          strtofloat(StringReplace(ed_ValorTotalComissao.Text, '.', '',
          [rfReplaceAll])));
        if ValorTotalAtual > ValorTotal then
        begin
          AlteraSaldo(StrToInt(copy(ed_Conta.Text, 0, 5)),
            BuscarSaldo(StrToInt(copy(ed_Conta.Text, 0, 5))) -
            (ValorTotalAtual - ValorTotal));
        end
        else
        begin
          AlteraSaldo(StrToInt(copy(ed_Conta.Text, 0, 5)),
            BuscarSaldo(StrToInt(copy(ed_Conta.Text, 0, 5))) +
            (ValorTotal - ValorTotalAtual));
        end;

        QtdAnimaisAtual := StrToInt(ed_Quantidade.Text);
        if QtdAnimaisAtual > QtdAnimais then
          AlteraQtdAnimaisLote(RetornaIdLote(ed_Lote.Text),
            BuscarQtdAnimaisLote(RetornaIdLote(ed_Lote.Text)) +
            (QtdAnimaisAtual - QtdAnimais))
        else
          AlteraQtdAnimaisLote(RetornaIdLote(ed_Lote.Text),
            BuscarQtdAnimaisLote(RetornaIdLote(ed_Lote.Text)) -
            (QtdAnimais - QtdAnimaisAtual));

      end;
      Query.ExecSQL;
      // ShowMessage(IntToStr(MaxCod('compras') - 1));
      if Acao = 0 then
        AddInfoLotes(RetornaIdLote(ed_Lote.Text), MaxCod('compras') - 1, 1)
      else
        AddInfoLotes(RetornaIdLote(ed_Lote.Text), Cod_Selecao, status);
      LogCompras;

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
      LimpaCampos;
      ConsultaCompras;
    except
      abort;
    end;

  finally
    FreeAndNil(Query);
  end;
end;

procedure TFrmCadCompra.ListViewContaItemClick(const Sender: TObject;
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

        if Query.RecordCount > 0 then
        begin
          if Tipo_Busca = 0 then
          begin
            ed_Conta.Text := formatfloat('00000', Query.FieldByName('id')
              .AsFloat) + ' - ' + Query.FieldByName('conta').AsString;
            tab_Crud.ActiveTab := TabItem2;
          end
          else
          begin
            ed_Filtro.Text := formatfloat('00000', Query.FieldByName('id')
              .AsFloat) + ' - ' + Query.FieldByName('conta').AsString;
            tab_Crud.ActiveTab := TabItem1;
          end;
        end
        else
        begin
          ShowMessage
            ('N�o foi poss�vel carregar o dados dessa conta. Tente outra vez.');
          tab_Crud.ActiveTab := TabItem2;
        end;
      end;
    finally
      FreeAndNil(Query);
      ed_PesquisaConta.Text := EmptyStr;
    end;
  end
  else
    exit
end;

procedure TFrmCadCompra.ListViewLoteItemClick(const Sender: TObject;
  const AItem: TListViewItem);
const
  _SQLView = 'SELECT * from agrojun.lotes WHERE id = :id';
var
  txt: TListItemText;
  Query: TFDQuery;
  id: string;
begin
  inherited;
  ed_pesq.Enabled := true;
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
          if Tipo_Busca = 0 then
          begin
            ed_Lote.Text := formatfloat('00000',
              Query.FieldByName('id').AsFloat);
            tab_Crud.ActiveTab := TabItem2;
          end
          else
          begin
            ed_Filtro.Text := formatfloat('00000', Query.FieldByName('id')
              .AsFloat) + ' - ' + Query.FieldByName('numero').AsString;
            tab_Crud.ActiveTab := TabItem1;
          end;
        end
        else
        begin
          ShowMessage
            ('N�o foi poss�vel carregar o dados desse lote. Tente outra vez.');
          tab_Crud.ActiveTab := TabItem2;
        end;
      end;
    finally
      FreeAndNil(Query);
      ed_PesquisaLote.Text := EmptyStr;
    end;
  end
  else
    exit
end;

procedure TFrmCadCompra.ListViewPessoaItemClick(const Sender: TObject;
  const AItem: TListViewItem);
const
  _SQLView =
    'select p.*, e.QtdMun from agrojun.pessoas as p left outer join agrojun.estado as e on (p.estado = e.id) where p.id = :id';
var
  txt: TListItemText;
  Query: TFDQuery;
  id: string;
begin
  inherited;
  ed_PesquisaPessoa.Enabled := true;
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
          if Tipo_Busca = 0 then
          begin
            ed_Pessoa.Text := formatfloat('00000', Query.FieldByName('id')
              .AsFloat) + ' - ' + Query.FieldByName('nome').AsString;
            tab_Crud.ActiveTab := TabItem2;
          end
          else if Tipo_Busca = 1 then
          begin
            ed_Motorista.Text := formatfloat('00000', Query.FieldByName('id')
              .AsFloat) + ' - ' + Query.FieldByName('nome').AsString;
            tab_Crud.ActiveTab := TabItem2;
          end
          else if Tipo_Busca = 2 then
          begin
            ed_Corretor.Text := formatfloat('00000', Query.FieldByName('id')
              .AsFloat) + ' - ' + Query.FieldByName('nome').AsString;
            tab_Crud.ActiveTab := TabItem2;
          end
          else
          begin
            ed_Filtro.Text := formatfloat('00000', Query.FieldByName('id')
              .AsFloat) + ' - ' + Query.FieldByName('nome').AsString;
            tab_Crud.ActiveTab := TabItem1;
          end;
        end
        else
        begin
          ShowMessage
            ('N�o foi poss�vel carregar o dados dessa pessoa. Tente outra vez.');
          tab_Crud.ActiveTab := TabItem2;
        end;
      end;
    finally
      FreeAndNil(Query);
      ed_PesquisaPessoa.Text := EmptyStr;
    end;
  end
  else
    exit
end;

procedure TFrmCadCompra.LogCompras;
begin
  // if Acao = 0 then
  // begin
  // log(0007, MaxCod('compras'), '', ' data_compra: ' + DateToStr(DateEditCompra.Date) + ' lote: ' + edTms_Lote.Text + ' fornecedor: ' + edTms_Fornecedor.Text +
  // ' conta_bancaria: ' + edTms_ContaBancaria.Text + ' quantidade_cbs: ' + ed_Quantidade.Text + ' valor total dos animais: ' + ed_ValorTotalAnimal.Text + ' valor por cbs: ' + ed_ValorPorAnimal.Text
  // + ' idade: ' + cbx_IdadeAnimal.Items[cbx_IdadeAnimal.ItemIndex] + ' sexo: ' + cbx_SexoAnimal.Items[cbx_IdadeAnimal.ItemIndex] + ' ra�a: ' + cbx_TipoAnimal.Items[cbx_TipoAnimal.ItemIndex]
  // + ' etiqueta: ' + ed_Etiqueta.Text + ' caminh�o: ' + cbx_TipoCaminhao.Items[cbx_TipoCaminhao.ItemIndex] + ' placa: ' + ed_PlacaCaminhao.Text + ' motorista ' + edTms_Motorista.Text
  // + ' valor total frete: ' + ed_ValorTotalFrete.Text + ' valor frete por cbs: ' + ed_ValorFretePorAnimal.Text + ' corretor: ' + edTms_Corretor.Text + ' valor total comissao: ' + ed_ValorTotalComissao.Text
  // + ' valor comissao por cbs: ' + ed_ValorComisPorAnimal.Text + ' valor total compra: ' + ed_ValorTotalCompra.Text + ' valor compra por cbs: ' + ed_valorporcbs_compra.Text
  // + ' descricao: ' + ed_Obs.Text);
  // end;
  //
  // if Acao = 1 then
  // begin
  //
  // log(0007, cds_log.FieldByName('id').AsInteger, ' data_compra: ' + cds_log.FieldByName('data_compra').AsString + ' lote: ' +
  // cds_log.FieldByName('lote').AsString + ' fornecedor: ' + cds_log.FieldByName('fornecedor').AsString + ' conta_bancaria: ' +
  // cds_log.FieldByName('conta_bancaria').AsString + ' quantidade_cbs: ' + cds_log.FieldByName('quantidade_cbs').AsString + ' valor total dos animais: ' +
  // cds_log.FieldByName('valortotal_animais').AsString + ' valor por cbs: ' + cds_log.FieldByName('valorporcbs_animais').AsString
  // + ' idade: ' + cds_log.FieldByName('idade_animal').AsString + ' sexo: ' + cds_log.FieldByName('sexo_animal').AsString + ' ra�a: ' + cds_log.FieldByName('raca_animal').AsString +
  // ' etiqueta: ' + cds_log.FieldByName('etiqueta').AsString + ' caminh�o: ' + cds_log.FieldByName('tipo_caminhao').AsString + ' placa: ' + cds_log.FieldByName('placa_caminhao').AsString +
  // ' motorista: ' + cds_log.FieldByName('motorista').AsString + ' valor frete: ' + cds_log.FieldByName('valortotal_frete').AsString + ' valor frete por cbs: ' + cds_log.FieldByName('valorporcbs_frete').AsString +
  // ' corretor: ' + cds_log.FieldByName('corretor').AsString + ' valor comiss�o: ' + cds_log.FieldByName('valortotal_comissao').AsString + ' valor comissao por cbs: ' + cds_log.FieldByName('valorporcbs_comissao').AsString
  // + ' descricao: ' + cds_log.FieldByName('descricao').AsString + ' valor total compra: ' + cds_log.FieldByName('valortotal_compra').AsString + ' valor compra por cbs: ' + cds_log.FieldByName('valorporcbs_compra').AsString,
  //
  // ' data_compra: ' + DateToStr(DateEditCompra.Date) + ' lote: ' + edTms_Lote.Text + ' fornecedor: ' + edTms_Fornecedor.Text +
  // ' conta_bancaria: ' + edTms_ContaBancaria.Text + ' quantidade_cbs: ' + ed_Quantidade.Text + ' valor total dos animais: ' + ed_ValorTotalAnimal.Text + ' valor por cbs: ' + ed_ValorPorAnimal.Text
  // + ' idade: ' + cbx_IdadeAnimal.Items[cbx_IdadeAnimal.ItemIndex] + ' sexo: ' + cbx_SexoAnimal.Items[cbx_IdadeAnimal.ItemIndex] + ' ra�a: ' + cbx_TipoAnimal.Items[cbx_TipoAnimal.ItemIndex]
  // + ' etiqueta: ' + ed_Etiqueta.Text + ' caminh�o: ' + cbx_TipoCaminhao.Items[cbx_TipoCaminhao.ItemIndex] + ' placa: ' + ed_PlacaCaminhao.Text + ' motorista ' + edTms_Motorista.Text
  // + ' valor total frete: ' + ed_ValorTotalFrete.Text + ' valor frete por cbs: ' + ed_ValorFretePorAnimal.Text + ' corretor: ' + edTms_Corretor.Text + ' valor total comissao: ' + ed_ValorTotalComissao.Text
  // + ' valor comissao por cbs: ' + ed_ValorComisPorAnimal.Text + ' valor total compra: ' + ed_ValorTotalCompra.Text + ' valor compra por cbs: ' + ed_valorporcbs_compra.Text
  // + ' descricao: ' + ed_Obs.Text);
  // end;
  //
  // if Acao = 2 then
  // begin
  // log(0007, cds_log.FieldByName('id').AsInteger, ' data_compra: ' + cds_log.FieldByName('data_compra').AsString + ' lote: ' +
  // cds_log.FieldByName('lote').AsString + ' fornecedor: ' + cds_log.FieldByName('fornecedor').AsString + ' conta_bancaria: ' +
  // cds_log.FieldByName('conta_bancaria').AsString + ' quantidade_cbs: ' + cds_log.FieldByName('quantidade_cbs').AsString + ' valor total dos animais: ' +
  // cds_log.FieldByName('valortotal_animais').AsString + ' valor por cbs: ' + cds_log.FieldByName('valorporcbs_animais').AsString
  // + ' idade: ' + cds_log.FieldByName('idade_animal').AsString + ' sexo: ' + cds_log.FieldByName('sexo_animal').AsString + ' ra�a: ' + cds_log.FieldByName('raca_animal').AsString +
  // ' etiqueta: ' + cds_log.FieldByName('etiqueta').AsString + ' caminh�o: ' + cds_log.FieldByName('tipo_caminhao').AsString + ' placa: ' + cds_log.FieldByName('placa_caminhao').AsString +
  // ' motorista: ' + cds_log.FieldByName('motorista').AsString + ' valor frete: ' + cds_log.FieldByName('valortotal_frete').AsString + ' valor frete por cbs: ' + cds_log.FieldByName('valorporcbs_frete').AsString +
  // ' corretor: ' + cds_log.FieldByName('corretor').AsString + ' valor comiss�o: ' + cds_log.FieldByName('valortotal_comissao').AsString + ' valor comissao por cbs: ' + cds_log.FieldByName('valorporcbs_comissao').AsString
  // + ' descricao: ' + cds_log.FieldByName('descricao').AsString + ' valor total compra: ' + cds_log.FieldByName('valortotal_compra').AsString + ' valor compra por cbs: ' + cds_log.FieldByName('valorporcbs_compra').AsString, '')
  // end;
end;

procedure TFrmCadCompra.lst_PrincipalItemClick(const Sender: TObject;
  const AItem: TListViewItem);
const
  _SQLInicial =
    ' select c.id, c.data_compra, c.quantidade_cbs, c.valortotal_compra, c.valorporcbs_compra,            '
    + '      c.idade_animal, c.sexo_animal, c.raca_animal, c.etiqueta, c.tipo_caminhao, c.placa_caminhao,   '
    + '      c.valortotal_frete, c.valorporcbs_frete, c.valortotal_comissao, c.valorporcbs_comissao,        '
    + '      c.valortotal_animais, c.valorporcbs_animais, c.descricao, c.forma_pagto,                                                    '
    + '      f.nome as fornecedor, cc.conta, cc.id as id_cc, l.nome as lote, m.nome as motorista,                         '
    + '      r.raca as raca, ia.idade_animal as idade, tp.tipo_caminhao as caminhao,                                                      '
    + '      co.nome as corretor from compras as c                                                          '
    + ' left outer join pessoas as f on (f.id = c.fornecedor)                                               '
    + ' left outer join contas_bancarias as cc on (cc.id = c.conta_bancaria)                                '
    + ' left outer join lotes as l on (l.id = c.lote)                                                       '
    + ' left outer join pessoas as m on (m.id = c.motorista)                                                '
    + ' left outer join pessoas as co on (co.id = c.corretor)                                               '
    + ' left outer join raca_animal as r on (r.id = c.raca_animal)                                          '
    + ' left outer join idade_animal as ia on (ia.id = c.idade_animal)                                      '
    + ' left outer join tipo_caminhao as tp on (tp.id = c.tipo_caminhao)  ' +
    ' where c.id = :id order by data_compra desc;                                                         ';
var
  txt: TListItemText;
  Query: TFDQuery;
  id: string;
begin
  inherited;
  ed_pesq.Enabled := true;
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
      with AItem do
      begin

        txt := TListItemText(Objects.FindDrawable('codigo'));
        Cod_Selecao := txt.TagString.ToInteger;
        Query.Active := false;
        Query.SQL.Clear;
        Query.SQL.Add(_SQLInicial);
        Query.ParamByName('id').AsInteger := txt.TagString.ToInteger;
        Query.Active := true;

        cds_log.Active := false;
        cds_log.Active := true;
        cds_log.EmptyDataSet;
        cds_log.insert;
        cds_log.FieldByName('id').AsString := IntToStr(Cod_Selecao);
        cds_log.FieldByName('data_compra').AsDateTime :=
          Query.FieldByName('data_compra').AsDateTime;
        cds_log.FieldByName('lote').AsString := Query.FieldByName('lote')
          .AsString;;
        cds_log.FieldByName('fornecedor').AsString :=
          Query.FieldByName('fornecedor').AsString;
        cds_log.FieldByName('conta_bancaria').AsString :=
          Query.FieldByName('conta').AsString;
        cds_log.FieldByName('quantidade_cbs').AsString :=
          Query.FieldByName('quantidade_cbs').AsString;
        cds_log.FieldByName('valortotal_compra').AsString :=
          Query.FieldByName('valortotal_compra').AsString;
        cds_log.FieldByName('valorporcbs_compra').AsString :=
          Query.FieldByName('valorporcbs_compra').AsString;
        cds_log.FieldByName('idade_animal').AsString :=
          Query.FieldByName('idade').AsString;
        cds_log.FieldByName('sexo_animal').AsString :=
          Query.FieldByName('sexo_animal').AsString;
        cds_log.FieldByName('raca_animal').AsString :=
          Query.FieldByName('raca').AsString;
        cds_log.FieldByName('etiqueta').AsString :=
          Query.FieldByName('etiqueta').AsString;
        cds_log.FieldByName('tipo_caminhao').AsString :=
          Query.FieldByName('caminhao').AsString;
        cds_log.FieldByName('placa_caminhao').AsString :=
          Query.FieldByName('placa_caminhao').AsString;
        cds_log.FieldByName('motorista').AsString :=
          Query.FieldByName('motorista').AsString;
        cds_log.FieldByName('valortotal_frete').AsString :=
          Query.FieldByName('valortotal_frete').AsString;
        cds_log.FieldByName('valorporcbs_frete').AsString :=
          Query.FieldByName('valorporcbs_frete').AsString;
        cds_log.FieldByName('corretor').AsString :=
          Query.FieldByName('corretor').AsString;
        cds_log.FieldByName('valortotal_comissao').AsString :=
          Query.FieldByName('valortotal_comissao').AsString;
        cds_log.FieldByName('valorporcbs_comissao').AsString :=
          Query.FieldByName('valorporcbs_comissao').AsString;
        cds_log.FieldByName('descricao').AsString :=
          Query.FieldByName('descricao').AsString;
        cds_log.FieldByName('valortotal_animais').AsString :=
          Query.FieldByName('valortotal_animais').AsString;
        cds_log.FieldByName('valorporcbs_animais').AsString :=
          Query.FieldByName('valorporcbs_animais').AsString;
        cds_log.Post;

        if Query.RecordCount > 0 then
        begin
          PopularCampos(Query);

          tab_Crud.ActiveTab := TabItem2;
        end
        else
        begin
          ShowMessage
            ('N�o foi poss�vel carregar o dados dessa despesa. Tente outra vez.');
          tab_Crud.ActiveTab := TabItem1;
        end;
      end;
    finally
      FreeAndNil(Query);
    end;
  end
  else
    exit
end;

procedure TFrmCadCompra.PopulaListFiltros(QBanco: TFDQuery);
var
  x: integer;
  item: TListViewItem;
  txt: TListItemText;
begin

  try
    if (QBanco.RecordCount = 0) then
    begin
      lay_listvazia.Visible := true;
    end
    else
    begin
      lay_listvazia.Visible := false;
    end;

    lst_Principal.Items.Clear;
    lst_Principal.BeginUpdate;

    for x := 1 to 1 do
    begin
      item := lst_Principal.Items.Add;

      with item do
      begin
        txt := TListItemText(Objects.FindDrawable('lbl_codigo'));
        txt.Text := 'C�DIGO';
        txt.TagString := '0';

        txt := TListItemText(Objects.FindDrawable('lbl_data'));
        txt.Text := 'DATA';

        txt := TListItemText(Objects.FindDrawable('lbl_lote'));
        txt.Text := 'LOTE';

        txt := TListItemText(Objects.FindDrawable('lbl_fornecedor'));
        txt.Text := 'FORNECEDOR';

        txt := TListItemText(Objects.FindDrawable('lbl_conta'));
        txt.Text := 'CONTA BANC�RIA';

        txt := TListItemText(Objects.FindDrawable('lbl_quantidade'));
        txt.Text := 'QUANTIDADE';

        txt := TListItemText(Objects.FindDrawable('lbl_valorcbs'));
        txt.Text := 'VALOR P/ CBS';

        txt := TListItemText(Objects.FindDrawable('lbl_valorTotal'));
        txt.Text := 'VALOR TOTAL';

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

        txt := TListItemText(Objects.FindDrawable('data'));
        txt.Text := QBanco.FieldByName('data_compra').AsString;

        txt := TListItemText(Objects.FindDrawable('lote'));
        txt.Text := QBanco.FieldByName('lote').AsString;

        txt := TListItemText(Objects.FindDrawable('fornecedor'));
        txt.Text := QBanco.FieldByName('fornecedor').AsString;

        txt := TListItemText(Objects.FindDrawable('conta'));
        txt.Text := QBanco.FieldByName('conta').AsString;

        txt := TListItemText(Objects.FindDrawable('quantidade'));
        txt.Text := QBanco.FieldByName('quantidade_cbs').AsString;

        txt := TListItemText(Objects.FindDrawable('valorTotal'));
        txt.Text := 'R$' + formatfloat('#,##0.00',
          QBanco.FieldByName('valortotal_compra').AsFloat);

        txt := TListItemText(Objects.FindDrawable('valorcbs'));
        txt.Text := 'R$' + formatfloat('#,##0.00',
          QBanco.FieldByName('valorporcbs_compra').AsFloat);
      end;

      QBanco.Next
    end;
  finally
    lst_Principal.EndUpdate;
    FreeAndNil(QBanco);
  end;
end;

procedure TFrmCadCompra.PopularCampos(Query: TFDQuery);
begin
  // DATA DA COMPRA
  DateEditCompra.Date := Query.FieldByName('data_compra').AsDateTime;
  // LOTE
  // edTms_Lote.Text := Query.FieldByName('lote').AsString;
  ed_Lote.Text := Query.FieldByName('lote').AsString;
  // FORNECEDOR
  // edTms_Fornecedor.Text := Query.FieldByName('fornecedor').AsString;
  ed_Pessoa.Text := Query.FieldByName('fornecedor').AsString;
  // CONTA BANC�RIA
  // edTms_ContaBancaria.Text := Query.FieldByName('conta').AsString;
  ed_Conta.Text := formatfloat('00000', Query.FieldByName('id_cc')
              .AsFloat) + ' - ' + Query.FieldByName('conta').AsString;
  // QUANTIDADE DE CBS
  ed_Quantidade.Text := Query.FieldByName('quantidade_cbs').AsString;
  // VALOR TOTAL DOS ANIMAIS
  ed_ValorTotalAnimal.Text := formatfloat('###,##0.00',
    Query.FieldByName('valortotal_animais').AsFloat);
  // VALOR POR CBS
  ed_ValorPorAnimal.Text := formatfloat('###,##0.00',
    Query.FieldByName('valorporcbs_animais').AsFloat);
  // IDADE ANIMAL
  ConsultaIdadeAnimal;
  cbx_IdadeAnimal.ItemIndex := Query.FieldByName('idade_animal').AsInteger;
  // SEXO ANIMAL
  cbx_SexoAnimal.ItemIndex := Query.FieldByName('sexo_animal').AsInteger;
  // RA�A ANIMAL
  ConsultaRacaAnimal;
  cbx_TipoAnimal.ItemIndex := Query.FieldByName('raca_animal').AsInteger;
  // ETIQUETA
  ed_Etiqueta.Text := Query.FieldByName('etiqueta').AsString;
  // TIPO DE CAMINH�O
  ConsultaTipoCaminhao;
  cbx_TipoCaminhao.ItemIndex := Query.FieldByName('tipo_caminhao').AsInteger;
  // PLACA CAMINH�O
  ed_PlacaCaminhao.Text := Query.FieldByName('placa_caminhao').AsString;
  //FORMA DE PAGAMENTO
  ConsultaFormaPagto;
  cbx_FormaPagto.ItemIndex := Query.FieldByName('forma_pagto').AsInteger;
  // MOTORISTA
  // edTms_Motorista.Text := Query.FieldByName('motorista').AsString;
  ed_Motorista.Text := Query.FieldByName('motorista').AsString;
  // VALOR TOTAL DO FRETE
  ed_ValorTotalFrete.Text := formatfloat('###,##0.00',
    Query.FieldByName('valortotal_frete').AsFloat);
  // VALOR FRETE POR ANIMAL
  ed_ValorFretePorAnimal.Text := formatfloat('###,##0.00',
    Query.FieldByName('valorporcbs_frete').AsFloat);
  // CORRETOR
  // edTms_Corretor.Text := Query.FieldByName('corretor').AsString;
  ed_Corretor.Text := Query.FieldByName('corretor').AsString;
  // VALOR TOTAL DA COMISS�O
  ed_ValorTotalComissao.Text := formatfloat('###,##0.00',
    Query.FieldByName('valortotal_comissao').AsFloat);
  // VALOR COMISS�O POR ANIMAL
  ed_ValorComisPorAnimal.Text := formatfloat('###,##0.00',
    Query.FieldByName('valorporcbs_comissao').AsFloat);
  // DESCRI��O
  ed_Obs.Text := Query.FieldByName('descricao').AsString;
  // VALOR TOTAL DA COMPRA
  ed_ValorTotalCompra.Text := formatfloat('###,##0.00',
    Query.FieldByName('valortotal_compra').AsFloat);
  // VALOR POR CBS DA COMPRA
  ed_valorporcbs_compra.Text := formatfloat('###,##0.00',
    Query.FieldByName('valorporcbs_compra').AsFloat);
end;

procedure TFrmCadCompra.rbFisica1Change(Sender: TObject);
begin
  inherited;
  if rbFisica1.IsChecked then
    rbJuridica1.IsChecked := false;
end;

procedure TFrmCadCompra.rbFisica2Change(Sender: TObject);
begin
  inherited;
  if rbFisica2.IsChecked then
    rbJuridica2.IsChecked := false;
end;

procedure TFrmCadCompra.rbFisica3Change(Sender: TObject);
begin
  inherited;
  if rbFisica3.IsChecked then
    rbJuridica3.IsChecked := false;
end;

procedure TFrmCadCompra.rbJuridica1Change(Sender: TObject);
begin
  inherited;
  if rbJuridica1.IsChecked then
    rbFisica1.IsChecked := false;
end;

procedure TFrmCadCompra.rbJuridica2Change(Sender: TObject);
begin
  inherited;
  if rbJuridica2.IsChecked then
    rbFisica2.IsChecked := false;
end;

procedure TFrmCadCompra.rbJuridica3Change(Sender: TObject);
begin
  inherited;
  if rbJuridica3.IsChecked then
    rbFisica3.IsChecked := false;
end;

procedure TFrmCadCompra.RemoveInfoLotes(id: integer);
const
  SQL = 'UPDATE agrojun.lotes SET id_compra = 0, status = 0 WHERE id = :id';
var
  Query: TFDQuery;
begin
  try
    if id <> 0 then
    begin
      Query := TFDQuery.Create(self);
      Query.Connection := dm.FDConnection;
      Query.Active := false;
      Query.SQL.Clear;
      Query.SQL.Add(SQL);
      Query.ParamByName('id').AsInteger := id;
      Query.ExecSQL;
    end;
  finally
    FreeAndNil(Query);
  end;
end;

function TFrmCadCompra.RetornaIdConta(conta: string): integer;
const
  _SQL = 'select id from contas_bancarias where conta = :conta';
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.Create(nil);
    qry.Connection := dm.FDConnection;
    qry.Active := false;
    qry.SQL.Clear;
    qry.SQL.Text := _SQL;
    qry.ParamByName('conta').AsString := conta;
    qry.Active := true;
    if not qry.IsEmpty then
      Result := qry.FieldByName('id').AsInteger
    else
      Result := 0;
  finally
    FreeAndNil(qry);
  end;
end;

function TFrmCadCompra.RetornaIdLote(numero: string): integer;
const
  _SQL = 'select id from lotes where nome = :numero';
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.Create(nil);
    qry.Connection := dm.FDConnection;
    qry.Active := false;
    qry.SQL.Clear;
    qry.SQL.Text := _SQL;
    qry.ParamByName('numero').AsString := numero;
    qry.Active := true;
    if not qry.IsEmpty then
      Result := qry.FieldByName('id').AsInteger
    else
      Result := 0;
  finally
    FreeAndNil(qry);
  end;
end;

function TFrmCadCompra.RetornaIdPessoa(nome: string): integer;
const
  _SQL = 'select id from pessoas where nome = :nome';
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.Create(nil);
    qry.Connection := dm.FDConnection;
    qry.Active := false;
    qry.SQL.Clear;
    qry.SQL.Text := _SQL;
    qry.ParamByName('nome').AsString := nome;
    qry.Active := true;
    if not qry.IsEmpty then
      Result := qry.FieldByName('id').AsInteger
    else
      Result := 0;
  finally
    FreeAndNil(qry);
  end;
end;

function TFrmCadCompra.SalvarLote(numero: integer): integer;
const
  SQLInsert =
    'INSERT INTO agrojun.lotes (numero, nome) VALUES (:numero, :nome)';
  SQLVerifica = 'SELECT * from agrojun.lotes where nome = :nome';
var
  Query: TFDQuery;
begin
  try
    Query := TFDQuery.Create(self);
    Query.Connection := dm.FDConnection;
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add(SQLVerifica);
    Query.ParamByName('nome').AsString := IntToStr(numero);
    Query.Open();
    if Query.IsEmpty then
    begin
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add(SQLInsert);
      Query.ParamByName('nome').AsString := IntToStr(numero);
      Query.ParamByName('numero').AsString := formatfloat('00000', MaxCod('lotes'));
      Query.ExecSQL;
      result := 1;
    end
    else
      result := 0;
  finally
    FreeAndNil(Query);
  end;
end;

procedure TFrmCadCompra.SalvarPessoa(nome: string; tipo_pessoa: integer);
const
  SQLInsert =
    'INSERT INTO agrojun.pessoas (nome, tipo_pessoa, cidade, estado, fornecedor, cliente)             '
    + '                VALUES (:nome, :tipo_pessoa, :cidade, :estado, :fornecedor, '
    + '                :cliente)';
var
  Query: TFDQuery;
begin
  try
    Query := TFDQuery.Create(self);
    Query.Connection := dm.FDConnection;
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add(SQLInsert);
    Query.ParamByName('nome').AsString := nome;
    Query.ParamByName('tipo_pessoa').AsString := IntToStr(tipo_pessoa);
    Query.ParamByName('cidade').AsString := '120';
    Query.ParamByName('estado').AsString := '009';
    Query.ParamByName('fornecedor').AsInteger := 1;
    Query.ParamByName('cliente').AsInteger := 1;

    Query.ExecSQL;
  finally
    FreeAndNil(Query);
  end;
end;

procedure TFrmCadCompra.Validar(cod_vali: integer);
begin
  if (ed_Lote.Text = EmptyStr) or (cod_vali = 1) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 6001 : ' + sLineBreak + 'Selecione um LOTE v�lido!';
    ed_Lote.SetFocus;
    abort;
  end;

  if (ed_Pessoa.Text = EmptyStr) or (cod_vali = 2) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 6002 : ' + sLineBreak +
      'Selecione um(a) FORNECEDOR(A) v�lido(a)!';
    ed_Pessoa.SetFocus;
    abort;
  end;

  if (ed_Conta.Text = EmptyStr) or (cod_vali = 3) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 6003 : ' + sLineBreak +
      'Selecione uma CONTA v�lida!';
    ed_Conta.SetFocus;
    abort;
  end;

  if (ed_Quantidade.Text = EmptyStr) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 6004 : ' + sLineBreak +
      'Informe a QUANTIDADE de animais!';
    ed_Quantidade.SetFocus;
    abort;
  end;

  if (ed_ValorTotalAnimal.Text = EmptyStr) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 6005 : ' + sLineBreak +
      'Informe o VALOR TOTAL DA COMPRA!';
    ed_ValorTotalAnimal.SetFocus;
    abort;
  end;

  if cbx_IdadeAnimal.ItemIndex < 1 then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 6006 : ' + sLineBreak +
      'Selecione a IDADE do (s) animal (ais)!';
    cbx_IdadeAnimal.SetFocus;
    abort;
  end;

  if cbx_SexoAnimal.ItemIndex < 1 then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 6007 : ' + sLineBreak +
      'Selecione o SEXO do (s) animal (ais)!';
    cbx_SexoAnimal.SetFocus;
    abort;
  end;

  if cbx_TipoAnimal.ItemIndex < 1 then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 6008 : ' + sLineBreak +
      'Selecione a RA�A do (s) animal (ais)!';
    cbx_TipoAnimal.SetFocus;
    abort;
  end;

  if (ed_ValorTotalFrete.Text = EmptyStr) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 6009 : ' + sLineBreak +
      'Insira o VALOR TOTAL DO FRETE!';
    ed_ValorTotalFrete.SetFocus;
    abort;
  end;

  if (ed_ValorTotalComissao.Text = EmptyStr) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 6010 : ' + sLineBreak +
      'Insira o VALOR TOTAL DA COMISS�O!';
    ed_ValorTotalComissao.SetFocus;
    abort;
  end;

  if (cod_vali = 4) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 6011 : ' + sLineBreak +
      'Selecione um(a) MOTORISTA v�lido(a)!';
    ed_Motorista.SetFocus;
    abort;
  end;

  if (cod_vali = 5) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 6012 : ' + sLineBreak +
      'Selecione um(a) CORRETOR(A) v�lido(a)!';
    ed_Corretor.SetFocus;
    abort;
  end;

  if cod_vali = 8 then
  begin
    if not rbFisica1.IsChecked and not rbJuridica1.IsChecked then
    begin
      lay_error.Visible := true;
      lbl_Erro.Text := 'Erro 6013 : ' + sLineBreak +
        'Selecione um TIPO DE PESSOA v�lido no(a) FORNECEDOR(A)!';
      rbFisica1.SetFocus;
      abort;
    end
    else if not rbFisica2.IsChecked and not rbJuridica2.IsChecked then
    begin
      lay_error.Visible := true;
      lbl_Erro.Text := 'Erro 6014 : ' + sLineBreak +
        'Selecione um TIPO DE PESSOA v�lido no(a) MOTORISTA!';
      rbFisica2.SetFocus;
      abort;
    end
    else if not rbFisica3.IsChecked and not rbJuridica3.IsChecked then
    begin
      lay_error.Visible := true;
      lbl_Erro.Text := 'Erro 6015 : ' + sLineBreak +
        'Selecione um TIPO DE PESSOA v�lido no(a) CORRETOR(A)!';
      rbFisica3.SetFocus;
      abort;
    end;
  end;

  if (cod_vali = 9) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 6016 : ' + sLineBreak +
      'J� existe um lote cadastrado com esse nome/n�mero!';
    ed_Corretor.SetFocus;
    abort;
  end;

  if cbx_FormaPagto.ItemIndex < 1 then
  begin
    lay_error.Visible := True;
    lbl_Erro.Text := 'Erro 7007 : ' + sLineBreak + 'Selecione a FORMA DE PAGAMENTO!';
    cbx_FormaPagto.SetFocus;
    abort;
  end;

end;

function TFrmCadCompra.ValidarPessoa(nome: string): integer;
const
  SQL = 'select nome from agrojun.pessoas where nome = :nome';
var
  Query: TFDQuery;
begin
  try
    if not nome.IsEmpty then
    begin
      Query := TFDQuery.Create(self);
      Query.Connection := dm.FDConnection;
      Query.Active := false;
      Query.SQL.Clear;
      Query.SQL.Add(SQL);
      Query.ParamByName('nome').AsString := nome;
      Query.Open;
      if Query.IsEmpty then
        result := 0
      else
        result := 1;
    end;
  finally
    FreeAndNil(Query);
  end;
end;

end.
