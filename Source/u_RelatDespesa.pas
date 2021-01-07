unit u_RelatDespesa;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  u_CrudRelat, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts,
  FMX.frxClass, FMX.frxDBSet, FMX.Edit, FMX.ComboEdit, FMX.TabControl,
  FMX.DateTimeCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView,
  FMX.SearchBox;

type
  TFrmRelatDespesa = class(TFrmCrudRelat)
    frxDBDataset1: TfrxDBDataset;
    lytPessoa: TLayout;
    Label16: TLabel;
    lytConta: TLayout;
    Label17: TLabel;
    lytData: TLayout;
    dt_inicio: TDateEdit;
    Label14: TLabel;
    lytLote: TLayout;
    Label15: TLabel;
    lay_tipoDespesa: TLayout;
    Label2: TLabel;
    cbx_TipoDespesa: TComboEdit;
    Label1: TLabel;
    dt_fim: TDateEdit;
    QRelat: TFDQuery;
    frxRelatorioDespesas: TfrxReport;
    FDQuery1: TFDQuery;
    FDQuery2: TFDQuery;
    FDQuery3: TFDQuery;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    lay_lstvaziaPessoa: TLayout;
    Image3: TImage;
    Label41: TLabel;
    Layout2: TLayout;
    Rectangle5: TRectangle;
    ed_PesquisaPessoa: TEdit;
    ClearEditButton3: TClearEditButton;
    Label42: TLabel;
    Label47: TLabel;
    Layout15: TLayout;
    Rectangle4: TRectangle;
    Layout16: TLayout;
    Image5: TImage;
    ListViewPessoa: TListView;
    edTms_Cliente: TEdit;
    lay_lstvaziaConta: TLayout;
    Image4: TImage;
    Label43: TLabel;
    Layout12: TLayout;
    Rectangle10: TRectangle;
    ed_PesquisaConta: TEdit;
    ClearEditButton8: TClearEditButton;
    Label48: TLabel;
    Label49: TLabel;
    Layout17: TLayout;
    Rectangle8: TRectangle;
    Layout18: TLayout;
    Image2: TImage;
    ListViewConta: TListView;
    edTms_ContaBancaria: TEdit;
    lay_lstvaziaLote: TLayout;
    Image6: TImage;
    Label39: TLabel;
    Layout26: TLayout;
    Rectangle14: TRectangle;
    Layout27: TLayout;
    Image20: TImage;
    Layout9: TLayout;
    Rectangle11: TRectangle;
    ed_PesquisaLote: TEdit;
    ClearEditButton7: TClearEditButton;
    Label44: TLabel;
    Label46: TLabel;
    ListViewLote: TListView;
    edTms_Lote: TEdit;
    procedure Img_GerarRelatorioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbx_TipoRelatChange(Sender: TObject);
    procedure ed_PesquisaPessoaChangeTracking(Sender: TObject);
    procedure ListViewPessoaItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure Image5Click(Sender: TObject);
    procedure edTms_ClienteEnter(Sender: TObject);
    procedure ed_PesquisaContaChangeTracking(Sender: TObject);
    procedure ListViewContaItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure edTms_ContaBancariaEnter(Sender: TObject);
    procedure ed_PesquisaLoteChangeTracking(Sender: TObject);
    procedure ListViewLoteItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure edTms_LoteEnter(Sender: TObject);
  private
    { Private declarations }
    sbPessoa: TSearchBox;
    sbLote: TSearchBox;
    sbConta: TSearchBox;
    procedure CarregaRelatorio(const pReport: TfrxReport);
    procedure ConsultaBancoPessoas;
    procedure ConsultaConta;
    procedure ConsultaBancoLotes;
  public
    { Public declarations }
  end;

var
  FrmRelatDespesa: TFrmRelatDespesa;

implementation

{$R *.fmx}

uses u_DM, Winapi.Windows;

procedure TFrmRelatDespesa.Image5Click(Sender: TObject);
begin
  inherited;
  TabControl1.ActiveTab := TabItem1;
end;

