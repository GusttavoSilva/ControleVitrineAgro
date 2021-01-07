unit u_CadDespesas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  u_CrudCad, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.Edit, FMX.Objects, FMX.ListView,
  FMX.TabControl, FMX.Controls.Presentation, FMX.Layouts, FMX.ComboEdit,
  FMX.DateTimeCtrls, System.DateUtils, FMX.ListBox, FMX.SearchBox,
  FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Stan.Async, FireDAC.DApt, FMX.frxClass, System.Rtti, FMX.Grid.Style,
  FMX.ScrollBox, FMX.Grid, Data.Bind.EngExt, FMX.Bind.DBEngExt, FMX.Bind.Grid, System.Bindings.Outputs, FMX.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, FireDAC.Stan.StorageBin;

type
  TFrmCadDespesas = class(TFrmCrud)
    lytInfo: TLayout;
    TabPessoa: TTabItem;
    Layout5: TLayout;
    ed_PesquisaPessoa: TEdit;
    ClearEditButton2: TClearEditButton;
    ListViewPessoa: TListView;
    Label11: TLabel;
    lay_lstvaziaPessoa: TLayout;
    Image3: TImage;
    Label12: TLabel;
    TabConta: TTabItem;
    lay_lstvaziaConta: TLayout;
    Image4: TImage;
    Label13: TLabel;
    Layout8: TLayout;
    TabLote: TTabItem;
    lay_lstvaziaLote: TLayout;
    Image6: TImage;
    Label15: TLabel;
    Layout9: TLayout;
    ListViewLote: TListView;
    ListViewConta: TListView;
    cds_log: TFDMemTable;
    cds_logid: TStringField;
    cds_logdata_despesa: TDateTimeField;
    cds_logid_pessoa: TStringField;
    cds_logid_conta: TStringField;
    cds_logid_lote: TStringField;
    cds_logtipo_despesa: TStringField;
    cds_logdescricao: TStringField;
    cds_logvalor: TStringField;
    ed_Obs: TEdit;
    ed_Valor: TEdit;
    ed_Lote: TEdit;
    ClearEditButton5: TClearEditButton;
    ed_Conta: TEdit;
    ClearEditButton4: TClearEditButton;
    ed_Pessoa: TEdit;
    ClearEditButton3: TClearEditButton;
    DateEditDespesa: TDateEdit;
    cbx_TipoDespesa: TComboEdit;
    Label24: TLabel;
    Label28: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Rectangle4: TRectangle;
    Layout1: TLayout;
    Rectangle5: TRectangle;
    Layout7: TLayout;
    Image11: TImage;
    Layout10: TLayout;
    Rectangle8: TRectangle;
    Layout11: TLayout;
    Image10: TImage;
    Layout12: TLayout;
    Rectangle9: TRectangle;
    Layout13: TLayout;
    Image16: TImage;
    Label27: TLabel;
    Rectangle10: TRectangle;
    ed_PesquisaConta: TEdit;
    ClearEditButton6: TClearEditButton;
    Label3: TLabel;
    Label10: TLabel;
    Rectangle11: TRectangle;
    ed_PesquisaLote: TEdit;
    ClearEditButton7: TClearEditButton;
    Label14: TLabel;
    Label16: TLabel;
    recibo: TFDQuery;
    frxRecibo: TfrxReport;
    img_recibo: TImage;
    lay_parc: TLayout;
    Rectangle12: TRectangle;
    Rectangle13: TRectangle;
    Layout14: TLayout;
    Grid1: TGrid;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    ed_DiasParc: TEdit;
    ed_EntradaValor: TEdit;
    cbx_Parc: TComboBox;
    rctApagarSelecionados: TRectangle;
    lblApagarSelec: TLabel;
    Rectangle15: TRectangle;
    lbl: TLabel;
    Label87: TLabel;
    Rectangle16: TRectangle;
    Label20: TLabel;
    cbx_FormaPagto: TComboEdit;
    lblFormaPagto: TLabel;
    Label45: TLabel;
    ckb_GerarParcela: TCheckBox;
    lay_GerarPac: TLayout;
    cdsParc: TFDMemTable;
    cdsParcnum_parc: TIntegerField;
    cdsParcdata: TDateTimeField;
    cdsParcvalor: TFloatField;
    cdsParcstatus: TStringField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Rectangle14: TRectangle;
    Label51: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Img_BtnNovoClick(Sender: TObject);
    procedure cbx_TipoDespesaChange(Sender: TObject);
    procedure ed_PessoaEnter(Sender: TObject);
    procedure ed_PesquisaPessoaChangeTracking(Sender: TObject);
    procedure ListViewPessoaItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure ed_ContaEnter(Sender: TObject);
    procedure ed_PesquisaContaChangeTracking(Sender: TObject);
    procedure ListViewContaItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure ed_PesquisaLoteChangeTracking(Sender: TObject);
    procedure ed_LoteEnter(Sender: TObject);
    procedure ListViewLoteItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure Img_BtnSalvarClick(Sender: TObject);
    procedure lst_PrincipalItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure Img_BtnExcluirClick(Sender: TObject);
    procedure Img_BtnCancelarClick(Sender: TObject);
    procedure Img_BtnEditarClick(Sender: TObject);
    procedure Img_BtnVoltarClick(Sender: TObject);
    procedure img_reciboClick(Sender: TObject);
    procedure ed_ValorKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure Rectangle15Click(Sender: TObject);
    procedure rctApagarSelecionadosClick(Sender: TObject);
    procedure Rectangle14Click(Sender: TObject);
    procedure Rectangle16Click(Sender: TObject);
    procedure ckb_GerarParcelaChange(Sender: TObject);
    procedure cbx_FormaPagtoChangeTracking(Sender: TObject);
    procedure ed_EntradaValorKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure Image16Click(Sender: TObject);
  private
    sbPessoa: TSearchBox;
    sbConta: TSearchBox;
    sbLote: TSearchBox;
    { Private declarations }
    procedure Validar(cod_vali: Integer);
    procedure ConsultaBancoPessoas;
    procedure ConsultaConta;
    procedure ConsultaBancoLotes;
    procedure ConsultaDespesas;
    procedure PopularCampos(Query: TFDQuery);
    procedure LogDespesas;
    procedure PopulaListFiltros(QBanco: TFDQuery);
    function BuscarSaldo(id: Integer): double;
    function AlteraSaldo(id: Integer; saldo: double): Integer;
    function RetornaQtdCbsLote(numero: string): Integer;
    function AlteraDespesaLote(id: Integer; despesa: double; despesa_cbs: double): Integer;
    function BuscarDespesaLote(id: Integer): double;
    procedure CarregaRelatorio(const pReport: TfrxReport; tipo: Integer);

    procedure GeraParcelas(Data: TDateTime; num_parc, num_dias: Integer; valor: double);
    procedure GravaParcelas(movimentacao: string; id_movimentacao, conta_bancaria, id_pessoa: Integer);
    procedure ConsultaFormaPagto;
  public
    { Public declarations }
  end;

