unit u_CadVenda;

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
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Stan.Async,
  FireDAC.DApt, FMX.frxClass,
  System.Rtti, FMX.Grid.Style, FMX.Grid, FMX.ScrollBox, FireDAC.Stan.StorageBin,
  Data.Bind.EngExt, FMX.Bind.DBEngExt, FMX.Bind.Grid,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, FMX.ListBox;

type
  TFrmCadVenda = class(TFrmCrud)
    lytInfo: TLayout;
    Layout7: TLayout;
    lytData: TLayout;
    Label3: TLabel;
    DateEditVenda: TDateEdit;
    Label14: TLabel;
    lytCliente: TLayout;
    Label5: TLabel;
    Label16: TLabel;
    lytConta: TLayout;
    Label6: TLabel;
    Label17: TLabel;
    lytValorTotalAnimal: TLayout;
    ed_ValorTotalAnimal: TEdit;
    Label13: TLabel;
    Label21: TLabel;
    lytValorPorAnimal: TLayout;
    ed_ValorPorAnimal: TEdit;
    Label22: TLabel;
    lytQuantidade: TLayout;
    ed_Quantidade: TEdit;
    Label4: TLabel;
    Label34: TLabel;
    Layout14: TLayout;
    lytMotorista: TLayout;
    Label8: TLabel;
    Label27: TLabel;
    lytTotalFrete: TLayout;
    ed_ValorTotalFrete: TEdit;
    Label26: TLabel;
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
    Layout5: TLayout;
    lytIdadeAnimal: TLayout;
    Label20: TLabel;
    cbx_IdadeAnimal: TComboEdit;
    Label12: TLabel;
    lytSexoAnimal: TLayout;
    cbx_SexoAnimal: TComboEdit;
    Label11: TLabel;
    Label18: TLabel;
    lytTipoAnimal: TLayout;
    cbx_TipoAnimal: TComboEdit;
    Label10: TLabel;
    Label19: TLabel;
    lytEtiqueta: TLayout;
    ed_Etiqueta: TEdit;
    Label23: TLabel;
    lytTipoCaminhao: TLayout;
    Label24: TLabel;
    cbx_TipoCaminhao: TComboEdit;
    Layout8: TLayout;
    ed_PlacaCaminhao: TEdit;
    Label25: TLabel;
    Layout11: TLayout;
    lytObs: TLayout;
    ed_Obs: TEdit;
    Label33: TLabel;
    lytValorTotalCompra: TLayout;
    ed_ValorTotalVenda: TEdit;
    Label37: TLabel;
    lytValorTotalCompraAnimal: TLayout;
    ed_valorporcbs_venda: TEdit;
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
    lay_lstvaziaLote: TLayout;
    Image6: TImage;
    Label39: TLabel;
    ListViewLote: TListView;
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
    ckbCadNow1: TCheckBox;
    rbFisica1: TCheckBox;
    rbJuridica1: TCheckBox;
    ckbCadNow2: TCheckBox;
    rbFisica2: TCheckBox;
    rbJuridica2: TCheckBox;
    ckbCadNow3: TCheckBox;
    rbFisica3: TCheckBox;
    rbJuridica3: TCheckBox;
    TabConta: TTabItem;
    lay_lstvaziaConta: TLayout;
    Image4: TImage;
    Label43: TLabel;
    Layout12: TLayout;
    ListViewConta: TListView;
    ed_Conta: TEdit;
    ClearEditButton9: TClearEditButton;
    Layout26: TLayout;
    Rectangle14: TRectangle;
    Layout27: TLayout;
    Image20: TImage;
    Layout15: TLayout;
    Rectangle4: TRectangle;
    Layout16: TLayout;
    Image5: TImage;
    Layout17: TLayout;
    Rectangle5: TRectangle;
    Layout18: TLayout;
    Image2: TImage;
    Rectangle10: TRectangle;
    ed_PesquisaConta: TEdit;
    ClearEditButton8: TClearEditButton;
    Label48: TLabel;
    Label49: TLabel;
    Rectangle11: TRectangle;
    ed_PesquisaLote: TEdit;
    ClearEditButton7: TClearEditButton;
    Label44: TLabel;
    Label46: TLabel;
    Rectangle8: TRectangle;
    ed_PesquisaPessoa: TEdit;
    ClearEditButton3: TClearEditButton;
    Label42: TLabel;
    Label47: TLabel;
    Label40: TLabel;
    TabItem3: TTabItem;
    Layout31: TLayout;
    Rectangle16: TRectangle;
    Layout32: TLayout;
    Image9: TImage;
    Layout33: TLayout;
    Rectangle17: TRectangle;
    Label56: TLabel;
    lst_Anexos: TListView;
    Layout34: TLayout;
    rct_AnexoArq: TRectangle;
    Label57: TLabel;
    OpenDialog: TOpenDialog;
    img_delAnex: TImage;
    Image8: TImage;
    Image7: TImage;
    frxRecibo: TfrxReport;
    recibo: TFDQuery;
    img_recibo: TImage;
    lay_Recibo: TLayout;
    Rectangle9: TRectangle;
    Rectangle12: TRectangle;
    btn_ReciboFrete: TButton;
    btn_ReciboComissao: TButton;
    btn_ReciboVenda: TButton;
    Label35: TLabel;
    TabItem4: TTabItem;
    Layout19: TLayout;
    Rectangle13: TRectangle;
    Layout20: TLayout;
    Layout21: TLayout;
    Layout25: TLayout;
    ed_ValorTotal: TEdit;
    Label54: TLabel;
    Layout28: TLayout;
    ed_valorporcbs_compra: TEdit;
    Label55: TLabel;
    Layout29: TLayout;
    Rectangle15: TRectangle;
    Label58: TLabel;
    Layout30: TLayout;
    StringGridAnimais: TStringGrid;
    id: TStringColumn;
    qtd: TStringColumn;
    idade_animal: TStringColumn;
    raca_animal: TStringColumn;
    sexo: TStringColumn;
    valor_animal: TStringColumn;
    valor_total: TStringColumn;
    lytBotoes: TLayout;
    lytApagarSelec: TLayout;
    rctApagarSelecionados: TRectangle;
    lblApagarSelec: TLabel;
    lytInfoEdit: TLayout;
    Label59: TLabel;
    Layout38: TLayout;
    ed_QuantidadeTotal: TEdit;
    Label66: TLabel;
    Label87: TLabel;
    Layout39: TLayout;
    Rectangle18: TRectangle;
    Layout40: TLayout;
    Img_BtnSalvar2: TImage;
    Img_BtnCancelar2: TImage;
    Img_BtnVoltar2: TImage;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    lytLote: TLayout;
    Label15: TLabel;
    Label7: TLabel;
    ed_Lote: TEdit;
    ClearEditButton2: TClearEditButton;
    Layout22: TLayout;
    Rectangle19: TRectangle;
    Label52: TLabel;
    StringColumn3: TStringColumn;
    despesa_cbs: TStringColumn;
    id_compra: TStringColumn;
    Label9: TLabel;
    Rectangle26: TRectangle;
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
    cdsParc: TFDMemTable;
    cdsParcnum_parc: TIntegerField;
    cdsParcdata: TDateTimeField;
    cdsParcvalor: TFloatField;
    cdsParcstatus: TStringField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    rct_fgto: TRectangle;
    Label45: TLabel;
    ckb_ComissaoParc: TCheckBox;
    ckb_FreteParc: TCheckBox;
    ckb_ComissaoDesc: TCheckBox;
    ckb_FreteDesc: TCheckBox;
    procedure ed_ValorTotalAnimalExit(Sender: TObject);
    procedure ed_ValorFretePorAnimalChange(Sender: TObject);
    procedure ed_ValorComisPorAnimalChange(Sender: TObject);
    procedure Img_BtnNovoClick(Sender: TObject);
    procedure Img_BtnSalvarClick(Sender: TObject);
    procedure Img_BtnEditarClick(Sender: TObject);
    procedure ed_ValorTotalComissaoKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure ed_ValorTotalAnimalKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure ed_ValorTotalFreteKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure ed_ValorPorAnimalChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lst_PrincipalItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure Img_BtnCancelarClick(Sender: TObject);
    procedure Img_BtnExcluirClick(Sender: TObject);
    procedure ed_PesquisaLoteChangeTracking(Sender: TObject);
    procedure ed_LoteEnter(Sender: TObject);
    procedure ListViewLoteItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure Image7Click(Sender: TObject);
    procedure ed_PesquisaPessoaChangeTracking(Sender: TObject);
    procedure ed_PessoaEnter(Sender: TObject);
    procedure ListViewPessoaItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure ckbCadNow1Change(Sender: TObject);
    procedure rbFisica1Change(Sender: TObject);
    procedure rbJuridica1Change(Sender: TObject);
    procedure ed_MotoristaEnter(Sender: TObject);
    procedure ed_CorretorEnter(Sender: TObject);
    procedure ckbCadNow2Change(Sender: TObject);
    procedure rbFisica2Change(Sender: TObject);
    procedure rbJuridica2Change(Sender: TObject);
    procedure ckbCadNow3Change(Sender: TObject);
    procedure rbFisica3Change(Sender: TObject);
    procedure rbJuridica3Change(Sender: TObject);
    procedure ed_PesquisaContaChangeTracking(Sender: TObject);
    procedure ed_ContaEnter(Sender: TObject);
    procedure ListViewContaItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure rct_AnexoArqClick(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Img_anexoClick(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure img_delAnexClick(Sender: TObject);
    procedure lst_AnexosItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure img_reciboClick(Sender: TObject);
    procedure btn_ReciboFreteClick(Sender: TObject);
    procedure btn_ReciboComissaoClick(Sender: TObject);
    procedure btn_ReciboVendaClick(Sender: TObject);
    procedure Rectangle19Click(Sender: TObject);
    procedure Img_BtnVoltar2Click(Sender: TObject);
    procedure StringGridAnimaisEditingDone(Sender: TObject; const ACol, ARow: Integer);
    procedure Img_BtnVoltarClick(Sender: TObject);
    procedure Rectangle26Click(Sender: TObject);
    procedure rct_fgtoClick(Sender: TObject);
    procedure Rectangle37Click(Sender: TObject);
    procedure Rectangle38Click(Sender: TObject);
    procedure Rectangle39Click(Sender: TObject);
    procedure cbx_FormaPagtoChangeTracking(Sender: TObject);
    procedure ckb_GerarParcelaChange(Sender: TObject);
    procedure ed_EntradaValorKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure ckb_FreteDescChange(Sender: TObject);
    procedure ckb_ComissaoDescChange(Sender: TObject);
    procedure ckb_FreteParcChange(Sender: TObject);
    procedure ckb_ComissaoParcChange(Sender: TObject);
  private
    { Private declarations }
    sbCompra: TSearchBox;
    sbLote: TSearchBox;
    Cod_Selecao: Integer;
    sbPessoa: TSearchBox;
    sbConta: TSearchBox;
    procedure Validar(cod_vali: Integer);
    procedure ConsultaConta;
    procedure CalcValorPorAnimal;
    procedure CalcValorTotal;
    function RetornaIdPessoa(nome: string): Integer;
    function RetornaIdConta(conta: string): Integer;
    function RetornaIdLote(numero: string): Integer;
    function RetornaIdVenda(numero: string): Integer;
    procedure ConsultaIdadeAnimal;
    procedure ConsultaRacaAnimal;
    procedure ConsultaTipoCaminhao;
    function AlteraSaldo(id: Integer; saldo: double): Integer;
    function AlteraQtdAnimaisLote(id: Integer; saldo: double): Integer;
    function BuscarSaldo(id: Integer): double;
    function BuscarQtdAnimaisLote(id: Integer): double;
    procedure ConsultaVendas;
    procedure PopularCampos(Query: TFDQuery);
    procedure PopulaListFiltros(QBanco: TFDQuery);
    procedure LogVendas;
    function BuscarDespesaLote(id: Integer; campo: string): double;
    procedure ConsultaBancoLotes;
    procedure ConsultaBancoPessoas;
    function ValidarPessoa(nome: string): Integer;
    procedure SalvarPessoa(nome: string; tipo_pessoa: Integer);
    procedure ConsultaFormaPagto;
    procedure InativarLote(numero: string);
    procedure VendaParcial(id_lote: Integer; id_venda: Integer);
    procedure anexos(cod: Integer);
    procedure CarregaRelatorio(const pReport: TfrxReport; tipo: Integer);
    procedure PopularLotesItens(Query: TFDQuery);
    procedure LimpaStringGrid(RowNumber: Integer; StringGrid1: TStringGrid);
    procedure PopularVendasItens(Query: TFDQuery);
    procedure GeraParcelas(Data: TDateTime; num_parc, num_dias: Integer; valor: double);
    procedure GravaParcelas(movimentacao: string; id_movimentacao, conta_bancaria, id_pessoa: Integer);
  public
    { Public declarations }
  end;

var
  FrmCadVenda: TFrmCadVenda;
  ValorTotal, ValorParc: double;
  QtdAnimais, id_venda, Edit, Tipo_Busca: Integer;
  id_anexo: string;

implementation

{$R *.fmx}

uses u_DM, u_Library, Winapi.Windows, Winapi.ShellAPI, FMX.Platform.Win,
  System.DateUtils;

{ TFrmCadVenda }

procedure TFrmCadVenda.CarregaRelatorio(const pReport: TfrxReport; tipo: Integer);
const
  ReciboFrete =
    ' select v.id,v.data_venda as data, valortotal_frete as valor, p.nome, case when p.cpf_pessoa is null then ''NÃO CADASTRADO'' else p.cpf_pessoa end as cpf_pessoa from vendas v '
    + ' left outer join pessoas p on (p.id = v.motorista) ' + ' where v.id = :id; ';
  ReciboComissao =
    ' select v.id,v.data_venda as data, valortotal_comissao as valor, p.nome, case when p.cpf_pessoa is null then ''NÃO CADASTRADO'' else p.cpf_pessoa end as cpf_pessoa from vendas v '
    + ' left outer join pessoas p on (p.id = v.corretor) ' + ' where v.id = :id; ';
  ReciboVenda =
    ' select v.id,v.data_venda as data, (v.valortotal_venda - v.valortotal_frete - v.valortotal_comissao) as valor, p.nome, case when p.cpf_pessoa is null then ''NÃO CADASTRADO'' else p.cpf_pessoa end as cpf_pessoa, v.descricao from vendas v '
    + ' left outer join pessoas p on (p.id = v.cliente) ' + ' where v.id = :id ';

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

procedure TFrmCadVenda.img_reciboClick(Sender: TObject);
begin
  inherited;
  lay_Recibo.Visible := true;
end;

procedure TFrmCadVenda.btn_ReciboFreteClick(Sender: TObject);
begin
  inherited;
  CarregaRelatorio(frxRecibo, 1);
end;

procedure TFrmCadVenda.btn_ReciboComissaoClick(Sender: TObject);
begin
  inherited;
  CarregaRelatorio(frxRecibo, 2);
end;

procedure TFrmCadVenda.btn_ReciboVendaClick(Sender: TObject);
begin
  inherited;
  CarregaRelatorio(frxRecibo, 3);
end;

procedure TFrmCadVenda.ConsultaConta;
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

procedure TFrmCadVenda.ConsultaFormaPagto;
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

procedure TFrmCadVenda.ConsultaIdadeAnimal;
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

function TFrmCadVenda.AlteraQtdAnimaisLote(id: Integer; saldo: double): Integer;
const
  SQL = 'UPDATE agrojun.lotes SET qtd_animais = :qtd_animais, despesa = :despesa, ' + 'despesa_cbs = :despesa_cbs, ' +
    ' venda_parcial = :vp' + ' WHERE id = :id';

  _SQL = 'SELECT * from agrojun.lotes where id = :id';
var
  Query: TFDQuery;
  QtdFinal: Integer;
  VTotalCompra, VCbsCompra, Dsp, DspCbs: double;
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
        Query.SQL.Add(_SQL);
        Query.ParamByName('id').AsInteger := id;
        Query.Open();

        // QUANTIDADE ATUAL DE ANIMAIS DO LOTE
        QtdFinal := Query.FieldByName('qtd_animais').AsInteger - StrToInt(saldo.ToString);
        // // VALOR TOTAL DE COMPRA ATUAL DO LOTE
        // VTotalCompra := Query.FieldByName('valortotal_compra').AsFloat - (saldo * Query.FieldByName('valorcbs_compra').AsFloat);
        // // VALOR TOTAL/CBS DE COMPRA ATUAL DE LOTE
        // VCbsCompra := VTotalCompra / saldo;
        // // VALOR TOTAL DE DESPESA ATUAL DE LOTE
        Dsp := Query.FieldByName('despesa').AsFloat - (saldo * Query.FieldByName('despesa_cbs').AsFloat);
        // VALOR TOTAL/CBS DE DESPESA ATUAL DE LOTE
        DspCbs := Dsp / saldo;

        if QtdFinal = 0 then
          InativarLote(id.ToString)
        else
        begin
          Query.Active := false;
          Query.SQL.Clear;
          Query.SQL.Add(SQL);
          Query.ParamByName('despesa').AsFloat := Dsp;
          Query.ParamByName('despesa_cbs').AsFloat := DspCbs;
          // Query.ParamByName('vt').AsFloat := VTotalCompra;
          // Query.ParamByName('vc').AsFloat := VCbsCompra;
          Query.ParamByName('vp').AsInteger := 1;
          Query.ParamByName('qtd_animais').AsFloat := QtdFinal;
          Query.ParamByName('id').AsInteger := id;
          Query.ExecSQL;
        end;
        Result := 1;
      end;
    except
      Result := 0;
    end;
  finally
    FreeAndNil(Query);
  end;
end;

function TFrmCadVenda.AlteraSaldo(id: Integer; saldo: double): Integer;
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

function TFrmCadVenda.BuscarDespesaLote(id: Integer; campo: string): double;
const
  SQL = 'SELECT despesa, despesa_cbs from agrojun.lotes where id = :id';
var
  Query: TFDQuery;
begin
  try
    Query := TFDQuery.Create(self);
    Query.Connection := dm.FDConnection;
    Query.FetchOptions.RowsetSize := 50000;
    Query.Active := false;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT ' + campo + ' from agrojun.lotes where id = :id');
    Query.ParamByName('id').AsInteger := id;
    Query.Active := true;
    Result := Query.FieldByName(campo).AsFloat;
  finally
    FreeAndNil(Query);
  end;
end;

function TFrmCadVenda.BuscarQtdAnimaisLote(id: Integer): double;
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

function TFrmCadVenda.BuscarSaldo(id: Integer): double;
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

procedure TFrmCadVenda.CalcValorPorAnimal;
begin
  if not ed_QuantidadeTotal.Text.IsEmpty then
  begin

    if not ed_ValorTotal.Text.IsEmpty then
    begin
      ed_ValorPorAnimal.Text := FloatToStr(strtofloat(StringReplace(ed_ValorTotal.Text, '.', '', [rfReplaceAll])) /
        StrToInt(ed_QuantidadeTotal.Text));
    end;

    if not ed_ValorTotalFrete.Text.IsEmpty then
    begin
      ed_ValorFretePorAnimal.Text :=
        FloatToStr(strtofloat(StringReplace(ed_ValorTotalFrete.Text, '.', '', [rfReplaceAll])) /
        StrToInt(ed_QuantidadeTotal.Text));
    end;

    if not ed_ValorTotalComissao.Text.IsEmpty then
    begin
      ed_ValorComisPorAnimal.Text :=
        FloatToStr(strtofloat(StringReplace(ed_ValorTotalComissao.Text, '.', '', [rfReplaceAll])) /
        StrToInt(ed_QuantidadeTotal.Text));
    end;

  end;
end;

procedure TFrmCadVenda.CalcValorTotal;
var
  vt: double;
begin
  if not ed_QuantidadeTotal.Text.IsEmpty and not ed_ValorTotal.Text.IsEmpty and not ed_ValorTotalFrete.Text.IsEmpty and
    not ed_ValorTotalComissao.Text.IsEmpty then
  begin
    vt := (strtofloat(StringReplace(ed_ValorTotal.Text, '.', '', [rfReplaceAll])) +
      strtofloat(StringReplace(ed_ValorTotalFrete.Text, '.', '', [rfReplaceAll])) +
      strtofloat(StringReplace(ed_ValorTotalComissao.Text, '.', '', [rfReplaceAll])));
    ed_ValorTotalVenda.Text := formatfloat('###,##0.00', vt);
    ed_valorporcbs_venda.Text := formatfloat('###,##0.00', vt / StrToInt(ed_QuantidadeTotal.Text));
  end;
end;

procedure TFrmCadVenda.cbx_FormaPagtoChangeTracking(Sender: TObject);
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

procedure TFrmCadVenda.ckbCadNow1Change(Sender: TObject);
begin
  inherited;
  if ckbCadNow1.IsChecked then
  begin
    lytCliente.Height := 70;
    rbFisica1.Visible := true;
    rbJuridica1.Visible := true;
  end
  else
  begin
    lytCliente.Height := 55;
    rbFisica1.Visible := false;
    rbJuridica1.Visible := false;
    rbFisica1.IsChecked := false;
    rbJuridica1.IsChecked := false;
  end;
end;

procedure TFrmCadVenda.ckbCadNow2Change(Sender: TObject);
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

procedure TFrmCadVenda.ckbCadNow3Change(Sender: TObject);
begin
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



procedure TFrmCadVenda.ckb_GerarParcelaChange(Sender: TObject);
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

procedure TFrmCadVenda.ConsultaBancoLotes;
const
  _SQLbanco = 'select * from agrojun.lotes where ativo = 1 ';
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

procedure TFrmCadVenda.ConsultaBancoPessoas;
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

procedure TFrmCadVenda.ConsultaRacaAnimal;
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

procedure TFrmCadVenda.ConsultaTipoCaminhao;
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

procedure TFrmCadVenda.ConsultaVendas;
const
  _SQLbanco =
    ' select v.id, v.data_venda, v.quantidade_cbs, f.nome as cliente, cc.conta, l.nome as lote, v.valortotal_venda, v.valorporcbs_venda from vendas as v '
    + ' left outer join pessoas as f on (f.id = v.cliente)                                                                                     '
    + ' left outer join contas_bancarias as cc on (cc.id = v.conta_bancaria)                                                                      '
    + ' left outer join lotes as l on (l.id = v.lote)                                                                                             '
    + ' where month(data_venda) = :mes and year(data_venda) = :ano order by data_venda desc                                                     ';
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
    QBanco.ParamByName('mes').AsInteger := StrToInt(FormatDateTime('MM', Now));
    QBanco.ParamByName('ano').AsInteger := StrToInt(FormatDateTime('YYYY', Now));
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

        txt := TListItemText(Objects.FindDrawable('lbl_cliente'));
        txt.Text := 'CLIENTE';

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
        txt.Text := QBanco.FieldByName('data_venda').AsString;

        txt := TListItemText(Objects.FindDrawable('lote'));
        txt.Text := QBanco.FieldByName('lote').AsString;

        txt := TListItemText(Objects.FindDrawable('cliente'));
        txt.Text := QBanco.FieldByName('cliente').AsString;

        txt := TListItemText(Objects.FindDrawable('conta'));
        txt.Text := QBanco.FieldByName('conta').AsString;

        txt := TListItemText(Objects.FindDrawable('quantidade'));
        txt.Text := QBanco.FieldByName('quantidade_cbs').AsString;

        txt := TListItemText(Objects.FindDrawable('valorTotal'));
        txt.Text := 'R$' + formatfloat('#,##0.00', QBanco.FieldByName('valortotal_venda').AsFloat);
      end;

      QBanco.Next
    end;
  finally
    lst_Principal.EndUpdate;
    FreeAndNil(QBanco);
  end;
end;

procedure TFrmCadVenda.ed_ContaEnter(Sender: TObject);
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

procedure TFrmCadVenda.ed_CorretorEnter(Sender: TObject);
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

procedure TFrmCadVenda.ed_EntradaValorKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  FormatarMoeda(ed_EntradaValor, KeyChar);
end;

procedure TFrmCadVenda.ed_LoteEnter(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  if ed_Lote.Text.IsEmpty then
  begin
    ConsultaBancoLotes;
    ListViewLote.SearchVisible := true;
    for I := 0 to ListViewLote.Controls.Count - 1 do
      if ListViewLote.Controls[I].ClassType = TSearchBox then
      begin
        sbLote := TSearchBox(ListViewLote.Controls[I]);
        Break;
      end;
    sbLote.Height := 0;
    Tipo_Busca := 0;
    tab_Crud.ActiveTab := TabLote;
  end;
end;

procedure TFrmCadVenda.ed_MotoristaEnter(Sender: TObject);
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

procedure TFrmCadVenda.ed_PesquisaContaChangeTracking(Sender: TObject);
begin
  inherited;
  sbConta.Text := ed_PesquisaConta.Text;
end;

procedure TFrmCadVenda.ed_PesquisaLoteChangeTracking(Sender: TObject);
begin
  inherited;
  sbLote.Text := ed_PesquisaLote.Text;
end;

procedure TFrmCadVenda.ed_PesquisaPessoaChangeTracking(Sender: TObject);
begin
  inherited;
  sbPessoa.Text := ed_PesquisaPessoa.Text;
end;

procedure TFrmCadVenda.ed_PessoaEnter(Sender: TObject);
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

procedure TFrmCadVenda.ed_ValorComisPorAnimalChange(Sender: TObject);
begin
  inherited;
  ed_ValorComisPorAnimal.Text := formatfloat('###,##0.00', StrToFloat_Universal(ed_ValorComisPorAnimal.Text));
end;

procedure TFrmCadVenda.ed_ValorFretePorAnimalChange(Sender: TObject);
begin
  inherited;
  ed_ValorFretePorAnimal.Text := formatfloat('###,##0.00', StrToFloat_Universal(ed_ValorFretePorAnimal.Text));
end;

procedure TFrmCadVenda.ed_ValorPorAnimalChange(Sender: TObject);
begin
  inherited;
  ed_ValorPorAnimal.Text := formatfloat('###,##0.00', StrToFloat_Universal(ed_ValorPorAnimal.Text));
end;

procedure TFrmCadVenda.ed_ValorTotalAnimalExit(Sender: TObject);
begin
  inherited;
  CalcValorPorAnimal;
  CalcValorTotal;
end;

procedure TFrmCadVenda.ed_ValorTotalAnimalKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  inherited;
  FormatarMoeda(ed_ValorTotalAnimal, KeyChar);
end;

procedure TFrmCadVenda.ed_ValorTotalComissaoKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  inherited;
  FormatarMoeda(ed_ValorTotalComissao, KeyChar);
end;

procedure TFrmCadVenda.ed_ValorTotalFreteKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  FormatarMoeda(ed_ValorTotalFrete, KeyChar);
end;

procedure TFrmCadVenda.FormCreate(Sender: TObject);
begin
  inherited;
  ValorParc := 0;
  cbx_FormaPagto.ItemIndex := 0;
  lay_GerarPac.Visible := false;
  lay_parc.Visible := false;
  ConsultaVendas;
  ed_pesq.Enabled := true;
end;

procedure TFrmCadVenda.Image7Click(Sender: TObject);
begin
  inherited;
  ListViewPessoa.Items.Clear;
  // ListViewConta.Items.Clear;
  ListViewLote.Items.Clear;
  ed_PesquisaPessoa.Text := EmptyStr;
  // ed_PesquisaConta.Text := EmptyStr;
  ed_PesquisaLote.Text := EmptyStr;
  tab_Crud.ActiveTab := TabItem2;
end;

procedure TFrmCadVenda.Image8Click(Sender: TObject);
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

procedure TFrmCadVenda.Image9Click(Sender: TObject);
begin
  inherited;
  tab_Crud.ActiveTab := TabItem2;
end;

procedure TFrmCadVenda.Img_anexoClick(Sender: TObject);
const
  SQL = 'INSERT INTO anexos (cod_mov, status, caminho, nome_arq) VALUES (:cod_mov, :status, :caminho, :nome_arq); ';
var
  Query: TFDQuery;
  caminho, NomeArq: String;
  cod: Integer;

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
    Query.ParamByName('status').AsString := 'V';
    Query.ParamByName('caminho').AsString := caminho;
    Query.ParamByName('nome_arq').AsString := NomeArq;
    Query.ExecSQL;

    anexos(Cod_Selecao);

    FreeAndNil(Query);
    exit;
  end;
end;

procedure TFrmCadVenda.Img_BtnCancelarClick(Sender: TObject);
const
  _SQLInicial =
    ' select v.id, v.data_venda, v.quantidade_cbs, v.valortotal_venda, v.valorporcbs_venda,                     ' +
    '  v.idade_animal, v.sexo_animal, v.raca_animal, v.etiqueta, v.tipo_caminhao, v.placa_caminhao,             ' +
    '  v.valortotal_frete, v.valorporcbs_frete, v.valortotal_comissao, v.valorporcbs_comissao,                  ' +
    '  v.valortotal_animais, v.valorporcbs_animais, v.descricao,                                                ' +
    '  f.nome as cliente, cc.conta, l.numero as lote, m.nome as motorista, co.nome as corretor from vendas as v ' +
    ' left outer join pessoas as f on (f.id = v.cliente)                                                        ' +
    ' left outer join contas_bancarias as cc on (cc.id = v.conta_bancaria)                                      ' +
    ' left outer join lotes as l on (l.id = v.lote)                                                             ' +
    ' left outer join pessoas as m on (m.id = v.motorista)                                                      ' +
    ' left outer join pessoas as co on (co.id = v.corretor)                                                     ' +
    ' where v.id = :id                                                                                          ';
var
  Query: TFDQuery;
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
    finally
      FreeAndNil(Query);
    end;
  end
  else
    ed_pesq.Enabled := true;
end;

procedure TFrmCadVenda.Img_BtnEditarClick(Sender: TObject);
begin
  inherited;
  ValorTotal := (strtofloat(StringReplace(ed_ValorTotalAnimal.Text, '.', '', [rfReplaceAll])) +
    strtofloat(StringReplace(ed_ValorTotalFrete.Text, '.', '', [rfReplaceAll])) +
    strtofloat(StringReplace(ed_ValorTotalComissao.Text, '.', '', [rfReplaceAll])));
  QtdAnimais := StrToInt(ed_Quantidade.Text);
  // ConsultaLote(edTms_Lote);
  // ConsultaCliente(edTms_Cliente);
  // ConsultaConta(edTms_ContaBancaria);
  // ConsultaMotorista(edTms_Motorista);
  // ConsultaCorretor(edTms_Corretor);
  ed_ValorPorAnimal.Enabled := false;
  ed_ValorFretePorAnimal.Enabled := false;
  ed_ValorComisPorAnimal.Enabled := false;
  ed_ValorTotalVenda.Enabled := false;
  ed_valorporcbs_venda.Enabled := false;
end;

procedure TFrmCadVenda.Img_BtnExcluirClick(Sender: TObject);
const
  SQLUpdateLote = 'UPDATE agrojun.lotes SET ativo = 1, qtd_animais = :qtd_animais, despesa = :despesa, ' +
    'despesa_cbs = :despesa_cbs ' + ' WHERE id = :id';
  SQL           = 'DELETE FROM agrojun.vendas WHERE id = :id';
  _SQL          = 'SELECT * from agrojun.lotes where id = :id';
  SQLVenda      = 'SELECT * FROM agrojun.vendas where id = :id';
  fretecomissao =
    'select status_comissao, status_frete, valortotal_frete, valortotal_comissao from vendas where id = :id';
  SQLanexos               = 'delete from anexos where cod_mov = :cod_mov and status = ''V''';
  SQLVendaParcial         = 'DELETE FROM agrojun.vendas_parcial where id_venda = :id';
  SQLVerificaVendaParcial = 'SELECT * FROM agrojun.vendas_parcial where id_lote = :id';
  SQLUpdateVendaParcial   = 'UPDATE agrojun.lotes SET venda_parcial = 0 where id = :id';
  SQLItensVenda           = 'DELETE FROM agrojun.vendas_itens where id_venda = :id';
  SQLItensLote            =
    'INSERT INTO agrojun.lotes_itens (quantidade, valorporcbs_animais, valortotal_animais, idade_animal, raca_animal, sexo_animal, id_lote, ativo, id_compra, despesa_cbs)'
    + ' VALUES (:quantidade, :valorporcbs_animais, :valortotal_animais, :idade_animal, :raca_animal, :sexo_animal, :id_lote, :ativo, :id_compra, :despesa_cbs)';

  sqlDeletparcela = ' select sum(IFNULL(p.valor, 0) ) + IFNULL(c.entrada, 0) as valor, c.parcela from vendas C ' +
    ' left outer join parcelas p on (p.status = 1 and p.id_movimentacao = c.id and p.movimentacao = ''V'')  where c.id = :id ';
var
  Query, parcela, fretecomis: TFDQuery;
  QtdFinal, I: Integer;
  VTotalCompra, VCbsCompra, Dsp, DspCbs, valoranimais: double;
begin
  inherited;
  // APAGAR REGISTROS
  try
    Query := TFDQuery.Create(self);
    Query.Connection := dm.FDConnection;
    Query.FetchOptions.RowsetSize := 50000;

    fretecomis := TFDQuery.Create(self);
    fretecomis.Connection := dm.FDConnection;
    fretecomis.FetchOptions.RowsetSize := 50000;

    Query.Active := false;
    Query.SQL.Clear;
    Query.SQL.Add(SQLItensLote);

    for I := 0 to StringGridAnimais.RowCount - 1 do
    begin
      // QUANTIDADE
      Query.ParamByName('quantidade').AsInteger := StrToInt(StringGridAnimais.Cells[8, I]);

      // IDADE
      Query.ParamByName('idade_animal').AsInteger := StrToInt(copy(StringGridAnimais.Cells[2, I], 0, 3));

      // RAÇA
      Query.ParamByName('raca_animal').AsInteger := StrToInt(copy(StringGridAnimais.Cells[3, I], 0, 3));

      // SEXO
      Query.ParamByName('sexo_animal').AsInteger := StrToInt(copy(StringGridAnimais.Cells[4, I], 0, 3));
      // DESPESA_CBS
      Query.ParamByName('despesa_cbs').AsFloat := StrToFloat_Universal(StringGridAnimais.Cells[5, I]);
      // VALOR POR CBS
      Query.ParamByName('valorporcbs_animais').AsFloat := StrToFloat_Universal(StringGridAnimais.Cells[6, I]);
      // VALOR TOTAL
      Query.ParamByName('valortotal_animais').AsFloat := StrToInt(StringGridAnimais.Cells[8, I]) *
        StrToFloat_Universal(StringGridAnimais.Cells[6, I]);
      // id lote
      Query.ParamByName('id_lote').AsInteger := StrToInt(copy(ed_Lote.Text, 0, 5));
      // ativo
      Query.ParamByName('ativo').AsInteger := 1;
      // id compra
      Query.ParamByName('id_compra').AsInteger := StrToInt(copy(StringGridAnimais.Cells[11, I], 0, 3));

      Query.ExecSQL;
    end;
    fretecomis.Active := false;
    fretecomis.SQL.Clear;
    fretecomis.SQL.Add(fretecomissao);
    fretecomis.ParamByName('id').AsInteger := Cod_Selecao;
    fretecomis.Open;

    Query.Active := false;
    Query.SQL.Clear;
    Query.SQL.Add(SQLItensVenda);
    Query.ParamByName('id').AsInteger := Cod_Selecao;
    Query.ExecSQL;

    Query.Active := false;
    Query.SQL.Clear;
    Query.SQL.Add(SQLVenda);
    Query.ParamByName('id').AsInteger := Cod_Selecao;
    Query.Open;
    VTotalCompra := Query.FieldByName('valortotal_compra').AsFloat;
    Dsp := Query.FieldByName('despesa').AsFloat;

    parcela := TFDQuery.Create(self);
    parcela.Connection := dm.FDConnection;
    parcela.FetchOptions.RowsetSize := 50000;
    parcela.Active := false;
    parcela.SQL.Clear;
    parcela.SQL.Add(sqlDeletparcela);
    parcela.ParamByName('id').AsInteger := Cod_Selecao;
    parcela.Open;

    if (fretecomis.FieldByName('status_frete').AsInteger = 1) then
      AlteraSaldo(StrToInt(copy(ed_Conta.Text, 0, 5)), BuscarSaldo(StrToInt(copy(ed_Conta.Text, 0, 5))) +
        (fretecomis.FieldByName('valortotal_frete').AsFloat));

    if (fretecomis.FieldByName('status_comissao').AsInteger = 1) then
      AlteraSaldo(StrToInt(copy(ed_Conta.Text, 0, 5)), BuscarSaldo(StrToInt(copy(ed_Conta.Text, 0, 5))) +
        (fretecomis.FieldByName('valortotal_comissao').AsFloat));


      valoranimais := strtofloat(StringReplace(ed_ValorTotal.Text, '.', '', [rfReplaceAll]));
    if parcela.FieldByName('parcela').AsInteger = 0 then
      AlteraSaldo(StrToInt(copy(ed_Conta.Text, 0, 5)), BuscarSaldo(StrToInt(copy(ed_Conta.Text, 0, 5))) -
        (valoranimais))
    else
      AlteraSaldo(StrToInt(copy(ed_Conta.Text, 0, 5)), BuscarSaldo(StrToInt(copy(ed_Conta.Text, 0, 5))) -
        (parcela.FieldByName('valor').AsFloat));

    parcela.Active := false;
    parcela.SQL.Clear;
    parcela.SQL.Add('delete from parcelas where movimentacao = ''V'' and id_movimentacao = :id ');
    parcela.ParamByName('id').AsInteger := Cod_Selecao;
    parcela.ExecSQL;


    // AlteraQtdAnimaisLote(RetornaIdLote(ed_Lote.Text), BuscarQtdAnimaisLote(RetornaIdLote(ed_Lote.Text)) + strtoint(ed_Quantidade.Text));

    Query.Active := false;
    Query.SQL.Clear;
    Query.SQL.Add(_SQL);
    Query.ParamByName('id').AsInteger := StrToInt(copy(ed_Lote.Text, 0, 5));
    Query.Open();

    // QUANTIDADE ATUAL DE ANIMAIS DO LOTE
    QtdFinal := Query.FieldByName('qtd_animais').AsInteger + StrToInt(ed_QuantidadeTotal.Text);
    // // VALOR TOTAL DE COMPRA ATUAL DO LOTE
    // VTotalCompra := VTotalCompra + Query.FieldByName('valortotal_compra').AsFloat;
    // // VALOR TOTAL/CBS DE COMPRA ATUAL DE LOTE
    // VCbsCompra := VTotalCompra / QtdFinal;
    // VALOR TOTAL DE DESPESA ATUAL DE LOTE
    Dsp := Dsp + Query.FieldByName('despesa').AsFloat;
    // VALOR TOTAL/CBS DE DESPESA ATUAL DE LOTE
    DspCbs := Dsp / QtdFinal;

    Query.Active := false;
    Query.SQL.Clear;
    Query.SQL.Add(SQLUpdateLote);
    Query.ParamByName('despesa').AsFloat := Dsp;
    Query.ParamByName('despesa_cbs').AsFloat := DspCbs;
    // Query.ParamByName('vt').AsFloat := VTotalCompra;
    // Query.ParamByName('vc').AsFloat := VCbsCompra;
    Query.ParamByName('qtd_animais').AsFloat := QtdFinal;
    Query.ParamByName('id').AsInteger := StrToInt(copy(ed_Lote.Text, 0, 5));
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

    Query.Active := false;
    Query.SQL.Clear;
    Query.SQL.Add(SQLVendaParcial);
    Query.ParamByName('id').AsInteger := Cod_Selecao;
    Query.ExecSQL;

    Query.Active := false;
    Query.SQL.Clear;
    Query.SQL.Add(SQLVerificaVendaParcial);
    Query.ParamByName('id').AsInteger := StrToInt(copy(ed_Lote.Text, 0, 5));
    Query.Open;

    if Query.IsEmpty then
    begin
      Query.Active := false;
      Query.SQL.Clear;
      Query.SQL.Add(SQLUpdateVendaParcial);
      Query.ParamByName('id').AsInteger := StrToInt(copy(ed_Lote.Text, 0, 5));
      Query.ExecSQL;
    end;

  finally
    FreeAndNil(Query);
    LimpaCampos;
    ShowMessage('Registro excluído com sucesso!');
    ConsultaVendas;
    LogVendas;
    tab_Crud.ActiveTab := TabItem1;
  end;
end;

procedure TFrmCadVenda.Img_BtnNovoClick(Sender: TObject);
var
  lin: Integer;
begin
  inherited;
  ValorParc := 0;
  cbx_FormaPagto.ItemIndex := 0;
  // ConsultaLote(edTms_Lote);
  // ConsultaCliente(edTms_Cliente);
  // ConsultaConta(edTms_ContaBancaria);
  // ConsultaMotorista(edTms_Motorista);
  // ConsultaCorretor(edTms_Corretor);
  Img_BtnSalvar.Visible := false;
  img_recibo.Visible := false;
  rct_AnexoArq.Visible := false;
  ConsultaIdadeAnimal;
  ConsultaRacaAnimal;
  ConsultaTipoCaminhao;
  ConsultaFormaPagto;
  cbx_TipoCaminhao.ItemIndex := 0;
  ed_ValorPorAnimal.Enabled := false;
  ed_ValorFretePorAnimal.Enabled := false;
  ed_ValorComisPorAnimal.Enabled := false;
  ed_ValorTotalVenda.Enabled := false;
  ed_valorporcbs_venda.Enabled := false;
  Edit := 1;
  Cod_Selecao := MaxCod('compras');
  anexos(Cod_Selecao);
  for lin := 0 to StringGridAnimais.RowCount - 1 do
    LimpaStringGrid(lin, StringGridAnimais);
  StringGridAnimais.Enabled := true;
end;

procedure TFrmCadVenda.Img_BtnSalvarClick(Sender: TObject);
const
  SQLInsert =
    'INSERT INTO `agrojun`.`vendas` (`data_venda`, `lote`, `cliente`, `conta_bancaria`, `quantidade_cbs`,        ' +
    '               `valortotal_venda`, `valorporcbs_venda`, `etiqueta`, `tipo_caminhao`, `placa_caminhao`, `motorista`,                             '
    + '                `valortotal_frete`, `valorporcbs_frete`, `corretor`, `valortotal_comissao`,                            '
    + '                `valorporcbs_comissao`, `descricao`, `despesa`, `despesa_cbs`, `forma_pagto`, ' +
    ' `valortotal_compra`, `valorcbs_compra`, entrada, parcela, status_frete, status_comissao)                                                                   '
    + 'VALUES (:data_venda, :lote, :cliente, :conta_bancaria, :quantidade_cbs, :valortotal_venda,                        '
    + '    :valorporcbs_venda, :etiqueta, :tipo_caminhao,                         ' +
    '        :placa_caminhao, :motorista, :valortotal_frete, :valorporcbs_frete, :corretor, :valortotal_comissao,           '
    + '        :valorporcbs_comissao, :descricao, :despesa, :despesa_cbs, :forma_pagto, ' +
    '        :valortotal_compra, :valorcbs_compra, :entrada, :parcela, :status_frete, :status_comissao)                                                                    ';
  SQLUpdate =
    ' UPDATE `agrojun`.`vendas`                                                                                                     '
    + ' SET `data_venda` = :data_venda, `lote` = :lote, `cliente` = :cliente, `conta_bancaria` = :conta_bancaria,              '
    + ' `quantidade_cbs` = :quantidade_cbs, `valortotal_venda` = :valortotal_venda, `valorporcbs_venda` = :valorporcbs_venda,      '
    + ' `idade_animal` = :idade_animal, `sexo_animal` = :sexo_animal, `raca_animal` = :raca_animal, `etiqueta` = :etiqueta,            '
    + ' `tipo_caminhao` = :tipo_caminhao, `placa_caminhao` = :placa_caminhao, `motorista` = :motorista,                                '
    + ' `valortotal_frete` = :valortotal_frete, `valorporcbs_frete` = :valorporcbs_frete, `corretor` = :corretor,                      '
    + ' `valortotal_comissao` = :valortotal_comissao, `valorporcbs_comissao` = :valorporcbs_comissao, `descricao` = :descricao,          '
    + ' `valortotal_animais` = :valortotal_animais, `valorporcbs_animais` = :valorporcbs_animais , `forma_pagto` = :forma_pagto '
    + ' WHERE `id` = :id                                                                                                              ';
  SQLLote  = 'Select * from agrojun.lotes where id = :id';
  SQLItens =
    'INSERT INTO `agrojun`.`vendas_itens`                                                                           ' +
    ' (`valorporcbs_animais`, `valortotal_animais`, `idade_animal`, `raca_animal`, `sexo_animal`, `quantidade`,      ' +
    '  `id_lote`, `despesa_cbs`, `id_compra`, `qtd_vendida`, `valorporcbs_vendido`, `valortotal_vendido`, `id_venda`)' +
    ' VALUES                                                                                                        ' +
    ' (:valorporcbs_animais, :valortotal_animais, :idade_animal, :raca_animal, :sexo_animal, :quantidade,            ' +
    ' :id_lote, :despesa_cbs, :id_compra, :qtd_vendida, :valorporcbs_vendido, :valortotal_vendido, :id_venda)   ';
  SQLUpdateItens = '';
  SQLItensLote   =
    'UPDATE agrojun.lotes_itens SET valorporcbs_animais = :vc, valortotal_animais = :vt, quantidade = :qtd, ativo = :ativo WHERE id = :id ';

var
  Query, qry, qryAux: TFDQuery;
  ValorTotalAtual, valoranimais: double;
  QtdAnimaisAtual, is_vendaparcial, qtd, I, QtdTransf, id_pessoa: Integer;
  VTotalCompra, VCbsCompra, Dsp, DspCbs, VTotalVenda: double;
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
      QtdTransf := 0;
      for I := 0 to StringGridAnimais.RowCount - 1 do
      begin
        // qtd
        if StringGridAnimais.Cells[8, I].Equals('') then
        begin
          QtdTransf := QtdTransf + 0;
          StringGridAnimais.Cells[8, I] := '0';
          StringGridAnimais.Cells[9, I] := '0';
          StringGridAnimais.Cells[10, I] := '0';
        end
        else
        begin
          if StrToInt(StringGridAnimais.Cells[8, I]) > StrToInt(StringGridAnimais.Cells[1, I]) then
          begin
            ShowMessage('Existem itens com a QUANTIDADE A VENDER maior do que a QUANTIDADE ATUAL');
            abort
          end
          else
            QtdTransf := QtdTransf + StrToInt(StringGridAnimais.Cells[8, I]);
        end;

      end;

      Query.ParamByName('data_venda').AsDateTime := DateEditVenda.Date;
      if (not ed_Lote.Text.IsEmpty) and (RetornaIdLote(copy(ed_Lote.Text, 0, 5)) = 0) then
      begin
        Validar(1);
        exit;
      end;
      Query.ParamByName('lote').AsInteger := RetornaIdLote(copy(ed_Lote.Text, 0, 5));

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

            Query.ParamByName('cliente').AsInteger := RetornaIdPessoa(ed_Pessoa.Text);
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

          Query.ParamByName('cliente').AsInteger := RetornaIdPessoa(ed_Pessoa.Text);
          id_pessoa := RetornaIdPessoa(ed_Pessoa.Text);
        end;
      end
      else
      begin
        Query.ParamByName('cliente').AsInteger := StrToInt(copy(ed_Pessoa.Text, 0, 5));
        id_pessoa := StrToInt(copy(ed_Pessoa.Text, 0, 5));
      end;
      if (not ed_Conta.Text.IsEmpty) and (StrToInt(copy(ed_Conta.Text, 0, 5)) = 0) then
      begin
        Validar(3);
        exit;
      end;
      Query.ParamByName('conta_bancaria').AsInteger := StrToInt(copy(ed_Conta.Text, 0, 5));

      Query.ParamByName('quantidade_cbs').AsInteger := StrToInt(ed_QuantidadeTotal.Text);

      qry := TFDQuery.Create(self);
      qry.Connection := dm.FDConnection;
      qry.FetchOptions.RowsetSize := 50000;
      qry.Close;
      qry.SQL.Clear;
      qry.SQL.Add(SQLLote);
      qry.ParamByName('id').AsInteger := Query.ParamByName('lote').AsInteger;
      qry.Open();
      // VARIAVEL PRA FAZER O CALCULO DE DESPESA CORRETAMENTE
      qtd := qry.FieldByName('qtd_animais').AsInteger;

      if not qry.IsEmpty then
      begin
        if qry.FieldByName('qtd_animais').AsInteger = Query.ParamByName('quantidade_cbs').AsInteger then
        begin
          is_vendaparcial := 0;
          VTotalCompra := qry.FieldByName('valortotal_compra').AsFloat;
          VCbsCompra := qry.FieldByName('valorcbs_compra').AsFloat;
        end
        else
        begin
          is_vendaparcial := 1;
          VTotalCompra := (Query.ParamByName('quantidade_cbs').AsInteger * qry.FieldByName('valorcbs_compra').AsFloat);
          VCbsCompra := VTotalCompra / Query.ParamByName('quantidade_cbs').AsInteger;
        end;
      end;

      // Query.ParamByName('valortotal_animais').AsFloat := strtofloat(StringReplace(ed_ValorTotal.Text, '.', '', [rfReplaceAll]));
      // Query.ParamByName('valorporcbs_animais').AsFloat := strtofloat(StringReplace(ed_ValorPorAnimal.Text, '.', '', [rfReplaceAll]));

      // Query.ParamByName('idade_animal').AsInteger := StrToInt(copy(cbx_IdadeAnimal.Items[cbx_IdadeAnimal.ItemIndex], 0, 3));
      // Query.ParamByName('sexo_animal').AsInteger := StrToInt(copy(cbx_SexoAnimal.Items[cbx_SexoAnimal.ItemIndex], 0, 3));
      // Query.ParamByName('raca_animal').AsInteger := StrToInt(copy(cbx_TipoAnimal.Items[cbx_TipoAnimal.ItemIndex], 0, 3));
      if ed_Etiqueta.Text.IsEmpty then
        Query.ParamByName('etiqueta').AsInteger := 0
      else
        Query.ParamByName('etiqueta').AsInteger := StrToInt(ed_Etiqueta.Text);

      if cbx_TipoCaminhao.ItemIndex <= 0 then
        Query.ParamByName('tipo_caminhao').AsInteger := 0
      else
        Query.ParamByName('tipo_caminhao').AsInteger :=
          StrToInt(copy(cbx_TipoCaminhao.Items[cbx_TipoCaminhao.ItemIndex], 0, 3));
      Query.ParamByName('placa_caminhao').AsString := ed_PlacaCaminhao.Text;

      if cbx_FormaPagto.ItemIndex <= 0 then
        Query.ParamByName('forma_pagto').AsInteger := 0
      else
        Query.ParamByName('forma_pagto').AsInteger :=
          StrToInt(copy(cbx_FormaPagto.Items[cbx_FormaPagto.ItemIndex], 0, 3));

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

      Query.ParamByName('valortotal_frete').AsFloat :=
        strtofloat(StringReplace(ed_ValorTotalFrete.Text, '.', '', [rfReplaceAll]));
      Query.ParamByName('valorporcbs_frete').AsFloat :=
        strtofloat(StringReplace(ed_ValorFretePorAnimal.Text, '.', '', [rfReplaceAll]));

      if (ed_Corretor.Text.IsEmpty) and not ckbCadNow3.IsChecked then
      begin
        Query.ParamByName('corretor').AsInteger := 0;
      end;
      if ckbCadNow3.IsChecked and not ed_Corretor.Text.IsEmpty then
      begin
        if ValidarPessoa(ed_Corretor.Text) = 1 then
        begin
          if mensagemConfirmacao('Já existe uma pessoa cadastrada com esse nome. Deseja continuar com o cadastro?') = mrYes
          then
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

      Query.ParamByName('valortotal_comissao').AsFloat :=
        strtofloat(StringReplace(ed_ValorTotalComissao.Text, '.', '', [rfReplaceAll]));
      Query.ParamByName('valorporcbs_comissao').AsFloat :=
        strtofloat(StringReplace(ed_ValorComisPorAnimal.Text, '.', '', [rfReplaceAll]));

      Query.ParamByName('descricao').AsString := ed_Obs.Text;
      Query.ParamByName('valortotal_venda').AsFloat :=
        strtofloat(StringReplace(ed_ValorTotal.Text, '.', '', [rfReplaceAll]));
      Query.ParamByName('valorporcbs_venda').AsFloat := Query.ParamByName('valortotal_venda').AsFloat /
        Query.ParamByName('quantidade_cbs').AsInteger;

      if ((ed_EntradaValor.Text <> '0') and (ckb_GerarParcela.IsChecked)) then
        Query.ParamByName('entrada').AsFloat := strtofloat(StringReplace(ed_EntradaValor.Text, '.', '', [rfReplaceAll]))
      else
        Query.ParamByName('entrada').AsFloat := 0;

      if ckb_GerarParcela.IsChecked then
        Query.ParamByName('parcela').AsInteger := 1
      else
        Query.ParamByName('parcela').AsInteger := 0;

      if Acao = 0 then
      begin
        Dsp := BuscarDespesaLote(RetornaIdLote(copy(ed_Lote.Text, 0, 5)), 'despesa');
        DspCbs := BuscarDespesaLote(RetornaIdLote(copy(ed_Lote.Text, 0, 5)), 'despesa_cbs');
        if qtd = Query.ParamByName('quantidade_cbs').AsInteger then
        begin
          Query.ParamByName('despesa').AsFloat := BuscarDespesaLote(RetornaIdLote(copy(ed_Lote.Text, 0, 5)), 'despesa');
          Query.ParamByName('despesa_cbs').AsFloat := BuscarDespesaLote(RetornaIdLote(copy(ed_Lote.Text, 0, 5)),
            'despesa_cbs');
        end
        else
        begin
          Query.ParamByName('despesa').AsFloat := (Query.ParamByName('quantidade_cbs').AsInteger * DspCbs);
          Query.ParamByName('despesa_cbs').AsFloat := Query.ParamByName('despesa').AsFloat /
            Query.ParamByName('quantidade_cbs').AsInteger;
        end;
        Query.ParamByName('valortotal_compra').AsFloat := VTotalCompra;
        Query.ParamByName('valorcbs_compra').AsFloat := VCbsCompra;
        AlteraQtdAnimaisLote(RetornaIdLote(ed_Lote.Text), StrToInt(ed_QuantidadeTotal.Text));
      end;

      if  ckb_FreteParc.IsChecked then
        Query.ParamByName('status_frete').AsInteger := 2
      else if ckb_FreteDesc.IsChecked then
        Query.ParamByName('status_frete').AsInteger := 1
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


       valoranimais := strtofloat(StringReplace(ed_ValorTotal.Text, '.', '', [rfReplaceAll]));

        if not(ckb_GerarParcela.IsChecked) then
        begin
          AlteraSaldo(StrToInt(copy(ed_Conta.Text, 0, 5)), BuscarSaldo(StrToInt(copy(ed_Conta.Text, 0, 5))) +
            (valoranimais));
        end
        else
        begin
          GravaParcelas('V', MaxCod('vendas') - 1, StrToInt(copy(ed_Conta.Text, 0, 5)), id_pessoa);
          AlteraSaldo(StrToInt(copy(ed_Conta.Text, 0, 5)), BuscarSaldo(StrToInt(copy(ed_Conta.Text, 0, 5))) +
            (strtofloat(StringReplace(ed_EntradaValor.Text, '.', '', [rfReplaceAll]))));
        end;

        // AlteraSaldo(StrToInt(copy(ed_Conta.Text, 0, 5)), BuscarSaldo(StrToInt(copy(ed_Conta.Text, 0, 5))) +
        // (strtofloat(StringReplace(ed_ValorTotal.Text, '.', '', [rfReplaceAll]))));
      end
      else
      begin
        ValorTotalAtual := (strtofloat(StringReplace(ed_ValorTotalAnimal.Text, '.', '', [rfReplaceAll])) +
          strtofloat(StringReplace(ed_ValorTotalFrete.Text, '.', '', [rfReplaceAll])) +
          strtofloat(StringReplace(ed_ValorTotalComissao.Text, '.', '', [rfReplaceAll])));
        if ValorTotalAtual > ValorTotal then
        begin
          AlteraSaldo(RetornaIdConta(ed_Conta.Text), BuscarSaldo(RetornaIdConta(ed_Conta.Text)) +
            (ValorTotalAtual - ValorTotal));
        end
        else
        begin
          AlteraSaldo(RetornaIdConta(ed_Conta.Text), BuscarSaldo(RetornaIdConta(ed_Conta.Text)) -
            (ValorTotal - ValorTotalAtual));
        end;

        QtdAnimaisAtual := StrToInt(ed_Quantidade.Text);
        if QtdAnimaisAtual > QtdAnimais then
          AlteraQtdAnimaisLote(RetornaIdLote(ed_Lote.Text), BuscarQtdAnimaisLote(RetornaIdLote(ed_Lote.Text)) -
            (QtdAnimaisAtual - QtdAnimais))
        else
          AlteraQtdAnimaisLote(RetornaIdLote(ed_Lote.Text), BuscarQtdAnimaisLote(RetornaIdLote(ed_Lote.Text)) +
            (QtdAnimais - QtdAnimaisAtual));

      end;

      Query.Close;
      Query.SQL.Clear;
      LogVendas;
      if is_vendaparcial = 1 then
        VendaParcial(StrToInt(copy(ed_Lote.Text, 0, 5)), RetornaIdVenda('0'));

      if Acao = 0 then
      begin
        Query.SQL.Add(SQLItens);
        Query.ParamByName('id_venda').AsInteger := MaxCod('vendas') - 1;
        qryAux := TFDQuery.Create(self);
        qryAux.Connection := dm.FDConnection;
        qryAux.FetchOptions.RowsetSize := 50000;
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(SQLItensLote);
        // qryAux.ParamByName('id').AsInteger := RetornaIdLote(copy(ed_Lote.Text,0 ,5));
      end
      else
      begin
        Query.SQL.Add(SQLUpdateItens);
        Query.ParamByName('id_venda').AsInteger := Cod_Selecao;
      end;

      for I := 0 to StringGridAnimais.RowCount - 1 do
      begin
        if StrToInt(StringGridAnimais.Cells[8, I]) <> 0 then
        begin
          // QUANTIDADE
          Query.ParamByName('quantidade').AsInteger := StrToInt(StringGridAnimais.Cells[1, I]);
          qryAux.ParamByName('qtd').AsInteger := StrToInt(StringGridAnimais.Cells[1, I]) -
            StrToInt(StringGridAnimais.Cells[8, I]);
          // IDADE
          Query.ParamByName('idade_animal').AsInteger := StrToInt(copy(StringGridAnimais.Cells[2, I], 0, 3));

          // RAÇA
          Query.ParamByName('raca_animal').AsInteger := StrToInt(copy(StringGridAnimais.Cells[3, I], 0, 3));

          // SEXO
          Query.ParamByName('sexo_animal').AsInteger := StrToInt(copy(StringGridAnimais.Cells[4, I], 0, 3));

          // DESPESA
          Query.ParamByName('despesa_cbs').AsFloat := StrToFloat_Universal(StringGridAnimais.Cells[5, I]);

          // VALOR POR CBS
          Query.ParamByName('valorporcbs_animais').AsFloat := StrToFloat_Universal(StringGridAnimais.Cells[6, I]);
          if qryAux.ParamByName('qtd').AsInteger = 0 then
          begin
            // valor por cbs sendo zerado  no lote
            qryAux.ParamByName('vc').AsFloat := 0;
            // valor total sendo zerado no lote
            qryAux.ParamByName('vt').AsFloat := 0;
          end
          else
          begin
            // valor por cbs sendo atualizado no lote
            qryAux.ParamByName('vc').AsFloat := StrToFloat_Universal(StringGridAnimais.Cells[6, I]);
            // valor total sendo atualizado no lote
            qryAux.ParamByName('vt').AsFloat := StrToInt(StringGridAnimais.Cells[8, I]) *
              StrToFloat_Universal(StringGridAnimais.Cells[6, I]);
          end;

          // VALOR TOTAL
          Query.ParamByName('valortotal_animais').AsFloat := StrToFloat_Universal(StringGridAnimais.Cells[7, I]);

          // QUANTIDADE VENDIDA
          Query.ParamByName('qtd_vendida').AsInteger := StrToInt(StringGridAnimais.Cells[8, I]);

          // VALOR POR CBS VENDIDO
          Query.ParamByName('valorporcbs_vendido').AsFloat := StrToFloat_Universal(StringGridAnimais.Cells[9, I]);

          // VALOR TOTAL VENDIDO
          Query.ParamByName('valortotal_vendido').AsFloat := StrToFloat_Universal(StringGridAnimais.Cells[10, I]);

          // ativo
          if qryAux.ParamByName('qtd').AsInteger <> 0 then
            qryAux.ParamByName('ativo').AsInteger := 1
          else
            qryAux.ParamByName('ativo').AsInteger := 0;

          // id compra
          Query.ParamByName('id_compra').AsInteger := StrToInt(StringGridAnimais.Cells[11, I]);
          // id lote
          Query.ParamByName('id_lote').AsInteger := StrToInt(copy(ed_Lote.Text, 0, 5));

          // id lote item
          qryAux.ParamByName('id').AsInteger := StrToInt(StringGridAnimais.Cells[0, I]);

          Query.ExecSQL;
          qryAux.ExecSQL;
        end;
      end;

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
      ConsultaVendas;
    except
      abort;
    end;

  finally
    FreeAndNil(Query);
  end;
end;

procedure TFrmCadVenda.Img_BtnVoltar2Click(Sender: TObject);
begin
  inherited;
  tab_Crud.ActiveTab := TabItem2;
  // ed_QuantidadeTotal.Text := EmptyStr;
  // ed_ValorTotal.Text := EmptyStr;
end;

procedure TFrmCadVenda.Img_BtnVoltarClick(Sender: TObject);
begin
  inherited;
  LimpaCampos;
end;

procedure TFrmCadVenda.img_delAnexClick(Sender: TObject);
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

procedure TFrmCadVenda.InativarLote(numero: string);
const
  SQL = 'UPDATE agrojun.lotes SET qtd_animais = 0, ativo = :ativo where id = :numero';
var
  Query: TFDQuery;
begin
  inherited;
  try
    // INATIVAR REGISTROS
    Query := TFDQuery.Create(self);
    Query.Connection := dm.FDConnection;
    Query.FetchOptions.RowsetSize := 50000;
    Query.Active := false;
    Query.SQL.Clear;
    Query.SQL.Add(SQL);
    Query.ParamByName('ativo').AsInteger := 0;
    Query.ParamByName('numero').AsInteger := StrToInt(numero);
    Query.ExecSQL;
  finally
    FreeAndNil(Query);
  end;
end;

procedure TFrmCadVenda.LimpaStringGrid(RowNumber: Integer; StringGrid1: TStringGrid);
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

procedure TFrmCadVenda.ListViewContaItemClick(const Sender: TObject; const AItem: TListViewItem);
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

procedure TFrmCadVenda.ListViewLoteItemClick(const Sender: TObject; const AItem: TListViewItem);
const
  _SQLView = 'SELECT l.*, c.idade_animal, c.raca_animal, c.sexo_animal FROM agrojun.lotes as l  ' +
    'left outer join compras_itens as c on (c.id_compra = l.id_compra)                  ' +
    'where l.id = :id ;                                                                   ';
  SQLItens = 'select li.*, i.idade_animal as idade, r.raca as raca from lotes_itens as li    ' +
    'left outer join idade_animal as i on (i.id = li.idade_animal)                    ' +
    'left outer join raca_animal as r on(r.id = li.raca_animal)                       ' +
    'where li.id_lote = :id and ativo = 1                                             ' +
    'order by li.id asc;                                                              ';
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
            ed_Lote.Text := formatfloat('00000', Query.FieldByName('id').AsFloat) + ' - ' +
              Query.FieldByName('nome').AsString;
            // cbx_IdadeAnimal.ItemIndex := Query.FieldByName('idade_animal').AsInteger;
            // cbx_SexoAnimal.ItemIndex := Query.FieldByName('sexo_animal').AsInteger;
            // cbx_TipoAnimal.ItemIndex := Query.FieldByName('raca_animal').AsInteger;
            Query.Active := false;
            Query.SQL.Clear;
            Query.SQL.Add(SQLItens);
            Query.ParamByName('id').AsInteger := Cod_Selecao;
            Query.Open();

            PopularLotesItens(Query);
            ed_ValorTotal.Text := EmptyStr;
            ed_QuantidadeTotal.Text := EmptyStr;
            tab_Crud.ActiveTab := TabItem4;
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

procedure TFrmCadVenda.ListViewPessoaItemClick(const Sender: TObject; const AItem: TListViewItem);
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

procedure TFrmCadVenda.LogVendas;
begin
  // if Acao = 0 then
  // begin
  // log(0008, MaxCod('vendas'), '', ' data_venda: ' + DateToStr(DateEditVenda.Date) + ' lote: ' + edTms_Lote.Text + ' cliente: ' + edTms_Cliente.Text +
  // ' conta_bancaria: ' + edTms_ContaBancaria.Text + ' quantidade_cbs: ' + ed_Quantidade.Text + ' valor total dos animais: ' + ed_ValorTotalAnimal.Text + ' valor por cbs: ' + ed_ValorPorAnimal.Text
  // + ' idade: ' + cbx_IdadeAnimal.Items[cbx_IdadeAnimal.ItemIndex] + ' sexo: ' + cbx_SexoAnimal.Items[cbx_IdadeAnimal.ItemIndex] + ' raça: ' + cbx_TipoAnimal.Items[cbx_TipoAnimal.ItemIndex]
  // + ' etiqueta: ' + ed_Etiqueta.Text + ' caminhão: ' + cbx_TipoCaminhao.Items[cbx_TipoCaminhao.ItemIndex] + ' placa: ' + ed_PlacaCaminhao.Text + ' motorista ' + edTms_Motorista.Text
  // + ' valor total frete: ' + ed_ValorTotalFrete.Text + ' valor frete por cbs: ' + ed_ValorFretePorAnimal.Text + ' corretor: ' + edTms_Corretor.Text + ' valor total comissao: ' + ed_ValorTotalComissao.Text
  // + ' valor comissao por cbs: ' + ed_ValorComisPorAnimal.Text + ' valor total venda: ' + ed_ValorTotalVenda.Text + ' valor venda por cbs: ' + ed_valorporcbs_venda.Text
  // + ' descricao: ' + ed_Obs.Text);
  // end;
  //
  // if Acao = 1 then
  // begin
  //
  // log(0008, cds_log.FieldByName('id').AsInteger, ' data_venda: ' + cds_log.FieldByName('data_venda').AsString + ' lote: ' +
  // cds_log.FieldByName('lote').AsString + ' cliente: ' + cds_log.FieldByName('cliente').AsString + ' conta_bancaria: ' +
  // cds_log.FieldByName('conta_bancaria').AsString + ' quantidade_cbs: ' + cds_log.FieldByName('quantidade_cbs').AsString + ' valor total dos animais: ' +
  // cds_log.FieldByName('valortotal_animais').AsString + ' valor por cbs: ' + cds_log.FieldByName('valorporcbs_animais').AsString
  // + ' idade: ' + cds_log.FieldByName('idade_animal').AsString + ' sexo: ' + cds_log.FieldByName('sexo_animal').AsString + ' raça: ' + cds_log.FieldByName('raca_animal').AsString +
  // ' etiqueta: ' + cds_log.FieldByName('etiqueta').AsString + ' caminhão: ' + cds_log.FieldByName('tipo_caminhao').AsString + ' placa: ' + cds_log.FieldByName('placa_caminhao').AsString +
  // ' motorista: ' + cds_log.FieldByName('motorista').AsString + ' valor frete: ' + cds_log.FieldByName('valortotal_frete').AsString + ' valor frete por cbs: ' + cds_log.FieldByName('valorporcbs_frete').AsString +
  // ' corretor: ' + cds_log.FieldByName('corretor').AsString + ' valor comissão: ' + cds_log.FieldByName('valortotal_comissao').AsString + ' valor comissao por cbs: ' + cds_log.FieldByName('valorporcbs_comissao').AsString
  // + ' descricao: ' + cds_log.FieldByName('descricao').AsString + ' valor total venda: ' + cds_log.FieldByName('valortotal_venda').AsString + ' valor venda por cbs: ' + cds_log.FieldByName('valorporcbs_venda').AsString,
  //
  // ' data_venda: ' + DateToStr(DateEditVenda.Date) + ' lote: ' + edTms_Lote.Text + ' cliente: ' + edTms_Cliente.Text +
  // ' conta_bancaria: ' + edTms_ContaBancaria.Text + ' quantidade_cbs: ' + ed_Quantidade.Text + ' valor total dos animais: ' + ed_ValorTotalAnimal.Text + ' valor por cbs: ' + ed_ValorPorAnimal.Text
  // + ' idade: ' + cbx_IdadeAnimal.Items[cbx_IdadeAnimal.ItemIndex] + ' sexo: ' + cbx_SexoAnimal.Items[cbx_IdadeAnimal.ItemIndex] + ' raça: ' + cbx_TipoAnimal.Items[cbx_TipoAnimal.ItemIndex]
  // + ' etiqueta: ' + ed_Etiqueta.Text + ' caminhão: ' + cbx_TipoCaminhao.Items[cbx_TipoCaminhao.ItemIndex] + ' placa: ' + ed_PlacaCaminhao.Text + ' motorista ' + edTms_Motorista.Text
  // + ' valor total frete: ' + ed_ValorTotalFrete.Text + ' valor frete por cbs: ' + ed_ValorFretePorAnimal.Text + ' corretor: ' + edTms_Corretor.Text + ' valor total comissao: ' + ed_ValorTotalComissao.Text
  // + ' valor comissao por cbs: ' + ed_ValorComisPorAnimal.Text + ' valor total venda: ' + ed_ValorTotalVenda.Text + ' valor venda por cbs: ' + ed_valorporcbs_venda.Text
  // + ' descricao: ' + ed_Obs.Text);
  // end;
  //
  // if Acao = 2 then
  // begin
  // log(0008, cds_log.FieldByName('id').AsInteger, ' data_venda: ' + cds_log.FieldByName('data_venda').AsString + ' lote: ' +
  // cds_log.FieldByName('lote').AsString + ' cliente: ' + cds_log.FieldByName('cliente').AsString + ' conta_bancaria: ' +
  // cds_log.FieldByName('conta_bancaria').AsString + ' quantidade_cbs: ' + cds_log.FieldByName('quantidade_cbs').AsString + ' valor total dos animais: ' +
  // cds_log.FieldByName('valortotal_animais').AsString + ' valor por cbs: ' + cds_log.FieldByName('valorporcbs_animais').AsString
  // + ' idade: ' + cds_log.FieldByName('idade_animal').AsString + ' sexo: ' + cds_log.FieldByName('sexo_animal').AsString + ' raça: ' + cds_log.FieldByName('raca_animal').AsString +
  // ' etiqueta: ' + cds_log.FieldByName('etiqueta').AsString + ' caminhão: ' + cds_log.FieldByName('tipo_caminhao').AsString + ' placa: ' + cds_log.FieldByName('placa_caminhao').AsString +
  // ' motorista: ' + cds_log.FieldByName('motorista').AsString + ' valor frete: ' + cds_log.FieldByName('valortotal_frete').AsString + ' valor frete por cbs: ' + cds_log.FieldByName('valorporcbs_frete').AsString +
  // ' corretor: ' + cds_log.FieldByName('corretor').AsString + ' valor comissão: ' + cds_log.FieldByName('valortotal_comissao').AsString + ' valor comissao por cbs: ' + cds_log.FieldByName('valorporcbs_comissao').AsString
  // + ' descricao: ' + cds_log.FieldByName('descricao').AsString + ' valor total venda: ' + cds_log.FieldByName('valortotal_venda').AsString + ' valor venda por cbs: ' + cds_log.FieldByName('valorporcbs_venda').AsString, '')
  // end;
end;

procedure TFrmCadVenda.lst_AnexosItemClick(const Sender: TObject; const AItem: TListViewItem);
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

procedure TFrmCadVenda.lst_PrincipalItemClick(const Sender: TObject; const AItem: TListViewItem);
const
  _SQLInicial = 'select v.id, v.data_venda, v.quantidade_cbs, v.valortotal_venda, v.valorporcbs_venda,               ' +
    '       v.idade_animal, v.sexo_animal, v.raca_animal, v.etiqueta, v.tipo_caminhao, v.placa_caminhao, ' +
    '       v.valortotal_frete, v.valorporcbs_frete, v.valortotal_comissao, v.valorporcbs_comissao,      ' +
    '       v.valortotal_animais, v.valorporcbs_animais, v.descricao, v.forma_pagto,                                    '
    + '       f.nome as cliente,cc.id as codigo_conta, cc.conta, l.id as codigo_lote, l.nome as lote, m.nome as motorista,                       '
    + '       r.raca as raca, ia.idade_animal as idade, tp.tipo_caminhao as caminhao,                      ' +
    '       co.nome as corretor, v.parcela, v.entrada, v.status_frete, v.status_comissao from vendas as v                                                         '
    + '  left outer join pessoas as f on (f.id = v.cliente)                                                ' +
    '  left outer join contas_bancarias as cc on (cc.id = v.conta_bancaria)                              ' +
    '  left outer join lotes as l on (l.id = v.lote)                                                     ' +
    '  left outer join pessoas as m on (m.id = v.motorista)                                              ' +
    '  left outer join pessoas as co on (co.id = v.corretor)                                             ' +
    '  left outer join raca_animal as r on (r.id = v.raca_animal)                                        ' +
    '  left outer join idade_animal as ia on (ia.id = v.idade_animal)                                    ' +
    '  left outer join tipo_caminhao as tp on (tp.id = v.tipo_caminhao)                                  ' +
    '  where v.id = :id order by data_venda desc;                                                         ';
  _SQLItens = 'select vi.*, i.idade_animal as idade, r.raca as raca from vendas_itens as vi    ' +
    'left outer join idade_animal as i on (i.id = vi.idade_animal)                    ' +
    'left outer join raca_animal as r on(r.id = vi.raca_animal)                       ' +
    'where vi.id_venda = :id                                                         ' +
    'order by vi.id asc;                                                              ';

  sqlparcela = ' select num_parc, DATE_FORMAT(data, "%d/%m/%Y") as data, valor, ' + ' case ' +
    ' when (data < CURDATE() and status = 0) then ''VENCIDA'' ' + ' when (status = 0) then ''ABERTO'' ' +
    ' when (status = 1) then ''PAGO'' ' + ' END as status ' + ' from parcelas ' +
    ' where movimentacao = ''V'' and id_movimentacao = :id ';
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
        cds_log.FieldByName('data_venda').AsDateTime := Query.FieldByName('data_venda').AsDateTime;
        cds_log.FieldByName('lote').AsString := Query.FieldByName('lote').AsString;;
        cds_log.FieldByName('cliente').AsString := Query.FieldByName('cliente').AsString;
        cds_log.FieldByName('conta_bancaria').AsString := Query.FieldByName('conta').AsString;
        cds_log.FieldByName('quantidade_cbs').AsString := Query.FieldByName('quantidade_cbs').AsString;
        cds_log.FieldByName('valortotal_venda').AsString := Query.FieldByName('valortotal_venda').AsString;
        cds_log.FieldByName('valorporcbs_venda').AsString := Query.FieldByName('valorporcbs_venda').AsString;
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
          Query.SQL.Add(_SQLItens);
          Query.ParamByName('id').AsInteger := Cod_Selecao;
          Query.Open();

          PopularVendasItens(Query);

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

procedure TFrmCadVenda.PopulaListFiltros(QBanco: TFDQuery);
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

        txt := TListItemText(Objects.FindDrawable('lbl_cliente'));
        txt.Text := 'CLIENTE';

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
        txt.Text := QBanco.FieldByName('data_venda').AsString;

        txt := TListItemText(Objects.FindDrawable('lote'));
        txt.Text := QBanco.FieldByName('lote').AsString;

        txt := TListItemText(Objects.FindDrawable('cliente'));
        txt.Text := QBanco.FieldByName('cliente').AsString;

        txt := TListItemText(Objects.FindDrawable('conta'));
        txt.Text := QBanco.FieldByName('conta').AsString;

        txt := TListItemText(Objects.FindDrawable('quantidade'));
        txt.Text := QBanco.FieldByName('quantidade_cbs').AsString;

        txt := TListItemText(Objects.FindDrawable('valorTotal'));
        txt.Text := 'R$' + formatfloat('#,##0.00', QBanco.FieldByName('valortotal_venda').AsFloat);

        txt := TListItemText(Objects.FindDrawable('valorporcbs'));
        txt.Text := 'R$' + formatfloat('#,##0.00', QBanco.FieldByName('valorporcbs_venda').AsFloat);
      end;

      QBanco.Next
    end;
  finally
    lst_Principal.EndUpdate;
    FreeAndNil(QBanco);
  end;
end;

procedure TFrmCadVenda.PopularCampos(Query: TFDQuery);
begin
  // DATA DA VENDA
  DateEditVenda.Date := Query.FieldByName('data_venda').AsDateTime;
  // LOTE
  // edTms_Lote.Text := Query.FieldByName('lote').AsString;
  ed_Lote.Text := formatfloat('00000', Query.FieldByName('codigo_lote').AsFloat) + ' - ' +
    Query.FieldByName('lote').AsString;
  // FORNECEDOR
  ed_Pessoa.Text := Query.FieldByName('cliente').AsString;
  // CONTA BANCÁRIA
  ed_Conta.Text := formatfloat('00000', Query.FieldByName('codigo_conta').AsFloat) + ' - ' +
    Query.FieldByName('conta').AsString;
  // QUANTIDADE DE CBS
  ed_QuantidadeTotal.Text := Query.FieldByName('quantidade_cbs').AsString;
  // // VALOR TOTAL DOS ANIMAIS
  // ed_ValorTotalAnimal.Text := formatfloat('###,##0.00', Query.FieldByName('valortotal_animais').AsFloat);
  // // VALOR POR CBS
  // ed_ValorPorAnimal.Text := formatfloat('###,##0.00', Query.FieldByName('valorporcbs_animais').AsFloat);
  // // IDADE ANIMAL
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
  ed_Motorista.Text := Query.FieldByName('motorista').AsString;
  // VALOR TOTAL DO FRETE
  ed_ValorTotalFrete.Text := formatfloat('###,##0.00', Query.FieldByName('valortotal_frete').AsFloat);
  // VALOR FRETE POR ANIMAL
  ed_ValorFretePorAnimal.Text := formatfloat('###,##0.00', Query.FieldByName('valorporcbs_frete').AsFloat);
  // CORRETOR
  ed_Corretor.Text := Query.FieldByName('corretor').AsString;
  // VALOR TOTAL DA COMISSÃO
  ed_ValorTotalComissao.Text := formatfloat('###,##0.00', Query.FieldByName('valortotal_comissao').AsFloat);
  // VALOR COMISSÃO POR ANIMAL
  ed_ValorComisPorAnimal.Text := formatfloat('###,##0.00', Query.FieldByName('valorporcbs_comissao').AsFloat);
  // DESCRIÇÃO
  ed_Obs.Text := Query.FieldByName('descricao').AsString;
  // VALOR TOTAL DA VENDA
  ed_ValorTotal.Text := formatfloat('###,##0.00', Query.FieldByName('valortotal_venda').AsFloat);
  ValorParc := Query.FieldByName('valortotal_venda').AsFloat;
  // VALOR POR CBS DA VENDA
  ed_valorporcbs_venda.Text := formatfloat('###,##0.00', Query.FieldByName('valorporcbs_venda').AsFloat);

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
        ckb_comissaoDesc.IsChecked := false;
        ckb_comissaoParc.IsChecked := false;
      end;

    1:
      begin
        ckb_comissaoDesc.IsChecked := true;
        ckb_comissaoParc.IsChecked := false;
      end;
    2:
      begin
        ckb_comissaoDesc.IsChecked := false;
        ckb_comissaoParc.IsChecked := true;
      end;
  end;

end;

procedure TFrmCadVenda.PopularLotesItens(Query: TFDQuery);
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
      Cells[0, Row] := formatfloat('00000', Query.FieldByName('id').AsFloat);
      // qtd
      Cells[1, Row] := Query.FieldByName('quantidade').AsString;
      // Idade
      Cells[2, Row] := formatfloat('000', Query.FieldByName('idade_animal').AsFloat) + ' - ' +
        Query.FieldByName('idade').AsString;
      // raça
      Cells[3, Row] := formatfloat('000', Query.FieldByName('raca_animal').AsFloat) + ' - ' +
        Query.FieldByName('raca').AsString;
      // sexo
      if Query.FieldByName('sexo_animal').AsInteger = 1 then
        Cells[4, Row] := '001 - FEMÊA'
      else if Query.FieldByName('sexo_animal').AsInteger = 2 then
        Cells[4, Row] := '002 - MACHO';
      // despesa_cbs
      Cells[5, Row] := formatfloat('###,###,##0.00', Query.FieldByName('despesa_cbs').AsFloat);
      // valor por animal
      Cells[6, Row] := formatfloat('###,###,##0.00', Query.FieldByName('valorporcbs_animais').AsFloat);
      // valor total
      Cells[7, Row] := formatfloat('###,###,##0.00', Query.FieldByName('valortotal_animais').AsFloat);

      // id compra
      Cells[11, Row] := Query.FieldByName('id_compra').AsString;
    end;
    Query.Next;
  end;
end;

procedure TFrmCadVenda.PopularVendasItens(Query: TFDQuery);
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
      Cells[0, Row] := formatfloat('00000', Query.FieldByName('id').AsFloat);
      // qtd
      Cells[1, Row] := Query.FieldByName('quantidade').AsString;
      // Idade
      Cells[2, Row] := formatfloat('000', Query.FieldByName('idade_animal').AsFloat) + ' - ' +
        Query.FieldByName('idade').AsString;
      // raça
      Cells[3, Row] := formatfloat('000', Query.FieldByName('raca_animal').AsFloat) + ' - ' +
        Query.FieldByName('raca').AsString;
      // sexo
      if Query.FieldByName('sexo_animal').AsInteger = 1 then
        Cells[4, Row] := '001 - FEMÊA'
      else if Query.FieldByName('sexo_animal').AsInteger = 2 then
        Cells[4, Row] := '002 - MACHO';
      // despesa_cbs
      Cells[5, Row] := formatfloat('###,###,##0.00', Query.FieldByName('despesa_cbs').AsFloat);
      // valor por animal
      Cells[6, Row] := formatfloat('###,###,##0.00', Query.FieldByName('valorporcbs_animais').AsFloat);
      // valor total
      Cells[7, Row] := formatfloat('###,###,##0.00', Query.FieldByName('valortotal_animais').AsFloat);
      // QUANTIDADE VENDIDA
      Cells[8, Row] := Query.FieldByName('qtd_vendida').AsString;
      // VALOR POR ANIMAL VENDIDO
      Cells[9, Row] := formatfloat('###,###,##0.00', Query.FieldByName('valorporcbs_vendido').AsFloat);
      // VALOR TOTAL VENDIDO
      Cells[10, Row] := formatfloat('###,###,##0.00', Query.FieldByName('valortotal_vendido').AsFloat);
      // ID COMPRA
      Cells[11, Row] := Query.FieldByName('id_compra').AsString;
    end;
    Query.Next;
  end;
end;

procedure TFrmCadVenda.rbFisica1Change(Sender: TObject);
begin
  inherited;
  if rbFisica1.IsChecked then
    rbJuridica1.IsChecked := false;
end;

procedure TFrmCadVenda.rbFisica2Change(Sender: TObject);
begin
  inherited;
  if rbFisica2.IsChecked then
    rbJuridica2.IsChecked := false;
end;

procedure TFrmCadVenda.rbFisica3Change(Sender: TObject);
begin
  inherited;
  if rbFisica3.IsChecked then
    rbJuridica3.IsChecked := false;
end;

procedure TFrmCadVenda.rbJuridica1Change(Sender: TObject);
begin
  inherited;
  if rbJuridica1.IsChecked then
    rbFisica1.IsChecked := false;
end;

procedure TFrmCadVenda.rbJuridica2Change(Sender: TObject);
begin
  inherited;
  if rbJuridica2.IsChecked then
    rbFisica2.IsChecked := false;
end;

procedure TFrmCadVenda.rbJuridica3Change(Sender: TObject);
begin
  inherited;
  if rbJuridica3.IsChecked then
    rbFisica3.IsChecked := false;
end;

procedure TFrmCadVenda.rct_AnexoArqClick(Sender: TObject);
begin
  inherited;
  tab_Crud.ActiveTab := TabItem3;
end;

procedure TFrmCadVenda.rct_fgtoClick(Sender: TObject);
begin
  inherited;
  if (ValorParc = 0) or (ed_ValorTotal.Text = '0,00') then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 5080 : ' + sLineBreak +
      'Não é possivel adicionar uma forma de pagamento com o valor zerado!';
    abort;
  end;

  if cbx_FormaPagto.Enabled then
  begin
    rctApagarSelecionados.Enabled := true;
    Rectangle14.Enabled := true;
  end
  else
  begin
    rctApagarSelecionados.Enabled := false;
    Rectangle14.Enabled := false;
  end;
  lay_parc.Visible := true;
end;

procedure TFrmCadVenda.Rectangle19Click(Sender: TObject);
begin
  inherited;
  if (ed_Pessoa.Text = EmptyStr) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 7002 : ' + sLineBreak + 'Selecione um(a) CLIENTE válido(a)!';
    ed_Pessoa.SetFocus;
    abort;
  end;

  if (ed_Conta.Text = EmptyStr) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 7003 : ' + sLineBreak + 'Selecione uma CONTA válida!';
    ed_Conta.SetFocus;
    abort;
  end;

  if (ed_ValorTotalFrete.Text = EmptyStr) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 7009 : ' + sLineBreak + 'Insira o VALOR TOTAL DO FRETE!';
    ed_ValorTotalFrete.SetFocus;
    abort;
  end;

  if (ed_ValorTotalComissao.Text = EmptyStr) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 7010 : ' + sLineBreak + 'Insira o VALOR TOTAL DA COMISSÃO!';
    ed_ValorTotalComissao.SetFocus;
    abort;
  end;

  // if cbx_FormaPagto.ItemIndex < 1 then
  // begin
  // lay_error.Visible := true;
  // lbl_Erro.Text := 'Erro 7017 : ' + sLineBreak + 'Selecione a FORMA DE PAGAMENTO!';
  // cbx_FormaPagto.SetFocus;
  // abort;
  // end;

  tab_Crud.ActiveTab := TabItem4;
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

procedure TFrmCadVenda.Rectangle26Click(Sender: TObject);
begin
  inherited;
  lay_Recibo.Visible := false;
end;

procedure TFrmCadVenda.Rectangle37Click(Sender: TObject);
begin
  inherited;
  lay_parc.Visible := false;
end;

procedure TFrmCadVenda.Rectangle38Click(Sender: TObject);
begin
  inherited;
  cdsParc.EmptyDataSet;
  cdsParc.Refresh;
end;

procedure TFrmCadVenda.Rectangle39Click(Sender: TObject);
var
  valor: double;
begin
  inherited;

  cdsParc.EmptyDataSet;
  valor := ValorParc;

  if ckb_ComissaoParc.IsChecked  then
    valor := valor + strtofloat(StringReplace(ed_ValorTotalComissao.Text, '.', '', [rfReplaceAll]));
  if ckb_FreteParc.IsChecked  then
    valor := valor + strtofloat(StringReplace(ed_ValorTotalFrete.Text, '.', '', [rfReplaceAll]));

  GeraParcelas(DateEditVenda.Date, cbx_Parc.ItemIndex, StrToInt(ed_DiasParc.Text),
    (valor - strtofloat(StringReplace(ed_EntradaValor.Text, '.', '', [rfReplaceAll]))));
  cdsParc.Refresh;

end;

function TFrmCadVenda.RetornaIdConta(conta: string): Integer;
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

function TFrmCadVenda.RetornaIdLote(numero: string): Integer;
const
  _SQL = 'select id from lotes where id = :numero';
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

function TFrmCadVenda.RetornaIdPessoa(nome: string): Integer;
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

function TFrmCadVenda.RetornaIdVenda(numero: string): Integer;
const
  _SQL = 'SELECT id FROM agrojun.vendas order by id desc LIMIT 1';
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.Create(nil);
    qry.Connection := dm.FDConnection;
    qry.Active := false;
    qry.SQL.Clear;
    qry.SQL.Text := _SQL;
    qry.Active := true;
    if not qry.IsEmpty then
      Result := qry.FieldByName('id').AsInteger
    else
      Result := 0;
  finally
    FreeAndNil(qry);
  end;
end;

procedure TFrmCadVenda.SalvarPessoa(nome: string; tipo_pessoa: Integer);
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

procedure TFrmCadVenda.StringGridAnimaisEditingDone(Sender: TObject; const ACol, ARow: Integer);
var
  I, qtd: Integer;
  ValorTotal: double;
begin
  inherited;
  qtd := 0;
  ValorTotal := 0;

  for I := 0 to StringGridAnimais.RowCount - 1 do
  begin
    if (not StringGridAnimais.Cells[8, I].IsEmpty) and (not StringGridAnimais.Cells[9, I].IsEmpty) then
    begin
      qtd := qtd + StrToInt(StringGridAnimais.Cells[8, I]);
      StringGridAnimais.Cells[10, I] := FloatToStr(StrToInt(StringGridAnimais.Cells[8, I]) *
        strtofloat(StringGridAnimais.Cells[9, I]));
      ValorTotal := ValorTotal + strtofloat(StringGridAnimais.Cells[10, I]);

    end;

    ed_QuantidadeTotal.Text := IntToStr(qtd);
    ed_ValorTotal.Text := formatfloat('###,###,##0.00', ValorTotal);
    ValorParc := ValorTotal;
  end;
end;

procedure TFrmCadVenda.Validar(cod_vali: Integer);
begin
  if (ed_Lote.Text = EmptyStr) or (cod_vali = 1) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 7001 : ' + sLineBreak + 'Selecione um LOTE válido!';
    ed_Lote.SetFocus;
    abort;
  end;

  if (ed_Pessoa.Text = EmptyStr) or (cod_vali = 2) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 7002 : ' + sLineBreak + 'Selecione um(a) CLIENTE válido(a)!';
    ed_Pessoa.SetFocus;
    abort;
  end;

  if (ed_Conta.Text = EmptyStr) or (cod_vali = 3) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 7003 : ' + sLineBreak + 'Selecione uma CONTA válida!';
    ed_Conta.SetFocus;
    abort;
  end;

  if (ed_QuantidadeTotal.Text = EmptyStr) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 7004 : ' + sLineBreak + 'Informe a QUANTIDADE de animais!';
    ed_Quantidade.SetFocus;
    abort;
  end;

  // if (ed_ValorTotal.Text = EmptyStr) then
  // begin
  // lay_error.Visible := true;
  // lbl_Erro.Text := 'Erro 7005 : ' + sLineBreak + 'Informe o VALOR TOTAL DA COMPRA!';
  // ed_ValorTotalAnimal.SetFocus;
  // abort;
  // end;

  // if cbx_IdadeAnimal.ItemIndex < 1 then
  // begin
  // lay_error.Visible := true;
  // lbl_Erro.Text := 'Erro 7006 : ' + sLineBreak + 'Selecione a IDADE do (s) animal (ais)!';
  // cbx_IdadeAnimal.SetFocus;
  // abort;
  // end;
  //
  // if cbx_SexoAnimal.ItemIndex < 1 then
  // begin
  // lay_error.Visible := true;
  // lbl_Erro.Text := 'Erro 7007 : ' + sLineBreak + 'Selecione o SEXO do (s) animal (ais)!';
  // cbx_SexoAnimal.SetFocus;
  // abort;
  // end;
  //
  // if cbx_TipoAnimal.ItemIndex < 1 then
  // begin
  // lay_error.Visible := true;
  // lbl_Erro.Text := 'Erro 7008 : ' + sLineBreak + 'Selecione a RAÇA do (s) animal (ais)!';
  // cbx_TipoAnimal.SetFocus;
  // abort;
  // end;

  if (ed_ValorTotalFrete.Text = EmptyStr) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 7009 : ' + sLineBreak + 'Insira o VALOR TOTAL DO FRETE!';
    ed_ValorTotalFrete.SetFocus;
    abort;
  end;

  if (ed_ValorTotalComissao.Text = EmptyStr) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 7010 : ' + sLineBreak + 'Insira o VALOR TOTAL DA COMISSÃO!';
    ed_ValorTotalComissao.SetFocus;
    abort;
  end;

  if (cod_vali = 4) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 7011 : ' + sLineBreak + 'Selecione um(a) MOTORISTA válido(a)!';
    ed_Motorista.SetFocus;
    abort;
  end;

  if (cod_vali = 5) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 7012 : ' + sLineBreak + 'Selecione um(a) CORRETOR(A) válido(a)!';
    ed_Corretor.SetFocus;
    abort;
  end;

  if Acao = 0 then
  begin
    // ShowMessage(BuscarQtdAnimaisLote(RetornaIdLote(ed_Lote.Text)).ToString);
    if BuscarQtdAnimaisLote(StrToInt(copy(ed_Lote.Text, 0, 5))) < StrToInt(ed_QuantidadeTotal.Text) then
    begin
      lay_error.Visible := true;
      lbl_Erro.Text := 'Erro 7013 : ' + sLineBreak +
        'O lote selecionado não tem a quantidade de animais suficiente para fazer essa venda!';
      ed_Lote.SetFocus;
      abort;
    end;
  end
  else
  begin
    if (BuscarQtdAnimaisLote(RetornaIdLote(copy(ed_Lote.Text, 0, 5))) + QtdAnimais) < StrToInt(ed_QuantidadeTotal.Text)
    then
    begin
      lay_error.Visible := true;
      lbl_Erro.Text := 'Erro 7013 : ' + sLineBreak +
        'O lote selecionado não tem a quantidade de animais suficiente para fazer essa venda!';
      ed_Lote.SetFocus;
      abort;
    end;
  end;

  if cod_vali = 8 then
  begin
    if not rbFisica1.IsChecked and not rbJuridica1.IsChecked then
    begin
      lay_error.Visible := true;
      lbl_Erro.Text := 'Erro 7014 : ' + sLineBreak + 'Selecione um TIPO DE PESSOA válido no(a) FORNECEDOR(A)!';
      rbFisica1.SetFocus;
      abort;
    end
    else if not rbFisica2.IsChecked and not rbJuridica2.IsChecked then
    begin
      lay_error.Visible := true;
      lbl_Erro.Text := 'Erro 7015 : ' + sLineBreak + 'Selecione um TIPO DE PESSOA válido no(a) MOTORISTA!';
      rbFisica2.SetFocus;
      abort;
    end
    else if not rbFisica3.IsChecked and not rbJuridica3.IsChecked then
    begin
      lay_error.Visible := true;
      lbl_Erro.Text := 'Erro 7016 : ' + sLineBreak + 'Selecione um TIPO DE PESSOA válido no(a) CORRETOR(A)!';
      rbFisica3.SetFocus;
      abort;
    end;
  end;

  if cbx_FormaPagto.ItemIndex < 1 then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 7017 : ' + sLineBreak + 'Selecione a FORMA DE PAGAMENTO!';
    cbx_FormaPagto.SetFocus;
    abort;
  end;
end;

function TFrmCadVenda.ValidarPessoa(nome: string): Integer;
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

procedure TFrmCadVenda.VendaParcial(id_lote, id_venda: Integer);
const
  SQLVP = 'INSERT INTO agrojun.vendas_parcial (id_lote, id_venda, data_vendaparcial) VALUES (:id_lote, :id_venda, :data)';
var
  qryAux: TFDQuery;
begin
  try
    qryAux := TFDQuery.Create(self);
    qryAux.Connection := dm.FDConnection;
    qryAux.FetchOptions.RowsetSize := 50000;
    qryAux.Active := false;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(SQLVP);
    qryAux.ParamByName('id_lote').AsInteger := id_lote;
    qryAux.ParamByName('id_venda').AsInteger := id_venda;
    qryAux.ParamByName('data').AsDateTime := Now;
    qryAux.ExecSQL;
  finally
    FreeAndNil(qryAux);
  end;
end;

procedure TFrmCadVenda.anexos(cod: Integer);
const
  _SqlAnexo = 'SELECT * FROM agrojun.anexos where status = ''V'' and cod_mov = :cod_mov';
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

procedure TFrmCadVenda.GravaParcelas(movimentacao: string; id_movimentacao, conta_bancaria, id_pessoa: Integer);
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

procedure TFrmCadVenda.GeraParcelas(Data: TDateTime; num_parc, num_dias: Integer; valor: double);

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

procedure TFrmCadVenda.ckb_ComissaoDescChange(Sender: TObject);
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



procedure TFrmCadVenda.ckb_ComissaoParcChange(Sender: TObject);
begin
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

procedure TFrmCadVenda.ckb_FreteDescChange(Sender: TObject);
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

procedure TFrmCadVenda.ckb_FreteParcChange(Sender: TObject);
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