procedure TFrmRelatDespesa.Img_GerarRelatorioClick(Sender: TObject);
const
  SqlDespesa =
    'select LPAD(d.id, 4, ''0'') as id, DATE_FORMAT( d.data_despesa, ''%d/%m/%Y'' ) AS data, C.conta,   d.descricao ,  concat(LPAD(p.id, 4, ''0''), '' - '', p.nome) as pessoa , '
    + 'CASE d.tipo_despesa ' + 'WHEN  1 THEN ''VITRINE'' ' + 'WHEN 2 THEN ''ESCRITÓRIO'' ' + 'WHEN 3 THEN ''FUNCIONÁRIO'' ' +
    'WHEN 4 THEN ''GADO'' ' + 'WHEN  5 THEN ''ARRENDAMENTO'' ' + 'ELSE ''OUTROS'' ' + 'END as tipo_despesa,  d.valor ' +
     'from despesas d ' +
    'left outer join pessoas p on (d.id_pessoa = p.id) ' +
     'left outer join contas_bancarias c on (d.id_conta = c.Id) ' +
    'left outer join lotes l on (d.id_lote = l.Id) ';
begin

  QRelat.Close;
  QRelat.SQL.Clear;
  QRelat.SQL.Add(SqlDespesa);
  case cbx_tipoRelat.ItemIndex of
    1:
      QRelat.SQL.Add('where DATE_FORMAT(d.data_despesa, ''%d/%m/%Y'')BETWEEN ' + QuotedStr(datetoStr(dt_inicio.Date)) + ' and ' +
        QuotedStr(datetoStr(dt_fim.Date)));
    2:
      QRelat.SQL.Add('WHERE l.Id = ' + QuotedStr(edTms_Lote.Text) + ' and DATE_FORMAT(d.data_despesa, ''%d/%m/%Y'')' + 'BETWEEN' +
        QuotedStr(datetoStr(dt_inicio.Date)) + ' and ' + QuotedStr(datetoStr(dt_fim.Date)));
    3:
      QRelat.SQL.Add(' where p.nome = ' + QuotedStr(edTms_Cliente.Text) + ' and DATE_FORMAT(d.data_despesa, ''%d/%m/%Y'')' + 'BETWEEN' +
        QuotedStr(datetoStr(dt_inicio.Date)) + ' and ' + QuotedStr(datetoStr(dt_fim.Date)));
    4:
      QRelat.SQL.Add('where c.conta = ' + QuotedStr(edTms_ContaBancaria.Text) + ' and DATE_FORMAT(d.data_despesa, ''%d/%m/%Y'')' + 'BETWEEN'
        + QuotedStr(datetoStr(dt_inicio.Date)) + ' and ' + QuotedStr(datetoStr(dt_fim.Date)));
    5:
      begin
        if cbx_TipoDespesa.ItemIndex = 7 then
          QRelat.SQL.Add(' where DATE_FORMAT(d.data_despesa, ''%d/%m/%Y'')' + 'BETWEEN' + QuotedStr(datetoStr(dt_inicio.Date)) + ' and ' +
            QuotedStr(datetoStr(dt_fim.Date)))
        else
          QRelat.SQL.Add(' where tipo_despesa = ' + QuotedStr(cbx_TipoDespesa.ItemIndex.ToString) +
            ' and DATE_FORMAT(d.data_despesa, ''%d/%m/%Y'')' + 'BETWEEN' + QuotedStr(datetoStr(dt_inicio.Date)) + ' and ' +
            QuotedStr(datetoStr(dt_fim.Date)));
      end;

  end;
  // ShowMessage(QRelat.SQL.Text);
  QRelat.Active := True;

  CarregaRelatorio(frxRelatorioDespesas);

end;

procedure TFrmRelatDespesa.ListViewContaItemClick(const Sender: TObject; const AItem: TListViewItem);
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
      TabControl1.ActiveTab := TabItem2;
      with AItem do
      begin

        txt := TListItemText(Objects.FindDrawable('codigo'));
