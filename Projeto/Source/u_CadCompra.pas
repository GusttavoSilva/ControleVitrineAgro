{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N-,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED ON}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN TYPEINFO_IMPLICITLY_ADDED ON}
{$WARN RLINK_WARNING ON}
{$WARN IMPLICIT_STRING_CAST ON}
{$WARN IMPLICIT_STRING_CAST_LOSS ON}
{$WARN EXPLICIT_STRING_CAST OFF}
{$WARN EXPLICIT_STRING_CAST_LOSS OFF}
{$WARN CVT_WCHAR_TO_ACHAR ON}
{$WARN CVT_NARROWING_STRING_LOST ON}
{$WARN CVT_ACHAR_TO_WCHAR ON}
{$WARN CVT_WIDENING_STRING_LOST ON}
{$WARN NON_PORTABLE_TYPECAST ON}
{$WARN XML_WHITESPACE_NOT_ALLOWED ON}
{$WARN XML_UNKNOWN_ENTITY ON}
{$WARN XML_INVALID_NAME_START ON}
{$WARN XML_INVALID_NAME ON}
{$WARN XML_EXPECTED_CHARACTER ON}
{$WARN XML_CREF_NO_RESOLVE ON}
{$WARN XML_NO_PARM ON}
{$WARN XML_NO_MATCHING_PARM ON}
{$WARN IMMUTABLE_STRINGS OFF}
unit u_CadCompra;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  u_CrudCad, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.Edit, FMX.Objects, FMX.ListView,
  FMX.TabControl, FMX.Controls.Presentation, FMX.Layouts, FMX.ComboEdit,
  FMX.DateTimeCtrls, FMX.SearchBox,
  FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, System.Rtti, FMX.Grid.Style,
  FMX.Grid, FMX.ScrollBox, winapi.shellapi, FMX.Platform.Win,
  FireDAC.Stan.Async, FireDAC.DApt, FMX.frxClass, Data.Bind.Components,
  Data.Bind.DBScope, FMX.ListBox, FireDAC.Stan.StorageBin, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, FMX.Bind.Grid, System.Bindings.Outputs,
  FMX.Bind.Editors, Data.Bind.Grid;

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
    lytEtiqueta: TLayout;
    ed_Etiqueta: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
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
    lay_lstvaziaLote: TLayout;
    Image6: TImage;
    Label39: TLabel;
    ListViewLote: TListView;
    ed_Lote: TEdit;
    ClearEditButton2: TClearEditButton;
    TabPessoa: TTabItem;
    lay_lstvaziaPessoa: TLayout;
    Image3: TImage;
    Label41: TLabel;
    Layout1: TLayout;
    ListViewPessoa: TListView;
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
    ListViewConta: TListView;
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
    Layout26: TLayout;
    Rectangle14: TRectangle;
    Layout27: TLayout;
    Image20: TImage;
    Rectangle11: TRectangle;
    ed_PesquisaLote: TEdit;
    ClearEditButton7: TClearEditButton;
    Label40: TLabel;
    Label46: TLabel;
    Layout15: TLayout;
    Rectangle4: TRectangle;
    Layout16: TLayout;
    Image5: TImage;
    Rectangle5: TRectangle;
    ed_PesquisaPessoa: TEdit;
    ClearEditButton3: TClearEditButton;
    Label42: TLabel;
    Label47: TLabel;
    Rectangle10: TRectangle;
    ed_PesquisaConta: TEdit;
    ClearEditButton8: TClearEditButton;
    Label48: TLabel;
    Label49: TLabel;
    Layout17: TLayout;
    Rectangle8: TRectangle;
    Layout18: TLayout;
    Image2: TImage;
    Label44: TLabel;
    TabItem3: TTabItem;
    Layout19: TLayout;
    Rectangle9: TRectangle;
    Layout20: TLayout;
    Layout21: TLayout;
    Label87: TLabel;
    lytQuantidade: TLayout;
    ed_Quantidade: TEdit;
    Label4: TLabel;
    Label34: TLabel;
    lytValorPorAnimal: TLayout;
    ed_ValorPorAnimal: TEdit;
    Label22: TLabel;
    lytValorTotalAnimal: TLayout;
    ed_ValorTotalAnimal: TEdit;
    Label13: TLabel;
    Label21: TLabel;
    lytValorTotalCompra: TLayout;
    ed_ValorTotalCompra: TEdit;
    Label37: TLabel;
    lytValorTotalCompraAnimal: TLayout;
    ed_valorporcbs_compra: TEdit;
    Label38: TLabel;
    Layout22: TLayout;
    Rectangle12: TRectangle;
    Layout23: TLayout;
    Rectangle13: TRectangle;
    Layout24: TLayout;
    Img_BtnSalvar2: TImage;
    Img_BtnCancelar2: TImage;
    Img_BtnVoltar2: TImage;
    Label51: TLabel;
    Layout25: TLayout;
    Rectangle15: TRectangle;
    Label52: TLabel;
    Layout28: TLayout;
    StringGridAnimais: TStringGrid;
    CheckColumn1: TCheckColumn;
    qtd: TStringColumn;
    valor_animal: TStringColumn;
    valor_total: TStringColumn;
    lytBotoes: TLayout;
    lytApagarSelec: TLayout;
    rctApagarSelecionados: TRectangle;
    lblApagarSelec: TLabel;
    lytInfoEdit: TLayout;
    Label53: TLabel;
    lytSexoAnimal: TLayout;
    cbx_SexoAnimal: TComboEdit;
    Label11: TLabel;
    Label18: TLabel;
    lytTipoAnimal: TLayout;
    cbx_TipoAnimal: TComboEdit;
    Label10: TLabel;
    Label19: TLabel;
    lytIdadeAnimal: TLayout;
    Label20: TLabel;
    cbx_IdadeAnimal: TComboEdit;
    Label12: TLabel;
    raca_animal: TStringColumn;
    sexo: TStringColumn;
    idade_animal: TStringColumn;
    id: TStringColumn;
    Layout29: TLayout;
    ed_QuantidadeTotal: TEdit;
    Label54: TLabel;
    TabItem4: TTabItem;
    Layout31: TLayout;
    Rectangle16: TRectangle;
    Layout32: TLayout;
    Img_anexo: TImage;
    Image9: TImage;
    Layout33: TLayout;
    lst_Anexos: TListView;
    OpenDialog: TOpenDialog;
    img_delAnex: TImage;
    Image8: TImage;
    Rectangle17: TRectangle;
    Label56: TLabel;
    Layout34: TLayout;
    rct_AnexoArq: TRectangle;
    Label57: TLabel;
    recibo: TFDQuery;
    frxRecibo: TfrxReport;
    lay_Recibo: TLayout;
    Rectangle18: TRectangle;
    Rectangle19: TRectangle;
    btn_ReciboFrete: TButton;
    btn_ReciboVenda: TButton;
    btn_ReciboComissao: TButton;
    Label35: TLabel;
    img_recibo: TImage;
    ckbCadNow4: TCheckBox;
    rct_fgto: TRectangle;
    Label36: TLabel;
    lay_parc: TLayout;
    Rectangle35: TRectangle;
    Rectangle36: TRectangle;
    Layout56: TLayout;
    Rectangle37: TRectangle;
    lbl: TLabel;
    Label79: TLabel;
    cbx_FormaPagto: TComboEdit;
    Label80: TLabel;
    Label81: TLabel;
    lay_GerarPac: TLayout;
    cbx_Parc: TComboBox;
    ed_DiasParc: TEdit;
    ed_EntradaValor: TEdit;
    Grid1: TGrid;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Rectangle38: TRectangle;
    Label85: TLabel;
    Rectangle39: TRectangle;
    Label86: TLabel;
    ckb_GerarParcela: TCheckBox;
    BindSourceDB1: TBindSourceDB;
    Layout35: TLayout;
    Rectangle21: TRectangle;
    Rectangle22: TRectangle;
    Layout36: TLayout;
    Rectangle23: TRectangle;
    Label50: TLabel;
    Label55: TLabel;
    ComboEdit2: TComboEdit;
    Label58: TLabel;
    Label59: TLabel;
    Layout37: TLayout;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Grid2: TGrid;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Rectangle24: TRectangle;
    Label63: TLabel;
    Rectangle25: TRectangle;
    Label64: TLabel;
    CheckBox1: TCheckBox;
    Rectangle26: TRectangle;
    Label45: TLabel;
    cdsParc: TFDMemTable;
    cdsParcnum_parc: TIntegerField;
    cdsParcdata: TDateTimeField;
    cdsParcvalor: TFloatField;
    cdsParcstatus: TStringField;
    BindingsList1: TBindingsList;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB22: TLinkGridToDataSource;
    ckb_FreteParc: TCheckBox;
    ckb_ComissaoParc: TCheckBox;
    ckb_FreteDesc: TCheckBox;
    ckb_ComissaoDesc: TCheckBox;
    procedure ed_ValorTotalAnimalKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure ed_ValorTotalFreteKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure ed_ValorTotalComissaoKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure Img_BtnNovoClick(Sender: TObject);
    procedure ed_ValorTotalAnimalExit(Sender: TObject);
    procedure ed_ValorPorAnimalChange(Sender: TObject);
    procedure ed_ValorTotalFreteExit(Sender: TObject);
    procedure ed_ValorTotalComissaoExit(Sender: TObject);
    procedure ed_ValorFretePorAnimalChange(Sender: TObject);
    procedure ed_ValorComisPorAnimalChange(Sender: TObject);
    procedure Img_BtnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lst_PrincipalItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure Img_BtnEditarClick(Sender: TObject);
    procedure Img_BtnCancelarClick(Sender: TObject);
    procedure Img_BtnExcluirClick(Sender: TObject);
    procedure ed_LoteEnter(Sender: TObject);
    procedure ListViewLoteItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure Image7Click(Sender: TObject);
    procedure ed_PesquisaLoteChangeTracking(Sender: TObject);
    procedure ed_PesquisaPessoaChangeTracking(Sender: TObject);
    procedure ed_PessoaEnter(Sender: TObject);
    procedure ListViewPessoaItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure ed_MotoristaEnter(Sender: TObject);
    procedure ed_CorretorEnter(Sender: TObject);
    procedure ed_PesquisaContaChangeTracking(Sender: TObject);
    procedure ed_ContaEnter(Sender: TObject);
    procedure ListViewContaItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure ckbCadNow1Change(Sender: TObject);
    procedure ckbCadNow2Change(Sender: TObject);
    procedure ckbCadNow3Change(Sender: TObject);
    procedure rbFisica1Change(Sender: TObject);
    procedure rbJuridica1Change(Sender: TObject);
    procedure rbFisica2Change(Sender: TObject);
    procedure rbFisica3Change(Sender: TObject);
    procedure rbJuridica2Change(Sender: TObject);
    procedure rbJuridica3Change(Sender: TObject);
    procedure ed_LoteKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure Label52Click(Sender: TObject);
    procedure Img_BtnVoltar2Click(Sender: TObject);
    procedure Rectangle12Click(Sender: TObject);
    procedure rctApagarSelecionadosClick(Sender: TObject);
    procedure StringGridAnimaisCellDblClick(const Column: TColumn; const Row: Integer);
    procedure Image9Click(Sender: TObject);
    procedure Img_anexoClick(Sender: TObject);
    procedure rct_AnexoArqClick(Sender: TObject);
    procedure lst_AnexosItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure Image8Click(Sender: TObject);
    procedure img_delAnexClick(Sender: TObject);
    procedure btn_ReciboComissaoClick(Sender: TObject);
    procedure btn_ReciboFreteClick(Sender: TObject);
    procedure btn_ReciboVendaClick(Sender: TObject);
    procedure img_reciboClick(Sender: TObject);
    procedure rct_fgtoClick(Sender: TObject);
    procedure Rectangle26Click(Sender: TObject);
    procedure Rectangle37Click(Sender: TObject);
    procedure cbx_FormaPagtoChangeTracking(Sender: TObject);
    procedure ckb_GerarParcelaChange(Sender: TObject);
    procedure Rectangle39Click(Sender: TObject);
    procedure Rectangle38Click(Sender: TObject);
    procedure ed_EntradaValorKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure ckb_FreteParcChange(Sender: TObject);
    procedure ckb_ComissaoParcChange(Sender: TObject);
    procedure ckb_FreteDescChange(Sender: TObject);
    procedure ckb_ComissaoDescChange(Sender: TObject);
  private
    sbCompra: TSearchBox;
    sbLote: TSearchBox;
    Cod_Selecao: Integer;
    sbPessoa: TSearchBox;
    sbConta: TSearchBox;
    { Private declarations }
    procedure Validar(cod_vali: Integer);
    procedure CalcValorPorAnimal;
    function RetornaIdPessoa(nome: string): Integer;
    function RetornaIdConta(conta: string): Integer;
    function RetornaIdLote(numero: string): Integer;
    procedure ConsultaIdadeAnimal;
    procedure ConsultaRacaAnimal;
    procedure ConsultaTipoCaminhao;
    function AlteraSaldo(id: Integer; saldo: double): Integer;
    function BuscarSaldo(id: Integer): double;
    procedure ConsultaCompras;
    procedure PopularCampos(Query: TFDQuery);
    procedure PopulaListFiltros(QBanco: TFDQuery);
    procedure CalcValorTotal;
    procedure LogCompras;
    function AlteraQtdAnimaisLote(id: Integer; saldo: double; vt_compra: double; vtcbs_compra: double): Integer;
    function BuscarQtdAnimaisLote(id: Integer): double;
    procedure AddInfoLotes(id: Integer; id_compra: Integer; status: Integer);
    procedure RemoveInfoLotes(id: Integer);
    procedure ConsultaBancoLotes;
    procedure ConsultaBancoPessoas;
    procedure ConsultaConta;
    function ValidarPessoa(nome: string): Integer;
    procedure SalvarPessoa(nome: string; tipo_pessoa: Integer);
    function SalvarLote(numero: string): Integer;
    procedure ConsultaFormaPagto;
    procedure DeleteRow(ARowIndex: Integer; AGrid: TStringGrid);
    procedure LimpaStringGrid(RowNumber: Integer; StringGrid1: TStringGrid);
    procedure PopularComprasItens(Query: TFDQuery);
    procedure anexos(cod: Integer);
    procedure CarregaRelatorio(const pReport: TfrxReport; tipo: Integer);
    procedure GeraParcelas(Data: TDateTime; num_parc, num_dias: Integer; valor: double);
    procedure GravaParcelas(movimentacao: string; id_movimentacao, conta_bancaria, id_pessoa: Integer);
  public
    { Public declarations }
  end;

