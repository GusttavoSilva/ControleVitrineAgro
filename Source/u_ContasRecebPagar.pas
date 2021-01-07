unit u_ContasRecebPagar;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, u_CrudCad, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.Objects, FMX.Edit, FMX.Controls.Presentation, FMX.TabControl, FMX.Layouts, FMX.ComboEdit,
  FMX.DateTimeCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmContasRecebPagar = class(TFrmCrud)
    cbx_PagaRecebe: TComboEdit;
    cbx_Status: TComboEdit;
    dt_inicio: TDateEdit;
    dt_Fim: TDateEdit;
    Label3: TLabel;
    Label4: TLabel;
    cbx_TodasParcelas: TCheckBox;
    Layout1: TLayout;
    img_Pagar: TImage;
    img_Voltar: TImage;
    QParcela: TFDQuery;
    lbl_Qnt: TLabel;
    lbl_Valor: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure cbx_PagaRecebeChange(Sender: TObject);
    procedure cbx_StatusChange(Sender: TObject);
    procedure dt_inicioChange(Sender: TObject);
    procedure dt_FimChange(Sender: TObject);
    procedure cbx_TodasParcelasChange(Sender: TObject);
    procedure lst_PrincipalItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure img_PagarClick(Sender: TObject);
    procedure img_VoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure populalist;
    function AlteraSaldo(id: Integer; saldo: double): Integer;
    function BuscarSaldo(id: Integer): double;
    procedure updateParcela(id, status: Integer);
  end;

var
  FrmContasRecebPagar: TFrmContasRecebPagar;
  Cod_Selecao: Integer;

implementation

uses
  u_DM, System.DateUtils, u_Library;

{$R *.fmx}
{ TFrmContasRecebPagar }

function TFrmContasRecebPagar.BuscarSaldo(id: Integer): double;
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

function TFrmContasRecebPagar.AlteraSaldo(id: Integer; saldo: double): Integer;
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

procedure TFrmContasRecebPagar.updateParcela(id, status: Integer);
const
  SQL = 'UPDATE agrojun.parcelas SET status = :status, data_baixa = :data_baixa WHERE id = :id';
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
    Query.ParamByName('data_baixa').asDatetime := Now;
    Query.ParamByName('status').AsInteger := status;
    Query.ParamByName('id').AsInteger := id;
    Query.ExecSQL;
  finally
    FreeAndNil(Query);
  end;
end;

procedure TFrmContasRecebPagar.cbx_PagaRecebeChange(Sender: TObject);
begin
  inherited;
  populalist;
end;

procedure TFrmContasRecebPagar.cbx_StatusChange(Sender: TObject);
begin
  inherited;
  populalist;
end;

procedure TFrmContasRecebPagar.cbx_TodasParcelasChange(Sender: TObject);
begin
  inherited;
  populalist;
end;

procedure TFrmContasRecebPagar.dt_FimChange(Sender: TObject);
begin
  inherited;
  populalist;
end;

procedure TFrmContasRecebPagar.dt_inicioChange(Sender: TObject);
begin
  inherited;
  populalist;
end;

procedure TFrmContasRecebPagar.FormCreate(Sender: TObject);
begin
  inherited;
  Cod_Selecao := 0;
  Img_BtnNovo.Visible := false;
  dt_inicio.Date := StartOfTheMonth(Now);
  dt_Fim.Date := EndOfTheMonth(Now);

  cbx_Status.ItemIndex := 0;
  cbx_PagaRecebe.ItemIndex := 0;
  populalist;
end;

procedure TFrmContasRecebPagar.img_PagarClick(Sender: TObject);
var
  QParcela: TFDQuery;
begin
  inherited;
  if Cod_Selecao = 0 then
    raise Exception.Create('Selecione uma parcela!');

  QParcela := TFDQuery.Create(self);
  QParcela.Connection := dm.FDConnection;
  QParcela.FetchOptions.RowsetSize := 50000;
  QParcela.Active := false;
  QParcela.SQL.Clear;
  QParcela.SQL.Add(' Select * from parcelas where id = :id ');
  QParcela.Params.ParamByName('id').AsInteger := Cod_Selecao;
  QParcela.Active := true;
  if QParcela.FieldByName('status').AsInteger = 1 then
    raise Exception.Create('Parcela JÁ foi paga!');

  if mensagemConfirmacao('Deseja confirmar o PAGAMENDO desta parcela?') = mrYes then
  begin
    if QParcela.FieldByName('movimentacao').AsString <> 'V' then
    begin
      //
      // **************  CONTAS A PAGAR ************************
      //
      AlteraSaldo(QParcela.FieldByName('conta_bancaria').AsInteger, BuscarSaldo(QParcela.FieldByName('conta_bancaria').AsInteger) -
        QParcela.FieldByName('valor').AsInteger);
    end
    else if QParcela.FieldByName('movimentacao').AsString = 'V' then
    begin
      //
      // **************  CONTAS A RECEBER ************************
      //
      AlteraSaldo(QParcela.FieldByName('conta_bancaria').AsInteger, BuscarSaldo(QParcela.FieldByName('conta_bancaria').AsInteger) +
        QParcela.FieldByName('valor').AsInteger);
    end;
    updateParcela(QParcela.FieldByName('id').AsInteger, 1);
  end;



  Cod_Selecao := 0;
  QParcela.Close;
  populalist;
