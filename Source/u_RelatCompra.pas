unit u_RelatCompra;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  u_CrudRelat, FMX.frxClass, FMX.frxDBSet, FMX.Edit, FMX.ComboEdit,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.TabControl;

type
  TFrmRelatCompra = class(TFrmCrudRelat)
    frxReport1: TfrxReport;
    frxDBcompra: TfrxDBDataset;
    QCompra: TFDQuery;
    lay_ListCompra: TLayout;
    lst_Principal: TListView;
    lay_listVazia: TLayout;
    Image1: TImage;
    Label2: TLabel;
    QItem: TFDQuery;
    frxDBItem: TfrxDBDataset;
    QItemraca: TStringField;
    QItemsexo_animal: TStringField;
    QItemidade_animal: TStringField;
    QItemqnt: TStringField;
    QItemvalorporcbs_animais: TSingleField;
    QItemvalortotal_animais: TSingleField;
    QCompraid: TStringField;
    QCompradata_compra: TStringField;
    QCompralote: TStringField;
    QComprafornecedor: TStringField;
    QCompraconta: TStringField;
    QCompravalortotal_compra: TSingleField;
    QCompravalorporcbs_compra: TSingleField;
    QCompraetiqueta: TIntegerField;
    QCompratipo_caminhao: TStringField;
    QCompraplaca_caminhao: TStringField;
    QCompramotorista: TStringField;
    QCompravalortotal_frete: TSingleField;
    QCompravalorporcbs_frete: TSingleField;
    QCompracorretor: TStringField;
    QCompravalortotal_comissao: TSingleField;
    QCompravalorporcbs_comissao: TSingleField;
    QCompravalortotal_animais: TSingleField;
    QCompravalorporcbs_animais: TSingleField;
    QCompradescricao: TStringField;
    QCompraforma_pagto: TStringField;
    procedure cbx_TipoRelatChange(Sender: TObject);
    procedure Img_GerarRelatorioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lst_PrincipalItemClick(const Sender: TObject;
      const AItem: TListViewItem);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConsultaCompras;
    procedure CarregaRelatorio(const pReport: TfrxReport);
  end;

var
  FrmRelatCompra: TFrmRelatCompra;
  id_compra: string;

implementation

{$R *.fmx}

uses u_DM;

procedure TFrmRelatCompra.cbx_TipoRelatChange(Sender: TObject);
begin
  inherited;
  case cbx_TipoRelat.ItemIndex of
    0:
      begin
        //
      end;
    1:
      begin

      end;
  end;
end;

procedure TFrmRelatCompra.ConsultaCompras;
const
  _SQLbanco =
    ' select c.id, c.data_compra, c.quantidade_cbs, f.nome as fornecedor, cc.conta, l.numero as lote, c.valortotal_compra, c.valorporcbs_compra from compras as c '
    + ' left outer join pessoas as f on (f.id = c.fornecedor)                                                                                     '
    + ' left outer join contas_bancarias as cc on (cc.id = c.conta_bancaria)                                                                      '
    + ' left outer join lotes as l on (l.id = c.lote)                                                                                             '
    + ' order by c.id desc                                                     ';
var
  x: integer;
  QBanco: TFDQuery;
  item: TListViewItem;
  txt: TListItemText;
begin

  try
    QBanco := TFDQuery.Create(self);
    QBanco.Connection := dm.FDConnection;
    qbanco.FetchOptions.RowsetSize := 50000;
    QBanco.Active := false;
    QBanco.SQL.Clear;
    QBanco.SQL.Add(_SQLbanco);
    // QBanco.ParamByName('mes').AsInteger := StrToInt(FormatDateTime('MM', Now));
    // QBanco.ParamByName('ano').AsInteger :=
    // StrToInt(FormatDateTime('YYYY', Now));
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

procedure TFrmRelatCompra.FormCreate(Sender: TObject);
begin
  inherited;
  cbx_TipoRelat.Visible := false;
ConsultaCompras;
end;





procedure TFrmRelatCompra.Img_GerarRelatorioClick(Sender: TObject);
const
   SQlCompra =
    ' select  LPAD(c.id, 4, ''0'') as id, DATE_FORMAT( c.data_compra, ''%d/%m/%Y'' ) AS data_compra, '+
    ' l.nome as lote, pf.nome as fornecedor, '+
    ' concat(cb.conta, '' - '', CB.titular) AS conta, '+
    ' c.valortotal_compra, c.valorporcbs_compra, '+
    ' c.etiqueta, tc.tipo_caminhao, c.placa_caminhao, pm.nome as motorista, '+
    ' c.valortotal_frete, c.valorporcbs_frete, pc.nome as corretor, c.valortotal_comissao, '+
    ' c.valorporcbs_comissao,  c.valortotal_animais, c.valorporcbs_animais, c.descricao, '+
    ' pg.forma_pagto '+
    ' from compras c '+
    ' left outer join  tipo_caminhao tc on (c.tipo_caminhao = tc.id) '+
    ' left outer join pessoas pf on (c. fornecedor = pf.id) '+
    ' left outer join pessoas pm on (c.motorista = pm.id) '+
    ' left outer join pessoas pc on (c.corretor = pc.id) '+
    ' left outer join lotes l on (c.lote = l.id) '+
    ' left outer join contas_bancarias cb on (c.conta_bancaria = cb.id) '+
    ' left outer join forma_pagamento pg on (c.forma_pagto = pg.id) ';

    SQlCompraItem =
    ' Select '+
    ' rc.raca, '+
    ' case ci.sexo_animal '+
    ' when 1 then ''FÊMEA'' '+
    ' when 2 then ''MACHO'' '+
    ' else ''MISTO'' end sexo_animal, '+
    ' ia.idade_animal, '+
    '  '+
    ' LPAD(ci.quantidade, 4, ''0'') AS qnt, '+
    ' ci.valorporcbs_animais, '+
    ' ci.valortotal_animais '+
    ' FROM agrojun.compras_itens ci '+
    ' left outer join idade_animal ia on (ci.idade_animal = ia.id) '+
    ' left outer join raca_animal rc on (ci.raca_animal = rc.id) '+
    '  '+
    ' where id_compra = :id ';



begin

  QCompra.Close;
  QCompra.SQL.Clear;
  QCompra.SQL.Add( SQlCompra);
      QCompra.SQL.Add('where  c.id =  ' + QuotedStr(id_compra));
  QCompra.Active := true;

    QItem.Close;
  QItem.SQL.Clear;
  QItem.SQL.Add(SQlCompraItem);
  QItem.Params.ParamByName('id').AsInteger := id_compra.ToInteger;
  QItem.Active := true;

  CarregaRelatorio(frxReport1);

end;

procedure TFrmRelatCompra.lst_PrincipalItemClick(const Sender: TObject;
  const AItem: TListViewItem);
var
  txt: TListItemText;
  Query: TFDQuery;

begin
  inherited;
  with AItem do
  begin
    txt := TListItemText(Objects.FindDrawable('codigo'));
    id_compra := txt.TagString;
  end;

end;

procedure TFrmRelatCompra.CarregaRelatorio(const pReport: TfrxReport);
begin
  // frxReport1.Variables['periodo'] := QuotedStr( 'Período: ' + medPesInc.Text + ' á ' + medPesFin.Text);
  // frxReport1.Variables['duracao'] := QuotedStr('Duração do Evento: ' + edtDuraEvento.Text);
  // frxReport1.Variables['usuario'] := QuotedStr(Trim(DM.QAcessoSys.FieldByName('usuario').AsString));
  pReport.PrepareReport;
  pReport.ShowPreparedReport;
end;

end.
