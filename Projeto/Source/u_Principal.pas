unit u_Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls,
  u_CadContaBanco, u_CadPessoa, u_Library, FMX.Edit, FMX.WebBrowser, View.WebCharts, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, Charts.Types, FMX.TabControl, System.Rtti, FMX.Grid.Style, Data.Bind.EngExt, FMX.Bind.DBEngExt,
  FMX.Bind.Grid, System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, FMX.ScrollBox,
  FMX.Grid, FMX.Effects, Datasnap.DBClient, Repositorio.Conexao, Repositorio.Dump,SHDocVw
  ; // u_CadUsuario;

type
  TFrmPrincipal = class(TForm)
    QVenda: TFDQuery;
    Cds_DespesaMensal: TFDMemTable;
    Cds_DespesaMensalLabel: TStringField;
    Cds_DespesaMensalRGB: TStringField;
    Cds_DespesaMensalvalue: TFloatField;
    Cds_Compra: TFDMemTable;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    Cds_Venda: TFDMemTable;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField2: TFloatField;
    QCompra: TFDQuery;
    QDespesaMensal: TFDQuery;
    Cds_TipoDespesa: TFDMemTable;
    StringField5: TStringField;
    StringField6: TStringField;
    FloatField3: TFloatField;
    QTipoDespesa: TFDQuery;
    QQntCbsCompra: TFDQuery;
    QQntCbVenda: TFDQuery;
    Cds_QntCbsCompra: TFDMemTable;
    StringField7: TStringField;
    StringField8: TStringField;
    FloatField4: TFloatField;
    Cds_QntCbsVenda: TFDMemTable;
    StringField9: TStringField;
    StringField10: TStringField;
    FloatField5: TFloatField;
    QCard3: TFDQuery;
    QCard2: TFDQuery;
    QCard1: TFDQuery;
    Layout11: TLayout;
    ToolBar1: TToolBar;
    Rectangle6: TRectangle;
    Rectangle13: TRectangle;
    Label39: TLabel;
    Rectangle19: TRectangle;
    Label40: TLabel;
    Rectangle21: TRectangle;
    Label45: TLabel;
    Rectangle22: TRectangle;
    Label46: TLabel;
    lay_Relatorio: TLayout;
    Layout13: TLayout;
    Layout14: TLayout;
    Layout15: TLayout;
    Rectangle24: TRectangle;
    Label48: TLabel;
    Rectangle20: TRectangle;
    Label41: TLabel;
    Rectangle23: TRectangle;
    Pessoas: TLabel;
    Rectangle25: TRectangle;
    Label47: TLabel;
    Rectangle26: TRectangle;
    Label49: TLabel;
    Rectangle27: TRectangle;
    Label50: TLabel;
    Rectangle28: TRectangle;
    Label51: TLabel;
    Rectangle29: TRectangle;
    Label52: TLabel;
    Rectangle30: TRectangle;
    Label53: TLabel;
    Rectangle31: TRectangle;
    Label54: TLabel;
    Rectangle32: TRectangle;
    Label55: TLabel;
    Rectangle33: TRectangle;
    Image2: TImage;
    lbl_DataDia: TLabel;
    ShadowEffect1: TShadowEffect;
    ShadowEffect2: TShadowEffect;
    WebCharts1: TWebCharts;
    lay_Center: TLayout;
    lay_Grafico: TLayout;
    Rectangle1: TRectangle;
    lbl_hora: TLabel;
    Timer1: TTimer;
    Rectangle2: TRectangle;
    Label1: TLabel;
    Rectangle3: TRectangle;
    Label2: TLabel;
    WebCharts2: TWebCharts;
    rct_Parametros: TRectangle;
    Label3: TLabel;
    Label4: TLabel;
    rct_contas: TRectangle;
    btnContas: TLabel;
    QCard4: TFDQuery;
    QCard5: TFDQuery;
    WebBrowser1: TWebBrowser;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rct_CadPessoasClick(Sender: TObject);
    procedure Rct_CadDespesasClick(Sender: TObject);
    procedure rct_CadContaBancariasClick(Sender: TObject);
    procedure rct_CadLotesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rct_BtnComprasClick(Sender: TObject);
    procedure rct_BtnVendasClick(Sender: TObject);
    procedure rct_RelatDespesasClick(Sender: TObject);
    procedure rct_RelatPessoaClick(Sender: TObject);
    procedure rct_RelatCompraClick(Sender: TObject);
    procedure rct_RelatVendaClick(Sender: TObject);
    procedure Rectangle16Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Rectangle2Click(Sender: TObject);
    procedure mouseenter(Sender: TObject);
    procedure mouseleave(Sender: TObject);
    procedure Rectangle3Click(Sender: TObject);
    procedure rct_ParametrosClick(Sender: TObject);
    procedure rct_contasClick(Sender: TObject);

  private
    FActiveForm: TForm;
    procedure FormOpen(aForm: TComponentClass);
    function FormEstaCriado(AClass: TClass): Boolean;
    procedure DestruirForms;
    procedure GeraGrafico;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.fmx}