var
  FrmCadCompra: TFrmCadCompra;
  ValorTotal, ValorParc: double;
  QtdAnimais, Tipo_Busca, Edit, r, id_compra: Integer;
  id_anexo: string;

implementation

{$R *.fmx}

uses u_Library, u_DM, winapi.Windows, System.DateUtils;

{ TFrmCadCompra }

procedure TFrmCadCompra.CarregaRelatorio(const pReport: TfrxReport; tipo: Integer);
const
  ReciboFrete =
    ' select v.id,v.data_compra as data, valortotal_frete as valor, p.nome, case when p.cpf_pessoa is null then ''NÃO CADASTRADO'' else p.cpf_pessoa end as cpf_pessoa from compras v '
    + ' left outer join pessoas p on (p.id = v.motorista) ' + ' where v.id = :id; ';
  ReciboComissao =
    ' select v.id,v.data_compra as data, valortotal_comissao as valor, p.nome, case when p.cpf_pessoa is null then ''NÃO CADASTRADO'' else p.cpf_pessoa end as cpf_pessoa from compras v '
    + ' left outer join pessoas p on (p.id = v.corretor) ' + ' where v.id = :id; ';
  ReciboVenda =
    ' select v.id,v.data_compra as data, (v.valortotal_compra - v.valortotal_frete - v.valortotal_comissao) as valor, p.nome, case when p.cpf_pessoa is null then ''NÃO CADASTRADO'' else p.cpf_pessoa end as cpf_pessoa, v.descricao from compras v '
    + ' left outer join pessoas p on (p.id = v.fornecedor) ' + ' where v.id = :id ';

begin
  lay_Recibo.Visible := false;
  recibo.Active := false;
  recibo.SQL.Clear;
  case tipo of
    1:
      begin
        recibo.SQL.Add(ReciboFrete);
      end;
    2:
      begin
        recibo.SQL.Add(ReciboComissao);
      end;
    3:
      begin
        recibo.SQL.Add(ReciboVenda);
      end;
  end;

  recibo.Params.ParamByName('id').AsInteger := Cod_Selecao;
  recibo.Active := true;

  frxRecibo.Variables['numRecibo'] := QuotedStr('08' + formatfloat('0000', recibo.FieldByName('id').AsFloat));
  frxRecibo.Variables['id'] := QuotedStr(formatfloat('0000', recibo.FieldByName('id').AsFloat));
  case tipo of
    1:
      begin
        frxRecibo.Variables['tipoRecibo'] := QuotedStr('FRETE DE VENDA');
      end;
    2:
      begin
        frxRecibo.Variables['tipoRecibo'] := QuotedStr('COMISSÃO DE VENDA');
      end;
    3:
      begin
        frxRecibo.Variables['tipoRecibo'] := QuotedStr('VENDA');
      end;
  end;
  frxRecibo.Variables['nomePessoa'] := QuotedStr(recibo.FieldByName('nome').AsString);
  frxRecibo.Variables['CPF'] := QuotedStr(recibo.FieldByName('cpf_pessoa').AsString);
  frxRecibo.Variables['valor'] := QuotedStr(formatfloat('#,##0.00', recibo.FieldByName('valor').AsFloat));
  frxRecibo.Variables['extenso'] := QuotedStr(valorPorExtenso(recibo.FieldByName('valor').AsFloat));
  if tipo = 3 then
    frxRecibo.Variables['descricao'] := QuotedStr(recibo.FieldByName('descricao').AsString)
  else
    frxRecibo.Variables['descricao'] := QuotedStr('');
  frxRecibo.Variables['data'] := QuotedStr(FormatDateTime('dd/mm/yyyy', recibo.FieldByName('data').AsFloat));

  pReport.PrepareReport;
  pReport.ShowPreparedReport;
end;

procedure TFrmCadCompra.img_reciboClick(Sender: TObject);
begin
  inherited;
  lay_Recibo.Visible := true;
end;

procedure TFrmCadCompra.btn_ReciboFreteClick(Sender: TObject);
begin
  inherited;
  CarregaRelatorio(frxRecibo, 1);
end;

procedure TFrmCadCompra.btn_ReciboComissaoClick(Sender: TObject);
begin
  inherited;
  CarregaRelatorio(frxRecibo, 2);
end;

procedure TFrmCadCompra.btn_ReciboVendaClick(Sender: TObject);
begin
  inherited;
  CarregaRelatorio(frxRecibo, 3);
end;

procedure TFrmCadCompra.AddInfoLotes(id: Integer; id_compra: Integer; status: Integer);
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
      Query.FetchOptions.RowsetSize := 50000;
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

function TFrmCadCompra.AlteraQtdAnimaisLote(id: Integer; saldo: double; vt_compra: double;
  vtcbs_compra: double): Integer;
const
  SQL = 'UPDATE agrojun.lotes SET qtd_animais = :qtd_animais, qtd_real = :qtd_animais, valortotal_compra = :vt, valorcbs_compra = :vc WHERE id = :id';
var
  Query: TFDQuery;
begin
  try
    try
      if id <> 0 then
      begin
        Query := TFDQuery.Create(self);
        Query.Connection := dm.FDConnection;
        Query.FetchOptions.RowsetSize := 50000;
        Query.Active := false;
        Query.SQL.Clear;
        Query.SQL.Add(SQL);
        Query.ParamByName('qtd_animais').AsFloat := saldo;
        Query.ParamByName('vt').AsFloat := vt_compra;
        Query.ParamByName('vc').AsFloat := vtcbs_compra;
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

function TFrmCadCompra.AlteraSaldo(id: Integer; saldo: double): Integer;
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
        Query.FetchOptions.RowsetSize := 50000;
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

function TFrmCadCompra.BuscarQtdAnimaisLote(id: Integer): double;
const
  SQL = 'SELECT qtd_animais from agrojun.lotes where id = :id';
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
    Result := Query.FieldByName('qtd_animais').AsFloat;
  finally
    FreeAndNil(Query);
  end;
end;

function TFrmCadCompra.BuscarSaldo(id: Integer): double;
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

procedure TFrmCadCompra.CalcValorPorAnimal;
begin
  if not ed_Quantidade.Text.IsEmpty then
  begin

    if not ed_ValorTotalAnimal.Text.IsEmpty then
    begin
      ed_ValorPorAnimal.Text := FloatToStr(strtofloat(StringReplace(ed_ValorTotalAnimal.Text, '.', '', [rfReplaceAll]))
        / StrToInt(ed_Quantidade.Text));
    end;

    if not ed_ValorTotalFrete.Text.IsEmpty then
    begin
      if ed_QuantidadeTotal.Text.Equals('0') then
        ed_ValorFretePorAnimal.Text :=
          FloatToStr(strtofloat(StringReplace(ed_ValorTotalFrete.Text, '.', '', [rfReplaceAll])) /
          StrToInt(ed_Quantidade.Text))
      else
        ed_ValorFretePorAnimal.Text :=
          FloatToStr(strtofloat(StringReplace(ed_ValorTotalFrete.Text, '.', '', [rfReplaceAll])) /
          StrToInt(ed_QuantidadeTotal.Text));
    end;

    if not ed_ValorTotalComissao.Text.IsEmpty then
    begin
      if ed_QuantidadeTotal.Text.Equals('0') then
        ed_ValorComisPorAnimal.Text :=
          FloatToStr(strtofloat(StringReplace(ed_ValorTotalComissao.Text, '.', '', [rfReplaceAll])) /
          StrToInt(ed_Quantidade.Text))
      else
        ed_ValorComisPorAnimal.Text :=
          FloatToStr(strtofloat(StringReplace(ed_ValorTotalComissao.Text, '.', '', [rfReplaceAll])) /
          StrToInt(ed_QuantidadeTotal.Text));
    end;

  end;
end;

procedure TFrmCadCompra.CalcValorTotal;
var
  vt, vtp, FreteComiss: double;
  I: Integer;
begin

  if not ed_Quantidade.Text.IsEmpty and not ed_ValorTotalAnimal.Text.IsEmpty and not ed_ValorTotalFrete.Text.IsEmpty and
    not ed_ValorTotalComissao.Text.IsEmpty then
  begin
    FreteComiss := strtofloat(StringReplace(ed_ValorTotalFrete.Text, '.', '', [rfReplaceAll])) +
      strtofloat(StringReplace(ed_ValorTotalComissao.Text, '.', '', [rfReplaceAll]));
    if not StringGridAnimais.RowCount <= 0 then
    begin
      for I := 0 to StringGridAnimais.RowCount - 1 do
        vtp := StrTofloat_Universal(StringGridAnimais.Cells[7, I]);
    end;

    if StringGridAnimais.RowCount <= 1 then
      vt := vtp + FreteComiss
      // (strtofloat(StringReplace(ed_ValorTotalAnimal.Text, '.', '', [rfReplaceAll])));
    else
      vt := StrTofloat_Universal(ed_ValorTotalCompra.Text) + vtp;

    ed_ValorTotalCompra.Text := formatfloat('###,##0.00', vt);
    if ed_QuantidadeTotal.Text.Equals('0') then
      ed_valorporcbs_compra.Text := formatfloat('###,##0.00', vt / StrToInt(ed_QuantidadeTotal.Text))
    else
      ed_valorporcbs_compra.Text := formatfloat('###,##0.00', vt / StrToInt(ed_QuantidadeTotal.Text))
  end;
end;

procedure TFrmCadCompra.cbx_FormaPagtoChangeTracking(Sender: TObject);
begin
  inherited;
  if ((cbx_FormaPagto.ItemIndex = 0) or (cbx_FormaPagto.ItemIndex = 1)) then
  begin
    ckb_GerarParcela.IsChecked := false;
    ckb_GerarParcela.Enabled := false;
  end
  else
  begin
    ckb_GerarParcela.IsChecked := false;
    ckb_GerarParcela.Enabled := true;
  end;

  if not cbx_FormaPagto.Enabled then
    ckb_GerarParcela.Enabled := false;
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

procedure TFrmCadCompra.ckb_GerarParcelaChange(Sender: TObject);
begin
  inherited;
  if ckb_GerarParcela.IsChecked then
  begin
    cbx_Parc.ItemIndex := 0;
    ed_DiasParc.Text := '0';
    ed_EntradaValor.Text := '0';
    lay_GerarPac.Visible := true;

  end
  else
  begin
    cdsParc.IsEmpty;
    cdsParc.Refresh;
    cbx_Parc.ItemIndex := 0;
    ed_DiasParc.Text := '0';
    ed_EntradaValor.Text := '0';
    lay_GerarPac.Visible := false;

  end;
end;

procedure TFrmCadCompra.ConsultaBancoLotes;
const
  _SQLbanco = 'select id, numero, qtd_animais, nome from agrojun.lotes ';
var
  x: Integer;
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
      lay_lstvaziaLote.Visible := true;
    end
    else
    begin
      lay_lstvaziaLote.Visible := false;
    end;

    ListViewLote.Items.Clear;
    ListViewLote.BeginUpdate;

    for x := 1 to 1 do
    begin
      item := ListViewLote.Items.Add;

      with item do
      begin
        txt := TListItemText(Objects.FindDrawable('lbl_codigo'));
        txt.Text := 'CÓDIGO';
        txt.TagString := '0';

        txt := TListItemText(Objects.FindDrawable('lbl_numero'));
        txt.Text := 'NÚMERO';

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
  x: Integer;
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
      lay_lstvaziaPessoa.Visible := true;
    end
    else
    begin
      lay_lstvaziaPessoa.Visible := false;
    end;

    ListViewPessoa.Items.Clear;
    ListViewPessoa.BeginUpdate;

    for x := 1 to 1 do
    begin
      item := ListViewPessoa.Items.Add;

      with item do
      begin
        txt := TListItemText(Objects.FindDrawable('lbl_codigo'));
        txt.Text := 'CÓDIGO';
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
    + '  order by c.data_compra desc                                                     ';
var
  x: Integer;
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
    // QBanco.ParamByName('mes').AsInteger := StrToInt(FormatDateTime('MM', Now));
    // QBanco.ParamByName('ano').AsInteger := StrToInt(FormatDateTime('YYYY', Now));
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
        txt.Text := 'CÓDIGO';
        txt.TagString := '0';

        txt := TListItemText(Objects.FindDrawable('lbl_data'));
        txt.Text := 'DATA';

        txt := TListItemText(Objects.FindDrawable('lbl_lote'));
        txt.Text := 'LOTE';

        txt := TListItemText(Objects.FindDrawable('lbl_fornecedor'));
        txt.Text := 'FORNECEDOR';

        txt := TListItemText(Objects.FindDrawable('lbl_conta'));
        txt.Text := 'CONTA BANCÁRIA';

        txt := TListItemText(Objects.FindDrawable('lbl_quantidade'));
        txt.Text := 'QUANTIDADE';

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
        txt.Text := 'R$' + formatfloat('#,##0.00', QBanco.FieldByName('valortotal_compra').AsFloat);
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
    'SELECT cb.*, b.banco FROM agrojun.contas_bancarias cb left outer join bancos b on (cb.cod_banco = b.cod)';
var
  x: Integer;
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
      lay_lstvaziaConta.Visible := true;
    end
    else
    begin
      lay_lstvaziaConta.Visible := false;
    end;

    ListViewConta.Items.Clear;
    ListViewConta.BeginUpdate;

    for x := 1 to 1 do
    begin
      item := ListViewConta.Items.Add;

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

        txt := TListItemText(Objects.FindDrawable('saldo'));
        txt.Text := 'R$' + formatfloat('#,##0.00', QBanco.FieldByName('saldo').AsFloat);
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
  vCampo, cont: Integer;
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
          vResultado.Add(formatfloat('000', dm.QAux.FieldByName('id').AsFloat) + ' - ' +
            dm.QAux.FieldByName('forma_pagto').AsString);
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
  vCampo, cont: Integer;
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
          vResultado.Add(valid + ' - ' + dm.QAux.FieldByName('idade_animal').AsString);
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
  vCampo, cont: Integer;
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
        vResultado.Add('INFORME A RAÇA DO (S) ANIMAL (AIS)...');
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
  vCampo, cont: Integer;
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
        vResultado.Add('INFORME O TIPO DO CAMINHÃO...');
        while vCampo < dm.QAux.RecordCount do
        begin
          valid := IntToStr(cont);
          if valid.Length = 1 then
            valid := '00' + valid;
          if valid.Length = 2 then
            valid := '0' + valid;
          vResultado.Add(valid + ' - ' + dm.QAux.FieldByName('tipo_caminhao').AsString);
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

