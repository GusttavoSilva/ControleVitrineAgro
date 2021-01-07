unit u_CadLote;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  u_CrudCad, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.Edit, FMX.Objects, FMX.ListView,
  FMX.TabControl, FMX.Controls.Presentation, FMX.Layouts, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FMX.ComboEdit, FMX.DateTimeCtrls, System.Rtti,
  FMX.Grid.Style, FMX.Grid, FMX.ScrollBox;

type
  TFrmCadLote = class(TFrmCrud)
    lytInfo: TLayout;
    lytObs: TLayout;
    ed_Obs: TEdit;
    lytNumero: TLayout;
    ed_Numero: TEdit;
    lytQtd: TLayout;
    ed_QtdAnimais: TEdit;
    Label3: TLabel;
    cds_log: TFDMemTable;
    cds_logid: TStringField;
    cds_lognumero: TStringField;
    cds_logqtd_animais: TStringField;
    cds_logdescricao: TStringField;
    lytNome: TLayout;
    edt_Nome: TEdit;
    TabItem3: TTabItem;
    Layout5: TLayout;
    Layout7: TLayout;
    Image2: TImage;
    Image7: TImage;
    Layout8: TLayout;
    Layout9: TLayout;
    Layout11: TLayout;
    Label4: TLabel;
    Label5: TLabel;
    Layout12: TLayout;
    ed_Qtd: TEdit;
    Layout13: TLayout;
    cbx_Remetente: TComboEdit;
    cbx_Destinatario: TComboEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    lay_error2: TLayout;
    Rectangle4: TRectangle;
    lbl_error2: TLabel;
    Label10: TLabel;
    cds_lognome: TStringField;
    cds_log2: TFDMemTable;
    cds_log2QtdAnteriorRemetente: TStringField;
    cds_log2QtdAnteriorDest: TStringField;
    cds_log2ValorTransf: TStringField;
    cds_log2QtdAtualRem: TStringField;
    cds_log2QtdAtualDest: TStringField;
    cds_log2idRemetente: TIntegerField;
    cds_log2idDestinatario: TIntegerField;
    cds_log2idUser: TIntegerField;
    Layout22: TLayout;
    Label23: TLabel;
    DateEditTransf: TDateEdit;
    Layout21: TLayout;
    ed_ObsTransf: TEdit;
    cds_log2descricao: TStringField;
    lytTotalCompraCbs: TLayout;
    ed_VcAtual: TEdit;
    lblTotalCompraCbs: TLabel;
    lytTotalCompra: TLayout;
    ed_VtAtual: TEdit;
    lblTotalCompra: TLabel;
    lytTotalDespesa: TLayout;
    ed_DspAtual: TEdit;
    lblTotalDespesa: TLabel;
    lytTotalDespesaCbs: TLayout;
    ed_DspCbsAtual: TEdit;
    lblTotalDespesaCbs: TLabel;
    Image3: TImage;
    lblQtd: TLabel;
    StringGridAnimais: TStringGrid;
    id: TStringColumn;
    qtd: TStringColumn;
    idade_animal: TStringColumn;
    raca_animal: TStringColumn;
    sexo: TStringColumn;
    valor_animal: TStringColumn;
    valor_total: TStringColumn;
    lytStringGrid: TLayout;
    lblGridAnimais: TLabel;
    lblObs: TLabel;
    lytGridTransf: TLayout;
    StringGridTransf: TStringGrid;
    cod: TStringColumn;
    qtd_atual: TStringColumn;
    idade: TStringColumn;
    raca: TStringColumn;
    sexo_animal: TStringColumn;
    qtd_transf: TStringColumn;
    Label8: TLabel;
    Rectangle5: TRectangle;
    vt_unitario: TStringColumn;
    vt_total: TStringColumn;
    StringColumn1: TStringColumn;
    despesa_cbs: TStringColumn;
    cod_compra: TStringColumn;
    StringColumn2: TStringColumn;
    procedure Img_BtnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lst_PrincipalItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Img_BtnCancelarClick(Sender: TObject);
    procedure Img_BtnExcluirClick(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure cbx_RemetenteChange(Sender: TObject);
    procedure cbx_DestinatarioChange(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Img_BtnEditarClick(Sender: TObject);
    procedure Img_BtnNovoClick(Sender: TObject);
    procedure edt_NomeKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure Img_BtnVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Validar(cod_vali: integer);
    procedure ConsultaBancoLotes;
    function ValidarLote(numero: string): string;
    procedure PopularCampos(Query: TFDQuery);
    procedure ConsultaLotesRemetente;
    procedure ConsultaLotasDestinatario(remetente: string);
    function BuscarQtdAnimas(numero: string): integer;
    function AlterarQtdAnimais(numero: string; qtd: integer): integer;
    procedure ValidarTransferencia;
    procedure LogLotes;
    procedure LogTransfLotes;
    procedure InativarLote(numero: string);
    procedure AgruparLote( rem: string; dest: string; qtd:integer; data : string);
    procedure PopularLotesItens(Query: TFDQuery);
    procedure LimpaStringGrid(RowNumber: Integer; StringGrid1: TStringGrid);
    procedure PopularLotesItensTrans(Query: TFDQuery);
  end;

var
  FrmCadLote: TFrmCadLote;
  Cod_Selecao: integer;

implementation

uses
  u_Library, u_DM;

{$R *.fmx}

procedure TFrmCadLote.AgruparLote(rem, dest: string; qtd: integer; data : string);
const
  SQL = 'INSERT INTO agrojun.agrupar_lotes (id_rem, id_dest, qtd, data_agrupamento) VALUES (:id_rem, :id_dest, :qtd, :data)';
var
  Query: TFDQuery;
begin
  inherited;
  try
    // AGRUPAR LOTES
    Query := TFDQuery.Create(self);
    Query.Connection := dm.FDConnection;
    Query.FetchOptions.RowsetSize := 50000;
    Query.Active := false;
    Query.SQL.Clear;
    Query.SQL.Add(SQL);
    Query.ParamByName('id_rem').AsString := rem;
    Query.ParamByName('id_dest').AsString := dest;
    Query.ParamByName('qtd').Asinteger := qtd;
    Query.ParamByName('data').AsDateTime := StrToDateTime(data);
    Query.ExecSQL;
  finally
    FreeAndNil(Query);
  end;
end;

function TFrmCadLote.AlterarQtdAnimais(numero: string; qtd: integer): integer;
const
  SQL = 'UPDATE agrojun.lotes SET qtd_animais = :qtd_animais WHERE id = :id';
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
      Query.ParamByName('qtd_animais').AsInteger := qtd;
      Query.ParamByName('id').AsString := numero;
      Query.ExecSQL;
      Result := 1;
    except
      Result := 0;
    end;
    // Result := Query.FieldByName('qtd_animais').AsInteger;
  finally
    FreeAndNil(Query);
  end;
end;


function TFrmCadLote.BuscarQtdAnimas(numero: string): integer;
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
    Query.ParamByName('id').AsString := numero;
    Query.Active := true;
    Result := Query.FieldByName('qtd_animais').AsInteger;
  finally
    FreeAndNil(Query);
  end;
end;

procedure TFrmCadLote.cbx_DestinatarioChange(Sender: TObject);
begin
  inherited;
  if cbx_Remetente.ItemIndex <> 0 then
  begin
    ed_Qtd.Enabled := true;
    ed_ObsTransf.Enabled := true;
    DateEditTransf.Enabled := true;
  end
  else
  begin
    ed_Qtd.Enabled := false;
    ed_ObsTransf.Enabled := false;
    DateEditTransf.Enabled := false;
  end;
end;

procedure TFrmCadLote.cbx_RemetenteChange(Sender: TObject);
const
  SQLItens = 'select li.*, c.lote as lote_origem, i.idade_animal as idade, r.raca as raca from lotes_itens as li   '+
            'left outer join lotes as l on (li.id_compra = l.id_compra)                                            '+
            'left outer join compras as c on (li.id_compra = c.id)                                                 '+
            'left outer join idade_animal as i on (i.id = li.idade_animal)                                         '+
            'left outer join raca_animal as r on(r.id = li.raca_animal)                                            '+
            'where li.id_lote = :id and li.ativo = 1                                                               '+
            'order by li.id asc;                                                                                   ';
var
  Query: TFDQuery;
begin
  inherited;
  if cbx_Remetente.ItemIndex <> 0 then
  begin
    ConsultaLotasDestinatario
      (copy(cbx_Remetente.Items[cbx_Remetente.ItemIndex], 0, 5));
    cbx_Destinatario.Enabled := true;
    cbx_Destinatario.ItemIndex := 0;

    Query := TFDQuery.Create(self);
    Query.Connection := dm.FDConnection;
    Query.FetchOptions.RowsetSize := 50000;
    Query.Active := false;
    Query.SQL.Clear;
    Query.SQL.Add(SQLItens);
    Query.ParamByName('id').AsInteger := StrToInt(copy(cbx_Remetente.Items[cbx_Remetente.ItemIndex], 0, 5));
    Query.Open();

    PopularLotesItensTrans(Query);
  end
end;

procedure TFrmCadLote.ConsultaBancoLotes;
const
  _SQLbanco = 'select * from agrojun.lotes where ativo = 1';
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

        txt := TListItemText(Objects.FindDrawable('lbl_quantidade'));
        txt.Text := 'QTD ANIMAIS';

        txt := TListItemText(Objects.FindDrawable('lbl_nome'));
        txt.Text := 'NOME DO LOTE';
      end;
    end;

    for x := 1 to QBanco.RecordCount do
    begin

      item := lst_Principal.Items.Add;

      with item do
      begin
//        if QBanco.FieldByName('agrupado').AsInteger = 0 then
//        begin
          txt := TListItemText(Objects.FindDrawable('codigo'));
          txt.Text := formatfloat('0000', QBanco.FieldByName('id').AsFloat);
          txt.TagString := QBanco.FieldByName('id').AsString;

          txt := TListItemText(Objects.FindDrawable('quantidade'));
          txt.Text := QBanco.FieldByName('qtd_animais').AsString;

          txt := TListItemText(Objects.FindDrawable('nome'));
          txt.Text := QBanco.FieldByName('nome').AsString;
//        end
//        else
//        begin
//
//          txt := TListItemText(Objects.FindDrawable('codigo'));
//          txt.Text := formatfloat('0000', QBanco.FieldByName('id').AsFloat);
//          txt.TagString := QBanco.FieldByName('id').AsString;
//
//          txt := TListItemText(Objects.FindDrawable('numero'));
//          txt.Text := formatfloat('00000', QBanco.FieldByName('numero').AsFloat);
//
//          txt := TListItemText(Objects.FindDrawable('quantidade'));
//          txt.Text := QBanco.FieldByName('qtd_animais').AsString;
//
//          txt := TListItemText(Objects.FindDrawable('nome'));
//          txt.Text := QBanco.FieldByName('nome').AsString;
//        end;
      end;

      QBanco.Next
    end;
  finally
    lst_Principal.EndUpdate;
    FreeAndNil(QBanco);
  end;
end;

procedure TFrmCadLote.ConsultaLotasDestinatario(remetente: string);
const
  _SQL = 'SELECT id, nome FROM agrojun.lotes where ativo = 1';
  SQLItens = 'select li.*, c.lote as lote_origem,l.nome, i.idade_animal as idade, r.raca as raca from lotes_itens as li   '+
            'left outer join lotes as l on (li.id_compra = l.id_compra)                                            '+
            'left outer join compras as c on (li.id_compra = c.id)                                                 '+
            'left outer join idade_animal as i on (i.id = li.idade_animal)                                         '+
            'left outer join raca_animal as r on(r.id = li.raca_animal)                                            '+
            'where li.id_lote = :id and li.ativo = 1                                                               '+
            'order by li.id asc;                                                                                   ';
var
  vCampo, cont: integer;
  vResultado: TStringList;
  valid: string;
begin
  dm.QAux := TFDQuery.Create(nil);
  dm.QAux.Connection := dm.FDConnection;
  dm.QAux.FetchOptions.RowsetSize := 50000;
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
        vResultado.Add('INFORME O DESTINATÁRIO...');
        dm.QAux.Active := false;
        dm.QAux.SQL.Clear;
        dm.QAux.SQL.Text := SQLItens;
        dm.QAux.ParamByName('id').AsInteger := StrToInt(copy(cbx_Remetente.Items[cbx_Remetente.ItemIndex], 0, 5));
        dm.QAux.Active := true;
        while vCampo < dm.QAux.RecordCount do
        begin
          if dm.QAux.FieldByName('lote_origem').AsInteger <> StrToInt(remetente) then
            vResultado.Add(formatfloat('00000', dm.QAux.FieldByName('lote_origem')
              .AsFloat) + ' - LOTE*: ' + dm.QAux.FieldByName('nome')
              .AsString);
          dm.QAux.Next;
          vCampo := vCampo + 1;
        end;
        dm.QAux.Active := false;
        dm.QAux.SQL.Clear;
        dm.QAux.SQL.Text := _SQL;
        dm.QAux.Active := true;
        vCampo := 0;
        while vCampo < dm.QAux.RecordCount do
        begin
          if dm.QAux.FieldByName('id').AsInteger <> StrToInt(remetente) then
            vResultado.Add(formatfloat('00000', dm.QAux.FieldByName('id')
              .AsFloat) + ' - Lote: ' + dm.QAux.FieldByName('nome')
              .AsString);
          dm.QAux.Next;
          vCampo := vCampo + 1;
        end;
      end;
      vResultado.EndUpdate;

      cbx_Destinatario.Items := vResultado;
    except
      //
    end;
  finally
    if dm.QAux.Active then
      FreeAndNil(dm.QAux);
  end;
end;

procedure TFrmCadLote.ConsultaLotesRemetente;
const
  _SQL = 'SELECT id, nome FROM agrojun.lotes where ativo = 1';
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
        // cont := 1;
        vResultado.Add('INFORME O REMETENTE...');
        while vCampo < dm.QAux.RecordCount do
        begin
          vResultado.Add(formatfloat('00000', dm.QAux.FieldByName('id').AsFloat)
            + ' - Lote: ' + dm.QAux.FieldByName('nome').AsString);
          dm.QAux.Next;
          // cont := cont + 1;
          vCampo := vCampo + 1;
        end;
      end;
      vResultado.EndUpdate;

      cbx_Remetente.Items := vResultado;
    except
      //
    end;
  finally
    if dm.QAux.Active then
      FreeAndNil(dm.QAux);
  end;
end;

procedure TFrmCadLote.edt_NomeKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
//  if (not(KeyChar in ['0'..'9'])) and (KeyChar <>#0) then
//  begin
//    ShowMessage('Somente números!');
//    KeyChar := #0;
//  end;
end;

procedure TFrmCadLote.FormCreate(Sender: TObject);
begin
  inherited;
  ConsultaBancoLotes;
  ed_pesq.Enabled := true;
end;

procedure TFrmCadLote.Image2Click(Sender: TObject);
const
  SQL = 'SELECT l.*, c.valorporcbs_frete as frete, c.valorporcbs_comissao as comissao, li.id_compra as id_compra from lotes as l '+
        'left outer join compras as c on (c.id = l.id_compra)'+
        'left outer join lotes_itens as li on (li.id_lote = l.id)'+
        'WHERE l.id = :id';
  SQLUpdateD = 'UPDATE agrojun.lotes SET ativo = 1, qtd_animais = :qtd, despesa = :despesa, despesa_cbs = :despesa_cbs, ' +
              ' valortotal_compra = :vt, valorcbs_compra = :vc WHERE id = :id';
  SQLUpdate = 'UPDATE agrojun.lotes SET qtd_animais = :qtd, despesa = :despesa, despesa_cbs = :despesa_cbs, ' +
              ' valortotal_compra = :vt, valorcbs_compra = :vc WHERE id = :id';
  SQLUpItensTodos = 'UPDATE agrojun.lotes_itens SET id_lote = :id_lote WHERE id = :id';
  SQLUpdateItens = 'UPDATE agrojun.lotes_itens SET valorporcbs_animais = :vt_unitario, valortotal_animais = :vt_total, '+
                    'quantidade = :qtd, ativo = :ativo WHERE id = :id' ;
  SQLInsertItens = 'INSERT INTO `agrojun`.`lotes_itens`            '+
                  ' (`valorporcbs_animais`, `valortotal_animais`,   '+
                  ' `idade_animal`, `raca_animal`, `sexo_animal`,   '+
                  ' `quantidade`, `id_lote`, `ativo`, `despesa_cbs`, `id_compra`)                        '+
                  ' VALUES                                          '+
                  ' (:vt_unitario, :vt_total, :idade, :raca, :sexo, '+
                  ' :qtd, :id_lote, :ativo, :despesa_cbs, :id_compra);                                ';
  SQLSelectCompra = 'SELECT id_compra from agrojun.lotes_itens WHERE id = :id' ;
  SQLUpdateLote = 'UPDATE agrojun.lotes SET agrupado = :agrupado WHERE id = :id';
  SQLUpdateLoteOrigem = 'UPDATE agrojun.lotes SET qtd_animais = :qtd, despesa = :despesa, despesa_cbs = :despesa_cbs, ' +
              ' valortotal_compra = :vt, valorcbs_compra = :vc, ativo = 1 WHERE id = :id';
var
  QtdR, QtdD, QtdFinalR, QtdFinalD, QtdTransf, I, IdCompra, agrupado: integer;
  DspTemp, DspR, DspD, DspCbsFinalR, DspFinalR, DspFinalD, DspCbsFinalD : double;
  VTotalR, VTotalD, VTotalTemp, VTotalFinalR, VTotalFinalD : double;
  VCbsR, VCbsD, VCbsTotalFinalR, VCbsTotalFinalD : double;
  FreteR, FreteD, ComissR, ComissD : double;
  Query, qryAux : TFDQuery;
begin
  inherited;
  qryAux := TFDQuery.Create(self);
  qryAux.Connection := dm.FDConnection;
  qryAux.FetchOptions.RowsetSize := 50000;
  if mensagemConfirmacao('Confirma a operação de transferência entre lotes?') = mrYes then
  begin
    ValidarTransferencia;
    QtdTransf := 0;
    for I := 0 to StringGridTransf.RowCount - 1 do
    begin
      // qtd
      if StringGridTransf.Cells[8, I].Equals('') then
      begin
        QtdTransf := QtdTransf + 0;
        StringGridTransf.Cells[8, I] := '0';
      end
      else
      begin
        if StrToInt(StringGridTransf.Cells[8, I]) > StrToInt(StringGridTransf.Cells[1, I]) then
        begin
          ShowMessage('Existem itens com a QUANTIDADE A TRANSFERIR maior do que a QUANTIDADE ATUAL');
          abort
        end
        else
          QtdTransf := QtdTransf + StrToInt(StringGridTransf.Cells[8, I]);
      end;

    end;
    if BuscarQtdAnimas(copy(cbx_Remetente.Items[cbx_Remetente.ItemIndex], 0, 5)) <
      QtdTransf then
      ShowMessage
        ('O lote remetente não tem a quantidade suficiente para fazer essa transferência!')
    else
    begin
      try
        //------------------- POPULANDO VARIAVEIS -----------------------------
          Query := TFDQuery.Create(self);
          Query.Connection := dm.FDConnection;
          Query.FetchOptions.RowsetSize := 50000;
          Query.Active := false;
          Query.SQL.Clear;
          Query.SQL.Add(SQL);
          Query.ParamByName('id').AsInteger := StrToInt(copy(cbx_Remetente.Items[cbx_Remetente.ItemIndex], 0, 5));
          Query.Open();

       // Remetente
        QtdR := Query.FieldByName('qtd_animais').AsInteger;
        DspR := Query.FieldByName('despesa').AsFloat;
        FreteR := Query.FieldByName('frete').AsFloat;
        ComissR := Query.FieldByName('comissao').AsFloat;
        VTotalR := Query.FieldByName('valortotal_compra').AsFloat;
        VCbsR := Query.FieldByName('valorcbs_compra').AsFloat;
        IdCompra := Query.FieldByName('id_compra').AsInteger;

          Query.Active := false;
          Query.SQL.Clear;
          Query.SQL.Add(SQL);
          Query.ParamByName('id').AsInteger := StrToInt(copy(cbx_Destinatario.Items[cbx_Destinatario.ItemIndex], 0, 5));
          Query.Open();

       // Destinatario
        QtdD := Query.FieldByName('qtd_animais').AsInteger;
        DspD := Query.FieldByName('despesa').AsFloat;
        FreteD := Query.FieldByName('frete').AsFloat;
        ComissD := Query.FieldByName('comissao').AsFloat;
        VTotalD := Query.FieldByName('valortotal_compra').AsFloat;
        VCbsD := Query.FieldByName('valorcbs_compra').AsFloat ;

        //QUANTIDADE ANIMAIS FINAL REMENTE
        QtdFinalR := QtdR - QtdTransf;
        //QUANTIDADE ANIMAIS FINAL DESTINATARIO
        QtdFinalD := QtdD + QtdTransf;


        cds_log2.Active := false;
        cds_log2.Active := true;
        cds_log2.EmptyDataSet;
        cds_log2.insert;
        cds_log2.FieldByName('idUser').AsInteger := Cod_User;
        cds_log2.FieldByName('idRemetente').AsInteger :=
          StrToInt(copy(cbx_Remetente.Items[cbx_Remetente.ItemIndex], 0, 5));
        cds_log2.FieldByName('idDestinatario').AsInteger :=
          StrToInt(copy(cbx_Destinatario.Items
          [cbx_Destinatario.ItemIndex], 0, 5));
        cds_log2.FieldByName('QtdAnteriorRemetente').AsString := IntToStr(QtdR);
        cds_log2.FieldByName('QtdAnteriorDest').AsString := IntToStr(QtdD);
        cds_log2.FieldByName('ValorTransf').AsString := IntToStr(QtdTransf);
        cds_log2.FieldByName('QtdAtualRem').AsString := IntToStr(QtdFinalR);
        cds_log2.FieldByName('QtdAtualDest').AsString := IntToStr(QtdFinalD);
        cds_log2.FieldByName('descricao').AsString := ed_ObsTransf.Text;
        cds_log2.Post;

        LogTransfLotes;

        if QtdFinalR = 0 then
        begin
          InativarLote(copy(cbx_Remetente.Items[cbx_Remetente.ItemIndex], 0,
            5));

          Query.Active := false;
          Query.SQL.Clear;
          Query.SQL.Add(SQLUpItensTodos);
          for I := 0 to StringGridTransf.RowCount - 1 do
          begin
            Query.ParamByName('id_lote').AsInteger := StrToInt(copy(cbx_Destinatario.Items[cbx_Destinatario.ItemIndex], 0, 5));
            Query.ParamByName('id').AsInteger := StrToInt(StringGridTransf.Cells[0, I]);

            Query.ExecSQL;
          end;

          //VALOR TOTAL DE COMPRA ATUAL LOTE REMETENTE
          VTotalFinalR := VTotalR - (QtdTransf * VCbsR);

          //VALOR TOTAL DE COMPRA ATUAL LOTE DESTINATARIO
          if QtdFinalR = 0 then
            VTotalFinalD :=  VTotalR + VTotalD
          else
          begin
            if VTotalD <> 0 then
              VTotalFinalD := (QtdTransf * VCbsR) + VTotalD
            else
              VTotalFinalD := (QtdTransf * VCbsR);
          end;

          //VALOR DA DESPESA FINAL DO REMETENTE
          if QtdFinalR <> 0 then
            DspFinalR := DspR - ((QtdTransf * DspR)/ QtdR)
          else
            DspFinalR := 0;

          //VALOR DA DESPESA FINAL DO DESTINARIO
          DspFinalD := ((QtdTransf * DspR)/ QtdR) + DspD;

          //DESPESA/CBS ATUAL REMETENDE
          DspCbsFinalR := DspFinalR / QtdFinalR;

          //DESPESA/CBS ATUAL DESTINATARIO
          DspCbsFinalD := DspFinalD / QtdFinalD;

          //VALOR TOTAL/CBS DE COMPRA ATUAL LOTE REMETENTE
          VCbsTotalFinalR := VTotalFinalR / QtdFinalR;

          //VALOR TOTAL/CBS DE COMPRA ATUAL LOTE DESTINATARIO
          VCbsTotalFinalD := VTotalFinalD / QtdFinalD;

          Query.Active := false;
          Query.SQL.Clear;
          Query.SQL.Add(SQLUpdateD);
          Query.ParamByName('qtd').AsInteger := QtdFinalD;
          Query.ParamByName('despesa').AsFloat := DspFinalD;
          Query.ParamByName('despesa_cbs').AsFloat := DspCbsFinalD;
          Query.ParamByName('vt').AsFloat := VTotalFinalD;
          Query.ParamByName('vc').AsFloat := VCbsTotalFinalD;
          Query.ParamByName('id').AsString := copy(cbx_Destinatario.Items[cbx_Destinatario.ItemIndex], 0, 5);
          Query.ExecSQL;

          Query.Active := false;
          Query.SQL.Clear;
          Query.SQL.Add(SQLUpdateLote);
          if OriginalidadeLoteCompra(StrToInt(copy(cbx_Destinatario.Items[cbx_Destinatario.ItemIndex], 0, 5))) = 0 then
            Query.ParamByName('agrupado').AsInteger := 0
          else
            Query.ParamByName('agrupado').AsInteger := 1;
          Query.ParamByName('id').AsString := copy(cbx_Destinatario.Items[cbx_Destinatario.ItemIndex], 0, 5);
          Query.ExecSQL;

        end
        else
        begin
          VTotalTemp := 0;
          DspTemp := 0;
          //Remetente
          Query.Active := false;
          Query.SQL.Clear;
          Query.SQL.Add(SQLUpdateItens);
          for I := 0 to StringGridTransf.RowCount - 1 do
          begin
            if StrToInt(StringGridTransf.Cells[8, I]) <> 0 then
            begin
              if StrToInt(StringGridTransf.Cells[1,I]) = StrToInt(StringGridTransf.Cells[8, I]) then
              begin
                //valor total
                Query.ParamByName('vt_total').AsFloat := 0;
                //quantidade
                Query.ParamByName('qtd').AsInteger := 0;
                //valor unitario
                Query.ParamByName('vt_unitario').AsFloat := 0;
                //id lotes_item
                Query.ParamByName('id').AsInteger := StrToInt(StringGridTransf.Cells[0, I]);
    //          //ativo
                Query.ParamByName('ativo').AsInteger := 0;

                Query.ExecSQL;

                VTotalTemp := VTotalTemp + StrToFloat_Universal(StringGridTransf.Cells[6, I]);
                DspTemp := DspTemp + (StrToFloat_Universal(StringGridTransf.Cells[1, I]) * StrToFloat_Universal(StringGridTransf.Cells[7, I]));
              end
              else
              begin
                //valor total
                Query.ParamByName('vt_total').AsFloat := StrTofloat_Universal(StringGridTransf.Cells[6, I]) - (StrToInt(StringGridTransf.Cells[8, I]) * StrTofloat_Universal(StringGridTransf.Cells[5, I]));
                //quantidade
                Query.ParamByName('qtd').AsInteger := StrToInt(StringGridTransf.Cells[1, I]) - StrToInt(StringGridTransf.Cells[8, I]);
                //valor unitario
                Query.ParamByName('vt_unitario').AsFloat := Query.ParamByName('vt_total').AsFloat/Query.ParamByName('qtd').AsInteger;
                //id lotes_item
                Query.ParamByName('id').AsInteger := StrToInt(StringGridTransf.Cells[0, I]);
    //          //ativo
                Query.ParamByName('ativo').AsInteger := 1;

                Query.ExecSQL;

                VTotalTemp := VTotalTemp + (StrToInt(StringGridTransf.Cells[8, I]) * StrTofloat_Universal(StringGridTransf.Cells[5, I]));
                DspTemp := DspTemp + (StrToFloat_Universal(StringGridTransf.Cells[8, I]) * StrToFloat_Universal(StringGridTransf.Cells[7, I]))
              end;
            end;
          end;

          //VALOR DA DESPESA FINAL DO REMETENTE
          if QtdFinalR <> 0 then
            DspFinalR := DspR - DspTemp
          else
            DspFinalR := 0;

          //DESPESA/CBS ATUAL REMETENDE
          DspCbsFinalR := DspFinalR / QtdFinalR;

          //VALOR TOTAL DE COMPRA ATUAL LOTE REMETENTE
          VTotalFinalR := VTotalR - VTotalTemp;

          //VALOR TOTAL/CBS DE COMPRA ATUAL LOTE REMETENTE
          VCbsTotalFinalR := VTotalFinalR / QtdFinalR;



          Query.Active := false;
          Query.SQL.Clear;
          Query.SQL.Add(SQLUpdate);
          Query.ParamByName('qtd').AsInteger := QtdFinalR;
          Query.ParamByName('despesa').AsFloat := DspFinalR;
          Query.ParamByName('despesa_cbs').AsFloat := DspCbsFinalR;
          Query.ParamByName('vt').AsFloat := VTotalFinalR;
          Query.ParamByName('vc').AsFloat := VCbsTotalFinalR;
          Query.ParamByName('id').AsString := copy(cbx_Remetente.Items[cbx_Remetente.ItemIndex], 0, 5);
          Query.ExecSQL;

          //DESTINATARIO

          Query.Active := false;
          Query.SQL.Clear;
          Query.SQL.Add(SQLInsertItens);
          for I := 0 to StringGridTransf.RowCount - 1 do
          begin
            if StrToInt(StringGridTransf.Cells[8,I]) <> 0 then
            begin
              qryAux.Active := false;
              qryAux.SQL.Clear;
              qryAux.SQL.Add(SQLSelectCompra);
              //valor total
              Query.ParamByName('vt_total').AsFloat := (StrToInt(StringGridTransf.Cells[8, I]) * StrTofloat_Universal(StringGridTransf.Cells[5, I]));
              //quantidade
              Query.ParamByName('qtd').AsInteger := StrToInt(StringGridTransf.Cells[8, I]);
              //valor unitario
              Query.ParamByName('vt_unitario').AsFloat := Query.ParamByName('vt_total').AsFloat/Query.ParamByName('qtd').AsInteger;
              //idade
              Query.ParamByName('idade').AsInteger := StrToInt(copy(StringGridTransf.Cells[2, I], 0, 3));
              //raca
              Query.ParamByName('raca').AsInteger := StrToInt(copy(StringGridTransf.Cells[3, I], 0, 3));
              //sexo
              Query.ParamByName('sexo').AsInteger := StrToInt(copy(StringGridTransf.Cells[4, I], 0, 3));
              //id lote destinatario
              Query.ParamByName('id_lote').AsInteger := StrToInt(copy(cbx_Destinatario.Items[cbx_Destinatario.ItemIndex], 0, 5));
              //ativo
              Query.ParamByName('ativo').AsInteger := 1;
              //despesa_cbs
              Query.ParamByName('despesa_cbs').AsFloat := StrToFloat_Universal(StringGridTransf.Cells[7, I]);

              //id_compra
              qryAux.ParamByName('id').AsInteger := StrToInt(copy(StringGridTransf.Cells[0, I], 0, 5));
              qryAux.Open();

              Query.ParamByName('id_compra').AsInteger := qryAux.FieldByName('id_compra').AsInteger;



              Query.ExecSQL;
            end;
          end;

          //VALOR TOTAL DE COMPRA ATUAL LOTE DESTINATARIO
          if QtdFinalR = 0 then
            VTotalFinalD :=  VTotalR + VTotalD
          else
          begin
            if VTotalD <> 0 then
              VTotalFinalD := VTotalTemp + VTotalD
            else
              VTotalFinalD := VTotalTemp;
          end;

          //VALOR TOTAL/CBS DE COMPRA ATUAL LOTE DESTINATARIO
          VCbsTotalFinalD := VTotalFinalD / QtdFinalD;

          //VALOR DA DESPESA FINAL DO DESTINARIO
          DspFinalD := DspTemp + DspD;

          //DESPESA/CBS ATUAL DESTINATARIO
          DspCbsFinalD := DspFinalD / QtdFinalD;

          Query.Active := false;
          Query.SQL.Clear;
          Query.SQL.Add(SQLUpdateD);
          Query.ParamByName('qtd').AsInteger := QtdFinalD;
          Query.ParamByName('despesa').AsFloat := DspFinalD;
          Query.ParamByName('despesa_cbs').AsFloat := DspCbsFinalD;
          Query.ParamByName('vt').AsFloat := VTotalFinalD;
          Query.ParamByName('vc').AsFloat := VCbsTotalFinalD;
          Query.ParamByName('id').AsString := copy(cbx_Destinatario.Items[cbx_Destinatario.ItemIndex], 0, 5);
          Query.ExecSQL;



          agrupado := 0;

          Query.Active := false;
          Query.SQL.Clear;
          Query.SQL.Add(SQLUpdateLote);
          if OriginalidadeLoteCompra(StrToInt(copy(cbx_Remetente.Items[cbx_Remetente.ItemIndex], 0, 5))) = 0 then
            Query.ParamByName('agrupado').AsInteger := 0
          else
          begin
            Query.ParamByName('agrupado').AsInteger := 1;
            agrupado := 1;
          end;
          Query.ParamByName('id').AsString := copy(cbx_Remetente.Items[cbx_Remetente.ItemIndex], 0, 5);
          Query.ExecSQL;

          Query.Active := false;
          Query.SQL.Clear;
          Query.SQL.Add(SQLUpdateLote);
          if agrupado = 1 then
            Query.ParamByName('agrupado').AsInteger := 1
          else
          begin
            if OriginalidadeLoteCompra(StrToInt(copy(cbx_Destinatario.Items[cbx_Destinatario.ItemIndex], 0, 5))) = 0 then
              Query.ParamByName('agrupado').AsInteger := 0
            else
              Query.ParamByName('agrupado').AsInteger := 1;
          end;

          Query.ParamByName('id').AsString := copy(cbx_Destinatario.Items[cbx_Destinatario.ItemIndex], 0, 5);
          Query.ExecSQL;
        end;


        AgruparLote(copy(cbx_Remetente.Items[cbx_Remetente.ItemIndex], 0, 5), copy(cbx_Destinatario.Items[cbx_Destinatario.ItemIndex], 0, 5), QtdTransf, DateTimeToStr(Now));
  //        AlterarQtdAnimais(copy(cbx_Remetente.Items[cbx_Remetente.ItemIndex], 0,
  //          5), QtdFinalR);
  //      AlterarQtdAnimais(copy(cbx_Destinatario.Items[cbx_Destinatario.ItemIndex],
  //        0, 5), QtdFinalD);

      finally
        cbx_Remetente.ItemIndex := 0;
        cbx_Destinatario.ItemIndex := 0;
        cbx_Destinatario.Enabled := false;
        ed_Qtd.Text := EmptyStr;
        ed_Qtd.Enabled := false;
        ConsultaBancoLotes;
        tab_Crud.ActiveTab := TabItem1;
        ShowMessage('Transferência feita com sucesso!');
        for i := 0 to StringGridTransf.RowCount - 1 do
          LimpaStringGrid(i, StringGridTransf);
        FreeAndNil(Query);
      end;
    end;
  end;

end;

procedure TFrmCadLote.Image5Click(Sender: TObject);
begin
  inherited;
  if mensagemConfirmacao('Deseja cancelar a tranferência?') = mrYes then
  begin
    tab_Crud.ActiveTab := TabItem1;
    cbx_Remetente.ItemIndex := 0;
    cbx_Destinatario.ItemIndex := 0;
    cbx_Destinatario.Enabled := false;
    ed_Qtd.Text := EmptyStr;
    ed_Qtd.Enabled := false;
    ed_ObsTransf.Text := EmptyStr;
    ed_ObsTransf.Enabled := false;
    DateEditTransf.Date := Now;
    DateEditTransf.Enabled := false;
  end;
end;

procedure TFrmCadLote.Image7Click(Sender: TObject);
begin
  inherited;
  Acao := 4;
  ConsultaLotesRemetente;
  cbx_Remetente.ItemIndex := 0;
  cbx_Remetente.Enabled := true;
  tab_Crud.ActiveTab := TabItem3;
end;

procedure TFrmCadLote.Img_BtnCancelarClick(Sender: TObject);
const
  SQL = 'SELECT * from agrojun.lotes WHERE id = :id';
var
  Query: TFDQuery;
begin
  inherited;
  // DesabilitaCampos;
  if Acao = 1 then
  begin
    Query := TFDQuery.Create(self);
    try
      Query.Connection := dm.FDConnection;
      Query.FetchOptions.RowsetSize := 50000;
      Query.Active := false;
      Query.SQL.Clear;
      Query.SQL.Add(SQL);
      Query.ParamByName('id').AsInteger := Cod_Selecao;
      Query.Active := true;
      PopularCampos(Query);
    finally
      FreeAndNil(Query);
    end;
  end;
  ed_pesq.Enabled := true;
end;

procedure TFrmCadLote.Img_BtnEditarClick(Sender: TObject);
begin
  inherited;
  edt_Nome.Enabled:= false;
  ed_QtdAnimais.Enabled := false;
  ed_Numero.Enabled := false;
  ed_VtAtual.Enabled := false;
  ed_VcAtual.Enabled := false;
  ed_DspAtual.Enabled := false;
  ed_DspCbsAtual.Enabled := false;
  StringGridAnimais.Enabled := true;
end;

procedure TFrmCadLote.Img_BtnExcluirClick(Sender: TObject);
const
  SQL = 'DELETE FROM agrojun.lotes WHERE id = :id';
  SQLVerifica = 'SELECT l.*, COUNT(li.id) as itens FROM agrojun.lotes as l '+
  'left outer join lotes_itens as li on (li.id_lote = l.id) '+
  ' WHERE l.id = :id ';
var
  Query: TFDQuery;
begin
  inherited;
  // APAGAR REGISTROS
  Query := TFDQuery.Create(self);
  Query.Connection := dm.FDConnection;
  Query.FetchOptions.RowsetSize := 50000;
  Query.Active := false;
  Query.SQL.Clear;
  Query.SQL.Add(SQLVerifica);
  Query.ParamByName('id').AsInteger := Cod_Selecao;
  Query.Open;
  if (Query.FieldByName('id_compra').AsString.IsEmpty) and (Query.FieldByName('itens').AsInteger > 0) then
    ShowMessage
      ('Esse lote não pode ser excluído pois foi criado manualmente e possui animais de origem de outro lote.')
  else if Query.FieldByName('status').AsInteger = 1 then
    ShowMessage
      ('Esse lote não pode ser excluído pois já possui vínculos com alguma compra/venda.')
  else
  begin
    try
      Query.Active := false;
      Query.SQL.Clear;
      Query.SQL.Add(SQL);
      Query.ParamByName('id').AsInteger := Cod_Selecao;
      Query.ExecSQL;
    finally
      FreeAndNil(Query);
      LimpaCampos;
      ShowMessage('Registro excluído com sucesso!');
      ConsultaBancoLotes;
      // LogLotes;
      tab_Crud.ActiveTab := TabItem1;
    end;
  end;
end;

procedure TFrmCadLote.Img_BtnNovoClick(Sender: TObject);
begin
  inherited;
//  lytQtd.Visible := false;
//  lytTotalCompraCbs.Visible := false;
//  lytTotalCompra.Visible := false;
//  lytTotalDespesa.Visible := false;
//  lytTotalDespesaCbs.Visible := false;
  lblQtd.Visible := false;
  ed_QtdAnimais.Visible := false;

  lblObs.Visible := false;
  lblTotalCompra.Visible := false;
  ed_VtAtual.Visible := false;

//  lblTotalCompraCbs.Visible := false;
//  ed_VcAtual.Visible := false;

  lblGridAnimais.Visible := false;
  StringGridAnimais.Visible := true;

  lblTotalDespesa.Visible := false;
  ed_DspAtual.Visible := false;

//  lblTotalDespesaCbs.Visible := false;
//  ed_DspCbsAtual.Visible := false;

  ed_Numero.Enabled := false;
  ed_Numero.Text := formatfloat('00000', MaxCod('lotes'));
end;

procedure TFrmCadLote.Img_BtnSalvarClick(Sender: TObject);
const
  SQLInsert =
    'INSERT INTO agrojun.lotes (numero, descricao, nome, ativo, qtd_animais, despesa, despesa_cbs, valortotal_compra, valorcbs_compra, agrupado) '+
    ' VALUES (:numero, :descricao, :nome, 1, 0, 0, 0, 0, 0, 0)';
  SQLUpdate =
    'UPDATE agrojun.lotes SET  descricao = :descricao '
    + ' WHERE id = :id';
var
  Query: TFDQuery;
begin
  inherited;
  Validar(0);
  if (ValidarLote(ed_Numero.Text).Equals('1')) and (Acao = 0) then
  begin
    ShowMessage('Já existe um lote cadastrado com esse NÚMERO.');
    abort
  end;

  try
    Query := TFDQuery.Create(self);
    Query.Connection := dm.FDConnection;
    Query.FetchOptions.RowsetSize := 50000;
    Query.Close;
    Query.SQL.Clear;

    if Acao = 0 then
    begin
      Query.SQL.Add(SQLInsert);
      Query.ParamByName('numero').AsString := ed_Numero.Text;
      Query.ParamByName('nome').AsString := edt_Nome.Text;

    end
    else
    begin
      Query.SQL.Add(SQLUpdate);
      Query.ParamByName('id').AsInteger := Cod_Selecao;
    end;


    // Query.ParamByName('qtd_animais').AsInteger := StrToInt(ed_QtdAnimais.Text);
    Query.ParamByName('descricao').AsString := ed_Obs.Text;

    Query.ExecSQL;
    LogLotes;

  finally
    LimpaCampos;
    ConsultaBancoLotes;
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
end;

procedure TFrmCadLote.Img_BtnVoltarClick(Sender: TObject);
var
 lin: integer;
begin
  inherited;
  for lin := 0 to StringGridTransf.RowCount - 1 do
    LimpaStringGrid(lin, StringGridTransf);

  for lin := 0 to StringGridAnimais.RowCount - 1 do
    LimpaStringGrid(lin, StringGridAnimais);
end;

procedure TFrmCadLote.InativarLote(numero: string);
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
    qUERY.ParamByName('ativo').AsInteger := 0;
    Query.ParamByName('numero').AsString := numero;
    Query.ExecSQL;
  finally
    FreeAndNil(Query);
  end;
end;

procedure TFrmCadLote.LimpaStringGrid(RowNumber: Integer;
  StringGrid1: TStringGrid);
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

procedure TFrmCadLote.LogLotes;
begin
  if Acao = 0 then
  begin
    log(0005, MaxCod('pessoas'), '', ' numero: ' + ed_Numero.Text + ' nome: ' +
      edt_Nome.Text + ' qtd_animais: ' + ed_QtdAnimais.Text + ' descricao: ' +
      ed_Obs.Text);
  end;

  if Acao = 1 then
  begin

    log(0005, cds_log.FieldByName('id').AsInteger,
      ' numero: ' + cds_log.FieldByName('numero').AsString + ' nome: ' +
      cds_log.FieldByName('nome').AsString + ' qtd_animais: ' +
      cds_log.FieldByName('qtd_animais').AsString + ' descricao: ' +
      cds_log.FieldByName('descricao').AsString,

      ' numero: ' + ed_Numero.Text + ' nome: ' + edt_Nome.Text +
      ' qtd_animais: ' + ed_QtdAnimais.Text + ' descricao: ' + ed_Obs.Text);
  end;

  if Acao = 2 then
  begin
    log(0005, cds_log.FieldByName('id').AsInteger,
      ' numero: ' + cds_log.FieldByName('numero').AsString + ' nome: ' +
      cds_log.FieldByName('nome').AsString + ' qtd_animais: ' +
      cds_log.FieldByName('qtd_animais').AsString + ' descricao: ' +
      cds_log.FieldByName('descricao').AsString, '')
  end;
end;

procedure TFrmCadLote.LogTransfLotes;
const
  SQL = 'INSERT INTO agrojun.transferencia_lotes ( id_remetente, id_destinatario, qtd_anterior_remet, qtd_anterior_dest, qtd_transferida, qtd_atual_remet, qtd_atual_dest, id_usuario, data_transferencia, descricao)   '
    + ' VALUES  (:id_remetente, :id_destinatario, :qtd_anterior_remet, :qtd_anterior_dest, :qtd_transferida, :qtd_atual_remet, :qtd_atual_dest, :id_usuario, :data_transferencia, :descricao)';
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.Create(self);
    qry.Connection := dm.FDConnection;
    qry.FetchOptions.RowsetSize := 50000;
    qry.Close;
    qry.SQL.Clear;

    qry.SQL.Add(SQL);

    qry.ParamByName('id_remetente').AsInteger :=
      cds_log2.FieldByName('idRemetente').AsInteger;
    qry.ParamByName('id_destinatario').AsInteger :=
      cds_log2.FieldByName('idDestinatario').AsInteger;
    qry.ParamByName('id_usuario').AsInteger := cds_log2.FieldByName('idUser')
      .AsInteger;
    qry.ParamByName('qtd_anterior_remet').AsInteger :=
      StrToInt(cds_log2.FieldByName('QtdAnteriorRemetente').AsString);
    qry.ParamByName('qtd_anterior_dest').AsInteger :=
      StrToInt(cds_log2.FieldByName('QtdAnteriorDest').AsString);
    qry.ParamByName('qtd_transferida').AsInteger :=
      StrToInt(cds_log2.FieldByName('ValorTransf').AsString);
    qry.ParamByName('qtd_atual_remet').AsInteger :=
      StrToInt(cds_log2.FieldByName('QtdAtualRem').AsString);
    qry.ParamByName('qtd_atual_dest').AsInteger :=
      StrToInt(cds_log2.FieldByName('QtdAtualDest').AsString);
    qry.ParamByName('data_transferencia').AsDateTime := DateEditTransf.Date;
    qry.ParamByName('descricao').AsString :=
      cds_log2.FieldByName('descricao').AsString;
    qry.ExecSQL;

  finally
    FreeAndNil(qry);
  end;
end;

procedure TFrmCadLote.lst_PrincipalItemClick(const Sender: TObject;
  const AItem: TListViewItem);
const
  _SQLView = 'SELECT l.*, sum(li.valortotal_animais) as total from agrojun.lotes as l '+
             ' left outer join lotes_itens as li on (li.id_lote = l.id)               '+
             ' WHERE l.id = :id';
  SQLItens = 'select li.*, c.lote as lote_origem, i.idade_animal as idade, r.raca as raca from lotes_itens as li   '+
            'left outer join lotes as l on (li.id_compra = l.id_compra)                                            '+
            'left outer join compras as c on (li.id_compra = c.id)                                                 '+
            'left outer join idade_animal as i on (i.id = li.idade_animal)                                         '+
            'left outer join raca_animal as r on(r.id = li.raca_animal)                                            '+
            'where li.id_lote = :id and li.ativo = 1                                                               '+
            'order by li.id asc;                                                                                   ';
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

        cds_log.Active := false;
        cds_log.Active := true;
        cds_log.EmptyDataSet;
        cds_log.insert;
        cds_log.FieldByName('id').AsString := IntToStr(Cod_Selecao);
        cds_log.FieldByName('numero').AsString :=
          Query.FieldByName('numero').AsString;
        cds_log.FieldByName('nome').AsString :=
          Query.FieldByName('nome').AsString;
        cds_log.FieldByName('qtd_animais').AsString :=
          IntToStr(Query.FieldByName('qtd_animais').AsInteger);
        cds_log.FieldByName('descricao').AsString :=
          Query.FieldByName('descricao').AsString;
        cds_log.Post;

        if Query.RecordCount > 0 then
        begin
          PopularCampos(Query);
//          lytQtd.Visible := true;
//          lytTotalCompra.Visible := true;
//          lytTotalCompraCbs.Visible := true;
//          lytTotalDespesa.Visible := true;
//          lytTotalDespesaCbs.Visible := true;

          Query.Active := false;
          Query.SQL.Clear;
          Query.SQL.Add(SQLItens);
          Query.ParamByName('id').AsInteger := Cod_Selecao;
          Query.Open();

          PopularLotesItens(Query);

          lblQtd.Visible := true;
          ed_QtdAnimais.Visible := true;

          lblTotalCompra.Visible := true;
          ed_VtAtual.Visible := true;
          lblObs.Visible := true;

          lblGridAnimais.Visible := true;
          StringGridAnimais.Visible := true;

//
//          lblTotalCompraCbs.Visible := true;
//          ed_VcAtual.Visible := true;
//
          lblTotalDespesa.Visible := true;
          ed_DspAtual.Visible := true;
//
//          lblTotalDespesaCbs.Visible := true;
//          ed_DspCbsAtual.Visible := true;
          StringGridAnimais.Enabled := true;
          tab_Crud.ActiveTab := TabItem2;
        end
        else
        begin
          ShowMessage
            ('Não foi possível carregar o dados dessa pessoa. Tente outra vez.');
          tab_Crud.ActiveTab := TabItem1;
        end;
      end;

      //lytQtd.Visible := false;
    finally
      FreeAndNil(Query);
    end;
  end
  else
    exit
end;

procedure TFrmCadLote.PopularCampos(Query: TFDQuery);
begin
  ed_Numero.Text := formatfloat('00000', Query.FieldByName('id').AsFloat);
  edt_Nome.Text := Query.FieldByName('nome').AsString;
  ed_QtdAnimais.Text := IntToStr(Query.FieldByName('qtd_animais').AsInteger);
  ed_Obs.Text := Query.FieldByName('descricao').AsString;
  ed_VtAtual.Text := formatfloat('###,###,##0.00', Query.FieldByName('total').AsFloat);
  ed_VcAtual.Text := formatfloat('###,###,##0.00', Query.FieldByName('valorcbs_compra').AsFloat);
  ed_DspAtual.Text := formatfloat('###,###,##0.00', Query.FieldByName('despesa').AsFloat);
  ed_DspCbsAtual.Text := formatfloat('###,###,##0.00', Query.FieldByName('despesa_cbs').AsFloat);
end;

procedure TFrmCadLote.PopularLotesItens(Query: TFDQuery);
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
      Cells[2, Row] := Query.FieldByName('idade').AsString;
      // raça
      Cells[3, Row] := Query.FieldByName('raca').AsString;
      // sexo
      if Query.FieldByName('sexo_animal').AsInteger = 1 then
        Cells[4, Row] := 'FEMÊA'
      else if Query.FieldByName('sexo_animal').AsInteger = 2 then
        Cells[4, Row] := 'MACHO'
      else
        Cells[4, Row] := 'MISTO';
      // valor por animal
      Cells[5, Row] := formatfloat('###,###,##0.00', Query.FieldByName('valorporcbs_animais').AsFloat);
      // valor total
      Cells[6, Row] := formatfloat('###,###,##0.00', Query.FieldByName('valortotal_animais').AsFloat);
      // despesa_cbs
      Cells[7, Row] := formatfloat('###,###,##0.00', Query.FieldByName('despesa_cbs').AsFloat);
      // id compra origem
      Cells[8, Row] := formatfloat('00000', Query.FieldByName('lote_origem').AsFloat);
    end;
    Query.Next;
  end;
end;

procedure TFrmCadLote.PopularLotesItensTrans(Query: TFDQuery);
var
  I, lin: Integer;
begin
  for lin := 0 to StringGridTransf.RowCount - 1 do
    LimpaStringGrid(lin, StringGridTransf);

  for I := 0 to Query.RecordCount - 1 do
  begin
    with StringGridTransf do
    begin
      RowCount := RowCount + 1;
      Row := RowCount - 1;
      // id
      Cells[0, Row] := formatfloat('00000', Query.FieldByName('id').AsFloat);
      // qtd
      Cells[1, Row] := Query.FieldByName('quantidade').AsString;
      // Idade
      Cells[2, Row] := formatfloat('000', Query.FieldByName('idade_animal').AsFloat) + ' - ' + Query.FieldByName('idade').AsString;
      // raça
      Cells[3, Row] := formatfloat('000', Query.FieldByName('raca_animal').AsFloat) + ' - ' + Query.FieldByName('raca').AsString;
      // sexo
      if Query.FieldByName('sexo_animal').AsInteger = 1 then
        Cells[4, Row] := '001 - FEMÊA'
      else if Query.FieldByName('sexo_animal').AsInteger = 2 then
        Cells[4, Row] := '002 - MACHO';
      // valor por animal
      Cells[5, Row] := formatfloat('###,###,##0.00', Query.FieldByName('valorporcbs_animais').AsFloat);
      // valor total
      Cells[6, Row] := formatfloat('###,###,##0.00', Query.FieldByName('valortotal_animais').AsFloat);
      //despesa por animal
      Cells[7, Row] := formatfloat('###,###,##0.00', Query.FieldByName('despesa_cbs').AsFloat);
      // id compra origem
      Cells[9, Row] := formatfloat('00000', Query.FieldByName('lote_origem').AsFloat);
    end;
    Query.Next;
  end;
end;

procedure TFrmCadLote.Validar(cod_vali: integer);
begin
  if (ed_Numero.Text = EmptyStr) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 4001 : ' + sLineBreak + 'Informe o NÚMERO do lote!';
    ed_Numero.SetFocus;
    abort;
  end;

  if (cod_vali = 10) then
    lbl_Erro.Text := 'Erro 4002 : ' + sLineBreak + 'Apenas Numero!';

end;

function TFrmCadLote.ValidarLote(numero: string): string;
var
  Query: TFDQuery;
const
  SQL = 'select numero from agrojun.lotes where numero = :num';
begin
  Query := TFDQuery.Create(self);
  Query.Connection := dm.FDConnection;
  Query.FetchOptions.RowsetSize := 50000;
  try
    Query.Active := false;
    Query.SQL.Clear;
    Query.SQL.Text := SQL;
    Query.ParamByName('num').AsString := numero;
    Query.Active := true;
    if Query.IsEmpty then
      Result := '0'
    else
      Result := '1';
  finally
    FreeAndNil(Query);
  end;
end;

procedure TFrmCadLote.ValidarTransferencia;
var
  I, QtdTransf : integer;
begin
  if (cbx_Destinatario.ItemIndex = 0) or (cbx_Destinatario.ItemIndex = -1) then
  begin
    lay_error2.Visible := true;
    lbl_error2.Text := 'Erro 4004 : ' + sLineBreak + 'Informe o DESTINATÁRIO!';
    cbx_Destinatario.SetFocus;
    abort;
  end;

  QtdTransf := 0;
  for I := 0 to StringGridTransf.RowCount - 1 do
  begin
    // qtd
    if StringGridTransf.Cells[8, I].Equals('') then
      QtdTransf := QtdTransf + 0
    else
      QtdTransf := QtdTransf + StrToInt(StringGridTransf.Cells[8, I]);
  end;

  if (QtdTransf = 0) then
  begin
    lay_error2.Visible := true;
    lbl_error2.Text := 'Erro 4005 : ' + sLineBreak +
      'Informe a QUANTIDADE a ser transferida!';
    StringGridTransf.SetFocus;
    abort;
  end;

end;

end.
