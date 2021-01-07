unit u_RelatVendas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  u_CrudRelat, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FMX.frxClass, FMX.frxDBSet, FMX.Edit, FMX.ComboEdit,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.DateTimeCtrls, FMX.TabControl;

type
  TfrmRelatVenda = class(TFrmCrudRelat)
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    FDQuery1: TFDQuery;
    lst_Principal: TListView;
    frxReport2: TfrxReport;
    frxDBDataset3: TfrxDBDataset;
    FDQuery3: TFDQuery;
    Layout2: TLayout;
    Layout3: TLayout;
    lytData: TLayout;
    dt_inicio: TDateEdit;
    Label14: TLabel;
    Label1: TLabel;
    dt_fim: TDateEdit;
    FDQuery1quantidade_cbs: TIntegerField;
    FDQuery1valorporcbs_venda: TSingleField;
    FDQuery1valortotal_venda: TSingleField;
    FDQuery1valortotal_compra: TSingleField;
    FDQuery1valorcbs_compra: TSingleField;
    FDQuery1despesa: TSingleField;
    FDQuery1despesa_cbs: TSingleField;
    FDQuery1LucroBaixa_CBS: TFloatField;
    FDQuery1LucroBaixa_total: TFloatField;
    FDQuery1id: TStringField;
    FDQuery1data_venda: TStringField;
    FDQuery1lote: TStringField;
    FDQuery1cliente: TStringField;
    FDQuery1conta: TStringField;
    FDQuery1quantidade_cbs_1: TStringField;
    FDQuery1valortotal_venda_1: TSingleField;
    FDQuery1valorporcbs_venda_1: TSingleField;
    FDQuery1idade_animal: TStringField;
    FDQuery1sexo_animal: TStringField;
    FDQuery1raca: TStringField;
    FDQuery1etiqueta: TIntegerField;
    FDQuery1tipo_caminhao: TStringField;
    FDQuery1placa_caminhao: TStringField;
    FDQuery1motorista: TStringField;
    FDQuery1valortotal_frete: TSingleField;
    FDQuery1valorporcbs_frete: TSingleField;
    FDQuery1corretor: TStringField;
    FDQuery1valortotal_comissao: TSingleField;
    FDQuery1valorporcbs_comissao: TSingleField;
    FDQuery1valortotal_animais: TSingleField;
    FDQuery1valorporcbs_animais: TSingleField;
    FDQuery1descricao: TStringField;
    FDQuery1despesa_cbs_1: TSingleField;
    FDQuery1fornecedor: TStringField;
    FDQuery1data_compra: TDateTimeField;
    FDQuery1idcompra: TIntegerField;
    FDQuery3quantidade_cbs: TIntegerField;
    FDQuery3valorporcbs_animais: TSingleField;
    FDQuery3valortotal_animais: TSingleField;
    FDQuery3valorporcbs_compra: TSingleField;
    FDQuery3valortotal_compra: TSingleField;
    FDQuery3despesa: TFloatField;
    FDQuery3despesa_cbs: TFloatField;
    FDQuery3LucroBaixa_CBS: TFloatField;
    FDQuery3LucroBaixa_total: TFloatField;
    FDQuery3id: TStringField;
    FDQuery3data_venda: TStringField;
    FDQuery3lote: TStringField;
    FDQuery3cliente: TStringField;
    FDQuery3conta: TStringField;
    FDQuery3quantidade_cbs_1: TStringField;
    FDQuery3valortotal_venda: TSingleField;
    FDQuery3valorporcbs_venda: TSingleField;
    FDQuery3idade_animal: TStringField;
    FDQuery3sexo_animal: TStringField;
    FDQuery3raca: TStringField;
    FDQuery3etiqueta: TIntegerField;
    FDQuery3tipo_caminhao: TStringField;
    FDQuery3placa_caminhao: TStringField;
    FDQuery3motorista: TStringField;
    FDQuery3valortotal_frete: TSingleField;
    FDQuery3valorporcbs_frete: TSingleField;
    FDQuery3corretor: TStringField;
    FDQuery3valortotal_comissao: TSingleField;
    FDQuery3valorporcbs_comissao: TSingleField;
    FDQuery3valortotal_animais_1: TSingleField;
    FDQuery3valorporcbs_animais_1: TSingleField;
    FDQuery3descricao: TStringField;
    FDQuery3despesa_cbs_1: TSingleField;
    FDQuery3fornecedor: TStringField;
    FDQuery3data_compra: TDateTimeField;
    FDQuery3idcompra: TIntegerField;
    frxDBItem: TfrxDBDataset;
    QItem: TFDQuery;
    QItemraca: TStringField;
    QItemsexo_animal: TStringField;
    QItemidade_animal: TStringField;
    QItemqnt: TStringField;
    QItemvalorporcbs_vendido: TSingleField;
    QItemvalortotal_vendido: TSingleField;
    frxReport3: TfrxReport;
    FDQuery2: TFDQuery;
    frxDBDataset2: TfrxDBDataset;
    FDQuery2id_venda: TStringField;
    FDQuery2descricao: TStringField;
    FDQuery2cliente: TStringField;
    FDQuery2data_venda: TStringField;
    FDQuery2conta: TStringField;
    FDQuery2lote: TStringField;
    FDQuery2data_compra: TStringField;
    FDQuery2forncedor: TStringField;
    FDQuery2valorporcbs_frete: TSingleField;
    FDQuery2valortotal_frete: TFloatField;
    FDQuery2valorporcbs_comissao: TSingleField;
    FDQuery2valortotal_comissao: TFloatField;
    FDQuery2raca: TStringField;
    FDQuery2sexo_animal: TStringField;
    FDQuery2idade_animal: TStringField;
    FDQuery2qnt: TStringField;
    FDQuery2valorporcbs_vendido: TSingleField;
    FDQuery2valortotal_vendido: TSingleField;
    FDQuery2despesa_cbs: TSingleField;
    FDQuery2id_compra: TStringField;
    FDQuery2despesatotal: TFloatField;
    FDQuery2valorcbs_compra: TFloatField;
    FDQuery2valortotal_compra: TFloatField;
    FDQuery2valor_fretecbs: TSingleField;
    FDQuery2valor_comissaocbs: TSingleField;
    FDQuery2valor_frete: TFloatField;
    FDQuery2valor_comissao: TFloatField;
    FDQuery2Lucrobaixacbs: TFloatField;
    FDQuery2Lucrobaixatotal: TFloatField;
    procedure Img_GerarRelatorioClick(Sender: TObject);
    procedure lst_PrincipalItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure FormCreate(Sender: TObject);
    procedure cbx_TipoRelatChange(Sender: TObject);
  private
    { Private declarations }
    procedure CarregaRelatorio(const pReport: TfrxReport);
    procedure ConsultaVendas;
  public
    { Public declarations }
  end;

