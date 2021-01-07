unit u_RelatPessoas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  u_CrudRelat, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FMX.frxClass, FMX.frxDBSet, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FMX.Edit, FMX.ComboEdit, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.TabControl, FMX.SearchBox;

type
  TFrmRelatorioPessoa = class(TFrmCrudRelat)
    QRelatPessoa: TFDQuery;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    FDQuery1: TFDQuery;
    TabItem2: TTabItem;
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
    lytPessoa: TLayout;
    Label16: TLabel;
    lay_tipoPessoa: TLayout;
    Label2: TLabel;
    cbx_TipoPessoa: TComboEdit;
    edTms_Cliente: TEdit;
    procedure Img_GerarRelatorioClick(Sender: TObject);
    procedure cbx_TipoRelatChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edTms_ClienteEnter(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure ListViewPessoaItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure ed_PesquisaPessoaChange(Sender: TObject);
    procedure ed_PesquisaPessoaChangeTracking(Sender: TObject);
  private
    { Private declarations }
    sbPessoa: TSearchBox;
    procedure CarregaRelatorio(const pReport: TfrxReport);
    procedure ConsultaBancoPessoas;

  public
    { Public declarations }
  end;

var
  FrmRelatorioPessoa: TFrmRelatorioPessoa;
Cod_Selecao : integer;

implementation

{$R *.fmx}

uses u_DM;


procedure TFrmRelatorioPessoa.ConsultaBancoPessoas;
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
    Qbanco.FetchOptions.RowsetSize := 50000;
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

procedure TFrmRelatorioPessoa.edTms_ClienteEnter(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  if edTms_Cliente.Text.IsEmpty  then
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
    TabControl1.ActiveTab := TabItem2;
  end;

end;

procedure TFrmRelatorioPessoa.ed_PesquisaPessoaChange(Sender: TObject);
begin
  inherited;
  sbPessoa.Text := ed_PesquisaPessoa.Text;
end;

procedure TFrmRelatorioPessoa.ed_PesquisaPessoaChangeTracking(Sender: TObject);
begin
  inherited;
  sbPessoa.Text := ed_PesquisaPessoa.Text;
end;

procedure TFrmRelatorioPessoa.CarregaRelatorio(const pReport: TfrxReport);
begin
  // frxReport1.Variables['periodo'] := QuotedStr( 'Período: ' + medPesInc.Text + ' á ' + medPesFin.Text);
  // frxReport1.Variables['duracao'] := QuotedStr('Duração do Evento: ' + edtDuraEvento.Text);
  // frxReport1.Variables['usuario'] := QuotedStr(Trim(DM.QAcessoSys.FieldByName('usuario').AsString));
  pReport.PrepareReport;
  pReport.ShowPreparedReport;
end;

procedure TFrmRelatorioPessoa.cbx_TipoRelatChange(Sender: TObject);
begin
  inherited;
  case cbx_TipoRelat.ItemIndex of
    0:
      begin
        lytPessoa.Visible := false;
        lay_tipoPessoa.Visible := false;
      end;
    1:
      begin
        lytPessoa.Visible := false;
        lay_tipoPessoa.Visible := True;
      end;
    2:
      begin
        lytPessoa.Visible := false;
        lay_tipoPessoa.Visible := True;
      end;
    3:
      begin
        lytPessoa.Visible := false;
        lay_tipoPessoa.Visible := True;
      end;
    4:
      begin
        lytPessoa.Visible := True;
        lay_tipoPessoa.Visible := false;
      end;
    5:
      begin
        lytPessoa.Visible := false;
        lay_tipoPessoa.Visible := false;
      end;
  end;

end;

procedure TFrmRelatorioPessoa.FormCreate(Sender: TObject);
begin
  inherited;


  cbx_TipoPessoa.ItemIndex := 0;
  cbx_TipoRelat.ItemIndex := 0;
  cbx_TipoRelatChange(self);
end;

procedure TFrmRelatorioPessoa.Image5Click(Sender: TObject);
begin
  inherited;
 TabControl1.ActiveTab := TabItem1;
end;

procedure TFrmRelatorioPessoa.Img_GerarRelatorioClick(Sender: TObject);
const
  SqlPessoas = 'select p.id, p.nome, p.cpf_pessoa,p.telefone, ' +
    'case p.tipo_pessoa ' + 'WHEN 1 THEN ''FÍSICA'' ' + 'ELSE ''JURÍDICA'' ' +
    'END as tipo_pessoa, ' + 'case ' +
    'WHEN p.funcionario = 1 THEN ''FUNCIONARIO'' ' +
    'WHEN p.fornecedor = 1 THEN ''FORNECEDOR'' ' +
    'WHEN p.CLIENTE = 1 THEN ''CLIENTE'' ' + 'ELSE '''' ' +
    'END as funcao_pessoa, ' + 'concat(m.Nome, '' - '',  m.Uf) as municipio ' +
    'from pessoas p ' + 'left outer join municipio m on (p.id_cidade = m.Id) ';
begin
  inherited;

  QRelatPessoa.Close;
  QRelatPessoa.SQL.Clear;
  QRelatPessoa.SQL.Add(SqlPessoas);

  if cbx_TipoPessoa.ItemIndex = 3 then
  begin
    case cbx_TipoRelat.ItemIndex of
      1:
        QRelatPessoa.SQL.Add('where p.CLIENTE = 1 ');
      2:
        QRelatPessoa.SQL.Add('where p.funcionario = 1 ');
      3:
        QRelatPessoa.SQL.Add('where p.fornecedor = 1');
      4:
        QRelatPessoa.SQL.Add('where p.nome = ' + QuotedStr(edTms_Cliente.Text));
    end;
  end
  else
  begin

    case cbx_TipoRelat.ItemIndex of
      1:
        QRelatPessoa.SQL.Add('where p.CLIENTE = 1 AND p.tipo_pessoa =' +
          QuotedStr(cbx_TipoPessoa.ItemIndex.ToString));
      2:
        QRelatPessoa.SQL.Add('where p.funcionario = 1 AND p.tipo_pessoa =' +
          QuotedStr(cbx_TipoPessoa.ItemIndex.ToString));
      3:
        QRelatPessoa.SQL.Add('where p.fornecedor = 1 AND p.tipo_pessoa =' +
          cbx_TipoPessoa.ItemIndex.ToString);
      4:
        QRelatPessoa.SQL.Add('where p.nome = ' + QuotedStr(edTms_Cliente.Text));
    end;
  end;
//  ShowMessage(QRelatPessoa.SQL.text);
  QRelatPessoa.Active := True;

  CarregaRelatorio(frxReport1);

end;

procedure TFrmRelatorioPessoa.ListViewPessoaItemClick(const Sender: TObject; const AItem: TListViewItem);
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
        Query.ParamByName('id').AsInteger := txt.TagString.ToInteger;
        Query.Active := true;

        if Query.RecordCount > 0 then
        begin

            edTms_Cliente.Text :=  Query.FieldByName('nome').AsString;
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

end.