procedure TFrmCadCompra.DeleteRow(ARowIndex: Integer; AGrid: TStringGrid);
var
  I, j: Integer;
  MaxRows: Integer;
begin
  with AGrid do
  begin
    MaxRows := RowCount - 1;
    if (ARowIndex = MaxRows) then
      RowCount := RowCount - 1
    else
    begin
      for I := ARowIndex to MaxRows - 1 do
        for j := 0 to ColumnCount - 1 do
          Cells[j, I] := Cells[j, I + 1];

      RowCount := RowCount - 1;
    end;
  end;
end;

procedure TFrmCadCompra.ed_ContaEnter(Sender: TObject);
var
  I: Integer;
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
  I: Integer;
begin
  inherited;
  if ed_Corretor.Text.IsEmpty and (not ckbCadNow3.IsChecked) then
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

procedure TFrmCadCompra.ed_EntradaValorKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  FormatarMoeda(ed_EntradaValor, KeyChar);
end;

procedure TFrmCadCompra.ed_LoteEnter(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  // if ed_Lote.Text.IsEmpty and (not ckbCadNow4.IsChecked) then
  // begin
  // ConsultaBancoLotes;
  // ListViewLote.SearchVisible := true;
  // for I := 0 to ListViewLote.Controls.Count - 1 do
  // if ListViewLote.Controls[I].ClassType = TSearchBox then
  // begin
  // sbLote := TSearchBox(ListViewLote.Controls[I]);
  // Break;
  // end;
  // sbLote.Height := 0;
  // Tipo_Busca := 0;
  // tab_Crud.ActiveTab := TabLote;
  // end;
end;

procedure TFrmCadCompra.ed_LoteKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  inherited;
  // if (not(KeyChar in ['0'..'9'])) and (KeyChar <>#0) then
  // begin
  // ShowMessage('Somente números!');
  // KeyChar := #0;
  // end;
end;

procedure TFrmCadCompra.ed_MotoristaEnter(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  if ed_Motorista.Text.IsEmpty and (not ckbCadNow2.IsChecked) then
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
  I: Integer;
begin
  inherited;
  if ed_Pessoa.Text.IsEmpty and (not ckbCadNow1.IsChecked) then
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
  ed_ValorComisPorAnimal.Text := formatfloat('###,##0.00', StrTofloat_Universal(ed_ValorComisPorAnimal.Text));
end;

procedure TFrmCadCompra.ed_ValorFretePorAnimalChange(Sender: TObject);
begin
  inherited;
  ed_ValorFretePorAnimal.Text := formatfloat('###,##0.00', StrTofloat_Universal(ed_ValorFretePorAnimal.Text));
end;

procedure TFrmCadCompra.ed_ValorPorAnimalChange(Sender: TObject);
begin
  inherited;
  ed_ValorPorAnimal.Text := formatfloat('###,##0.00', StrTofloat_Universal(ed_ValorPorAnimal.Text));
end;

procedure TFrmCadCompra.ed_ValorTotalComissaoExit(Sender: TObject);
begin
  inherited;
  CalcValorPorAnimal;
  CalcValorTotal;
end;

procedure TFrmCadCompra.ed_ValorTotalComissaoKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  inherited;
  FormatarMoeda(ed_ValorTotalComissao, KeyChar);
end;

procedure TFrmCadCompra.ed_ValorTotalAnimalExit(Sender: TObject);
begin
  inherited;
  CalcValorPorAnimal;
  // CalcValorTotal;
end;

procedure TFrmCadCompra.ed_ValorTotalAnimalKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
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

procedure TFrmCadCompra.ed_ValorTotalFreteKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  inherited;
  FormatarMoeda(ed_ValorTotalFrete, KeyChar);
end;

procedure TFrmCadCompra.FormCreate(Sender: TObject);
begin
  inherited;
  ValorParc := 0;
  cbx_FormaPagto.ItemIndex := 0;
  lay_GerarPac.Visible := false;
  lay_parc.Visible := false;
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

procedure TFrmCadCompra.Image8Click(Sender: TObject);
const
  _SQLView = 'SELECT * FROM anexos where id = :id';
var
  Query: TFDQuery;
  id, caminho: string;
begin

  if id.IsEmpty then
  begin
    try
      Query := TFDQuery.Create(self);
      Query.Connection := dm.FDConnection;
      Query.FetchOptions.RowsetSize := 50000;
      Query.Active := false;
      Query.SQL.Clear;
      Query.SQL.Add(_SQLView);
      Query.ParamByName('id').AsInteger := id_anexo.ToInteger;
      Query.Active := true;

      caminho := Query.FieldByName('caminho').AsString + Query.FieldByName('nome_arq').AsString;

      ShellExecute(FmxHandleToHWND(Handle), 'open', PChar(caminho), '', '', SW_SHOWNORMAL);

    finally

    end;
  end;

end;

procedure TFrmCadCompra.img_delAnexClick(Sender: TObject);
const
  SQL = 'delete from anexos where id = :id';
var
  Query: TFDQuery;
begin

  if mensagemConfirmacao('Deseja Excluir esse anexo?') = mrYes then
  begin

    Query := TFDQuery.Create(self);
    Query.Connection := dm.FDConnection;
    Query.FetchOptions.RowsetSize := 50000;
    Query.Active := false;
    Query.SQL.Clear;
    Query.SQL.Add(SQL);
    Query.ParamByName('id').AsInteger := id_anexo.ToInteger;
    Query.ExecSQL;
    anexos(Cod_Selecao);
  end
  else
    abort;
end;

procedure TFrmCadCompra.Image9Click(Sender: TObject);
begin
  inherited;
  tab_Crud.ActiveTab := TabItem2;
end;

procedure TFrmCadCompra.Img_anexoClick(Sender: TObject);

const
  SQL = 'INSERT INTO anexos (cod_mov, status, caminho, nome_arq) VALUES (:cod_mov, :status, :caminho, :nome_arq); ';
var
  Query: TFDQuery;
  caminho, NomeArq: String;
begin

  if OpenDialog.Execute then
  begin
    caminho := ExtractFilePath(OpenDialog.FileName);
    NomeArq := ExtractFileName(OpenDialog.FileName);

    Query := TFDQuery.Create(self);
    Query.Connection := dm.FDConnection;
    Query.FetchOptions.RowsetSize := 50000;
    Query.Active := false;
    Query.SQL.Clear;
    Query.SQL.Add(SQL);
    Query.ParamByName('cod_mov').AsInteger := Cod_Selecao;
    Query.ParamByName('status').AsString := 'C';
    Query.ParamByName('caminho').AsString := caminho;
    Query.ParamByName('nome_arq').AsString := NomeArq;
    Query.ExecSQL;

    anexos(Cod_Selecao);

    FreeAndNil(Query);
    exit;
  end;
end;

procedure TFrmCadCompra.Img_BtnCancelarClick(Sender: TObject);
const
  _SQLInicial = ' select c.id, c.data_compra, c.quantidade_cbs, c.valortotal_compra, c.valorporcbs_compra,            '
    + '      c.idade_animal, c.sexo_animal, c.raca_animal, c.etiqueta, c.tipo_caminhao, c.placa_caminhao,   ' +
    '      c.valortotal_frete, c.valorporcbs_frete, c.valortotal_comissao, c.valorporcbs_comissao,        ' +
    '      c.valortotal_animais, c.valorporcbs_animais, c.descricao, c.forma_pagto,                                                    '
    + '      f.nome as fornecedor, cc.conta, cc.id as id_cc, l.nome as lote, m.nome as motorista,                         '
    + '      r.raca as raca, ia.idade_animal as idade, tp.tipo_caminhao as caminhao,                                                      '
    + '      co.nome as corretor from compras as c                                                          ' +
    ' left outer join pessoas as f on (f.id = c.fornecedor)                                               ' +
    ' left outer join contas_bancarias as cc on (cc.id = c.conta_bancaria)                                ' +
    ' left outer join lotes as l on (l.id = c.lote)                                                       ' +
    ' left outer join pessoas as m on (m.id = c.motorista)                                                ' +
    ' left outer join pessoas as co on (co.id = c.corretor)                                               ' +
    ' left outer join raca_animal as r on (r.id = c.raca_animal)                                          ' +
    ' left outer join idade_animal as ia on (ia.id = c.idade_animal)                                      ' +
    ' left outer join tipo_caminhao as tp on (tp.id = c.tipo_caminhao)  ' +
    ' where c.id = :id order by data_compra desc;                                                         ';
  SQLItens = 'select ci.*, i.idade_animal as idade, r.raca as raca from compras_itens as ci    ' +
    'left outer join idade_animal as i on (i.id = ci.idade_animal)                    ' +
    'left outer join raca_animal as r on(r.id = ci.raca_animal)                       ' +
    'where ci.id_compra = :id                                                         ' +
    'order by ci.id asc;                                                              ';
var
  Query: TFDQuery;
  lin: Integer;
begin
  inherited;
  if Acao = 1 then
  begin
    DesabilitaCampos;
    Query := TFDQuery.Create(self);
    Query.Connection := dm.FDConnection;
    Query.FetchOptions.RowsetSize := 50000;
    try
      Query.Active := false;
      Query.SQL.Clear;
      Query.SQL.Add(_SQLInicial);
      Query.ParamByName('id').AsInteger := Cod_Selecao;
      Query.Active := true;
      PopularCampos(Query);

      for lin := 0 to StringGridAnimais.RowCount - 1 do
        LimpaStringGrid(lin, StringGridAnimais);

      Query.Active := false;
      Query.SQL.Clear;
      Query.SQL.Add(SQLItens);
      Query.ParamByName('id').AsInteger := Cod_Selecao;
      Query.Open();

      PopularComprasItens(Query);
    finally
      StringGridAnimais.Enabled := false;
      FreeAndNil(Query);
    end;
  end
  else
    for lin := 0 to StringGridAnimais.RowCount - 1 do
      LimpaStringGrid(lin, StringGridAnimais);
  ed_pesq.Enabled := true;
end;

procedure TFrmCadCompra.Img_BtnEditarClick(Sender: TObject);
begin
  inherited;
  ValorTotal := (strtofloat(StringReplace(ed_ValorTotalCompra.Text, '.', '', [rfReplaceAll])));
  QtdAnimais := StrToInt(ed_QuantidadeTotal.Text);
  // ConsultaLote(edTms_Lote);
  // ConsultaFornecedor(edTms_Fornecedor);
  // ConsultaConta(edTms_ContaBancaria);
  // ConsultaMotorista(edTms_Motorista);
  // ConsultaCorretor(edTms_Corretor);
  ed_ValorPorAnimal.Enabled := false;
  ed_ValorFretePorAnimal.Enabled := false;
  ed_ValorComisPorAnimal.Enabled := false;
  ed_ValorTotalCompra.Enabled := false;
  ed_valorporcbs_compra.Enabled := false;
  ed_QuantidadeTotal.Enabled := false;
  StringGridAnimais.Enabled := false;
  Edit := 1;
end;

procedure TFrmCadCompra.Img_BtnExcluirClick(Sender: TObject);
const
  SQL           = 'DELETE FROM agrojun.compras WHERE id = :id';
  SQLLote       = 'DELETE FROM agrojun.lotes where id = :id';
  SQLLoteItens  = 'DELETE FROM agrojun.lotes_itens where id_lote = :id';
  SQLItens      = 'DELETE FROM agrojun.compras_itens where id_compra = :id';
  fretecomissao =
    'select status_comissao, status_frete, valortotal_frete, valortotal_comissao from compras where id = :id';
  SQLanexos       = 'delete from anexos where cod_mov = :cod_mov and status = ''C''';
  SQLVerifica     = 'SELECT * from agrojun.lotes where id_compra = :id';
  SqlDeletParcela = ' select sum(IFNULL(p.valor, 0) ) + IFNULL(c.entrada, 0) as valor, c.parcela from compras C ' +
    ' left outer join parcelas p on (p.status = 1 and p.id_movimentacao = c.id and p.movimentacao = ''C'')  where c.id = :id ';
var
  Query, parcela, fretecomis: TFDQuery;
  valoranimais: double;
begin
  inherited;
  // APAGAR REGISTROS
  try
    // AlteraQtdAnimaisLote(RetornaIdLote(ed_Lote.Text),
    // BuscarQtdAnimaisLote(RetornaIdLote(ed_Lote.Text)) -
    // StrToInt(ed_QuantidadeTotal.Text));
    Query := TFDQuery.Create(self);
    Query.Connection := dm.FDConnection;
    Query.FetchOptions.RowsetSize := 50000;

    fretecomis := TFDQuery.Create(self);
    fretecomis.Connection := dm.FDConnection;
    fretecomis.FetchOptions.RowsetSize := 50000;

    Query.Active := false;
    Query.SQL.Clear;
    Query.SQL.Add(SQLVerifica);
    Query.ParamByName('id').AsInteger := Cod_Selecao;
    Query.Open;

    fretecomis.Active := false;
    fretecomis.SQL.Clear;
    fretecomis.SQL.Add(fretecomissao);
    fretecomis.ParamByName('id').AsInteger := Cod_Selecao;
    fretecomis.Open;

    parcela := TFDQuery.Create(self);
    parcela.Connection := dm.FDConnection;
    parcela.FetchOptions.RowsetSize := 50000;
    parcela.Active := false;
    parcela.SQL.Clear;
    parcela.SQL.Add(SqlDeletParcela);
    parcela.ParamByName('id').AsInteger := Cod_Selecao;
    parcela.Open;
    if (Query.FieldByName('despesa').AsFloat > 0) OR (Query.FieldByName('ativo').AsInteger = 0) OR
      (Query.FieldByName('venda_parcial').AsInteger = 1) OR (Query.FieldByName('agrupado').AsInteger = 1) then
    begin
      ShowMessage('Não é possível excluir essa compra por um dos seguintes motivos: ' + sLineBreak +
        '1. Possui alguma despesa vínculada ' + sLineBreak + '2. Foi totalmente vendida/transferida ' + sLineBreak +
        '3. Foi vendida parcialmente.' + sLineBreak +
        '4. Houve transferência de animais dessa compra para outro lote.');
      abort
    end
    else
    begin
      Query.Active := false;
      Query.SQL.Clear;
      Query.SQL.Add(SQLLoteItens);
      Query.ParamByName('id').AsInteger := RetornaIdLote(ed_Lote.Text);
      Query.ExecSQL;

      Query.Active := false;
      Query.SQL.Clear;
      Query.SQL.Add(SQLLote);
      Query.ParamByName('id').AsInteger := RetornaIdLote(ed_Lote.Text);
      Query.ExecSQL;

      Query.Active := false;
      Query.SQL.Clear;
      Query.SQL.Add(SQLItens);
      Query.ParamByName('id').AsInteger := Cod_Selecao;
      Query.ExecSQL;

      Query.Active := false;
      Query.SQL.Clear;
      Query.SQL.Add(SQL);
      Query.ParamByName('id').AsInteger := Cod_Selecao;
      Query.ExecSQL;

      Query.Active := false;
      Query.SQL.Clear;
      Query.SQL.Add(SQLanexos);
      Query.ParamByName('cod_mov').AsInteger := Cod_Selecao;
      Query.ExecSQL;

      valoranimais := strtofloat(StringReplace(ed_ValorTotalCompra.Text, '.', '', [rfReplaceAll])) -
        strtofloat(StringReplace(ed_ValorTotalComissao.Text, '.', '', [rfReplaceAll])) -
        strtofloat(StringReplace(ed_ValorTotalFrete.Text, '.', '', [rfReplaceAll]));

      if parcela.FieldByName('parcela').AsInteger = 0 then
        AlteraSaldo(StrToInt(copy(ed_Conta.Text, 0, 5)), BuscarSaldo(StrToInt(copy(ed_Conta.Text, 0, 5))) +
          (valoranimais))
      else
        AlteraSaldo(StrToInt(copy(ed_Conta.Text, 0, 5)), BuscarSaldo(StrToInt(copy(ed_Conta.Text, 0, 5))) +
          (parcela.FieldByName('valor').AsFloat));

      if (fretecomis.FieldByName('status_frete').AsInteger = 1) then
        AlteraSaldo(StrToInt(copy(ed_Conta.Text, 0, 5)), BuscarSaldo(StrToInt(copy(ed_Conta.Text, 0, 5))) +
          (fretecomis.FieldByName('valortotal_frete').AsFloat));

      if (fretecomis.FieldByName('status_comissao').AsInteger = 1) then
        AlteraSaldo(StrToInt(copy(ed_Conta.Text, 0, 5)), BuscarSaldo(StrToInt(copy(ed_Conta.Text, 0, 5))) +
          (fretecomis.FieldByName('valortotal_comissao').AsFloat));


      // RemoveInfoLotes(RetornaIdLote(ed_Lote.Text));

      parcela.Active := false;
      parcela.SQL.Clear;
      parcela.SQL.Add(' delete from parcelas where movimentacao = ''C'' and id_movimentacao = :id ');
      parcela.ParamByName('id').AsInteger := Cod_Selecao;
      parcela.ExecSQL;
    end;

  finally
    FreeAndNil(Query);
    LimpaCampos;
    ConsultaCompras;
    LogCompras;
    tab_Crud.ActiveTab := TabItem1;
  end;
end;

procedure TFrmCadCompra.Img_BtnNovoClick(Sender: TObject);
var
  lin: Integer;
begin
  inherited;
  cdsParc.EmptyDataSet;
  cbx_FormaPagto.ItemIndex := 0;
  // ConsultaLote(edTms_Lote);
  // ConsultaFornecedor(edTms_Fornecedor);
  // ConsultaConta(edTms_ContaBancaria);
  // ConsultaMotorista(edTms_Motorista);
  // ConsultaCorretor(edTms_Corretor);
  img_recibo.Visible := false;
  rct_AnexoArq.Visible := false;
  Img_BtnSalvar.Visible := false;
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
  ed_QuantidadeTotal.Enabled := false;
  ed_QuantidadeTotal.Text := IntToStr(0);
  Edit := 1;
  Cod_Selecao := MaxCod('compras');
  anexos(Cod_Selecao);
  for lin := 0 to StringGridAnimais.RowCount - 1 do
    LimpaStringGrid(lin, StringGridAnimais);
  StringGridAnimais.Enabled := true;
end;

procedure TFrmCadCompra.Img_BtnSalvarClick(Sender: TObject);
const
  SQLInsert =
    'INSERT INTO `agrojun`.`compras` (`data_compra`, `lote`, `fornecedor`, `conta_bancaria`, `quantidade_cbs`,        '
    + '                `etiqueta`, `tipo_caminhao`, `placa_caminhao`, `motorista`,                             ' +
    '                `valortotal_frete`, `valorporcbs_frete`, `corretor`, `valortotal_comissao`,                            '
    + '                `valorporcbs_comissao`, `descricao`, `valortotal_compra`, `valorporcbs_compra`, `forma_pagto`, parcela, entrada, status_frete, status_comissao)                                                                   '
    + 'VALUES (:data_compra, :lote, :fornecedor, :conta_bancaria, :quantidade_cbs, :etiqueta, :tipo_caminhao,                         '
    + '        :placa_caminhao, :motorista, :valortotal_frete, :valorporcbs_frete, :corretor, :valortotal_comissao,           '
    + '        :valorporcbs_comissao, :descricao, :valortotal_compra, :valorporcbs_compra, :forma_pagto, :parcela, :entrada, :status_frete, :status_comissao)                                                                            ';
  SQLUpdate =
    ' UPDATE `agrojun`.`compras`                                                                                                     '
    + ' SET `data_compra` = :data_compra, `lote` = :lote, `fornecedor` = :fornecedor, `conta_bancaria` = :conta_bancaria,              '
    + ' `quantidade_cbs` = :quantidade_cbs, `etiqueta` = :etiqueta,            ' +
    ' `tipo_caminhao` = :tipo_caminhao, `placa_caminhao` = :placa_caminhao, `motorista` = :motorista,                                '
    + ' `valortotal_frete` = :valortotal_frete, `valorporcbs_frete` = :valorporcbs_frete, `corretor` = :corretor,                      '
    + ' `valortotal_comissao` = :valortotal_comissao, `valorporcbs_comissao` = :valorporcbs_comissao, `descricao` = :descricao,          '
    + ' `valortotal_compra` = :valortotal_compra, `valorporcbs_compra` = :valorporcbs_compra, `forma_pagto` = :forma_pagto '
    + ' WHERE `id` = :id                                                                                                              ';
  SQLItens =
    'INSERT INTO agrojun.compras_itens (quantidade, valorporcbs_animais, valortotal_animais, idade_animal, raca_animal, sexo_animal, id_compra)'
    + ' VALUES (:quantidade, :valorporcbs_animais, :valortotal_animais, :idade_animal, :raca_animal, :sexo_animal, :id_compra)';

  SQlUpdateItens = 'UPDATE agrojun.compras' +
    'SET quantidade = :quantidade, valorporcbs_animais = :valorporcbs_animais, valortotal_animais = :valortotal_animais '
    + 'idade_animal = :idade_animal, raca_animal = :raca_animal, sexo_animal = :sexo_animal' +
    'WHERE id_compra = :id_compra';

  SQLItensLote =
    'INSERT INTO agrojun.lotes_itens (quantidade, valorporcbs_animais, valortotal_animais, idade_animal, raca_animal, sexo_animal, id_lote, ativo, id_compra)'
    + ' VALUES (:quantidade, :valorporcbs_animais, :valortotal_animais, :idade_animal, :raca_animal, :sexo_animal, :id_lote, :ativo, :id_compra)';
var
  Query, qryAux: TFDQuery;
  ValorTotalAtual, valoranimais: double;
  QtdAnimaisAtual, id_pessoa: Integer;
  status: Integer;
  I, lin: Integer;
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
      Query.ParamByName('id').AsInteger := Cod_Selecao;
    end;

    try
      // DATA
      Query.ParamByName('data_compra').AsDateTime := DateEditCompra.Date;

      // LOTE
      if ed_Lote.Text.IsEmpty then
      begin
        Validar(1);
        abort
      end
      else
      begin
        if (SalvarLote(ed_Lote.Text) = 0) and (Acao = 0) then
        begin
          Validar(9);
          abort
        end
        else
          Query.ParamByName('lote').AsInteger := RetornaIdLote(ed_Lote.Text);
      end;

      // PESSOA
      if (ed_Pessoa.Text.IsEmpty) then
      begin
        Validar(2);
        exit;
      end;
      if ckbCadNow1.IsChecked then
      begin
        if ValidarPessoa(ed_Pessoa.Text) = 1 then
        begin
          if mensagemConfirmacao('Já existe uma pessoa cadastrada com esse nome. Deseja continuar com o cadastro?') = mrYes
          then
          begin
            if rbFisica1.IsChecked then
              SalvarPessoa(ed_Pessoa.Text, 1)
            else if rbJuridica1.IsChecked then
              SalvarPessoa(ed_Pessoa.Text, 2)
            else
              Validar(8);

            Query.ParamByName('fornecedor').AsInteger := RetornaIdPessoa(ed_Pessoa.Text);
            id_pessoa := RetornaIdPessoa(ed_Pessoa.Text);
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
          id_pessoa := RetornaIdPessoa(ed_Pessoa.Text);
        end;
      end
      else
      begin
        Query.ParamByName('fornecedor').AsInteger := StrToInt(copy(ed_Pessoa.Text, 0, 5));
        id_pessoa := StrToInt(copy(ed_Pessoa.Text, 0, 5));
      end;
      // CONTA
      if (not ed_Conta.Text.IsEmpty) and (StrToInt(copy(ed_Conta.Text, 0, 5)) = 0) then
      begin
        Validar(3);
        exit;
      end;
      Query.ParamByName('conta_bancaria').AsInteger := StrToInt(copy(ed_Conta.Text, 0, 5));

      // QUANTIDADE
      Query.ParamByName('quantidade_cbs').AsInteger := StrToInt(ed_QuantidadeTotal.Text);
      // Query.ParamByName('valortotal_animais').AsFloat :=
      // strtofloat(StringReplace(ed_ValorTotalAnimal.Text, '.', '',
      // [rfReplaceAll]));
      // Query.ParamByName('valorporcbs_animais').AsFloat :=
      // strtofloat(StringReplace(ed_ValorPorAnimal.Text, '.', '',
      // [rfReplaceAll]));
      //
      // Query.ParamByName('idade_animal').AsInteger :=
      // // StrToInt(copy(cbx_IdadeAnimal.Items[cbx_IdadeAnimal.ItemIndex], 0, 3));
      // Query.ParamByName('sexo_animal').AsInteger :=
      // //StrToInt(copy(cbx_SexoAnimal.Items[cbx_SexoAnimal.ItemIndex], 0, 3));
      // Query.ParamByName('raca_animal').AsInteger :=
      // //StrToInt(copy(cbx_TipoAnimal.Items[cbx_TipoAnimal.ItemIndex], 0, 3));
      // ETIQUETA
      if ed_Etiqueta.Text.IsEmpty then
        Query.ParamByName('etiqueta').AsInteger := 0
      else
        Query.ParamByName('etiqueta').AsInteger := StrToInt(ed_Etiqueta.Text);
      // TIPO CAMINHÃO
      if cbx_TipoCaminhao.ItemIndex <= 0 then
        Query.ParamByName('tipo_caminhao').AsInteger := 0
      else
        Query.ParamByName('tipo_caminhao').AsInteger :=
          StrToInt(copy(cbx_TipoCaminhao.Items[cbx_TipoCaminhao.ItemIndex], 0, 3));

      // PLACA CAMINHÃO
      Query.ParamByName('placa_caminhao').AsString := ed_PlacaCaminhao.Text;

      // FORMA PAGAMENTO
      if cbx_FormaPagto.ItemIndex <= 0 then
        Query.ParamByName('forma_pagto').AsInteger := 0
      else
        Query.ParamByName('forma_pagto').AsInteger :=
          StrToInt(copy(cbx_FormaPagto.Items[cbx_FormaPagto.ItemIndex], 0, 3));

      // MOTORISTA
      if (ed_Motorista.Text.IsEmpty) and not ckbCadNow2.IsChecked then
      begin
        Query.ParamByName('motorista').AsInteger := 0;
      end;
      if ckbCadNow2.IsChecked and not ed_Motorista.Text.IsEmpty then
      begin
        if ValidarPessoa(ed_Motorista.Text) = 1 then
        begin
          if mensagemConfirmacao('Já existe uma pessoa cadastrada com esse nome. Deseja continuar com o cadastro?') = mrYes
          then
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
        Query.ParamByName('motorista').AsInteger := StrToInt(copy(ed_Motorista.Text, 0, 5));
      end;

      // VALOR FRETE
      Query.ParamByName('valortotal_frete').AsFloat :=
        strtofloat(StringReplace(ed_ValorTotalFrete.Text, '.', '', [rfReplaceAll]));
      // VALOR FRETE POR CBS
      Query.ParamByName('valorporcbs_frete').AsFloat :=
        strtofloat(StringReplace(ed_ValorFretePorAnimal.Text, '.', '', [rfReplaceAll]));

      // CORRETOR
      if (ed_Corretor.Text.IsEmpty) and not ckbCadNow3.IsChecked then
      begin
        Query.ParamByName('corretor').AsInteger := 0;
      end;
      if ckbCadNow3.IsChecked and not ed_Corretor.Text.IsEmpty then
      begin
        if ValidarPessoa(ed_Corretor.Text) = 1 then
        begin
          if mensagemConfirmacao('Já existe uma pessoa cadastrada com esse nome!' + sLineBreak +
            'Deseja continuar com o cadastro?') = mrYes then
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
      else if not ckbCadNow3.IsChecked and not ed_Corretor.Text.IsEmpty then
      begin
        Query.ParamByName('corretor').AsInteger := StrToInt(copy(ed_Corretor.Text, 0, 5));
      end;

      // VALOR COMISSÃO
      Query.ParamByName('valortotal_comissao').AsFloat :=
        strtofloat(StringReplace(ed_ValorTotalComissao.Text, '.', '', [rfReplaceAll]));

      // VALOR COMISSÃO POR CBS
      Query.ParamByName('valorporcbs_comissao').AsFloat :=
        strtofloat(StringReplace(ed_ValorComisPorAnimal.Text, '.', '', [rfReplaceAll]));

      // DESCRICAO
      Query.ParamByName('descricao').AsString := ed_Obs.Text;

      // VALOR TOTAL DA COMPRA
      Query.ParamByName('valortotal_compra').AsFloat :=
        strtofloat(StringReplace(ed_ValorTotalCompra.Text, '.', '', [rfReplaceAll]));
      // VALOR TOTAL DA COMPRA POR CBS
      Query.ParamByName('valorporcbs_compra').AsFloat :=
        strtofloat(StringReplace(ed_valorporcbs_compra.Text, '.', '', [rfReplaceAll]));

      if ((ed_EntradaValor.Text <> '0') and (ckb_GerarParcela.IsChecked)) then
        Query.ParamByName('entrada').AsFloat := strtofloat(StringReplace(ed_EntradaValor.Text, '.', '', [rfReplaceAll]))
      else
        Query.ParamByName('entrada').AsFloat := 0;

      if ckb_GerarParcela.IsChecked then
        Query.ParamByName('parcela').AsInteger := 1
      else
        Query.ParamByName('parcela').AsInteger := 0;

      if ckb_FreteDesc.IsChecked then
        Query.ParamByName('status_frete').AsInteger := 1
      else if ckb_FreteParc.IsChecked then
        Query.ParamByName('status_frete').AsInteger := 2
      else
        Query.ParamByName('status_frete').AsInteger := 0;

      if ckb_ComissaoDesc.IsChecked then
        Query.ParamByName('status_comissao').AsInteger := 1
      else if ckb_ComissaoParc.IsChecked then
        Query.ParamByName('status_comissao').AsInteger := 2
      else
        Query.ParamByName('status_comissao').AsInteger := 0;

      Query.ExecSQL;

      if Acao = 0 then
      begin

        if ckb_ComissaoDesc.IsChecked then
          AlteraSaldo(StrToInt(copy(ed_Conta.Text, 0, 5)), BuscarSaldo(StrToInt(copy(ed_Conta.Text, 0, 5))) -
            (strtofloat(StringReplace(ed_ValorTotalComissao.Text, '.', '', [rfReplaceAll]))));

        if ckb_FreteDesc.IsChecked then
          AlteraSaldo(StrToInt(copy(ed_Conta.Text, 0, 5)), BuscarSaldo(StrToInt(copy(ed_Conta.Text, 0, 5))) -
            (strtofloat(StringReplace(ed_ValorTotalFrete.Text, '.', '', [rfReplaceAll]))));

        valoranimais := strtofloat(StringReplace(ed_ValorTotalCompra.Text, '.', '', [rfReplaceAll])) -
          strtofloat(StringReplace(ed_ValorTotalComissao.Text, '.', '', [rfReplaceAll])) -
          strtofloat(StringReplace(ed_ValorTotalFrete.Text, '.', '', [rfReplaceAll]));

        if not(ckb_GerarParcela.IsChecked) then
        begin
          AlteraSaldo(StrToInt(copy(ed_Conta.Text, 0, 5)), BuscarSaldo(StrToInt(copy(ed_Conta.Text, 0, 5))) -
            (valoranimais));

        end
        else
        begin
          GravaParcelas('C', MaxCod('compras') - 1, StrToInt(copy(ed_Conta.Text, 0, 5)), id_pessoa);
          AlteraSaldo(StrToInt(copy(ed_Conta.Text, 0, 5)), BuscarSaldo(StrToInt(copy(ed_Conta.Text, 0, 5))) -
            (strtofloat(StringReplace(ed_EntradaValor.Text, '.', '', [rfReplaceAll]))));
        end;

        AlteraQtdAnimaisLote(RetornaIdLote(ed_Lote.Text), BuscarQtdAnimaisLote(RetornaIdLote(ed_Lote.Text)) +
          StrToInt(ed_QuantidadeTotal.Text), strtofloat(StringReplace(ed_ValorTotalCompra.Text, '.', '', [rfReplaceAll])
          ), strtofloat(StringReplace(ed_valorporcbs_compra.Text, '.', '', [rfReplaceAll])));
      end
      else
      begin
        ValorTotalAtual := (strtofloat(StringReplace(ed_ValorTotalAnimal.Text, '.', '', [rfReplaceAll])) +
          strtofloat(StringReplace(ed_ValorTotalFrete.Text, '.', '', [rfReplaceAll])) +
          strtofloat(StringReplace(ed_ValorTotalComissao.Text, '.', '', [rfReplaceAll])));
        if ValorTotalAtual > ValorTotal then
        begin
          AlteraSaldo(StrToInt(copy(ed_Conta.Text, 0, 5)), BuscarSaldo(StrToInt(copy(ed_Conta.Text, 0, 5))) -
            (ValorTotalAtual - ValorTotal));
        end
        else
        begin
          AlteraSaldo(StrToInt(copy(ed_Conta.Text, 0, 5)), BuscarSaldo(StrToInt(copy(ed_Conta.Text, 0, 5))) +
            (ValorTotal - ValorTotalAtual));
        end;

        QtdAnimaisAtual := StrToInt(ed_QuantidadeTotal.Text);
        if QtdAnimaisAtual > QtdAnimais then
          AlteraQtdAnimaisLote(RetornaIdLote(ed_Lote.Text), BuscarQtdAnimaisLote(RetornaIdLote(ed_Lote.Text)) +
            (QtdAnimaisAtual - QtdAnimais), strtofloat(StringReplace(ed_ValorTotalCompra.Text, '.', '', [rfReplaceAll])
            ), strtofloat(StringReplace(ed_valorporcbs_compra.Text, '.', '', [rfReplaceAll])))
        else
          AlteraQtdAnimaisLote(RetornaIdLote(ed_Lote.Text), BuscarQtdAnimaisLote(RetornaIdLote(ed_Lote.Text)) -
            (QtdAnimais - QtdAnimaisAtual), strtofloat(StringReplace(ed_ValorTotalCompra.Text, '.', '', [rfReplaceAll])
            ), strtofloat(StringReplace(ed_valorporcbs_compra.Text, '.', '', [rfReplaceAll])));

      end;

      Query.Close;
      Query.SQL.Clear;
      // ShowMessage(IntToStr(MaxCod('compras') - 1));
      if Acao = 0 then
        AddInfoLotes(RetornaIdLote(ed_Lote.Text), MaxCod('compras') - 1, 1)
      else
        AddInfoLotes(RetornaIdLote(ed_Lote.Text), Cod_Selecao, status);

      if Acao = 0 then
      begin
        Query.SQL.Add(SQLItens);
        Query.ParamByName('id_compra').AsInteger := MaxCod('compras') - 1;
        qryAux := TFDQuery.Create(self);
        qryAux.Connection := dm.FDConnection;
        qryAux.FetchOptions.RowsetSize := 50000;
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(SQLItensLote);
        qryAux.ParamByName('id_lote').AsInteger := RetornaIdLote(ed_Lote.Text);
      end
      else
      begin
        Query.SQL.Add(SQlUpdateItens);
        Query.ParamByName('id_compra').AsInteger := Cod_Selecao;
      end;

      for I := 0 to StringGridAnimais.RowCount - 1 do
      begin
        // QUANTIDADE
        Query.ParamByName('quantidade').AsInteger := StrToInt(StringGridAnimais.Cells[2, I]);
        qryAux.ParamByName('quantidade').AsInteger := StrToInt(StringGridAnimais.Cells[2, I]);
        // IDADE
        Query.ParamByName('idade_animal').AsInteger := StrToInt(copy(StringGridAnimais.Cells[3, I], 0, 3));
        qryAux.ParamByName('idade_animal').AsInteger := StrToInt(copy(StringGridAnimais.Cells[3, I], 0, 3));
        // RAÇA
        Query.ParamByName('raca_animal').AsInteger := StrToInt(copy(StringGridAnimais.Cells[4, I], 0, 3));
        qryAux.ParamByName('raca_animal').AsInteger := StrToInt(copy(StringGridAnimais.Cells[4, I], 0, 3));
        // SEXO
        Query.ParamByName('sexo_animal').AsInteger := StrToInt(copy(StringGridAnimais.Cells[5, I], 0, 3));
        qryAux.ParamByName('sexo_animal').AsInteger := StrToInt(copy(StringGridAnimais.Cells[5, I], 0, 3));
        // VALOR POR CBS
        Query.ParamByName('valorporcbs_animais').AsFloat := StrTofloat_Universal(StringGridAnimais.Cells[6, I]);
        qryAux.ParamByName('valorporcbs_animais').AsFloat := StrTofloat_Universal(StringGridAnimais.Cells[6, I]) +
          strtofloat(StringReplace(ed_ValorComisPorAnimal.Text, '.', '', [rfReplaceAll])) +
          strtofloat(StringReplace(ed_ValorFretePorAnimal.Text, '.', '', [rfReplaceAll]));
        // VALOR TOTAL
        Query.ParamByName('valortotal_animais').AsFloat := StrTofloat_Universal(StringGridAnimais.Cells[7, I]);
        qryAux.ParamByName('valortotal_animais').AsFloat := StrTofloat_Universal(StringGridAnimais.Cells[7, I]) +
          (StrToInt(StringGridAnimais.Cells[2, I]) * (strtofloat(StringReplace(ed_ValorComisPorAnimal.Text, '.', '',
          [rfReplaceAll])) + strtofloat(StringReplace(ed_ValorFretePorAnimal.Text, '.', '', [rfReplaceAll]))));
        // ativo
        qryAux.ParamByName('ativo').AsInteger := 1;

        // id compra
        qryAux.ParamByName('id_compra').AsInteger := Query.ParamByName('id_compra').AsInteger;

        Query.ExecSQL;
        qryAux.ExecSQL;
      end;

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
      for lin := 0 to StringGridAnimais.RowCount - 1 do
        LimpaStringGrid(lin, StringGridAnimais);
      ConsultaCompras;
    except
      abort;
    end;

  finally
    FreeAndNil(Query);
    FreeAndNil(qryAux);
  end;
end;

procedure TFrmCadCompra.Img_BtnVoltar2Click(Sender: TObject);
begin
  inherited;
  tab_Crud.ActiveTab := TabItem2;
  ed_Quantidade.Text := EmptyStr;
  ed_ValorTotalAnimal.Text := EmptyStr;
end;

procedure TFrmCadCompra.Label52Click(Sender: TObject);
begin
  inherited;
  if (ed_Lote.Text = EmptyStr) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 6001 : ' + sLineBreak + 'Selecione um LOTE válido!';
    ed_Lote.SetFocus;
    abort;
  end;

  if (ed_Pessoa.Text = EmptyStr) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 6002 : ' + sLineBreak + 'Selecione um(a) FORNECEDOR(A) válido(a)!';
    ed_Pessoa.SetFocus;
    abort;
  end;

  if (ed_Conta.Text = EmptyStr) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 6003 : ' + sLineBreak + 'Selecione uma CONTA válida!';
    ed_Conta.SetFocus;
    abort;
  end;

  if (ed_ValorTotalFrete.Text = EmptyStr) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 6009 : ' + sLineBreak + 'Insira o VALOR TOTAL DO FRETE!';
    ed_ValorTotalFrete.SetFocus;
    abort;
  end;

  if (ed_ValorTotalComissao.Text = EmptyStr) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 6010 : ' + sLineBreak + 'Insira o VALOR TOTAL DA COMISSÃO!';
    ed_ValorTotalComissao.SetFocus;
    abort;
  end;

  // if cbx_FormaPagto.ItemIndex < 1 then
  // begin
  // lay_error.Visible := true;
  // lbl_Erro.Text := 'Erro 6007 : ' + sLineBreak + 'Selecione a FORMA DE PAGAMENTO!';
  // cbx_FormaPagto.SetFocus;
  // abort;
  // end;

  tab_Crud.ActiveTab := TabItem3;
  if Edit = 1 then
  begin
    Img_BtnSalvar2.Visible := true;
    Img_BtnCancelar2.Visible := true;
  end
  else
  begin
    Img_BtnSalvar2.Visible := false;
    Img_BtnCancelar2.Visible := false;
  end;
  Img_BtnVoltar2.Visible := true;
end;

procedure TFrmCadCompra.LimpaStringGrid(RowNumber: Integer; StringGrid1: TStringGrid);
var
  lin, Col, j: Integer;
begin

  if StringGrid1.Row < 0 then
  begin
    exit
  end;
  StringGrid1.Row := RowNumber;
  if StringGrid1.Row = StringGrid1.RowCount - 1 then
    StringGrid1.RowCount := StringGrid1.RowCount - 1
  else
  begin
    for j := RowNumber to StringGrid1.RowCount - 1 do
    begin
      StringGrid1.Cells[0, j] := StringGrid1.Cells[0, j + 1];
      StringGrid1.Cells[1, j] := StringGrid1.Cells[0, j + 1];
      StringGrid1.Cells[2, j] := StringGrid1.Cells[0, j + 1];
      StringGrid1.Cells[3, j] := StringGrid1.Cells[0, j + 1];
      StringGrid1.Cells[4, j] := StringGrid1.Cells[0, j + 1];
      StringGrid1.Cells[5, j] := StringGrid1.Cells[0, j + 1];
    end;
    StringGrid1.RowCount := StringGrid1.RowCount - 1;
  end;
end;

procedure TFrmCadCompra.ListViewContaItemClick(const Sender: TObject; const AItem: TListViewItem);
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

        if Query.RecordCount > 0 then
        begin
          if Tipo_Busca = 0 then
          begin
            ed_Conta.Text := formatfloat('00000', Query.FieldByName('id').AsFloat) + ' - ' +
              Query.FieldByName('conta').AsString;
            tab_Crud.ActiveTab := TabItem2;
          end
          else
          begin
            // ed_Filtro.Text := formatfloat('00000', Query.FieldByName('id').AsFloat) + ' - ' + Query.FieldByName('conta').AsString;
            tab_Crud.ActiveTab := TabItem1;
          end;
        end
        else
        begin
          ShowMessage('Não foi possível carregar o dados dessa conta. Tente outra vez.');
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

procedure TFrmCadCompra.ListViewLoteItemClick(const Sender: TObject; const AItem: TListViewItem);
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
          if Tipo_Busca = 0 then
          begin
            ed_Lote.Text := formatfloat('00000', Query.FieldByName('id').AsFloat);
            tab_Crud.ActiveTab := TabItem2;
          end
          else
          begin
            // ed_Filtro.Text := formatfloat('00000', Query.FieldByName('id').AsFloat) + ' - ' + Query.FieldByName('numero').AsString;
            tab_Crud.ActiveTab := TabItem1;
          end;
        end
        else
        begin
          ShowMessage('Não foi possível carregar o dados desse lote. Tente outra vez.');
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

procedure TFrmCadCompra.ListViewPessoaItemClick(const Sender: TObject; const AItem: TListViewItem);
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
          if Tipo_Busca = 0 then
          begin
            ed_Pessoa.Text := formatfloat('00000', Query.FieldByName('id').AsFloat) + ' - ' +
              Query.FieldByName('nome').AsString;
            tab_Crud.ActiveTab := TabItem2;
          end
          else if Tipo_Busca = 1 then
          begin
            ed_Motorista.Text := formatfloat('00000', Query.FieldByName('id').AsFloat) + ' - ' +
              Query.FieldByName('nome').AsString;
            tab_Crud.ActiveTab := TabItem2;
          end
          else if Tipo_Busca = 2 then
          begin
            ed_Corretor.Text := formatfloat('00000', Query.FieldByName('id').AsFloat) + ' - ' +
              Query.FieldByName('nome').AsString;
            tab_Crud.ActiveTab := TabItem2;
          end
          else
          begin
            // ed_Filtro.Text := formatfloat('00000', Query.FieldByName('id').AsFloat) + ' - ' + Query.FieldByName('nome').AsString;
            tab_Crud.ActiveTab := TabItem1;
          end;
        end
        else
        begin
          ShowMessage('Não foi possível carregar o dados dessa pessoa. Tente outra vez.');
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
  // + ' idade: ' + cbx_IdadeAnimal.Items[cbx_IdadeAnimal.ItemIndex] + ' sexo: ' + cbx_SexoAnimal.Items[cbx_IdadeAnimal.ItemIndex] + ' raça: ' + cbx_TipoAnimal.Items[cbx_TipoAnimal.ItemIndex]
  // + ' etiqueta: ' + ed_Etiqueta.Text + ' caminhão: ' + cbx_TipoCaminhao.Items[cbx_TipoCaminhao.ItemIndex] + ' placa: ' + ed_PlacaCaminhao.Text + ' motorista ' + edTms_Motorista.Text
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
  // + ' idade: ' + cds_log.FieldByName('idade_animal').AsString + ' sexo: ' + cds_log.FieldByName('sexo_animal').AsString + ' raça: ' + cds_log.FieldByName('raca_animal').AsString +
  // ' etiqueta: ' + cds_log.FieldByName('etiqueta').AsString + ' caminhão: ' + cds_log.FieldByName('tipo_caminhao').AsString + ' placa: ' + cds_log.FieldByName('placa_caminhao').AsString +
  // ' motorista: ' + cds_log.FieldByName('motorista').AsString + ' valor frete: ' + cds_log.FieldByName('valortotal_frete').AsString + ' valor frete por cbs: ' + cds_log.FieldByName('valorporcbs_frete').AsString +
  // ' corretor: ' + cds_log.FieldByName('corretor').AsString + ' valor comissão: ' + cds_log.FieldByName('valortotal_comissao').AsString + ' valor comissao por cbs: ' + cds_log.FieldByName('valorporcbs_comissao').AsString
  // + ' descricao: ' + cds_log.FieldByName('descricao').AsString + ' valor total compra: ' + cds_log.FieldByName('valortotal_compra').AsString + ' valor compra por cbs: ' + cds_log.FieldByName('valorporcbs_compra').AsString,
  //
  // ' data_compra: ' + DateToStr(DateEditCompra.Date) + ' lote: ' + edTms_Lote.Text + ' fornecedor: ' + edTms_Fornecedor.Text +
  // ' conta_bancaria: ' + edTms_ContaBancaria.Text + ' quantidade_cbs: ' + ed_Quantidade.Text + ' valor total dos animais: ' + ed_ValorTotalAnimal.Text + ' valor por cbs: ' + ed_ValorPorAnimal.Text
  // + ' idade: ' + cbx_IdadeAnimal.Items[cbx_IdadeAnimal.ItemIndex] + ' sexo: ' + cbx_SexoAnimal.Items[cbx_IdadeAnimal.ItemIndex] + ' raça: ' + cbx_TipoAnimal.Items[cbx_TipoAnimal.ItemIndex]
  // + ' etiqueta: ' + ed_Etiqueta.Text + ' caminhão: ' + cbx_TipoCaminhao.Items[cbx_TipoCaminhao.ItemIndex] + ' placa: ' + ed_PlacaCaminhao.Text + ' motorista ' + edTms_Motorista.Text
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
  // + ' idade: ' + cds_log.FieldByName('idade_animal').AsString + ' sexo: ' + cds_log.FieldByName('sexo_animal').AsString + ' raça: ' + cds_log.FieldByName('raca_animal').AsString +
  // ' etiqueta: ' + cds_log.FieldByName('etiqueta').AsString + ' caminhão: ' + cds_log.FieldByName('tipo_caminhao').AsString + ' placa: ' + cds_log.FieldByName('placa_caminhao').AsString +
  // ' motorista: ' + cds_log.FieldByName('motorista').AsString + ' valor frete: ' + cds_log.FieldByName('valortotal_frete').AsString + ' valor frete por cbs: ' + cds_log.FieldByName('valorporcbs_frete').AsString +
  // ' corretor: ' + cds_log.FieldByName('corretor').AsString + ' valor comissão: ' + cds_log.FieldByName('valortotal_comissao').AsString + ' valor comissao por cbs: ' + cds_log.FieldByName('valorporcbs_comissao').AsString
  // + ' descricao: ' + cds_log.FieldByName('descricao').AsString + ' valor total compra: ' + cds_log.FieldByName('valortotal_compra').AsString + ' valor compra por cbs: ' + cds_log.FieldByName('valorporcbs_compra').AsString, '')
  // end;
end;

procedure TFrmCadCompra.lst_AnexosItemClick(const Sender: TObject; const AItem: TListViewItem);
var
  txt: TListItemText;
  Query: TFDQuery;

begin
  inherited;
  with AItem do
  begin
    txt := TListItemText(Objects.FindDrawable('codigo'));
    id_anexo := txt.TagString;
  end;
end;

procedure TFrmCadCompra.lst_PrincipalItemClick(const Sender: TObject; const AItem: TListViewItem);
const
  _SQLInicial = ' select c.id, c.data_compra, c.quantidade_cbs, c.valortotal_compra, c.valorporcbs_compra,            '
    + '      c.idade_animal, c.sexo_animal, c.raca_animal, c.etiqueta, c.tipo_caminhao, c.placa_caminhao,   ' +
    '      c.valortotal_frete, c.valorporcbs_frete, c.valortotal_comissao, c.valorporcbs_comissao,        ' +
    '      c.valortotal_animais, c.valorporcbs_animais, c.descricao, c.forma_pagto,                                                    '
    + '      f.nome as fornecedor, f.id as codigo_forn, cc.conta, cc.id as id_cc, l.nome as lote, m.nome as motorista,                         '
    + '      r.raca as raca, ia.idade_animal as idade, tp.tipo_caminhao as caminhao,                                                      '
    + '      co.nome as corretor, c.parcela, c.entrada, c.status_frete, c.status_comissao from compras as c                                                          '
    + ' left outer join pessoas as f on (f.id = c.fornecedor)                                               ' +
    ' left outer join contas_bancarias as cc on (cc.id = c.conta_bancaria)                                ' +
    ' left outer join lotes as l on (l.id = c.lote)                                                       ' +
    ' left outer join pessoas as m on (m.id = c.motorista)                                                ' +
    ' left outer join pessoas as co on (co.id = c.corretor)                                               ' +
    ' left outer join raca_animal as r on (r.id = c.raca_animal)                                          ' +
    ' left outer join idade_animal as ia on (ia.id = c.idade_animal)                                      ' +
    ' left outer join tipo_caminhao as tp on (tp.id = c.tipo_caminhao)  ' +
    ' where c.id = :id order by data_compra desc;                                                         ';
  SQLItens = 'select ci.*, i.idade_animal as idade, r.raca as raca from compras_itens as ci    ' +
    'left outer join idade_animal as i on (i.id = ci.idade_animal)                    ' +
    'left outer join raca_animal as r on(r.id = ci.raca_animal)                       ' +
    'where ci.id_compra = :id                                                         ' +
    'order by ci.id asc;                                                              ';

  sqlparcela = ' select num_parc, DATE_FORMAT(data, "%d/%m/%Y") as data, valor, ' + ' case ' +
    ' when (data < CURDATE() and status = 0) then ''VENCIDA'' ' + ' when (status = 0) then ''ABERTO'' ' +
    ' when (status = 1) then ''PAGO'' ' + ' END as status ' + ' from parcelas ' +
    ' where movimentacao = ''C'' and id_movimentacao = :id ';
var
  txt: TListItemText;
  Query, qry: TFDQuery;
  id: string;
begin
  inherited;

  img_recibo.Visible := true;
  Img_BtnEditar.Visible := false;
  ed_pesq.Enabled := true;
  with AItem do
  begin
    txt := TListItemText(Objects.FindDrawable('lbl_codigo'));
    id := txt.TagString;
  end;
  if id.IsEmpty then
  begin
    try
      rct_AnexoArq.Visible := true;
      Query := TFDQuery.Create(self);
      Query.Connection := dm.FDConnection;
      Query.FetchOptions.RowsetSize := 50000;
      with AItem do
      begin
        Edit := 0;

        txt := TListItemText(Objects.FindDrawable('codigo'));
        Cod_Selecao := txt.TagString.ToInteger;
        anexos(Cod_Selecao);
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
        cds_log.FieldByName('data_compra').AsDateTime := Query.FieldByName('data_compra').AsDateTime;
        cds_log.FieldByName('lote').AsString := Query.FieldByName('lote').AsString;;
        cds_log.FieldByName('fornecedor').AsString := Query.FieldByName('fornecedor').AsString;
        cds_log.FieldByName('conta_bancaria').AsString := Query.FieldByName('conta').AsString;
        cds_log.FieldByName('quantidade_cbs').AsString := Query.FieldByName('quantidade_cbs').AsString;
        cds_log.FieldByName('valortotal_compra').AsString := Query.FieldByName('valortotal_compra').AsString;
        cds_log.FieldByName('valorporcbs_compra').AsString := Query.FieldByName('valorporcbs_compra').AsString;
        cds_log.FieldByName('idade_animal').AsString := Query.FieldByName('idade').AsString;
        cds_log.FieldByName('sexo_animal').AsString := Query.FieldByName('sexo_animal').AsString;
        cds_log.FieldByName('raca_animal').AsString := Query.FieldByName('raca').AsString;
        cds_log.FieldByName('etiqueta').AsString := Query.FieldByName('etiqueta').AsString;
        cds_log.FieldByName('tipo_caminhao').AsString := Query.FieldByName('caminhao').AsString;
        cds_log.FieldByName('placa_caminhao').AsString := Query.FieldByName('placa_caminhao').AsString;
        cds_log.FieldByName('motorista').AsString := Query.FieldByName('motorista').AsString;
        cds_log.FieldByName('valortotal_frete').AsString := Query.FieldByName('valortotal_frete').AsString;
        cds_log.FieldByName('valorporcbs_frete').AsString := Query.FieldByName('valorporcbs_frete').AsString;
        cds_log.FieldByName('corretor').AsString := Query.FieldByName('corretor').AsString;
        cds_log.FieldByName('valortotal_comissao').AsString := Query.FieldByName('valortotal_comissao').AsString;
        cds_log.FieldByName('valorporcbs_comissao').AsString := Query.FieldByName('valorporcbs_comissao').AsString;
        cds_log.FieldByName('descricao').AsString := Query.FieldByName('descricao').AsString;
        cds_log.FieldByName('valortotal_animais').AsString := Query.FieldByName('valortotal_animais').AsString;
        cds_log.FieldByName('valorporcbs_animais').AsString := Query.FieldByName('valorporcbs_animais').AsString;
        cds_log.Post;

        ValorParc := 0;
        qry := TFDQuery.Create(nil);
        qry.Connection := dm.FDConnection;
        qry.Close;
        qry.SQL.Clear;
        qry.Active := false;
        qry.SQL.Clear;
        qry.SQL.Add(sqlparcela);
        qry.Params.ParamByName('id').AsInteger := txt.TagString.ToInteger;
        qry.Open;
        cdsParc.EmptyDataSet;
        cdsParc.CopyDataSet(qry);

        if Query.RecordCount > 0 then
        begin
          PopularCampos(Query);
          Query.Active := false;
          Query.SQL.Clear;
          Query.SQL.Add(SQLItens);
          Query.ParamByName('id').AsInteger := Cod_Selecao;
          Query.Open();

          PopularComprasItens(Query);

          StringGridAnimais.Enabled := false;
          Img_BtnSalvar2.Visible := false;
          Img_BtnCancelar2.Visible := false;
          tab_Crud.ActiveTab := TabItem2;
        end
        else
        begin
          ShowMessage('Não foi possível carregar o dados dessa despesa. Tente outra vez.');
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
  x: Integer;
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
        txt.Text := 'CÓDIGO';
        txt.TagString := '0';

        txt := TListItemText(Objects.FindDrawable('lbl_data'));
        txt.Text := 'DATA';

        txt := TListItemText(Objects.FindDrawable('lbl_lote'));
        txt.Text := 'LOTE';

        txt := TListItemText(Objects.FindDrawable('lbl_fornecedor'));
        txt.Text := 'FORNECEDOR';

        txt := TListItemText(Objects.FindDrawable('lbl_conta'));
        txt.Text := 'CONTA BANCÁRIA';

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
        txt.Text := 'R$' + formatfloat('#,##0.00', QBanco.FieldByName('valortotal_compra').AsFloat);

        txt := TListItemText(Objects.FindDrawable('valorcbs'));
        txt.Text := 'R$' + formatfloat('#,##0.00', QBanco.FieldByName('valorporcbs_compra').AsFloat);
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
  ed_Pessoa.Text := formatfloat('00000', Query.FieldByName('codigo_forn').AsFloat) + ' - ' +
    Query.FieldByName('fornecedor').AsString;
  // CONTA BANCÁRIA
  // edTms_ContaBancaria.Text := Query.FieldByName('conta').AsString;
  ed_Conta.Text := formatfloat('00000', Query.FieldByName('id_cc').AsFloat) + ' - ' +
    Query.FieldByName('conta').AsString;
  // QUANTIDADE DE CBS
  ed_QuantidadeTotal.Text := Query.FieldByName('quantidade_cbs').AsString;
  // VALOR TOTAL DOS ANIMAIS
  // ed_ValorTotalAnimal.Text := formatfloat('###,##0.00',
  // Query.FieldByName('valortotal_animais').AsFloat);
  // // VALOR POR CBS
  // ed_ValorPorAnimal.Text := formatfloat('###,##0.00',
  // Query.FieldByName('valorporcbs_animais').AsFloat);
  // IDADE ANIMAL
  // ConsultaIdadeAnimal;
  // cbx_IdadeAnimal.ItemIndex := Query.FieldByName('idade_animal').AsInteger;
  // // SEXO ANIMAL
  // cbx_SexoAnimal.ItemIndex := Query.FieldByName('sexo_animal').AsInteger;
  // // RAÇA ANIMAL
  // ConsultaRacaAnimal;
  // cbx_TipoAnimal.ItemIndex := Query.FieldByName('raca_animal').AsInteger;
  // ETIQUETA
  ed_Etiqueta.Text := Query.FieldByName('etiqueta').AsString;
  // TIPO DE CAMINHÃO
  ConsultaTipoCaminhao;
  cbx_TipoCaminhao.ItemIndex := Query.FieldByName('tipo_caminhao').AsInteger;
  // PLACA CAMINHÃO
  ed_PlacaCaminhao.Text := Query.FieldByName('placa_caminhao').AsString;
  // FORMA DE PAGAMENTO
  ConsultaFormaPagto;
  cbx_FormaPagto.ItemIndex := Query.FieldByName('forma_pagto').AsInteger;
  // MOTORISTA
  // edTms_Motorista.Text := Query.FieldByName('motorista').AsString;
  ed_Motorista.Text := Query.FieldByName('motorista').AsString;
  // VALOR TOTAL DO FRETE
  ed_ValorTotalFrete.Text := formatfloat('###,##0.00', Query.FieldByName('valortotal_frete').AsFloat);
  // VALOR FRETE POR ANIMAL
  ed_ValorFretePorAnimal.Text := formatfloat('###,##0.00', Query.FieldByName('valorporcbs_frete').AsFloat);
  // CORRETOR
  // edTms_Corretor.Text := Query.FieldByName('corretor').AsString;
  ed_Corretor.Text := Query.FieldByName('corretor').AsString;
  // VALOR TOTAL DA COMISSÃO
  ed_ValorTotalComissao.Text := formatfloat('###,##0.00', Query.FieldByName('valortotal_comissao').AsFloat);
  // VALOR COMISSÃO POR ANIMAL
  ed_ValorComisPorAnimal.Text := formatfloat('###,##0.00', Query.FieldByName('valorporcbs_comissao').AsFloat);
  // DESCRIÇÃO
  ed_Obs.Text := Query.FieldByName('descricao').AsString;
  // VALOR TOTAL DA COMPRA
  ed_ValorTotalCompra.Text := formatfloat('###,##0.00', Query.FieldByName('valortotal_compra').AsFloat);
  // VALOR POR CBS DA COMPRA
  ed_valorporcbs_compra.Text := formatfloat('###,##0.00', Query.FieldByName('valorporcbs_compra').AsFloat);

  case Query.FieldByName('parcela').AsInteger of
    0:
      begin
        lay_GerarPac.Visible := false;
        ckb_GerarParcela.IsChecked := false;
      end;
    1:
      begin
        lay_GerarPac.Visible := true;
        ckb_GerarParcela.IsChecked := true;
      end;
  end;
  ed_EntradaValor.Text := Query.FieldByName('entrada').AsString;

  case Query.FieldByName('status_frete').AsInteger of
    0:
      begin
        ckb_FreteDesc.IsChecked := false;
        ckb_FreteParc.IsChecked := false;
      end;

    1:
      begin
        ckb_FreteDesc.IsChecked := true;
        ckb_FreteParc.IsChecked := false;
      end;
    2:
      begin
        ckb_FreteDesc.IsChecked := false;
        ckb_FreteParc.IsChecked := true;
      end;
  end;

  case Query.FieldByName('status_comissao').AsInteger of
    0:
      begin
        ckb_ComissaoDesc.IsChecked := false;
        ckb_ComissaoParc.IsChecked := false;
      end;

    1:
      begin
        ckb_ComissaoDesc.IsChecked := true;
        ckb_ComissaoParc.IsChecked := false;
      end;
    2:
      begin
        ckb_ComissaoDesc.IsChecked := false;
        ckb_ComissaoParc.IsChecked := true;
      end;
  end;

end;

procedure TFrmCadCompra.PopularComprasItens(Query: TFDQuery);
var
  I, lin: Integer;
begin
  for lin := 0 to StringGridAnimais.RowCount - 1 do
    LimpaStringGrid(lin, StringGridAnimais);

  for I := 0 to Query.RecordCount - 1 do
  begin
    with StringGridAnimais do
    begin
      RowCount := RowCount + 1;
      Row := RowCount - 1;
      // id
      Cells[1, Row] := formatfloat('00000', Query.FieldByName('id').AsFloat);
      // qtd
      Cells[2, Row] := Query.FieldByName('quantidade').AsString;
      // Idade
      Cells[3, Row] := Query.FieldByName('idade').AsString;
      // raça
      Cells[4, Row] := Query.FieldByName('raca').AsString;
      // sexo
      if Query.FieldByName('sexo_animal').AsInteger = 1 then
        Cells[5, Row] := 'FEMÊA'
      else if Query.FieldByName('sexo_animal').AsInteger = 2 then
        Cells[5, Row] := 'MACHO'
      else
        Cells[5, Row] := 'MISTO';
      // valor por animal
      Cells[6, Row] := formatfloat('###,###,##0.00', Query.FieldByName('valorporcbs_animais').AsFloat);
      // valor total
      Cells[7, Row] := formatfloat('###,###,##0.00', Query.FieldByName('valortotal_animais').AsFloat);
    end;

    ValorParc := ValorParc + Query.FieldByName('valortotal_animais').AsFloat;
    Query.Next;
  end;

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

procedure TFrmCadCompra.rctApagarSelecionadosClick(Sender: TObject);
var
  cont, cont2: Integer;
  v1, v2, v3, total, total2: currency;
begin
  cont2 := 0;
  if mensagemConfirmacao('Confirma apagar os itens selecionados?') = mrYes then
  begin
    if StringGridAnimais.RowCount > 0 then
    begin
      for cont := 0 to StringGridAnimais.ColumnCount - 1 do
      begin
        if not StringGridAnimais.Cells[0, cont].IsEmpty then
        begin
          if StringGridAnimais.Cells[0, cont].ToBoolean then
          begin
            ed_ValorTotalCompra.Text := formatfloat('###,###,##0.00', StrTofloat_Universal(ed_ValorTotalCompra.Text) -
              StrTofloat_Universal(StringGridAnimais.Cells[7, cont]));
            ed_QuantidadeTotal.Text :=
              IntToStr(StrToInt(ed_QuantidadeTotal.Text) - StrToInt(StringGridAnimais.Cells[2, cont]));
            ed_valorporcbs_compra.Text := formatfloat('###,###,##0.00', StrTofloat_Universal(ed_ValorTotalCompra.Text) /
              StrTofloat_Universal(ed_QuantidadeTotal.Text));
            DeleteRow(cont, StringGridAnimais);
          end;
        end;
      end;
    end;
    if not ed_ValorTotalFrete.Text.IsEmpty then
    begin
      if ed_QuantidadeTotal.Text.Equals('0') then
      begin
        if ed_ValorFretePorAnimal.Text.IsEmpty then
          ed_ValorFretePorAnimal.Text := '0';

        ed_ValorFretePorAnimal.Text :=
          FloatToStr(strtofloat(StringReplace(ed_ValorTotalFrete.Text, '.', '', [rfReplaceAll])) /
          StrToInt(ed_Quantidade.Text))
      end
      else
        ed_ValorFretePorAnimal.Text :=
          FloatToStr(strtofloat(StringReplace(ed_ValorTotalFrete.Text, '.', '', [rfReplaceAll])) /
          StrToInt(ed_QuantidadeTotal.Text));
    end;

    if not ed_ValorTotalComissao.Text.IsEmpty then
    begin
      if ed_QuantidadeTotal.Text.Equals('0') then
      begin
        if ed_ValorComisPorAnimal.Text.IsEmpty then
          ed_ValorComisPorAnimal.Text := '0';
        ed_ValorComisPorAnimal.Text :=
          FloatToStr(strtofloat(StringReplace(ed_ValorTotalComissao.Text, '.', '', [rfReplaceAll])) /
          StrToInt(ed_Quantidade.Text))
      end
      else
        ed_ValorComisPorAnimal.Text :=
          FloatToStr(strtofloat(StringReplace(ed_ValorTotalComissao.Text, '.', '', [rfReplaceAll])) /
          StrToInt(ed_QuantidadeTotal.Text));
    end;
  end
  else
    abort
end;

procedure TFrmCadCompra.Rectangle12Click(Sender: TObject);
var
  cont: Integer;
begin
  inherited;
  if (ed_Quantidade.Text = EmptyStr) then
  begin
    ShowMessage('Erro 6004: Informe a QUANTIDADE de animais!');
    ed_Quantidade.SetFocus;
    abort;
  end;

  if (ed_ValorTotalAnimal.Text = EmptyStr) then
  begin
    ShowMessage('Erro 6005: Informe o VALOR TOTAL DA COMPRA!');
    ed_ValorTotalAnimal.SetFocus;
    abort;
  end;

  if cbx_IdadeAnimal.ItemIndex < 1 then
  begin
    ShowMessage('Erro 6006: Selecione a IDADE do (s) animal (ais)!');
    cbx_IdadeAnimal.SetFocus;
    abort;
  end;

  if cbx_SexoAnimal.ItemIndex < 1 then
  begin
    ShowMessage('Erro 6007: Selecione o SEXO do (s) animal (ais)!');
    cbx_SexoAnimal.SetFocus;
    abort;
  end;

  if cbx_TipoAnimal.ItemIndex < 1 then
  begin
    ShowMessage('Erro 6008: Selecione a RAÇA do (s) animal (ais)!');
    cbx_TipoAnimal.SetFocus;
    abort;
  end;

  try
    cont := 0;
    with StringGridAnimais do
    begin
      // cont := RowCount;
      RowCount := RowCount + 1;
      Row := RowCount - 1;
      // Cod
      Cells[1, Row] := IntToStr(Row + 1);
      // qtd
      Cells[2, Row] := ed_Quantidade.Text;
      // Idade
      Cells[3, Row] := cbx_IdadeAnimal.Items[cbx_IdadeAnimal.ItemIndex];
      // Raça
      Cells[4, Row] := cbx_TipoAnimal.Items[cbx_TipoAnimal.ItemIndex];
      // Sexo
      Cells[5, Row] := cbx_SexoAnimal.Items[cbx_SexoAnimal.ItemIndex];
      // valor por animal
      Cells[6, Row] := ed_ValorPorAnimal.Text;
      // Valor total
      Cells[7, Row] := ed_ValorTotalAnimal.Text; // edtQuantidade.Text;

      ValorParc := strtofloat(StringReplace(ed_ValorTotalAnimal.Text, '.', '', [rfReplaceAll]));

      ed_QuantidadeTotal.Text := IntToStr(StrToInt(ed_QuantidadeTotal.Text) + StrToInt(ed_Quantidade.Text));
      // ed_ValorTotalCompra.Text := formatfloat('###,###,##0.00', StrToFloat_Universal(ed_ValorTotalCompra.Text) +
      // StrToFloat_Universal(ed_ValorTotalAnimal.Text));
      // ed_valorporcbs_compra.Text := formatfloat('###,###,##0.00', StrToFloat_Universal(ed_valorporcbs_compra.Text) +
      // StrToFloat_Universal(ed_ValorTotalAnimal.Text) / strtofloat(ed_Quantidade.Text));
      // CalcValorPorAnimal;
      CalcValorTotal;
      CalcValorPorAnimal;
    end;
  finally
    ed_Quantidade.Text := EmptyStr;
    ed_ValorTotalAnimal.Text := EmptyStr;
    ed_ValorPorAnimal.Text := EmptyStr;
    cbx_IdadeAnimal.ItemIndex := 0;
    cbx_TipoAnimal.ItemIndex := 0;
    cbx_SexoAnimal.ItemIndex := 0;

  end;
end;

procedure TFrmCadCompra.rct_fgtoClick(Sender: TObject);
begin
  inherited;
  if (ValorParc = 0) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 5080 : ' + sLineBreak + 'Informe o UM ANIMAL da despesa!';
    abort;
  end;

  if cbx_FormaPagto.Enabled then
  begin
    Rectangle38.Enabled := true;
    Rectangle39.Enabled := true;
  end
  else
  begin
    Rectangle38.Enabled := false;
    Rectangle39.Enabled := false;
  end;

  lay_parc.Visible := true;
end;

procedure TFrmCadCompra.Rectangle26Click(Sender: TObject);
begin
  inherited;
  lay_Recibo.Visible := false;
end;

procedure TFrmCadCompra.Rectangle37Click(Sender: TObject);
begin
  inherited;
  lay_parc.Visible := false;
end;

procedure TFrmCadCompra.Rectangle38Click(Sender: TObject);
begin
  inherited;
  cdsParc.EmptyDataSet;
  cdsParc.Refresh;
end;

procedure TFrmCadCompra.Rectangle39Click(Sender: TObject);
var
  frete, comissao, valor: double;

begin
  inherited;
  cdsParc.EmptyDataSet;
  // valor := strtofloat(StringReplace(ed_ValorTotalCompra.Text, '.', '', [rfReplaceAll]));

  valor := strtofloat(StringReplace(ed_ValorTotalCompra.Text, '.', '', [rfReplaceAll])) -
    strtofloat(StringReplace(ed_ValorTotalComissao.Text, '.', '', [rfReplaceAll])) -
    strtofloat(StringReplace(ed_ValorTotalFrete.Text, '.', '', [rfReplaceAll]));

  if ckb_ComissaoParc.IsChecked then
    valor := valor + strtofloat(StringReplace(ed_ValorTotalComissao.Text, '.', '', [rfReplaceAll]));

  if ckb_FreteParc.IsChecked then
    valor := valor + strtofloat(StringReplace(ed_ValorTotalFrete.Text, '.', '', [rfReplaceAll]));

  GeraParcelas(DateEditCompra.Date, cbx_Parc.ItemIndex, StrToInt(ed_DiasParc.Text),
    (valor - strtofloat(StringReplace(ed_EntradaValor.Text, '.', '', [rfReplaceAll]))));
  cdsParc.Refresh;

end;

procedure TFrmCadCompra.rct_AnexoArqClick(Sender: TObject);
begin
  inherited;
  tab_Crud.ActiveTab := TabItem4;
end;

procedure TFrmCadCompra.RemoveInfoLotes(id: Integer);
const
  SQL = 'UPDATE agrojun.lotes SET id_compra = 0, status = 0 WHERE id = :id';
var
  Query: TFDQuery;
begin
  if id <> 0 then
  begin

    try
      Query := TFDQuery.Create(self);
      Query.Connection := dm.FDConnection;
      Query.FetchOptions.RowsetSize := 50000;
      Query.Active := false;
      Query.SQL.Clear;
      Query.SQL.Add(SQL);
      Query.ParamByName('id').AsInteger := id;
      Query.ExecSQL;

    finally
      FreeAndNil(Query);
    end;
  end;
end;

function TFrmCadCompra.RetornaIdConta(conta: string): Integer;
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

function TFrmCadCompra.RetornaIdLote(numero: string): Integer;
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

function TFrmCadCompra.RetornaIdPessoa(nome: string): Integer;
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

function TFrmCadCompra.SalvarLote(numero: string): Integer;
const
  SQLInsert   = 'INSERT INTO agrojun.lotes (numero, nome, ativo) VALUES (:numero, :nome, 1)';
  SQLVerifica = 'SELECT * from agrojun.lotes where nome = :nome';
var
  Query: TFDQuery;
begin
  try
    Query := TFDQuery.Create(self);
    Query.Connection := dm.FDConnection;
    Query.FetchOptions.RowsetSize := 50000;
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add(SQLVerifica);
    Query.ParamByName('nome').AsString := numero;
    Query.Open();
    if Query.IsEmpty then
    begin
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add(SQLInsert);
      Query.ParamByName('nome').AsString := numero;
      Query.ParamByName('numero').AsString := formatfloat('00000', MaxCod('lotes'));
      Query.ExecSQL;
      Result := 1;
    end
    else
      Result := 0;
  finally
    FreeAndNil(Query);
  end;
end;

procedure TFrmCadCompra.SalvarPessoa(nome: string; tipo_pessoa: Integer);
const
  SQLInsert = 'INSERT INTO agrojun.pessoas (nome, tipo_pessoa, cidade, estado, fornecedor, cliente)             ' +
    '                VALUES (:nome, :tipo_pessoa, :cidade, :estado, :fornecedor, ' + '                :cliente)';
var
  Query: TFDQuery;
begin
  try
    Query := TFDQuery.Create(self);
    Query.Connection := dm.FDConnection;
    Query.FetchOptions.RowsetSize := 50000;
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

procedure TFrmCadCompra.StringGridAnimaisCellDblClick(const Column: TColumn; const Row: Integer);
begin
  inherited;
  // //QUANTIDADE
  // ed_Quantidade.Text := StringGridAnimais.Cells[2, Row];
  // //IDADE
  // cbx_IdadeAnimal.ItemIndex := copy(StringGridAnimais.Cells[3,Row], 0, 3);
  // //RAÇA
  // cbx_TipoAnimal.ItemIndex := copy(StringGridAnimais.Cells[4,Row], 0, 3);
  // //SEXO
  // cbx_SexoAnimal.ItemIndex := copy(StringGridAnimais.Cells[5,Row], 0, 3);
  // //VALOR TOTAL
  // ed_ValorTotalAnimal.Text := StringGridAnimais.Cells[7,Row];
  //
  // Edit = 1;
  // r := Row;
end;

procedure TFrmCadCompra.Validar(cod_vali: Integer);
begin
  if (ed_Lote.Text = EmptyStr) or (cod_vali = 1) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 6001 : ' + sLineBreak + 'Selecione um LOTE válido!';
    ed_Lote.SetFocus;
    abort;
  end;

  if (ed_Pessoa.Text = EmptyStr) or (cod_vali = 2) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 6002 : ' + sLineBreak + 'Selecione um(a) FORNECEDOR(A) válido(a)!';
    ed_Pessoa.SetFocus;
    abort;
  end;

  if (ed_Conta.Text = EmptyStr) or (cod_vali = 3) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 6003 : ' + sLineBreak + 'Selecione uma CONTA válida!';
    ed_Conta.SetFocus;
    abort;
  end;

  // if (ed_Quantidade.Text = EmptyStr) then
  // begin
  // lay_error.Visible := true;
  // lbl_Erro.Text := 'Erro 6004 : ' + sLineBreak +
  // 'Informe a QUANTIDADE de animais!';
  // ed_Quantidade.SetFocus;
  // abort;
  // end;
  //
  // if (ed_ValorTotalAnimal.Text = EmptyStr) then
  // begin
  // lay_error.Visible := true;
  // lbl_Erro.Text := 'Erro 6005 : ' + sLineBreak +
  // 'Informe o VALOR TOTAL DA COMPRA!';
  // ed_ValorTotalAnimal.SetFocus;
  // abort;
  // end;

  // if cbx_IdadeAnimal.ItemIndex < 1 then
  // begin
  // lay_error.Visible := true;
  // lbl_Erro.Text := 'Erro 6006 : ' + sLineBreak +
  // 'Selecione a IDADE do (s) animal (ais)!';
  // cbx_IdadeAnimal.SetFocus;
  // abort;
  // end;
  //
  // if cbx_SexoAnimal.ItemIndex < 1 then
  // begin
  // lay_error.Visible := true;
  // lbl_Erro.Text := 'Erro 6007 : ' + sLineBreak +
  // 'Selecione o SEXO do (s) animal (ais)!';
  // cbx_SexoAnimal.SetFocus;
  // abort;
  // end;
  //
  // if cbx_TipoAnimal.ItemIndex < 1 then
  // begin
  // lay_error.Visible := true;
  // lbl_Erro.Text := 'Erro 6008 : ' + sLineBreak +
  // 'Selecione a RAÇA do (s) animal (ais)!';
  // cbx_TipoAnimal.SetFocus;
  // abort;
  // end;

  if (ed_ValorTotalFrete.Text = EmptyStr) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 6009 : ' + sLineBreak + 'Insira o VALOR TOTAL DO FRETE!';
    ed_ValorTotalFrete.SetFocus;
    abort;
  end;

  if (ed_ValorTotalComissao.Text = EmptyStr) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 6010 : ' + sLineBreak + 'Insira o VALOR TOTAL DA COMISSÃO!';
    ed_ValorTotalComissao.SetFocus;
    abort;
  end;

  if (cod_vali = 4) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 6011 : ' + sLineBreak + 'Selecione um(a) MOTORISTA válido(a)!';
    ed_Motorista.SetFocus;
    abort;
  end;

  if (cod_vali = 5) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 6012 : ' + sLineBreak + 'Selecione um(a) CORRETOR(A) válido(a)!';
    ed_Corretor.SetFocus;
    abort;
  end;

  if cod_vali = 8 then
  begin
    if not rbFisica1.IsChecked and not rbJuridica1.IsChecked then
    begin
      lay_error.Visible := true;
      lbl_Erro.Text := 'Erro 6013 : ' + sLineBreak + 'Selecione um TIPO DE PESSOA válido no(a) FORNECEDOR(A)!';
      rbFisica1.SetFocus;
      abort;
    end
    else if not rbFisica2.IsChecked and not rbJuridica2.IsChecked then
    begin
      lay_error.Visible := true;
      lbl_Erro.Text := 'Erro 6014 : ' + sLineBreak + 'Selecione um TIPO DE PESSOA válido no(a) MOTORISTA!';
      rbFisica2.SetFocus;
      abort;
    end
    else if not rbFisica3.IsChecked and not rbJuridica3.IsChecked then
    begin
      lay_error.Visible := true;
      lbl_Erro.Text := 'Erro 6015 : ' + sLineBreak + 'Selecione um TIPO DE PESSOA válido no(a) CORRETOR(A)!';
      rbFisica3.SetFocus;
      abort;
    end;
  end;

  if (cod_vali = 9) then
  begin
    ShowMessage('Erro 6016: Já existe um lote cadastrado com esse nome/número!');
    ed_Lote.SetFocus;
    abort;
  end;

  if cbx_FormaPagto.ItemIndex < 1 then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 6017 : ' + sLineBreak + 'Selecione a FORMA DE PAGAMENTO!';
    cbx_FormaPagto.SetFocus;
    abort;
  end;

end;

function TFrmCadCompra.ValidarPessoa(nome: string): Integer;
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
      Query.FetchOptions.RowsetSize := 50000;
      Query.Active := false;
      Query.SQL.Clear;
      Query.SQL.Add(SQL);
      Query.ParamByName('nome').AsString := nome;
      Query.Open;
      if Query.IsEmpty then
        Result := 0
      else
        Result := 1;
    end;
  finally
    FreeAndNil(Query);
  end;
end;

procedure TFrmCadCompra.anexos(cod: Integer);
const
  _SqlAnexo = 'SELECT * FROM agrojun.anexos where status = ''C'' and cod_mov = :cod_mov';
var
  x: Integer;
  QAnexo: TFDQuery;
  item: TListViewItem;
  txt: TListItemText;
begin

  try
    QAnexo := TFDQuery.Create(self);
    QAnexo.Connection := dm.FDConnection;
    QAnexo.FetchOptions.RowsetSize := 50000;
    QAnexo.Active := false;
    QAnexo.SQL.Clear;
    QAnexo.SQL.Add(_SqlAnexo);
    QAnexo.ParamByName('cod_mov').AsInteger := cod;
    QAnexo.Active := true;
    QAnexo.First;

    lst_Anexos.Items.Clear;
    lst_Anexos.BeginUpdate;

    for x := 1 to 1 do
    begin
      item := lst_Anexos.Items.Add;

      with item do
      begin
        txt := TListItemText(Objects.FindDrawable('lbl_codigo'));
        txt.Text := 'CÓDIGO';
        txt.TagString := '0';

        txt := TListItemText(Objects.FindDrawable('lbl_nome'));
        txt.Text := 'NOME DO ARQUIVO';

        txt := TListItemText(Objects.FindDrawable('lbl_caminho'));
        txt.Text := 'CAMINHO DO ARQUIVO';

      end;
    end;

    for x := 1 to QAnexo.RecordCount do
    begin

      item := lst_Anexos.Items.Add;

      with item do
      begin
        txt := TListItemText(Objects.FindDrawable('codigo'));
        txt.Text := formatfloat('0000', QAnexo.FieldByName('id').AsFloat);
        txt.TagString := QAnexo.FieldByName('id').AsString;

        txt := TListItemText(Objects.FindDrawable('nome'));
        txt.Text := QAnexo.FieldByName('nome_arq').AsString;

        txt := TListItemText(Objects.FindDrawable('caminho'));
        txt.Text := QAnexo.FieldByName('caminho').AsString;

      end;

      QAnexo.Next
    end;
  finally
    lst_Anexos.EndUpdate;
    FreeAndNil(QAnexo);
  end;

end;

procedure TFrmCadCompra.GravaParcelas(movimentacao: string; id_movimentacao, conta_bancaria, id_pessoa: Integer);
const
  SQL = ' INSERT INTO agrojun.parcelas ' +
    ' (data, movimentacao, id_movimentacao, conta_bancaria, num_parc, valor, status, id_pessoa) ' + ' VALUES ' +
    ' (:data, :movimentacao, :id_movimentacao, :conta_bancaria, :num_parc, :valor, :status, :id_pessoa); ';

var
  qry: TFDQuery;
begin

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := dm.FDConnection;

    cdsParc.First();
    while not cdsParc.Eof do
    begin

      qry.Close;
      qry.SQL.Clear;
      qry.Active := false;
      qry.SQL.Clear;
      qry.SQL.Add(SQL);
      qry.Params.ParamByName('id_movimentacao').AsInteger := id_movimentacao;
      qry.Params.ParamByName('id_pessoa').AsInteger := id_pessoa;
      qry.Params.ParamByName('movimentacao').AsString := movimentacao;
      // C = compra; V = venda; D = Despesa
      qry.Params.ParamByName('conta_bancaria').AsInteger := conta_bancaria;
      qry.Params.ParamByName('status').AsInteger := 0; // 0 = aberta; 1= fechada
      qry.Params.ParamByName('num_parc').AsInteger := cdsParc.FieldByName('num_parc').AsInteger;
      qry.Params.ParamByName('Data').AsDateTime := cdsParc.FieldByName('Data').AsDateTime;
      qry.Params.ParamByName('valor').AsFloat := cdsParc.FieldByName('valor').AsFloat;
      qry.ExecSQL;
      cdsParc.Next;
    end;
  finally
    FreeAndNil(qry);
  end;
end;

procedure TFrmCadCompra.GeraParcelas(Data: TDateTime; num_parc, num_dias: Integer; valor: double);

var
  cont, I, nParcela: Integer;
  Parc: Real;
begin
  cdsParc.EmptyDataSet;
  cdsParc.Refresh;

  if (num_parc = 0) and (num_parc > 30) then
  begin
    raise Exception.Create('Necessário informar um Número de Parcelas maior que zero e menor que trinta!');
  end;

  // if (num_dias = 0) then
  // begin
  // raise Exception.Create('O intervalos das parcelas nao pode ser igual a zero!');
  // end;

  if mensagemConfirmacao('Deseja efetuar a geraçao da(s) parcela(s)?') = mrYes then
  begin
    // Parc := Round(valor / num_parc);
    Parc := valor / num_parc;
    nParcela := 1;
    for I := 1 to num_parc do
    begin

      cdsParc.Append;
      cdsParc.FieldByName('num_parc').AsInteger := nParcela;
      cdsParc.FieldByName('Data').AsDateTime := IncDay(Data, num_dias * nParcela);
      cdsParc.FieldByName('valor').AsFloat := Parc;
      cdsParc.FieldByName('Status').AsString := 'ABERTO';
      cdsParc.Post;

      nParcela := nParcela + 1;

    end;
  end
  else
    abort;
end;

procedure TFrmCadCompra.ckb_ComissaoDescChange(Sender: TObject);
begin
  inherited;
  if ckb_ComissaoDesc.IsChecked then
  begin
    ckb_ComissaoParc.IsChecked := false;
    ckb_ComissaoParc.Enabled := false;
  end
  else
  begin
    ckb_ComissaoParc.IsChecked := false;
    ckb_ComissaoParc.Enabled := true;
  end;
end;

procedure TFrmCadCompra.ckb_ComissaoParcChange(Sender: TObject);
begin
  inherited;
  if ckb_ComissaoParc.IsChecked then
  begin
    ckb_ComissaoDesc.IsChecked := false;
    ckb_ComissaoDesc.Enabled := false;
  end
  else
  begin
    ckb_ComissaoDesc.IsChecked := false;
    ckb_ComissaoDesc.Enabled := true;
  end;
end;

procedure TFrmCadCompra.ckb_FreteDescChange(Sender: TObject);
begin
  inherited;

  if ckb_FreteDesc.IsChecked then
  begin
    ckb_FreteParc.IsChecked := false;
    ckb_FreteParc.Enabled := false;
  end
  else
  begin
    ckb_FreteParc.IsChecked := false;
    ckb_FreteParc.Enabled := true;
  end;
end;

procedure TFrmCadCompra.ckb_FreteParcChange(Sender: TObject);
begin
  inherited;
  if ckb_FreteParc.IsChecked then
  begin
    ckb_FreteDesc.IsChecked := false;
    ckb_FreteDesc.Enabled := false;
  end
  else
  begin
    ckb_FreteDesc.IsChecked := false;
    ckb_FreteDesc.Enabled := true;
  end;
end;

end.