var
  FrmCadDespesas: TFrmCadDespesas;
  Cod_Selecao, Tipo_Busca, Apagar: Integer;
  ValorTotal: double;

implementation

{$R *.fmx}

uses u_Library, u_DM;

procedure TFrmCadDespesas.ConsultaFormaPagto;
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
          vResultado.Add(formatfloat('000', dm.QAux.FieldByName('id').AsFloat) + ' - ' + dm.QAux.FieldByName('forma_pagto').AsString);
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

procedure TFrmCadDespesas.GravaParcelas(movimentacao: string; id_movimentacao, conta_bancaria, id_pessoa: Integer);
const
  SQL = ' INSERT INTO agrojun.parcelas ' + ' (data, movimentacao, id_movimentacao, conta_bancaria, num_parc, valor, status, id_pessoa) ' + ' VALUES ' +
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
      qry.Params.ParamByName('movimentacao').AsString := movimentacao; // C = compra; V = venda; D = Despesa
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

procedure TFrmCadDespesas.GeraParcelas(Data: TDateTime; num_parc, num_dias: Integer; valor: double);

var
  cont, i, nParcela: Integer;
  Parc: Real;
begin
  cdsParc.EmptyDataSet;
  cdsParc.Refresh;

  if (num_parc = 0) and (num_parc > 30) then
  begin
    raise Exception.Create('Necessário informar um Número de Parcelas maior que zero e menor que trinta!');
  end;

//  if (num_dias = 0) then
//  begin
//    raise Exception.Create('O intervalos das parcelas nao pode ser igual a zero!');
//  end;

  if mensagemConfirmacao('Deseja efetuar a geraçao da(s) parcela(s)?') = mrYes then
  begin
    // Parc := Round(valor / num_parc);
    Parc := valor / num_parc;
    nParcela := 1;
    for i := 1 to num_parc do
    begin

      cdsParc.Append;
      cdsParc.FieldByName('num_parc').asInteger := nParcela;
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

procedure TFrmCadDespesas.CarregaRelatorio(const pReport: TfrxReport; tipo: Integer);
const
  SqlRecibo = ' select LPAD(d.id, 4, ''0'') as id,  d.data_despesa,    d.descricao ,  p.nome as pessoa , ' +
    ' CASE d.tipo_despesa WHEN  1 THEN ''VITRINE''WHEN 2 THEN ''ESCRITÓRIO''WHEN 3 THEN ''FUNCIONÁRIO'' ' +
    ' WHEN 4 THEN ''GADO''ELSE ''OUTROS''END as tipo_despesa,  d.valor, ' +
    ' case when p.cpf_pessoa is null then ''NÃO CADASTRADO'' else p.cpf_pessoa end as cpf_pessoa ' + ' from despesas d ' +
    ' left outer join pessoas p on (d.id_pessoa = p.id) ' + ' left outer join lotes l on (d.id_lote = l.Id) ' + ' where d.id = :id ';
begin

  recibo.Active := false;
  recibo.SQL.Clear;
  recibo.SQL.Add(SqlRecibo);
  recibo.Params.ParamByName('id').asInteger := Cod_Selecao;
  recibo.Active := true;

  frxRecibo.Variables['numRecibo'] := QuotedStr('06' + formatfloat('0000', recibo.FieldByName('id').AsFloat));
  frxRecibo.Variables['id'] := QuotedStr(formatfloat('0000', recibo.FieldByName('id').AsFloat));
  frxRecibo.Variables['tipoRecibo'] := QuotedStr('DESPESA DE ' + recibo.FieldByName('tipo_despesa').AsString);
  frxRecibo.Variables['nomePessoa'] := QuotedStr(recibo.FieldByName('pessoa').AsString);
  frxRecibo.Variables['CPF'] := QuotedStr(recibo.FieldByName('cpf_pessoa').AsString);
  frxRecibo.Variables['valor'] := QuotedStr(formatfloat('#,##0.00', recibo.FieldByName('valor').AsFloat));
  frxRecibo.Variables['extenso'] := QuotedStr(valorPorExtenso(recibo.FieldByName('valor').AsFloat));
  frxRecibo.Variables['descricao'] := QuotedStr(recibo.FieldByName('descricao').AsString);
  frxRecibo.Variables['data'] := QuotedStr(FormatDateTime('dd/mm/yyyy', recibo.FieldByName('data_despesa').AsFloat));

  pReport.PrepareReport;
  pReport.ShowPreparedReport;
end;

procedure TFrmCadDespesas.img_reciboClick(Sender: TObject);
begin
  inherited;
  CarregaRelatorio(frxRecibo, 0);
end;

function TFrmCadDespesas.AlteraDespesaLote(id: Integer; despesa, despesa_cbs: double): Integer;
const
  SQL = 'UPDATE agrojun.lotes SET despesa = :despesa, despesa_cbs = :despesa_cbs  WHERE id = :id';
  SQLItens =
    'UPDATE agrojun.lotes_itens SET valorporcbs_animais = :vc, valortotal_animais = :vt, despesa_cbs = :despesa_cbs WHERE ativo = 1 and id = :id';
  SQLSelectItens = 'SELECT * FROM agrojun.lotes_itens WHERE id_lote = :id';
var
  Query, qryAux: TFDQuery;
  i, Qtd: Integer;