//        Cod_Selecao := txt.TagString.ToInteger;
        Query.Active := false;
        Query.SQL.Clear;
        Query.SQL.Add(_SQLView);
        Query.ParamByName('cod').AsInteger := txt.TagString.ToInteger;
        Query.Active := true;

        if Query.RecordCount > 0 then
        begin
            edTms_ContaBancaria.Text :=  Query.FieldByName('conta').AsString;
            TabControl1.ActiveTab := TabItem1;
        end
        else
        begin
          ShowMessage('Não foi possível carregar o dados dessa conta. Tente outra vez.');
          TabControl1.ActiveTab := TabItem1;
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

procedure TFrmRelatDespesa.ListViewLoteItemClick(const Sender: TObject; const AItem: TListViewItem);
const
  _SQLView = 'SELECT l.*, c.idade_animal, c.raca_animal, c.sexo_animal FROM agrojun.lotes as l  ' +
    'left outer join compras_itens as c on (c.id_compra = l.id_compra)                  ' +
    'where l.id = :id ;                                                                   ';
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
      with AItem do
      begin

        txt := TListItemText(Objects.FindDrawable('codigo'));
        Query.Active := false;
        Query.SQL.Clear;
        Query.SQL.Add(_SQLView);
        Query.ParamByName('id').AsInteger := txt.TagString.ToInteger;
        Query.Active := true;

        if Query.RecordCount > 0 then
        begin
            edTms_Lote.Text := formatfloat('00000', Query.FieldByName('id').AsFloat);
            TabControl1.ActiveTab := TabItem1;
        end
        else
        begin
          ShowMessage('Não foi possível carregar o dados desse lote. Tente outra vez.');
          TabControl1.ActiveTab := TabItem1;
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

procedure TFrmRelatDespesa.ListViewPessoaItemClick(const Sender: TObject; const AItem: TListViewItem);
const
  _SQLView = 'select p.*, e.QtdMun from agrojun.pessoas as p left outer join agrojun.estado as e on (p.estado = e.id) where p.id = :id';
var
  txt: TListItemText;
  Query: TFDQuery;
  id: string;
begin
  inherited;
  ed_PesquisaPessoa.Enabled := True;
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
        Query.Active := false;
        Query.SQL.Clear;
        Query.SQL.Add(_SQLView);
        Query.ParamByName('id').AsInteger := txt.TagString.ToInteger;
        Query.Active := True;

        if Query.RecordCount > 0 then
        begin

          edTms_Cliente.Text := Query.FieldByName('nome').AsString;
          TabControl1.ActiveTab := TabItem1;

        end
        else
        begin
          ShowMessage('Não foi possível carregar o dados dessa pessoa. Tente outra vez.');
          TabControl1.ActiveTab := TabItem1;
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

procedure TFrmRelatDespesa.CarregaRelatorio(const pReport: TfrxReport);
begin
  // frxReport1.Variables['periodo'] := QuotedStr( 'Período: ' + medPesInc.Text + ' á ' + medPesFin.Text);
  // frxReport1.Variables['duracao'] := QuotedStr('Duração do Evento: ' + edtDuraEvento.Text);
  // frxReport1.Variables['usuario'] := QuotedStr(Trim(DM.QAcessoSys.FieldByName('usuario').AsString));
  pReport.PrepareReport;
  pReport.ShowPreparedReport;
end;

procedure TFrmRelatDespesa.cbx_TipoRelatChange(Sender: TObject);
begin
  inherited;
  case cbx_tipoRelat.ItemIndex of
    0:
      begin
        lay_tipoDespesa.Visible := false;
        lytPessoa.Visible := false;
        lytConta.Visible := false;
        lytData.Visible := false;
        lytLote.Visible := false;
      end;
    1:
      begin
        lay_tipoDespesa.Visible := false;
        lytPessoa.Visible := false;
        lytConta.Visible := false;
        lytData.Visible := True;
        lytLote.Visible := false;
      end;
    2:
      begin
        lay_tipoDespesa.Visible := false;
        lytPessoa.Visible := false;
        lytConta.Visible := false;
        lytData.Visible := True;
        lytLote.Visible := True;
      end;
    3:
      begin
        lay_tipoDespesa.Visible := false;
        lytPessoa.Visible := True;
        lytConta.Visible := false;
        lytData.Visible := True;
        lytLote.Visible := false;
      end;
    4:
      begin
        lay_tipoDespesa.Visible := false;
        lytPessoa.Visible := false;
        lytConta.Visible := True;
        lytData.Visible := True;
        lytLote.Visible := false;
      end;
    5:
      begin
        lay_tipoDespesa.Visible := True;
        lytPessoa.Visible := false;
        lytConta.Visible := false;
        lytData.Visible := True;
        lytLote.Visible := false;
      end;
  end;