end;

procedure TFrmContasRecebPagar.img_VoltarClick(Sender: TObject);
var
  QParcela: TFDQuery;
begin
  inherited;
  if Cod_Selecao = 0 then
    raise Exception.Create('Selecione uma parcela!');

  QParcela := TFDQuery.Create(self);
  QParcela.Connection := dm.FDConnection;
  qparcela.FetchOptions.RowsetSize := 50000;
  QParcela.Active := false;
  QParcela.SQL.Clear;
  QParcela.SQL.Add(' Select * from parcelas where id = :id ');
  QParcela.Params.ParamByName('id').AsInteger := Cod_Selecao;
  QParcela.Active := true;

  if QParcela.FieldByName('status').AsInteger = 0 then
    raise Exception.Create('Parcela NÃO paga!');

  if mensagemConfirmacao('Deseja ESTORNAR o valor desta parcela?') = mrYes then
  begin
    if QParcela.FieldByName('movimentacao').AsString <> 'V' then
    begin
      //
      // **************  CONTAS A PAGAR ************************
      //
      AlteraSaldo(QParcela.FieldByName('conta_bancaria').AsInteger, BuscarSaldo(QParcela.FieldByName('conta_bancaria').AsInteger) +
        QParcela.FieldByName('valor').AsInteger);
    end
    else if QParcela.FieldByName('movimentacao').AsString = 'V' then
    begin
      //
      // **************  CONTAS A RECEBER ************************
      //
      AlteraSaldo(QParcela.FieldByName('conta_bancaria').AsInteger, BuscarSaldo(QParcela.FieldByName('conta_bancaria').AsInteger) -
        QParcela.FieldByName('valor').AsInteger);
    end;


  updateParcela(QParcela.FieldByName('id').AsInteger, 0);
  end;
  Cod_Selecao := 0;
  QParcela.Close;
  populalist;
end;

procedure TFrmContasRecebPagar.lst_PrincipalItemClick(const Sender: TObject; const AItem: TListViewItem);
var
  txt: TListItemText;
  Query: TFDQuery;
  id: string;
begin
  ed_pesq.Enabled := true;
  with AItem do
  begin
    txt := TListItemText(Objects.FindDrawable('Codigo'));
    id := txt.TagString;
    Cod_Selecao := txt.TagString.ToInteger;
  end;
end;

procedure TFrmContasRecebPagar.populalist;
const
  SQL = ' SELECT LPAD(p.id, 4, ''0'') as id, ' + ' DATE_FORMAT(p.data, "%d/%m/%Y") as vencimento, ' + ' concat(case p.movimentacao ' +
    ' when ''D'' then ''DESPESA'' ' + ' WHEN ''C'' then ''COMPRA'' ' + ' WHEN ''V'' THEN ''VENDA'' ' +
    ' END, '' - ID: '', LPAD(p.id_movimentacao, 4, ''0'')) as movimentacao,  c.conta as conta, ' + ' ps.nome, ps.telefone, cpf_pessoa, ' +
    ' case ' + ' when (data < CURDATE() and status = 0) then ''VENCIDA'' ' + ' when (status = 0) then ''ABERTO'' ' +
    ' when (status = 1) then ''PAGO'' ' + ' END as status, p.valor, ' +
    ' concat( LPAD(p.num_parc, 2, ''0''), ''/'',LPAD((select count(id) from parcelas where movimentacao = p.movimentacao and id_movimentacao = p.id_movimentacao), 2, ''0'')) as parcela '
    + ' FROM agrojun.parcelas p ' + ' left outer join contas_bancarias c on (p.conta_bancaria = c.id) ' +
    ' left outer join pessoas ps on (p.id_pessoa = ps.id) ';

var
  x: Integer;
  qry: TFDQuery;
  item: TListViewItem;
  txt: TListItemText;
  color: TAlphaColor;
  valorTotal: double;
  qnt: Integer;