begin
  try
    try
      Query := TFDQuery.Create(self);
      Query.Connection := dm.FDConnection;
      Query.FetchOptions.RowsetSize := 50000;
      Query.Active := false;
      Query.SQL.Clear;
      Query.SQL.Add(SQLSelectItens);
      Query.ParamByName('id').asInteger := id;
      Query.Open();

      qryAux := TFDQuery.Create(self);
      qryAux.Connection := dm.FDConnection;
      QryAux.FetchOptions.RowsetSize := 50000;
      qryAux.Active := false;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(SQLItens);
      Query.First;
      Qtd := 0;
      for i := 0 to Query.RecordCount - 1 do
      begin
        if Apagar = 0 then
        begin
          // ShowMessage(FloatToStr((despesa_cbs - (BuscarDespesaLote(StrToInt(copy(ed_Lote.Text, 0, 5)))/RetornaQtdCbsLote(copy(ed_Lote.Text, 0, 5))))));
          qryAux.ParamByName('vc').AsFloat := Query.FieldByName('valorporcbs_animais').AsFloat +
            (despesa_cbs - (BuscarDespesaLote(StrToInt(copy(ed_Lote.Text, 0, 5))) / RetornaQtdCbsLote(copy(ed_Lote.Text, 0, 5))));
          qryAux.ParamByName('vt').AsFloat := Query.FieldByName('valortotal_animais').AsFloat +
            (Query.FieldByName('quantidade').asInteger * (despesa_cbs - (BuscarDespesaLote(StrToInt(copy(ed_Lote.Text, 0, 5))) /
            RetornaQtdCbsLote(copy(ed_Lote.Text, 0, 5)))));
          qryAux.ParamByName('despesa_cbs').AsFloat := Query.FieldByName('despesa_cbs').AsFloat +
            (despesa_cbs - (BuscarDespesaLote(StrToInt(copy(ed_Lote.Text, 0, 5))) / RetornaQtdCbsLote(copy(ed_Lote.Text, 0, 5))));
        end
        else
        begin
          // ShowMessage(FloatToStr(((BuscarDespesaLote(StrToInt(copy(ed_Lote.Text, 0, 5)))/RetornaQtdCbsLote(copy(ed_Lote.Text, 0, 5))) - despesa_cbs)));
          // ShowMessage(FloatToStr(despesa) + ' | ' + FloattoStr(despesa_cbs));
          if despesa = 0 then
          begin
            qryAux.ParamByName('vc').AsFloat := Query.FieldByName('valorporcbs_animais').AsFloat - despesa_cbs;
            qryAux.ParamByName('vt').AsFloat := Query.FieldByName('valortotal_animais').AsFloat -
              ((Query.FieldByName('quantidade').asInteger * despesa_cbs));
            // (Query.FieldByName('quantidade').AsInteger * ((BuscarDespesaLote(StrToInt(copy(ed_Lote.Text, 0, 5)))/RetornaQtdCbsLote(copy(ed_Lote.Text, 0, 5)))) - despesa_cbs);
            qryAux.ParamByName('despesa_cbs').AsFloat := Query.FieldByName('despesa_cbs').AsFloat - despesa_cbs;

          end
          else
          begin
            qryAux.ParamByName('vc').AsFloat := Query.FieldByName('valorporcbs_animais').AsFloat -
              ((BuscarDespesaLote(StrToInt(copy(ed_Lote.Text, 0, 5))) / RetornaQtdCbsLote(copy(ed_Lote.Text, 0, 5))) - despesa_cbs);
            qryAux.ParamByName('vt').AsFloat := Query.FieldByName('valortotal_animais').AsFloat -
              ((Query.FieldByName('quantidade').asInteger * despesa) / RetornaQtdCbsLote(copy(ed_Lote.Text, 0, 5)));
            // (Query.FieldByName('quantidade').AsInteger * ((BuscarDespesaLote(StrToInt(copy(ed_Lote.Text, 0, 5)))/RetornaQtdCbsLote(copy(ed_Lote.Text, 0, 5)))) - despesa_cbs);
            qryAux.ParamByName('despesa_cbs').AsFloat := Query.FieldByName('despesa_cbs').AsFloat -
              ((BuscarDespesaLote(StrToInt(copy(ed_Lote.Text, 0, 5))) / RetornaQtdCbsLote(copy(ed_Lote.Text, 0, 5))) - despesa_cbs);
          end;
        end;

        qryAux.ParamByName('id').asInteger := Query.FieldByName('id').asInteger;
        qryAux.ExecSQL;
        Qtd := Qtd + Query.FieldByName('quantidade').asInteger;
        Query.Next
      end;

      Query.Active := false;
      Query.SQL.Clear;
      Query.SQL.Add(SQL);
      Query.ParamByName('despesa').AsFloat := despesa;
      Query.ParamByName('despesa_cbs').AsFloat := despesa / Qtd;
      Query.ParamByName('id').asInteger := id;
      Query.ExecSQL;
      Result := 1;
    except
      Result := 0;
    end;
  finally
    FreeAndNil(Query);
    FreeAndNil(qryAux);
  end;
end;

function TFrmCadDespesas.AlteraSaldo(id: Integer; saldo: double): Integer;
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
      Query.ParamByName('id').asInteger := id;
      Query.ExecSQL;
      Result := 1;
    except
      Result := 0;
    end;
  finally
    FreeAndNil(Query);
  end;
end;

function TFrmCadDespesas.BuscarDespesaLote(id: Integer): double;
const
  SQL = 'SELECT despesa from agrojun.lotes where id = :id';
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
    Query.ParamByName('id').asInteger := id;
    Query.Active := true;
    Result := Query.FieldByName('despesa').AsFloat;
  finally
    FreeAndNil(Query);
  end;
end;

function TFrmCadDespesas.BuscarSaldo(id: Integer): double;
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
    Query.ParamByName('id').asInteger := id;
    Query.Active := true;
    Result := Query.FieldByName('saldo').AsFloat;
  finally
    FreeAndNil(Query);
  end;
end;

procedure TFrmCadDespesas.cbx_FormaPagtoChangeTracking(Sender: TObject);
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

procedure TFrmCadDespesas.cbx_TipoDespesaChange(Sender: TObject);
begin
  inherited;
  if (cbx_TipoDespesa.ItemIndex <> 0) and (cbx_TipoDespesa.ItemIndex <> -1) then
  begin
    if (cbx_TipoDespesa.ItemIndex = 4) then
    begin
      Label9.Visible := true;
      ed_Lote.Visible := true;
    end
    else
    begin
      Label9.Visible := false;
      ed_Lote.Visible := false;
    end;
    HabilitaCampos;
  end
  else
  begin
    DesabilitaCampos;
    cbx_TipoDespesa.Enabled := true;
  end;
end;

procedure TFrmCadDespesas.ckb_GerarParcelaChange(Sender: TObject);
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

procedure TFrmCadDespesas.ConsultaBancoLotes;
const
  _SQLbanco = 'select id, numero, qtd_animais, nome from agrojun.lotes where ativo = 1 ';
var
  x: Integer;
  QBanco: TFDQuery;
  item: TListViewItem;
  txt: TListItemText;
begin

  try
    QBanco := TFDQuery.Create(self);
    QBanco.Connection := dm.FDConnection;
    qBanco.FetchOptions.RowsetSize := 50000;
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

procedure TFrmCadDespesas.ConsultaBancoPessoas;
const
  _SQLbanco = 'select id, nome, cpf_pessoa, telefone from agrojun.pessoas ';
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
      // lytInfoPessoa.Visible := false;
    end
    else
    begin
      lay_lstvaziaPessoa.Visible := false;
      // lytInfoPessoa.Visible := true;
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

procedure TFrmCadDespesas.ConsultaConta;
const
  _SQLbanco = 'SELECT cb.*, b.banco FROM agrojun.contas_bancarias cb left outer join bancos b on (cb.cod_banco = b.cod) ';
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