end;




procedure TFrmRelatDespesa.ConsultaBancoPessoas;
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
    QBanco.FetchOptions.RowsetSize := 50000;
    QBanco.Active := false;
    QBanco.SQL.Clear;
    QBanco.SQL.Add(_SQLbanco);
    QBanco.Active := True;
    QBanco.First;

    if (QBanco.RecordCount = 0) then
    begin
      lay_lstvaziaPessoa.Visible := True;
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

procedure TFrmRelatDespesa.edTms_ClienteEnter(Sender: TObject);
var
  I: integer;
begin
  inherited;
  ConsultaBancoPessoas;
  ListViewPessoa.SearchVisible := True;
  for I := 0 to ListViewPessoa.Controls.Count - 1 do
    if ListViewPessoa.Controls[I].ClassType = TSearchBox then
    begin
      sbPessoa := TSearchBox(ListViewPessoa.Controls[I]);
      Break;
    end;
  sbPessoa.Height := 0;
  TabControl1.ActiveTab := TabItem2;
end;

procedure TFrmRelatDespesa.ConsultaConta;
const
  _SQLbanco = 'SELECT cb.*, b.banco FROM agrojun.contas_bancarias cb left outer join bancos b on (cb.cod_banco = b.cod)';
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

procedure TFrmRelatDespesa.edTms_ContaBancariaEnter(Sender: TObject);
var
  I: Integer;
begin
  inherited;
    ConsultaConta;
    ListViewConta.SearchVisible := true;
    for I := 0 to ListViewConta.Controls.Count - 1 do
      if ListViewConta.Controls[I].ClassType = TSearchBox then
      begin
        sbConta := TSearchBox(ListViewConta.Controls[I]);
        Break;
      end;
    sbConta.Height := 0;
    TabControl1.ActiveTab := TabItem3;

end;

procedure TFrmRelatDespesa.edTms_LoteEnter(Sender: TObject);
var
  I: integer;
begin
  inherited;
    ConsultaBancoLotes;
    ListViewLote.SearchVisible := true;
    for I := 0 to ListViewLote.Controls.Count - 1 do
      if ListViewLote.Controls[I].ClassType = TSearchBox then
      begin
        sbLote := TSearchBox(ListViewLote.Controls[I]);
        Break;
      end;
    sbLote.Height := 0;
    TabControl1.ActiveTab := TabItem4;
end;

procedure TFrmRelatDespesa.ConsultaBancoLotes;
const
  _SQLbanco = 'select * from agrojun.lotes  ';
var
  x: integer;
  QBanco: TFDQuery;
  item: TListViewItem;
  txt: TListItemText;
begin

  try
    QBanco := TFDQuery.Create(self);
    QBanco.Connection := dm.FDConnection;
    QBAnco.FetchOptions.RowsetSize := 50000;
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

      QBanco.Next;
    end;
  finally
    ListViewLote.EndUpdate;
    FreeAndNil(QBanco);
  end;
end;

procedure TFrmRelatDespesa.ed_PesquisaContaChangeTracking(Sender: TObject);
begin
  inherited;
  sbConta.Text := ed_PesquisaConta.Text;
end;

procedure TFrmRelatDespesa.ed_PesquisaLoteChangeTracking(Sender: TObject);
begin
  inherited;
  sbLote.Text := ed_PesquisaLote.Text;
end;

procedure TFrmRelatDespesa.ed_PesquisaPessoaChangeTracking(Sender: TObject);
begin
  inherited;
  sbPessoa.Text := ed_PesquisaPessoa.Text;
end;

procedure TFrmRelatDespesa.FormCreate(Sender: TObject);
begin
  inherited;
  cbx_TipoRelatChange(self);
end;

end.