uses u_CadLote, u_CadDespesas, u_DM, u_Splash, u_CadCompra,
  u_CadVenda, u_RelatDespesa, u_RelatPessoas, u_RelatCompra, u_RelatVendas,
  u_CadUsuario, u_Grafico_Explore, Winapi.Windows, System.IniFiles, FMX.frxFMX, u_Parametros, u_ContasRecebPagar;

procedure TFrmPrincipal.FormOpen(aForm: TComponentClass);
var
  i: integer;
begin
  DestruirForms;
//  if (FActiveForm = nil) or (Assigned(FActiveForm) and (FActiveForm.ClassName <> aForm.ClassName)) then
//  begin
    for i := lay_Center.ControlsCount - 1 downto 0 do
      lay_Center.RemoveObject(lay_Center.Controls[i]);
    FActiveForm.Free;
    FActiveForm := nil;
    if (not FormEstaCriado(aForm)) then
    begin
      Application.CreateForm(aForm, FActiveForm);
      lay_Center.AddObject(TLayout(FActiveForm.FindComponent('lay_Principal')));
    end;
    lay_Grafico.Visible := false;
//  end;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  FrmPrincipal.WindowState := wsMaximized;
  GeraGrafico;
end;

procedure TFrmPrincipal.mouseenter(Sender: TObject);
begin
  TRectangle(Sender).Fill.Color := $FF4EC626;
end;

procedure TFrmPrincipal.mouseleave(Sender: TObject);
begin
  TRectangle(Sender).Fill.Color := $FFFBFBFB;
end;

procedure TFrmPrincipal.rct_CadContaBancariasClick(Sender: TObject);
begin
  FormOpen(TFrmCadContaBanco);
end;

procedure TFrmPrincipal.Rct_CadDespesasClick(Sender: TObject);
begin
  FormOpen(TFrmCadDespesas);
end;

procedure TFrmPrincipal.Rectangle16Click(Sender: TObject);
begin
  FormOpen(TFrmCadUsuario);
end;

procedure TFrmPrincipal.Rectangle2Click(Sender: TObject);
begin
 if mensagemConfirmacao('Deseja sair do sistema?') = mrYes then
  begin
    Rectangle3Click(Self);
    Application.Terminate  ;
  end
  else
    abort;

end;

procedure TFrmPrincipal.Rectangle3Click(Sender: TObject);
var
  aConexao: TRepositorioConexao;
  oBackup: TRepositorioDump;
  Caminho: string;
  ArquivoINI: TIniFile;