begin

  try
    qry := TFDQuery.Create(self);
    qry.Connection := dm.FDConnection;
    qry.FetchOptions.RowsetSize := 50000;
    qry.Active := false;
    qry.SQL.Clear;
    qry.SQL.Add(SQL);

    case cbx_PagaRecebe.ItemIndex of
      0:
        qry.SQL.Add(' WHERE  movimentacao <> ''V'' ');
      1:
        qry.SQL.Add(' WHERE  movimentacao = ''V'' ');
    end;

    case cbx_Status.ItemIndex of
      0:
        qry.SQL.Add(' ');
      1:
        qry.SQL.Add(' and status = 0 ');
      2:
        qry.SQL.Add(' and status = 1 ');
      3:
        qry.SQL.Add(' and data < CURDATE() and status = 0 ');

    end;

    if not cbx_TodasParcelas.IsChecked then
      qry.SQL.Add(' and p.data BETWEEN ' + QuotedStr(FormatDateTime('YYYY-MM-DD', dt_inicio.Date)) + ' AND ' +
        QuotedStr(FormatDateTime('YYYY-MM-DD', dt_Fim.Date)) + ' ');

    qry.SQL.Add(' order by p.data asc ');

    qry.Open;
    qry.First;

    valorTotal := 0;
    qnt := 0;

    if (qry.RecordCount = 0) then
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

        txt := TListItemText(Objects.FindDrawable('lblCodigo'));
        txt.Text := 'CÓDIGO';
        txt.TagString := '0';

        txt := TListItemText(Objects.FindDrawable('lblParcela'));
        txt.Text := 'PARCELA';

        txt := TListItemText(Objects.FindDrawable('lblVencimento'));
        txt.Text := 'VENCIMENTO';

        txt := TListItemText(Objects.FindDrawable('lblNome'));
        txt.Text := 'NOME';

        txt := TListItemText(Objects.FindDrawable('lblCpf'));
        txt.Text := 'CPF/CNPJ';

        txt := TListItemText(Objects.FindDrawable('lblTelefone'));
        txt.Text := 'TELEFONE';

        txt := TListItemText(Objects.FindDrawable('lblValor'));
        txt.Text := 'VALOR';

        txt := TListItemText(Objects.FindDrawable('lblStatus'));
        txt.Text := 'STATUS';

        txt := TListItemText(Objects.FindDrawable('lblConta'));
        txt.Text := 'CONTA';

        txt := TListItemText(Objects.FindDrawable('lblMovimentacao'));
        txt.Text := 'MOVIMENTAÇÃO';

      end;
    end;

    for x := 1 to qry.RecordCount do
    begin
      if qry.FieldByName('Status').AsString = 'ABERTO' then
      begin
        color := $FF000000;
        qnt := qry.RecordCount;
        valorTotal := valorTotal + qry.FieldByName('valor').AsFloat;
      end
      ELSE if qry.FieldByName('Status').AsString = 'PAGO' then
      begin
        color := $FF36C400;
      end
      ELSE if qry.FieldByName('Status').AsString = 'VENCIDA' then
      begin
        color := $FFFF0000;
        qnt := qry.RecordCount;
        valorTotal := valorTotal + qry.FieldByName('valor').AsFloat;
      end;
      item := lst_Principal.Items.Add;

      with item do
      begin

        txt := TListItemText(Objects.FindDrawable('Codigo'));
        txt.Text := formatfloat('0000', qry.FieldByName('id').AsFloat);
        txt.TagString := qry.FieldByName('id').AsString;
        txt.TextColor := color;

        txt := TListItemText(Objects.FindDrawable('Parcela'));
        txt.Text := qry.FieldByName('parcela').AsString;
        txt.TextColor := color;

        txt := TListItemText(Objects.FindDrawable('Vencimento'));
        txt.Text := qry.FieldByName('Vencimento').AsString;
        txt.TextColor := color;

        txt := TListItemText(Objects.FindDrawable('Nome'));
        txt.Text := qry.FieldByName('Nome').AsString;
        txt.TextColor := color;

        txt := TListItemText(Objects.FindDrawable('Cpf'));
        txt.Text := qry.FieldByName('Cpf_pessoa').AsString;
        txt.TextColor := color;

        txt := TListItemText(Objects.FindDrawable('Telefone'));
        txt.Text := qry.FieldByName('telefone').AsString;
        txt.TextColor := color;

        txt := TListItemText(Objects.FindDrawable('Valor'));
        txt.Text := 'R$' + formatfloat('#,##0.00', qry.FieldByName('Valor').AsFloat);
        txt.TextColor := color;

        txt := TListItemText(Objects.FindDrawable('Status'));
        txt.Text := qry.FieldByName('Status').AsString;
        txt.TextColor := color;

        txt := TListItemText(Objects.FindDrawable('Conta'));
        txt.Text := qry.FieldByName('Conta').AsString;
        txt.TextColor := color;

        txt := TListItemText(Objects.FindDrawable('Movimentacao'));
        txt.Text := qry.FieldByName('Movimentacao').AsString;
        txt.TextColor := color;

      end;

      qry.Next
    end;

    lbl_Qnt.Text := 'Qnt. de Parcelas:' + sLineBreak + formatfloat('0000', qnt.ToDouble);

    lbl_Valor.Text := 'Valor das Parcelas:' + sLineBreak + formatfloat('R$#,##0.00', valorTotal);
  finally

    lst_Principal.EndUpdate;
    FreeAndNil(qry);
  end;
end;

end.