var
  frmRelatVenda: TfrmRelatVenda;
  id_venda: string;

implementation

{$R *.fmx}

uses u_DM;

procedure TfrmRelatVenda.Img_GerarRelatorioClick(Sender: TObject);
const
  SqlVenda = ' set @id = :idvenda; '+
  ' Select '+
  ' LPAD(v.id, 4, ''0'') as id_venda, '+
  ' v.descricao, '+
  ' pc.nome as cliente, '+
  ' DATE_FORMAT( v.data_venda, ''%d/%m/%Y'' ) as data_venda, '+
  ' concat(cb.conta, '' - '', cb.titular) as conta, '+
  ' concat(LPAD(v.lote, 4, ''0''),'' - '', l.nome) as lote, '+
  ' DATE_FORMAT( c.data_compra, ''%d/%m/%Y'' ) AS data_compra, '+
  ' pf.nome as forncedor, c.valorporcbs_frete,  (c.valorporcbs_frete * ci.qtd_vendida) as valortotal_frete , '+
  ' c.valorporcbs_comissao, '+
  ' (c.valorporcbs_comissao * ci.qtd_vendida) as valortotal_comissao, '+
  ' rc.raca, '+
  ' case ci.sexo_animal '+
  ' when 1 then ''F'' '+
  ' else ''M''  end sexo_animal, '+
  ' ia.idade_animal, '+
  ' LPAD(ci.qtd_vendida, 4, ''0'') AS qnt, '+
  ' ci.valorporcbs_vendido , '+
  ' ci.valortotal_vendido, '+
  ' CI.despesa_cbs, '+
  ' LPAD(ci.id_compra, 4, ''0'') as id_compra, '+
  ' ci.despesa_cbs * ci.qtd_vendida as despesatotal, '+
  ' (ci.valorporcbs_animais - ci.despesa_cbs) as valorcbs_compra, '+
  ' ((ci.valorporcbs_animais - ci.despesa_cbs) * ci.qtd_vendida) as valortotal_compra, '+
  ' v.valorporcbs_frete as valor_fretecbs, v.valorporcbs_comissao as valor_comissaocbs, '+
  ' (v.valorporcbs_frete * ci.qtd_vendida)as valor_frete, '+
  ' ( v.valorporcbs_comissao * ci.qtd_vendida) as valor_comissao, '+
  ' (ci.valortotal_vendido -(ci.despesa_cbs * ci.qtd_vendida + ((ci.valorporcbs_animais - ci.despesa_cbs) * ci.qtd_vendida)))  / ci.qtd_vendida - (v.valorporcbs_frete + v.valorporcbs_comissao) as Lucrobaixacbs, '+
  ' ((ci.valortotal_vendido -(ci.despesa_cbs * ci.qtd_vendida + ((ci.valorporcbs_animais - ci.despesa_cbs) * ci.qtd_vendida)))  / ci.qtd_vendida - (v.valorporcbs_frete + v.valorporcbs_comissao)) * ci.qtd_vendida  as Lucrobaixatotal '+
  ' FROM agrojun.vendas_itens ci '+
  ' left outer join compras c on (c.id = ci.id_compra) '+
  ' left outer join vendas v on (v.id = ci.id_venda) '+
  ' left outer join pessoas pf on (c.fornecedor = pf.id) '+
  ' left outer join pessoas pc on (v.cliente = pc.id) '+
  ' left outer join idade_animal ia on (ci.idade_animal = ia.id) '+
  ' left outer join raca_animal rc on (ci.raca_animal = rc.id) '+
  ' left outer join contas_bancarias cb on (cb.id = v.conta_bancaria) '+
  ' left outer join lotes l on (l.id = v.lote) '+
  ' where id_venda = @id  order by v.id, v.data_venda desc ';




    sqlAnalitico = ' select    v.quantidade_cbs,        v.valorporcbs_animais,    v.valortotal_animais, '+
    ' c.valorporcbs_compra,    c.valortotal_compra, '+
    ' sum(COALESCE(d.valor, 0)) as despesa, '+
    ' sum(COALESCE(d.valor, 0))/v.quantidade_cbs as despesa_cbs, '+
    ' (v.valorporcbs_animais - (v.despesa_cbs +  v.valorcbs_compra) ) as LucroBaixa_CBS, '+
    ' (v.valortotal_animais - (v.despesa + v.valortotal_compra) ) as LucroBaixa_total, '+
    ' LPAD(v.id, 4, 0) as id, DATE_FORMAT( v.data_venda, ''%d/%m/%Y'' ) AS data_venda, '+
    ' concat(LPAD(v.lote, 4, ''0''),'' - '', l.nome) as lote, pcl.nome as cliente, cb.conta, LPAD(v.quantidade_cbs, 4, 0) as quantidade_cbs, '+
    ' v.valortotal_venda, v.valorporcbs_venda, ia.idade_animal,    case v.sexo_animal    when 1 then ''FÊMEA'' '+
    ' when 2 then ''MACHO'' '+
    ' else ''MISTO'' end sexo_animal, rc.raca, v.etiqueta, tc.tipo_caminhao, v.placa_caminhao, pm.nome as motorista, '+
    ' v.valortotal_frete, v.valorporcbs_frete, pc.nome as corretor, v.valortotal_comissao, v.valorporcbs_comissao, '+
    ' v.valortotal_animais, v.valorporcbs_animais, v.descricao, v.despesa_cbs, '+
    ' pf.nome as fornecedor, c.data_compra, c.id as idcompra    from vendas v '+
    ' left outer join compras c on (v.lote = c.lote) '+
    ' left outer join  tipo_caminhao tc on (v.tipo_caminhao = tc.id) '+
    ' left outer join raca_animal rc on (v.raca_animal = rc.id) '+
    ' left outer join pessoas pcl on (v.cliente = pcl.id) '+
    ' left outer join pessoas pm on (v.motorista = pm.id) '+
    ' left outer join pessoas pc on (v.corretor = pc.id) '+
    ' left outer join pessoas pf on (c.fornecedor = pf.id) '+
    ' left outer join lotes l on (v.lote = l.id) '+
    ' left outer join idade_animal ia on (v.idade_animal = ia.id) '+
    ' left outer join contas_bancarias cb on (v.conta_bancaria = cb.id) '+
    ' left outer join despesas d on(v.lote = d.id_lote) ';