begin

  aConexao := TRepositorioConexao.Cria_Se;
  oBackup := TRepositorioDump.Cria_Se(aConexao);

  try
    if not(DirectoryExists(GetCurrentDir + '\BackupDB')) then
      ForceDirectories(GetCurrentDir + 'BackupDB');


    Caminho := GetCurrentDir + '\BackupDB\Bkp-' + FormatDateTime('dd-mm-yyyy', now);

      if DirectoryExists(Caminho) then
        removedir(Caminho);



    ArquivoINI := TIniFile.Create(GetCurrentDir + '\ConfiguracaoINI.ini');

    if aConexao.Conectar(DesCriptografa(ArquivoINI.ReadString('Servidor', 'Server', '')),
      DesCriptografa(ArquivoINI.ReadString('Servidor', 'DataBase', '')),
      StrToInt(DesCriptografa(ArquivoINI.ReadString('Servidor', 'Port', ''))),
      DesCriptografa(ArquivoINI.ReadString('Servidor', 'User_name', '')), DesCriptografa(ArquivoINI.ReadString('Servidor', 'Password', '')),
      True) then
      oBackup.Backup(Caminho, 'AgroJun');


  finally
    ArquivoINI.Free;
    oBackup.Destrua_Se;
    aConexao.Destrua_Se;
  end;


end;

procedure TFrmPrincipal.Timer1Timer(Sender: TObject);
begin
  lbl_hora.Text := FormatDateTime('HH:MM:SS', now);
end;

procedure TFrmPrincipal.rct_RelatVendaClick(Sender: TObject);
begin
  FormOpen(TfrmRelatVenda);
end;

procedure TFrmPrincipal.rct_RelatCompraClick(Sender: TObject);
begin

  FormOpen(TFrmRelatCompra);
end;

procedure TFrmPrincipal.rct_RelatDespesasClick(Sender: TObject);
begin
  FormOpen(TFrmRelatDespesa);
end;

procedure TFrmPrincipal.rct_RelatPessoaClick(Sender: TObject);
begin
  FormOpen(TFrmRelatorioPessoa);
end;

procedure TFrmPrincipal.rct_BtnComprasClick(Sender: TObject);
begin
  FormOpen(TFrmCadCompra);
end;

procedure TFrmPrincipal.rct_BtnVendasClick(Sender: TObject);
begin
  FormOpen(TFrmCadVenda);
end;

procedure TFrmPrincipal.rct_CadLotesClick(Sender: TObject);
begin
  FormOpen(TFrmCadLote);
end;

procedure TFrmPrincipal.rct_CadPessoasClick(Sender: TObject);
begin
  FormOpen(TFrmCadPessoa);
end;

procedure TFrmPrincipal.rct_contasClick(Sender: TObject);
begin
   FormOpen(TFrmContasRecebPagar);
end;

procedure TFrmPrincipal.rct_ParametrosClick(Sender: TObject);
begin

   FormOpen(TFrmParametro);
end;

procedure TFrmPrincipal.DestruirForms;
begin
  FreeAndNil(FrmParametro);
  FreeAndNil(FrmRelatCompra);
  FreeAndNil(FrmRelatorioPessoa);
  FreeAndNil(FrmRelatDespesa);
  FreeAndNil(FrmCadVenda);
  FreeAndNil(FrmCadCompra);
  FreeAndNil(FrmCadDespesas);
  FreeAndNil(FrmCadLote);
  FreeAndNil(FrmCadPessoa);
  FreeAndNil(FrmCadContaBanco);

end;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Halt(0);
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  Rectangle32.Visible := True;
  rct_Parametros.Visible := false;
  lbl_DataDia.Text := (DiaSemana(now) + ', ' + FormatDateTime('dd', now) + ' de ' + ExtensoMes(StrToInt(FormatDateTime('mm', now))));
  Timer1.Enabled := True;

end;

function TFrmPrincipal.FormEstaCriado(AClass: TClass): Boolean;
var
  i: integer;
begin
  Result := false;
  for i := 0 to Screen.FormCount - 1 do
  begin
    if Screen.Forms[i] is AClass then
    begin
      Result := True;
      Break;
    end;
  end;
end;