procedure TFrmCadDespesas.ConsultaDespesas;
const
  _SQLbanco = 'select d.*, p.nome, c.conta from agrojun.despesas as d              ' +
    'left outer join agrojun.pessoas as p on (p.id = d.id_pessoa)         ' +
    'left outer join agrojun.contas_bancarias as c on (c.id = d.id_conta ) ' +
    'order by d.data_despesa desc';
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
//    QBanco.ParamByName('mes').asInteger := StrToInt(FormatDateTime('MM', Now));
//    QBanco.ParamByName('ano').asInteger := StrToInt(FormatDateTime('YYYY', Now));
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

        txt := TListItemText(Objects.FindDrawable('lbl_tipo_despesa'));
        txt.Text := 'TIPO';

        txt := TListItemText(Objects.FindDrawable('lbl_descricao'));
        txt.Text := 'DESCRIÇÃO';

        txt := TListItemText(Objects.FindDrawable('lbl_pessoa'));
        txt.Text := 'PESSOA/EMPRESA';

        txt := TListItemText(Objects.FindDrawable('lbl_valor'));
        txt.Text := 'VALOR';

        txt := TListItemText(Objects.FindDrawable('lbl_conta'));
        txt.Text := 'CONTA BANCÁRIA';

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
        txt.Text := QBanco.FieldByName('data_despesa').AsString;

        txt := TListItemText(Objects.FindDrawable('tipo_despesa'));
        // VITRINE
        if QBanco.FieldByName('tipo_despesa').asInteger = 1 then
          txt.Text := 'VITRINE'
          // ESCRITÓRIO
        else if QBanco.FieldByName('tipo_despesa').asInteger = 2 then
          txt.Text := 'ESCRITÓRIO'
          // FUNCIONÁRIO
        else if QBanco.FieldByName('tipo_despesa').asInteger = 3 then
          txt.Text := 'FUNCIONÁRIO'
          // GADO
        else if QBanco.FieldByName('tipo_despesa').asInteger = 4 then
          txt.Text := 'GADO'
          // ARRENDAMENTO
           else if QBanco.FieldByName('tipo_despesa').asInteger = 5 then
          txt.Text := 'ARRENDAMENTO'
//        OUTROS
        else
          txt.Text := 'OUTROS';

        txt := TListItemText(Objects.FindDrawable('descricao'));
        txt.Text := QBanco.FieldByName('descricao').AsString;

        txt := TListItemText(Objects.FindDrawable('conta'));
        txt.Text := QBanco.FieldByName('conta').AsString;

        txt := TListItemText(Objects.FindDrawable('pessoa'));
        txt.Text := QBanco.FieldByName('nome').AsString;

        txt := TListItemText(Objects.FindDrawable('valor'));
        txt.Text := 'R$' + formatfloat('#,##0.00', QBanco.FieldByName('valor').AsFloat);
      end;

      QBanco.Next
    end;
  finally
    lst_Principal.EndUpdate;
    FreeAndNil(QBanco);
  end;
end;