begin
  case cbx_TipoRelat.ItemIndex of
    1:
      begin

        FDQuery2.Close;
        FDQuery2.SQL.Clear;
        FDQuery2.SQL.Add(SqlVenda);
        FDQuery2.ParamByName('idvenda').asstring := id_venda;
        FDQuery1.Active := true;

        CarregaRelatorio(frxReport3);
      end;
    2:
      begin
        FDQuery3.Close;
        FDQuery3.SQL.Clear;
        FDQuery3.SQL.Add(sqlAnalitico);
        FDQuery3.SQL.Add('where DATE_FORMAT(v.data_venda, ''%d/%m/%Y'')BETWEEN ' + QuotedStr(datetoStr(dt_inicio.Date)) + ' and ' +
          QuotedStr(datetoStr(dt_fim.Date)) + ' group by v.id ');
        FDQuery3.Active := true;
        CarregaRelatorio(frxReport2);
      end;
  end;

end;

procedure TfrmRelatVenda.lst_PrincipalItemClick(const Sender: TObject; const AItem: TListViewItem);
var
  txt: TListItemText;
  Query: TFDQuery;
  id: string;
begin
  inherited;
  with AItem do
  begin
    txt := TListItemText(Objects.FindDrawable('codigo'));
    id_venda := txt.TagString;
  end;