procedure TFrmPrincipal.GeraGrafico;
begin

  Cds_DespesaMensal.Active := false;
  Cds_DespesaMensal.Active := True;

  Cds_Compra.Active := false;
  Cds_Compra.Active := True;

  Cds_Venda.Active := false;
  Cds_Venda.Active := True;

  Cds_QntCbsCompra.Active := false;
  Cds_QntCbsCompra.Active := True;

  Cds_QntCbsVenda.Active := false;
  Cds_QntCbsVenda.Active := True;

  Cds_TipoDespesa.Active := false;
  Cds_TipoDespesa.Active := True;

  (* ***** GRAFICO 1 BEGIN  ********************** *)
  Cds_Compra.EmptyDataSet;
  QCompra.Close;
  QCompra.sql.Clear;
  QCompra.sql.Add('SELECT m.descricao as Label, coalesce((select Sum(d.valortotal_compra) from compras d ' +
    'where month(d.data_compra) = m.id_mes), 0) as Value, ''0,187,41'' as RGB FROM meses m');
  QCompra.Active := True;
  QCompra.First;

  while not QCompra.Eof do
  begin
    Cds_Compra.Append;
    Cds_Compra.FieldByName('RGB').Value := QCompra.FieldByName('RGB').Value;
    Cds_Compra.FieldByName('Label').Value := QCompra.FieldByName('Label').Value;
    Cds_Compra.FieldByName('Value').AsFloat := QCompra.FieldByName('Value').AsFloat;
    Cds_Compra.Post;
    QCompra.Next;
  end;

  Cds_Venda.EmptyDataSet;
  QVenda.Close;
  QVenda.sql.Clear;
  QVenda.sql.Add('SELECT m.descricao as Label, coalesce((select Sum(d.valortotal_venda) from vendas d ' +
    'where month(d.data_venda) = m.id_mes), 0) as Value, ''0,187,41'' as RGB FROM meses m');
  QVenda.Active := True;
  QVenda.First;

  while not QVenda.Eof do
  begin
    Cds_Venda.Append;
    Cds_Venda.FieldByName('RGB').Value := QVenda.FieldByName('RGB').Value;
    Cds_Venda.FieldByName('Label').Value := QVenda.FieldByName('Label').Value;
    Cds_Venda.FieldByName('Value').AsFloat := QVenda.FieldByName('Value').AsFloat;
    Cds_Venda.Post;
    QVenda.Next;
  end;

  (* ***** GRAFICO 1 END ********************** *)

  (* ***** GRAFICO 2 BEGIN ********************** *)
  Cds_DespesaMensal.EmptyDataSet;
  QDespesaMensal.Close;
  QDespesaMensal.sql.Clear;
  QDespesaMensal.sql.Add('SELECT m.descricao as label, coalesce((select Sum(d.valor) from despesas d ' +
    'where month(d.data_despesa) = m.id_mes), 0) as value, ''0,187,41'' as RGB FROM meses m');
  QDespesaMensal.Active := True;
  QDespesaMensal.First;

  while not QDespesaMensal.Eof do
  begin
    Cds_DespesaMensal.Append;
    Cds_DespesaMensal.FieldByName('RGB').Value := QDespesaMensal.FieldByName('RGB').Value;
    Cds_DespesaMensal.FieldByName('Label').Value := QDespesaMensal.FieldByName('Label').Value;
    Cds_DespesaMensal.FieldByName('Value').AsFloat := QDespesaMensal.FieldByName('Value').AsFloat;
    Cds_DespesaMensal.Post;
    QDespesaMensal.Next;
  end;
  (* ***** GRAFICO 2 END ********************** *)

  (* ***** GRAFICO 3 BEGIN ********************** *)
  Cds_QntCbsCompra.EmptyDataSet;
  QQntCbsCompra.Close;
  QQntCbsCompra.sql.Clear;
  QQntCbsCompra.sql.Add('SELECT m.descricao as Label, coalesce((select Sum(d.quantidade_cbs) from compras d ' +
    'where month(d.data_compra) = m.id_mes), 0) as Value, ''0,187,41'' as RGB FROM meses m');
  QQntCbsCompra.Active := True;
  QQntCbsCompra.First;

  while not QQntCbsCompra.Eof do
  begin
    Cds_QntCbsCompra.Append;
    Cds_QntCbsCompra.FieldByName('RGB').Value := QQntCbsCompra.FieldByName('RGB').Value;
    Cds_QntCbsCompra.FieldByName('Label').Value := QQntCbsCompra.FieldByName('Label').Value;
    Cds_QntCbsCompra.FieldByName('Value').AsFloat := QQntCbsCompra.FieldByName('Value').AsFloat;
    Cds_QntCbsCompra.Post;
    QQntCbsCompra.Next;
  end;

  Cds_QntCbsVenda.EmptyDataSet;
  QQntCbVenda.Close;
  QQntCbVenda.sql.Clear;
  QQntCbVenda.sql.Add('SELECT m.descricao as Label, coalesce((select Sum(d.quantidade_cbs) from vendas d ' +
    'where month(d.data_venda) = m.id_mes), 0) as Value, ''0,187,41'' as RGB FROM meses m');
  QQntCbVenda.Active := True;
  QQntCbVenda.First;

  while not QQntCbVenda.Eof do
  begin
    Cds_QntCbsVenda.Append;
    Cds_QntCbsVenda.FieldByName('RGB').Value := QQntCbVenda.FieldByName('RGB').Value;
    Cds_QntCbsVenda.FieldByName('Label').Value := QQntCbVenda.FieldByName('Label').Value;
    Cds_QntCbsVenda.FieldByName('Value').AsFloat := QQntCbVenda.FieldByName('Value').AsFloat;
    Cds_QntCbsVenda.Post;
    QQntCbVenda.Next;
  end;
  (* ***** GRAFICO 3 END ********************** *)

  (* ***** GRAFICO 4 BEGIN ********************** *)
  Cds_TipoDespesa.EmptyDataSet;
  QTipoDespesa.Close;
  QTipoDespesa.sql.Clear;
  QTipoDespesa.sql.Add(' select ' + ' case tipo_despesa ' + ' when 1 then ''VITRINE'' ' + ' when 2 then ''ESCRITÓRIO'' ' +
    ' when 3 then ''FUNCIONÁRIO'' ' + ' when 4 then ''GADO'' ' + ' when 5 then ''ARRENDAMENTO'' ' +' else ''OUTROS'' end as label, ' + ' sum(valor) as Value, ' +
    ' case tipo_despesa ' + ' when 1 then ''154,192,205'' ' + ' when 2 then ''102,205,170'' ' + ' when 3 then ''0,205,102'' ' +
    ' when 4 then ''205,181,205'' ' + ' else ''205,198,115'' end as RGB ' + ' from Despesas ' +
    ' where month(data_despesa) = Month(CURDATE()) ' + ' group by tipo_despesa ');
  QTipoDespesa.Active := True;
  QTipoDespesa.First;

  while not QTipoDespesa.Eof do
  begin
    Cds_TipoDespesa.Append;
    Cds_TipoDespesa.FieldByName('RGB').Value := QTipoDespesa.FieldByName('RGB').Value;
    Cds_TipoDespesa.FieldByName('Label').Value := QTipoDespesa.FieldByName('Label').Value;
    Cds_TipoDespesa.FieldByName('Value').AsFloat := QTipoDespesa.FieldByName('Value').AsFloat;
    Cds_TipoDespesa.Post;
    QTipoDespesa.Next;
  end;
  (* ***** GRAFICO 4 END ********************** *)

  (* ***** GRAFICO 5 BEGIN ********************** *)
  (* ***** GRAFICO 5 END ********************** *)

  (* ***** CARD 1 BEGIN ********************** *)

  QCard1.Close;
  QCard1.sql.Clear;
  QCard1.sql.Add('select  IFNULL(sum(qtd_animais), 0) as cbs, count(id) as lote from lotes where ativo = 1');
  QCard1.Active := True;
  (* ***** CARD 1 END ********************** *)

  (* ***** CARD 2 BEGIN ********************** *)
  QCard2.Close;
  QCard2.sql.Clear;
  QCard2.sql.Add('SELECT count(id) as id FROM compras ');
  QCard2.Active := True;
  (* ***** CARD 2 END ********************** *)

  (* ***** CARD 3 BEGIN ********************** *)
  QCard3.Close;
  QCard3.sql.Clear;
  QCard3.sql.Add('SELECT count(id) as id FROM vendas ');
  QCard3.Active := True;
  (* ***** CARD 3 END ********************** *)

    (* ***** CARD 4 BEGIN ********************** *)
  QCard4.Close;
  QCard4.sql.Clear;
  QCard4.sql.Add('SELECT  count(IFNULL(id, 0)) as id, IFNULL(sum(valor), 0) as valor FROM parcelas '+
' WHERE  MONTH(data) = MONTH(CURDATE()) and movimentacao <> ''V'' ORDER BY data; ');
  QCard4.Active := True;
  (* ***** CARD 4 END ********************** *)

    (* ***** CARD 5 BEGIN ********************** *)
  QCard5.Close;
  QCard5.sql.Clear;
  QCard5.sql.Add(' SELECT  count(IFNULL(id, 0)) as id , IFNULL(sum(valor), 0) as valor FROM parcelas ' +
    ' WHERE  MONTH(data) = MONTH(CURDATE()) and movimentacao = ''V'' ORDER BY data;');
  QCard5.Active := True;
  (* ***** CARD 5 END ********************** *)

  WebCharts1.AddResource('<link href="css/green.css" rel="stylesheet">').AddResource('<link href="css/custom.min.css" rel="stylesheet">')

  // .BackgroundColor('#313337')
  // .FontColor('#FFFFFF')
    .NewProject

  // Criando uma Linha com 6 Colunas e Adicionando conteudo HTML em cada uma
  // dessas colunas
    .Rows._Div.ColSpan(2).Add('<span class="count_top">' + '  <i class="fas fa-user"></i> Total de Cabeças Restantes ' + '</span>' +
    '<div class="count" style="font-size:  40px;"> ' + QCard1.FieldByName('cbs').AsString + '</div>' + '<span class="count_bottom"> ' +
    '  <i class="green"><i class="fa fa-angle-up"> Em </i>' + QCard1.FieldByName('lote').AsString + ' </i> Lote(s) Ativo ' + '</span> ')
    .&End._Div.ColSpan(2).Add('<span class="count_top">' + '  <i class="fa fa-clock-o"></i> Quantidades de Compras ' + '</span>' +
    '<div class="count" style="font-size:  40px;">' + QCard2.FieldByName('id').AsString + '</div>' + '<span class="count_bottom"> ' +
    // '  <i class="green"><i class="fa fa-angle-up"></i>3% </i> From last Week' +
    '</span> ').&End._Div.ColSpan(2).Add('<span class="count_top">' + '  <i class="fa fa-user"></i> Quantidades de Vendas ' + '</span>' +
    '<div class="count" style="font-size: 40px; color: #1ABB9C;">' + QCard3.FieldByName('id').AsString + '</div>' +
    '<span class="count_bottom"> ' +
    // '  <i class="green"><i class="fa fa-angle-up"></i>34% </i> From last Week ' +
    '</span> ').&End

    ._Div
    .ColSpan(2)
    .Add('<span class="count_top">' +
    '  <i class="fa fa-user"></i> Contas a Pagar da Semana ' +
    '</span>' +
    '<div class="count" style="font-size:  40px;">' + QCard4.FieldByName('id').AsString + '</div>' +
    '<span class="count_bottom"> ' +
    '  <i class="red"> Total de <i class="fa fa-angle-down"></i>' + formatfloat('R$#,##0.00',QCard4.FieldByName('valor').AsFloat) + ' </i>  ' +
    '</span> ')
    .&End

     ._Div
    .ColSpan(2)
    .Add('<span class="count_top">' +
    '  <i class="fa fa-user"></i> Contas a Receber da Semana ' +
    '</span>' +
    '<div class="count" style="font-size:  40px;">' + QCard5.FieldByName('id').AsString + '</div>' +
    '<span class="count_bottom"> ' +
    '  <i class="red"> Total de <i class="fa fa-angle-down"></i>' + formatfloat('R$#,##0.00',QCard5.FieldByName('valor').AsFloat) + ' </i>  ' +
    '</span> ')
    .&End
    (*
    ._Div
    .ColSpan(2)
    .Add('<span class="count_top">' +
    '  <i class="fa fa-user"></i> Total Connections ' +
    '</span>' +
    '<div class="count" style="font-size:  40px;">7,325</div>' +
    '<span class="count_bottom"> ' +
    '  <i class="green"><i class="fa fa-angle-up"></i>54% </i> From last Week ' +
    '</span> ')
    .&End
  *)

    .&End

  // Pulando Linha
    .Jumpline

  // Adicionando uma nova linha com um gráfico LineStack e Barras Horizontal
    .Rows

  // Adicionando Grafico LineStacked
    .Tag.Add(WebCharts1.ContinuosProject.Charts._ChartType(line).Attributes
    // .Labelling
    // .Format('$0,0.00') //Consultar em http://numeraljs.com/#format
    // .RGBColor('0,187,41') //Cor RGB separado por Virgula
    // .FontSize(12)
    // .FontStyle('bold') //normal, bold, italic
    // .FontFamily('Arial') //Open Sans, Arial, Helvetica e etc..
    // .Padding(5) //Numeros negativos e positivos
    // .&End
    .Name('linestacked1').ColSpan(8).Heigth(150)
    // .Title('Network Activities Graph title sub-title')
    .DataSet.textLabel('Compras Mensais (R$)').DataSet(Cds_Compra).BackgroundColor('0,187,41').BorderColor('0,187,41')
    .&End.DataSet.textLabel('Vendas Mensais (R$)').DataSet(Cds_Venda).BackgroundColor('26,187,156').BorderColor('26,187,156')
    .&End.&End.&End.&End.HTML).&End

  // Adicionando Grafico Barras Horizontal
    .Tag.Add(WebCharts1.ContinuosProject.Charts._ChartType(bar).Attributes.Name('horizontabar1').ColSpan(4).Heigth(295)
    // .Title('Top Campaign Performance')
    .DataSet.textLabel('Despesas Mensais (R$)').DataSet(Cds_DespesaMensal).BackgroundColor('26,187,156').BorderColor('26,187,156')
    .&End.&End.&End.&End.HTML).&End.&End

    .Rows.Tag.Add(WebCharts1.ContinuosProject.Charts._ChartType(bar).Attributes.Name('horizontabar2').ColSpan(4).Heigth(295)
    // .Title('App Usage across versions')
    .DataSet.textLabel('Quantidade de Cabeças Compras').DataSet(Cds_QntCbsCompra).BackgroundColor('0,187,41').BorderColor('26,187,156')
    .&End.DataSet.textLabel('Quantidade de Cabeças Vendidas').DataSet(Cds_QntCbsVenda).BackgroundColor('26,187,156')
    .BorderColor('26,187,156').&End.&End.&End.&End.HTML).&End

    .Tag.Add(WebCharts1.ContinuosProject.Charts._ChartType(doughnut).Attributes.Name('Doughnut').ColSpan(4).Heigth(235)
    // .Title('Device Usage')
    .DataSet.textLabel('Meu DataSet 1').DataSet(Cds_TipoDespesa)
    // .BackgroundColor('26,187,156')
    .BorderColor('227,233,235').&End.&End.&End.&End.HTML).&End

    .&End
    .WebBrowser(WebBrowser1)
    .Generated;

end;

procedure TFrmPrincipal.Image2Click(Sender: TObject);
begin
  GeraGrafico;
  lay_Grafico.Visible := True;
end;

end.