procedure TFrmCadDespesas.ed_ContaEnter(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  if ed_Conta.Text.IsEmpty then
  begin
    ConsultaConta;
    ListViewConta.SearchVisible := true;
    for i := 0 to ListViewConta.Controls.Count - 1 do
      if ListViewConta.Controls[i].ClassType = TSearchBox then
      begin
        sbConta := TSearchBox(ListViewConta.Controls[i]);
        Break;
      end;
    sbConta.Height := 0;
    Tipo_Busca := 0;
    tab_Crud.ActiveTab := TabConta;
  end;
end;

procedure TFrmCadDespesas.ed_EntradaValorKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  FormatarMoeda(ed_EntradaValor, KeyChar);
end;

procedure TFrmCadDespesas.ed_LoteEnter(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  if ed_Lote.Text.IsEmpty then
  begin
    ConsultaBancoLotes;
    ListViewLote.SearchVisible := true;
    for i := 0 to ListViewLote.Controls.Count - 1 do
      if ListViewLote.Controls[i].ClassType = TSearchBox then
      begin
        sbLote := TSearchBox(ListViewLote.Controls[i]);
        Break;
      end;
    sbLote.Height := 0;
    Tipo_Busca := 0;
    tab_Crud.ActiveTab := TabLote;
  end;
end;

procedure TFrmCadDespesas.ed_PesquisaContaChangeTracking(Sender: TObject);
begin
  inherited;
  sbConta.Text := ed_PesquisaConta.Text;
end;

procedure TFrmCadDespesas.ed_PesquisaLoteChangeTracking(Sender: TObject);
begin
  inherited;
  sbLote.Text := ed_PesquisaLote.Text;
end;

procedure TFrmCadDespesas.ed_PesquisaPessoaChangeTracking(Sender: TObject);
begin
  inherited;
  sbPessoa.Text := ed_PesquisaPessoa.Text;
end;

procedure TFrmCadDespesas.ed_PessoaEnter(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  if ed_Pessoa.Text.IsEmpty then
  begin
    ConsultaBancoPessoas;
    ListViewPessoa.SearchVisible := true;
    for i := 0 to ListViewPessoa.Controls.Count - 1 do
      if ListViewPessoa.Controls[i].ClassType = TSearchBox then
      begin
        sbPessoa := TSearchBox(ListViewPessoa.Controls[i]);
        Break;
      end;
    sbPessoa.Height := 0;
    Tipo_Busca := 0;
    tab_Crud.ActiveTab := TabPessoa;
  end;
end;

procedure TFrmCadDespesas.ed_ValorKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  FormatarMoeda(ed_Valor, KeyChar);
end;

procedure TFrmCadDespesas.FormCreate(Sender: TObject);
begin
  inherited;
   cbx_FormaPagto.ItemIndex := 0;
    lay_GerarPac.Visible := false;
    lay_parc.Visible := false;
  ConsultaDespesas;
  ed_pesq.Enabled := true;
end;

procedure TFrmCadDespesas.Image16Click(Sender: TObject);
begin
  inherited;
tab_Crud.ActiveTab := TabItem2;
end;

procedure TFrmCadDespesas.Img_BtnCancelarClick(Sender: TObject);
const
  _SQLInicial = 'SELECT id_lote FROM agrojun.despesas WHERE id = :id';

  _SQLSemLote = 'select d.*, p.nome, c.conta from agrojun.despesas as d              ' +
    'left outer join agrojun.pessoas as p on (p.id = d.id_pessoa)         ' +
    'left outer join agrojun.contas_bancarias as c on (c.id = d.id_conta )' +
    'where d.id = :id_despesa                                                       ';

  _SQLComLote = 'select d.*, p.nome, c.conta, l.numero from agrojun.despesas as d     ' +
    'left outer join agrojun.pessoas as p on (p.id = d.id_pessoa)         ' +
    'left outer join agrojun.contas_bancarias as c on (c.id = d.id_conta )' +
    'left outer join agrojun.lotes as l on (l.id = d.id_lote )            ' +
    'where d.id = :id_despesa                                                       ';
var
  Query: TFDQuery;
begin
  inherited;
  DesabilitaCampos;
  DateEditDespesa.Date := Now;
  if Acao = 1 then
  begin
    cbx_TipoDespesa.Enabled := false;
    Query := TFDQuery.Create(self);
    Query.Connection := dm.FDConnection;
    Query.FetchOptions.RowsetSize := 50000;
    try
      Query.Active := false;
      Query.SQL.Clear;
      Query.SQL.Add(_SQLInicial);
      Query.ParamByName('id').asInteger := Cod_Selecao;
      Query.Active := true;
      if Query.FieldByName('id_lote').asInteger = 0 then
      begin
        Query.Active := false;
        Query.SQL.Clear;
        Query.SQL.Add(_SQLSemLote);
        Query.ParamByName('id_despesa').asInteger := Cod_Selecao;
        Query.Active := true;
      end
      else
      begin
        Query.Active := false;
        Query.SQL.Clear;
        Query.SQL.Add(_SQLComLote);
        Query.ParamByName('id_despesa').asInteger := Cod_Selecao;
        Query.Active := true;
      end;
      PopularCampos(Query);
    finally
      FreeAndNil(Query);
    end;
  end
  else
    cbx_TipoDespesa.Enabled := true;
  ed_pesq.Enabled := true;
  Label9.Visible := false;
  ed_Lote.Visible := false;
end;

procedure TFrmCadDespesas.Img_BtnEditarClick(Sender: TObject);
begin
  inherited;
  ValorTotal := (strtofloat(StringReplace(ed_Valor.Text, '.', '', [rfReplaceAll])));
end;

procedure TFrmCadDespesas.Img_BtnExcluirClick(Sender: TObject);
const
  SQL = 'DELETE FROM agrojun.despesas WHERE id = :id';
  SQLVefirifica = 'SELECT agrupado from lotes where id = :id';

  SqlDeletParcela = ' select sum(IFNULL(p.valor, 0) ) + IFNULL(d.entrada, 0) as valor, d.parcela from despesas d ' +
    ' left outer join parcelas p on (p.status = 1 and p.id_movimentacao = d.id and movimentacao = ''D'') ' + ' where d.id = :id ';
var
  Query, parcela: TFDQuery;
  DespesaAtualLote: double;
  QtdsCbsLoteAtual: Integer;
begin
  inherited;
  Query := TFDQuery.Create(self);
  Query.Connection := dm.FDConnection;
  Query.FetchOptions.RowsetSize := 50000;
  // APAGAR REGISTROS
  try
    Query.Active := false;
    Query.SQL.Clear;
    Query.SQL.Add(SQLVefirifica);
    if (not ed_Lote.Text.Equals('')) then
      Query.ParamByName('id').asInteger := StrToInt(copy(ed_Lote.Text, 0, 5))
    else
      Query.ParamByName('id').asInteger := 0;
    Query.Open();

    parcela := TFDQuery.Create(self);
    parcela.Connection := dm.FDConnection;
    parcela.FetchOptions.RowsetSize := 50000;
    parcela.Active := false;
    parcela.SQL.Clear;
    parcela.SQL.Add(SqlDeletParcela);
    parcela.ParamByName('id').asInteger := Cod_Selecao;
    parcela.Open;

    if Query.FieldByName('agrupado').asInteger <> 1 then
    begin

      if (not ed_Lote.Text.Equals('')) then
      begin
        DespesaAtualLote := BuscarDespesaLote(StrToInt(copy(ed_Lote.Text, 0, 5)));
        QtdsCbsLoteAtual := RetornaQtdCbsLote(copy(ed_Lote.Text, 0, 5));
        Apagar := 1;

        AlteraDespesaLote(StrToInt(copy(ed_Lote.Text, 0, 5)),
          DespesaAtualLote - (strtofloat(StringReplace(ed_Valor.Text, '.', '', [rfReplaceAll]))),
          (((strtofloat(StringReplace(ed_Valor.Text, '.', '', [rfReplaceAll])))) / QtdsCbsLoteAtual))

      end;
      Query.Active := false;
      Query.SQL.Clear;
      Query.SQL.Add(SQL);
      Query.ParamByName('id').asInteger := Cod_Selecao;
      Query.ExecSQL;

      if parcela.FieldByName('parcela').asInteger = 0 then
        AlteraSaldo(StrToInt(copy(ed_Conta.Text, 0, 5)), BuscarSaldo(StrToInt(copy(ed_Conta.Text, 0, 5))) +
          (strtofloat(StringReplace(ed_Valor.Text, '.', '', [rfReplaceAll]))))
      else
        AlteraSaldo(StrToInt(copy(ed_Conta.Text, 0, 5)), BuscarSaldo(StrToInt(copy(ed_Conta.Text, 0, 5))) +
          (parcela.FieldByName('valor').AsFloat));

      parcela.Active := false;
      parcela.SQL.Clear;
      parcela.SQL.Add(' delete from parcelas where movimentacao = ''D'' and id_movimentacao = :id ');
      parcela.ParamByName('id').asInteger := Cod_Selecao;
      parcela.ExecSQL;

      ShowMessage('Registro excluído com sucesso!');
    end
    else
    begin
      ShowMessage('Não é possível excluir essa despesa, pois já foi feita alguma ' + sLineBreak +
        ' transferência de gado após o cadastramento desta despesa!');
      abort
    end;

  finally
    FreeAndNil(Query);
    LimpaCampos;
    ConsultaDespesas;
    LogDespesas;
    tab_Crud.ActiveTab := TabItem1;
  end;
end;

procedure TFrmCadDespesas.Img_BtnNovoClick(Sender: TObject);
begin
  inherited;
   cbx_FormaPagto.ItemIndex := 0;
  cdsParc.EmptyDataSet;
  img_recibo.Visible := false;
  DesabilitaCampos;
  ConsultaFormaPagto;
  cbx_TipoDespesa.Enabled := true;
end;

procedure TFrmCadDespesas.Img_BtnSalvarClick(Sender: TObject);
const
  SQLInsert =
    'INSERT INTO agrojun.despesas (data_despesa, id_pessoa, id_conta, id_lote, descricao, valor, tipo_despesa, forma_pagamento, parcela, entrada) '
    + ' VALUES (:data_despesa, :id_pessoa, :id_conta, :id_lote, :descricao, :valor, :tipo_despesa, :forma_pagamento, :parcela, :entrada)';
  SQLUpdate = 'UPDATE agrojun.despesas SET data_despesa = :data_despesa, id_pessoa = :id_pessoa, id_conta = :id_conta, id_lote = :id_lote, '
    + ' descricao = :descricao, valor = :valor, tipo_despesa = :tipo_despesa ' + ' WHERE id = :id';

var
  Query: TFDQuery;
  ValorTotalAtual, DespesaAtual, despesa_cbs: double;
  QtdAnimais: Integer;
begin
  inherited;
  Validar(0);

  // if BuscarSaldo(StrToInt(copy(ed_Conta.Text, 0, 3))) < strtofloat(StringReplace(ed_Valor.Text, '.', '', [rfReplaceAll])) then
  // begin
  // ShowMessage('A conta selecionada não tem saldo suficiente para abater essa despesa. '+
  // ' Acesse o menu CONTAS BANCÁRIAS e tenha mais informações!');
  // Img_BtnCancelarClick(self);
  // end
  // else
  // begin
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
      Query.ParamByName('id').asInteger := Cod_Selecao;
    end;

    // AlteraSaldo(StrToInt(copy(ed_Conta.Text, 0, 5)), BuscarSaldo(StrToInt(copy(ed_Conta.Text, 0, 5))) - strtofloat(StringReplace(ed_Valor.Text, '.', '', [rfReplaceAll])));

    Query.ParamByName('data_despesa').AsDateTime := DateEditDespesa.Date;
    Query.ParamByName('id_pessoa').asInteger := StrToInt(copy(ed_Pessoa.Text, 0, 5));
    Query.ParamByName('id_conta').asInteger := StrToInt(copy(ed_Conta.Text, 0, 5));

    Query.ParamByName('tipo_despesa').asInteger := StrToInt(copy(cbx_TipoDespesa.Items[cbx_TipoDespesa.ItemIndex], 0, 3));
    Query.ParamByName('valor').AsFloat := strtofloat(StringReplace(ed_Valor.Text, '.', '', [rfReplaceAll]));
    Query.ParamByName('descricao').AsString := ed_Obs.Text;
    Query.ParamByName('forma_pagamento').asInteger := cbx_FormaPagto.ItemIndex;

    if  ((ed_EntradaValor.Text <> '0') and (ckb_GerarParcela.IsChecked)) then
      Query.ParamByName('entrada').AsFloat := strtofloat(StringReplace(ed_EntradaValor.Text, '.', '', [rfReplaceAll]))
    else
      Query.ParamByName('entrada').AsFloat := 0;

    if ckb_GerarParcela.IsChecked then
      Query.ParamByName('parcela').asInteger := 1
    else
      Query.ParamByName('parcela').asInteger := 0;

    if not ed_Lote.Text.IsEmpty then
      Query.ParamByName('id_lote').asInteger := StrToInt(copy(ed_Lote.Text, 0, 5))
    else
      Query.ParamByName('id_lote').asInteger := 0;

    Query.ExecSQL;
    if Acao = 0 then
    begin

      if not(ckb_GerarParcela.IsChecked) then
      begin
        AlteraSaldo(StrToInt(copy(ed_Conta.Text, 0, 5)), BuscarSaldo(StrToInt(copy(ed_Conta.Text, 0, 5))) -
          (strtofloat(StringReplace(ed_Valor.Text, '.', '', [rfReplaceAll]))));
      end
      else
      begin
        GravaParcelas('D', MaxCod('despesas') - 1, StrToInt(copy(ed_Conta.Text, 0, 5)), StrToInt(copy(ed_Pessoa.Text, 0, 5)));
        AlteraSaldo(StrToInt(copy(ed_Conta.Text, 0, 5)), BuscarSaldo(StrToInt(copy(ed_Conta.Text, 0, 5))) -
          (strtofloat(StringReplace(ed_EntradaValor.Text, '.', '', [rfReplaceAll]))));
      end;

      if not ed_Lote.Text.IsEmpty then
      begin
        QtdAnimais := RetornaQtdCbsLote(copy(ed_Lote.Text, 0, 5));
        DespesaAtual := BuscarDespesaLote(StrToInt(copy(ed_Lote.Text, 0, 5)));
        if QtdAnimais <> 0 then
        begin
          Apagar := 0;
          despesa_cbs := (DespesaAtual + (strtofloat(StringReplace(ed_Valor.Text, '.', '', [rfReplaceAll])))) / QtdAnimais;
          AlteraDespesaLote(StrToInt(copy(ed_Lote.Text, 0, 5)),
            (DespesaAtual + (strtofloat(StringReplace(ed_Valor.Text, '.', '', [rfReplaceAll])))), despesa_cbs);
        end;
      end
    end
    else
    begin
      ValorTotalAtual := (strtofloat(StringReplace(ed_Valor.Text, '.', '', [rfReplaceAll])));
      if ValorTotalAtual > ValorTotal then
      begin
        AlteraSaldo(StrToInt(copy(ed_Conta.Text, 0, 5)), BuscarSaldo(StrToInt(copy(ed_Conta.Text, 0, 5))) - (ValorTotalAtual - ValorTotal));
      end
      else
      begin
        AlteraSaldo(StrToInt(copy(ed_Conta.Text, 0, 5)), BuscarSaldo(StrToInt(copy(ed_Conta.Text, 0, 5))) + (ValorTotal - ValorTotalAtual));
      end;

      if not ed_Lote.Text.IsEmpty then
      begin
        QtdAnimais := RetornaQtdCbsLote((copy(ed_Lote.Text, 0, 5)));
        DespesaAtual := BuscarDespesaLote(StrToInt(copy(ed_Lote.Text, 0, 5)));
        despesa_cbs := DespesaAtual / QtdAnimais;

        if ValorTotalAtual > DespesaAtual then
        begin
          AlteraDespesaLote(StrToInt(copy(ed_Lote.Text, 0, 5)), DespesaAtual + (ValorTotalAtual - DespesaAtual),
            ((DespesaAtual + (ValorTotalAtual - DespesaAtual)) / QtdAnimais));
        end
        else
        begin
          AlteraDespesaLote(StrToInt(copy(ed_Lote.Text, 0, 5)), DespesaAtual - (DespesaAtual - ValorTotalAtual),
            ((DespesaAtual - (DespesaAtual - ValorTotalAtual)) / QtdAnimais));
        end;
      end;
    end;

    LogDespesas;

  finally
    LimpaCampos;
    ConsultaDespesas;
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
  // end;

end;

procedure TFrmCadDespesas.Img_BtnVoltarClick(Sender: TObject);
begin
  inherited;
  ListViewPessoa.Items.Clear;
  ListViewConta.Items.Clear;
  ListViewLote.Items.Clear;
  ed_PesquisaPessoa.Text := EmptyStr;
  ed_PesquisaConta.Text := EmptyStr;
  ed_PesquisaLote.Text := EmptyStr;
  tab_Crud.ActiveTab := TabItem1;
end;

procedure TFrmCadDespesas.ListViewContaItemClick(const Sender: TObject; const AItem: TListViewItem);
const
  _SQLView = 'SELECT cb.*, b.banco FROM agrojun.contas_bancarias cb left outer join bancos b on (cb.cod_banco = b.cod) where cb.id = :cod';
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
        Query.ParamByName('cod').asInteger := Cod_Selecao;
        Query.Active := true;

        if Query.RecordCount > 0 then
        begin
          if Tipo_Busca = 0 then
          begin
            ed_Conta.Text := formatfloat('00000', Query.FieldByName('id').AsFloat) + ' - ' + Query.FieldByName('conta').AsString;
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

procedure TFrmCadDespesas.ListViewLoteItemClick(const Sender: TObject; const AItem: TListViewItem);
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
        Query.ParamByName('id').asInteger := txt.TagString.ToInteger;
        Query.Active := true;

        if Query.RecordCount > 0 then
        begin
          if Tipo_Busca = 0 then
          begin
            ed_Lote.Text := formatfloat('00000', Query.FieldByName('id').AsFloat) + ' - ' + Query.FieldByName('numero').AsString;
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

procedure TFrmCadDespesas.ListViewPessoaItemClick(const Sender: TObject; const AItem: TListViewItem);
const
  _SQLView = 'select p.*, e.QtdMun from agrojun.pessoas as p left outer join agrojun.estado as e on (p.estado = e.id) where p.id = :id';
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
        Query.ParamByName('id').asInteger := txt.TagString.ToInteger;
        Query.Active := true;

        if Query.RecordCount > 0 then
        begin
          if Tipo_Busca = 0 then
          begin
            ed_Pessoa.Text := formatfloat('00000', Query.FieldByName('id').AsFloat) + ' - ' + Query.FieldByName('nome').AsString;
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

procedure TFrmCadDespesas.LogDespesas;
begin
  if Acao = 0 then
  begin
    log(0005, MaxCod('despesas'), '', ' tipo_despesa: ' + copy(cbx_TipoDespesa.Text, 0, 3) + ' data_despesa: ' +
      DateToStr(DateEditDespesa.Date) + ' id_pessoa: ' + copy(ed_Pessoa.Text, 0, 3) + ' id_conta: ' + copy(ed_Conta.Text, 0, 3) +
      ' id_lote: ' + copy(ed_Lote.Text, 0, 3) + ' valor: ' + ed_Valor.Text + ' descricao: ' + ed_Obs.Text);
  end;

  if Acao = 1 then
  begin

    log(0005, cds_log.FieldByName('id').asInteger, ' tipo_despesa: ' + cds_log.FieldByName('tipo_despesa').AsString + ' data_despesa: ' +
      cds_log.FieldByName('data_despesa').AsString + ' id_pessoa: ' + cds_log.FieldByName('id_pessoa').AsString + ' id_conta: ' +
      cds_log.FieldByName('id_conta').AsString + ' id_lote: ' + cds_log.FieldByName('id_lote').AsString + ' valor: ' +
      cds_log.FieldByName('valor').AsString + ' descricao: ' + cds_log.FieldByName('descricao').AsString,

      ' tipo_despesa: ' + copy(cbx_TipoDespesa.Text, 0, 3) + ' data_despesa: ' + DateToStr(DateEditDespesa.Date) + ' id_pessoa: ' +
      copy(ed_Pessoa.Text, 0, 3) + ' id_conta: ' + copy(ed_Conta.Text, 0, 3) + ' id_lote: ' + copy(ed_Lote.Text, 0, 3) + ' valor: ' +
      ed_Valor.Text + ' descricao: ' + ed_Obs.Text);
  end;

  if Acao = 2 then
  begin
    log(0005, cds_log.FieldByName('id').asInteger, ' tipo_despesa: ' + cds_log.FieldByName('tipo_despesa').AsString + ' data_despesa: ' +
      cds_log.FieldByName('data_despesa').AsString + ' id_pessoa: ' + cds_log.FieldByName('id_pessoa').AsString + ' id_conta: ' +
      cds_log.FieldByName('id_conta').AsString + ' id_lote: ' + cds_log.FieldByName('id_lote').AsString + ' valor: ' +
      cds_log.FieldByName('valor').AsString + ' descricao: ' + cds_log.FieldByName('descricao').AsString, '')
  end;
end;

procedure TFrmCadDespesas.lst_PrincipalItemClick(const Sender: TObject; const AItem: TListViewItem);
const
  _SQLInicial = 'SELECT id_lote FROM agrojun.despesas WHERE id = :id';

  _SQLSemLote = 'select d.*,f.forma_pagto, p.nome, c.conta from agrojun.despesas as d              ' +
    'left outer join agrojun.pessoas as p on (p.id = d.id_pessoa)         ' +
    'left outer join agrojun.contas_bancarias as c on (c.id = d.id_conta )    left outer join agrojun.forma_pagamento as f on (d.forma_pagamento = f.id )' +
    'where d.id = :id_despesa                                                       ';

  _SQLComLote = 'select d.*,f.forma_pagto, p.nome, c.conta, l.numero from agrojun.despesas as d     ' +
    'left outer join agrojun.pessoas as p on (p.id = d.id_pessoa)         ' +
    'left outer join agrojun.contas_bancarias as c on (c.id = d.id_conta )' +
    'left outer join agrojun.lotes as l on (l.id = d.id_lote )     left outer join agrojun.forma_pagamento as f on (d.forma_pagamento = f.id )           ' +
    'where d.id = :id_despesa                                                       ';

  sqlparcela = ' select num_parc, DATE_FORMAT(data, "%d/%m/%Y") as data, valor, ' + ' case ' +
    ' when (data < CURDATE() and status = 0) then ''VENCIDA'' ' + ' when (status = 0) then ''ABERTO'' ' +
    ' when (status = 1) then ''PAGO'' ' + ' END as status ' + ' from parcelas ' + ' where movimentacao = ''D'' and id_movimentacao = :id ';

var

  txt: TListItemText;
  Query, qry: TFDQuery;
  id: string;
begin
  inherited;

  img_recibo.Visible := true;
  Label9.Visible := false;
  ed_Lote.Visible := false;
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
        Query.SQL.Add(_SQLInicial);
        Query.ParamByName('id').asInteger := txt.TagString.ToInteger;
        Query.Active := true;
        if Query.FieldByName('id_lote').asInteger = 0 then
        begin
          Query.Active := false;
          Query.SQL.Clear;
          Query.SQL.Add(_SQLSemLote);
          Query.ParamByName('id_despesa').asInteger := txt.TagString.ToInteger;
          Query.Active := true;
        end
        else
        begin
          Query.Active := false;
          Query.SQL.Clear;
          Query.SQL.Add(_SQLComLote);
          Query.ParamByName('id_despesa').asInteger := txt.TagString.ToInteger;
          Query.Active := true;
        end;

        qry := TFDQuery.Create(nil);
        qry.Connection := dm.FDConnection;
        qry.Close;
        qry.SQL.Clear;
        qry.Active := false;
        qry.SQL.Clear;
        qry.SQL.Add(sqlparcela);
        qry.Params.ParamByName('id').asInteger := txt.TagString.ToInteger;
        qry.Open;
        cdsParc.EmptyDataSet;
        cdsParc.CopyDataSet(qry);

        cds_log.Active := false;
        cds_log.Active := true;
        cds_log.EmptyDataSet;
        cds_log.insert;
        cds_log.FieldByName('id').AsString := IntToStr(Cod_Selecao);
        cds_log.FieldByName('data_despesa').AsString := Query.FieldByName('data_despesa').AsString;
        cds_log.FieldByName('id_pessoa').AsString := Query.FieldByName('id_pessoa').AsString;;
        cds_log.FieldByName('id_conta').AsString := Query.FieldByName('id_conta').AsString;
        cds_log.FieldByName('id_lote').AsString := Query.FieldByName('id_lote').AsString;
        cds_log.FieldByName('tipo_despesa').AsString := Query.FieldByName('tipo_despesa').AsString;
        cds_log.FieldByName('valor').AsString := Query.FieldByName('valor').AsString;
        cds_log.FieldByName('descricao').AsString := Query.FieldByName('descricao').AsString;
        cds_log.Post;

        if Query.RecordCount > 0 then
        begin
          PopularCampos(Query);
          Img_BtnEditar.Visible := false;

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

procedure TFrmCadDespesas.PopulaListFiltros(QBanco: TFDQuery);
var
  x: Integer;
  // QBanco: TFDQuery;
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

        txt := TListItemText(Objects.FindDrawable('lbl_tipo_despesa'));
        txt.Text := 'TIPO';

        txt := TListItemText(Objects.FindDrawable('lbl_descricao'));
        txt.Text := 'DESCRIÇÃO';

        txt := TListItemText(Objects.FindDrawable('lbl_pessoa'));
        txt.Text := 'PESSOA/EMPRESA';

        txt := TListItemText(Objects.FindDrawable('lbl_valor'));
        txt.Text := 'VALOR';

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
        txt.Text := QBanco.FieldByName('data_despesa').AsString;

        txt := TListItemText(Objects.FindDrawable('tipo_despesa'));
        // VITRINE
        if QBanco.FieldByName('tipo_despesa').asInteger = 1 then
          txt.Text := 'VITRINE'
          // ESCRITÓRIO
        else if QBanco.FieldByName('tipo_despesa').asInteger = 2 then
          txt.Text := 'ESCRITÓRIO'
          // FUNCIONÁRIO
        else if QBanco.FieldByName('tipo_despesa').asInteger = 3 then
          txt.Text := 'FUNCIONÁRIO'
          // GADO
        else if QBanco.FieldByName('tipo_despesa').asInteger = 4 then
          txt.Text := 'GADO'
          // OUTROS
        else
          txt.Text := 'OUTROS';

        txt := TListItemText(Objects.FindDrawable('descricao'));
        txt.Text := QBanco.FieldByName('descricao').AsString;

        txt := TListItemText(Objects.FindDrawable('pessoa'));
        txt.Text := QBanco.FieldByName('nome').AsString;

        txt := TListItemText(Objects.FindDrawable('valor'));
        txt.Text := 'R$' + formatfloat('#,##0.00', QBanco.FieldByName('valor').AsFloat);
      end;

      QBanco.Next
    end;
  finally
    lst_Principal.EndUpdate;
    FreeAndNil(QBanco);
  end;
end;

procedure TFrmCadDespesas.PopularCampos(Query: TFDQuery);
var
  pessoa, conta, lote: string;
begin
  // TIPO DE DESPESA
  cbx_TipoDespesa.ItemIndex := Query.FieldByName('tipo_despesa').asInteger;
  // DATA DA DESPESA
  DateEditDespesa.Date := Query.FieldByName('data_despesa').AsDateTime;
  // NOME PESSOA/EMPRESA COM O CODIGO (ID)
  ed_Pessoa.Text := formatfloat('00000', Query.FieldByName('id_pessoa').AsFloat) + ' - ' + Query.FieldByName('nome').AsString;
  // pessoa + ' - ' + Query.FieldByName('nome').AsString;
  // NUMERO DA CONTA COM O CODIGO (ID)
  ed_Conta.Text := formatfloat('00000', Query.FieldByName('id_conta').AsFloat) + ' - ' + Query.FieldByName('conta').AsString;
  // NUMERO DO LOTE COM O CODIGO (ID) - CASO A DESPESA TENHA UM LOTE VINCULADO
  if Query.FieldByName('tipo_despesa').asInteger = 4 then
  begin
    ed_Lote.Text := formatfloat('00000', Query.FieldByName('id_lote').AsFloat) + ' - ' + Query.FieldByName('numero').AsString;
    Label9.Visible := true;
    ed_Lote.Visible := true;
  end;


  cbx_FormaPagto.Text := Query.FieldByName('forma_pagto').asString;

    case Query.FieldByName('parcela').asInteger of
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


  // VALOR DA DESPESA
  ed_Valor.Text := Query.FieldByName('valor').AsString;

  // DESCRICAO
  ed_Obs.Text := Query.FieldByName('descricao').AsString;
end;

procedure TFrmCadDespesas.rctApagarSelecionadosClick(Sender: TObject);
begin
  inherited;
  cdsParc.EmptyDataSet;
  cdsParc.Refresh;
end;

procedure TFrmCadDespesas.Rectangle14Click(Sender: TObject);
begin
  inherited;

  GeraParcelas(DateEditDespesa.Date, cbx_Parc.ItemIndex, StrToInt(ed_DiasParc.Text),
    (strtofloat(StringReplace(ed_Valor.Text, '.', '', [rfReplaceAll])) - strtofloat(StringReplace(ed_EntradaValor.Text, '.', '',
    [rfReplaceAll]))));
  cdsParc.Refresh;
end;

procedure TFrmCadDespesas.Rectangle15Click(Sender: TObject);
begin
  inherited;
  lay_parc.Visible := false;
end;

procedure TFrmCadDespesas.Rectangle16Click(Sender: TObject);
begin
  inherited;

  if (ed_Valor.Text = EmptyStr) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 5003 : ' + sLineBreak + 'Informe o VALOR da despesa!';
    ed_Valor.SetFocus;
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

function TFrmCadDespesas.RetornaQtdCbsLote(numero: string): Integer;
const
  _SQL = 'select qtd_animais from agrojun.lotes where id = :id';
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.Create(nil);
    qry.Connection := dm.FDConnection;
    qry.Active := false;
    qry.SQL.Clear;
    qry.SQL.Text := _SQL;
    qry.ParamByName('id').asInteger := StrToInt(numero);
    qry.Active := true;
    if not qry.IsEmpty then
      Result := qry.FieldByName('qtd_animais').asInteger
    else
      Result := 0;
  finally
    FreeAndNil(qry);
  end;
end;

procedure TFrmCadDespesas.Validar(cod_vali: Integer);
begin
  if (ed_Pessoa.Text = EmptyStr) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 5001 : ' + sLineBreak + 'Selecione uma PESSOA/EMPRESA!';
    ed_Pessoa.SetFocus;
    abort;
  end;

  if (ed_Conta.Text = EmptyStr) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 5002 : ' + sLineBreak + 'Selecione uma CONTA!';
    ed_Conta.SetFocus;
    abort;
  end;

  if cbx_TipoDespesa.ItemIndex = 4 then
  begin
    if (ed_Lote.Text = EmptyStr) then
    begin
      lay_error.Visible := true;
      lbl_Erro.Text := 'Erro 5005 : ' + sLineBreak + 'Selecione um LOTE!';
      ed_Lote.SetFocus;
      abort;
    end;
  end;

  if (ed_Valor.Text = EmptyStr) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 5003 : ' + sLineBreak + 'Informe o VALOR da despesa!';
    ed_Valor.SetFocus;
    abort;
  end;

  if (ed_Obs.Text = EmptyStr) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 5004 : ' + sLineBreak + 'Informe a DESCRIÇÃO da despesa!';
    ed_Obs.SetFocus;
    abort;
  end;

  if (cbx_FormaPagto.ItemIndex = 0) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 5005 : ' + sLineBreak + 'Informe a FORMA DE PAGAMENTO da despesa!';
    ed_Obs.SetFocus;
    abort;
  end;
end;

end.