end;

procedure TfrmRelatVenda.CarregaRelatorio(const pReport: TfrxReport);
begin
  // frxReport1.Variables['periodo'] := QuotedStr( 'Período: ' + medPesInc.Text + ' á ' + medPesFin.Text);
  // frxReport1.Variables['duracao'] := QuotedStr('Duração do Evento: ' + edtDuraEvento.Text);
  // frxReport1.Variables['usuario'] := QuotedStr(Trim(DM.QAcessoSys.FieldByName('usuario').AsString));
  pReport.PrepareReport;
  pReport.ShowPreparedReport;
end;

procedure TfrmRelatVenda.cbx_TipoRelatChange(Sender: TObject);
begin
  inherited;
  case cbx_TipoRelat.ItemIndex of
    0:
      begin
        Layout2.Visible := false;
        Layout3.Visible := false;
      end;
    1:
      begin
        Layout2.Visible := true;
        Layout3.Visible := false;
      end;
    2:
      begin
        Layout2.Visible := false;
        Layout3.Visible := true;
      end;
  end;
end;

procedure TfrmRelatVenda.ConsultaVendas;
const
  _SQLbanco =
    ' select v.id, v.data_venda, v.quantidade_cbs, f.nome as cliente, cc.conta, l.numero as lote, v.valortotal_venda, v.valorporcbs_venda from vendas as v '
    + ' left outer join pessoas as f on (f.id = v.cliente)                                                                                     '
    + ' left outer join contas_bancarias as cc on (cc.id = v.conta_bancaria)                                                                      '
    + ' left outer join lotes as l on (l.id = v.lote)                                                                                             '
    + ' where month(data_venda) = :mes and year(data_venda) = :ano order by data_venda desc                                                     ';
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
    QBanco.ParamByName('mes').AsInteger := StrToInt(FormatDateTime('MM', Now));
    QBanco.ParamByName('ano').AsInteger := StrToInt(FormatDateTime('YYYY', Now));
    QBanco.Active := true;
    QBanco.First;

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
        txt.TagString := QBanco.FieldByName('id').asstring;

        txt := TListItemText(Objects.FindDrawable('data'));
        txt.Text := QBanco.FieldByName('data_venda').asstring;

        txt := TListItemText(Objects.FindDrawable('lote'));
        txt.Text := QBanco.FieldByName('lote').asstring;

        txt := TListItemText(Objects.FindDrawable('cliente'));
        txt.Text := QBanco.FieldByName('cliente').asstring;

        txt := TListItemText(Objects.FindDrawable('conta'));
        txt.Text := QBanco.FieldByName('conta').asstring;

        txt := TListItemText(Objects.FindDrawable('quantidade'));
        txt.Text := QBanco.FieldByName('quantidade_cbs').asstring;

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

procedure TfrmRelatVenda.FormCreate(Sender: TObject);
begin
  inherited;

  cbx_TipoRelat.ItemIndex := 1;  cbx_TipoRelat.Enabled := false;
  cbx_TipoRelatChange(self);
  ConsultaVendas;
end;

end.
