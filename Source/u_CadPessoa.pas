unit u_CadPessoa;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  u_CrudCad, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.Edit, FMX.Objects, FMX.ListView,
  FMX.TabControl, FMX.Controls.Presentation, FMX.Layouts, FMX.ScrollBox,
  FMX.Memo, FMX.DateTimeCtrls, FMX.ComboEdit, FireDAC.Comp.Client,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet;

type
  TFrmCadPessoa = class(TFrmCrud)
    cds_log: TFDMemTable;
    cds_lognome: TStringField;
    cds_logemail: TStringField;
    cds_logcidade: TStringField;
    cds_logestado: TStringField;
    cds_logendereco: TStringField;
    cds_logbairro: TStringField;
    cds_logcomplemento: TStringField;
    cds_logtelefone: TStringField;
    cds_logtipo_pessoa: TStringField;
    cds_logcpf_pessoa: TStringField;
    cds_logobservacao: TStringField;
    cds_logid: TStringField;
    cds_logfuncionario: TStringField;
    cds_logfornecedor: TStringField;
    cds_logcliente: TStringField;
    Layout1: TLayout;
    cbx_TipoPessoa: TComboEdit;
    ed_Nome: TEdit;
    ed_Cpf: TEdit;
    cbx_Estado: TComboEdit;
    cbx_Cidade: TComboEdit;
    ed_Email: TEdit;
    ed_Telefone: TEdit;
    ed_Bairro: TEdit;
    ed_Endereco: TEdit;
    ed_Complemento: TEdit;
    ed_Obs: TEdit;
    lytFuncaoPessoa: TLayout;
    ckb_fornecedor: TCheckBox;
    ckb_cliente: TCheckBox;
    ckb_funcionario: TCheckBox;
    Label14: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label10: TLabel;
    StyleBook1: TStyleBook;
    Label24: TLabel;
    procedure cbx_TipoPessoaChange(Sender: TObject);
    procedure ed_CpfExit(Sender: TObject);
    procedure Img_BtnNovoClick(Sender: TObject);
    procedure cbx_EstadoChange(Sender: TObject);
    procedure Img_BtnCancelarClick(Sender: TObject);
    procedure Img_BtnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lst_PrincipalItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Img_BtnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Validar(cod_vali: integer);
    procedure desativaCampos;
    procedure ConsultaEstado;
    procedure ConsultaCidade(Estado: string; QtdMun: integer; extra: integer);
    procedure LimparComboCidade;
    function ValidarPessoa(cpf: string): string;
    procedure ConsultaBancoPessoas;
    procedure PopularCampos(Query: TFDQuery);
    procedure LogPessoas;
  end;

var
  FrmCadPessoa: TFrmCadPessoa;
  Cod_Selecao: integer;

implementation

{$R *.fmx}

uses u_Library, u_DM;


procedure TFrmCadPessoa.cbx_EstadoChange(Sender: TObject);
begin
  inherited;
  cbx_Cidade.ItemIndex := 0;
  if cbx_Estado.ItemIndex = 1 then
  begin
    //
    ConsultaCidade('Acre', 22, 0);
  end
  else if cbx_Estado.ItemIndex = 2 then
  begin
    //
    ConsultaCidade('Alagoas', 102, 0);
  end
  else if cbx_Estado.ItemIndex = 3 then
  begin
    //
    ConsultaCidade('Amapá', 16, 0);
  end
  else if cbx_Estado.ItemIndex = 4 then
  begin
    //
    ConsultaCidade('Amazonas', 62, 0);
  end
  else if cbx_Estado.ItemIndex = 5 then
  begin
    //
    ConsultaCidade('Bahia', 417, 0);
  end
  else if cbx_Estado.ItemIndex = 6 then
  begin
    //
    ConsultaCidade('Ceará', 184, 0);
  end
  else if cbx_Estado.ItemIndex = 7 then
  begin
    //
    ConsultaCidade('Distrito Federal', 1, 0);
  end
  else if cbx_Estado.ItemIndex = 8 then
  begin
    //
    ConsultaCidade('Espírito Santo', 78, 0);
  end
  else if cbx_Estado.ItemIndex = 9 then
  begin
    //
    ConsultaCidade('Goiás', 246, 0);
  end
  else if cbx_Estado.ItemIndex = 10 then
  begin
    //
    ConsultaCidade('Maranhão', 217, 0);
  end
  else if cbx_Estado.ItemIndex = 11 then
  begin
    //
    ConsultaCidade('Mato Grosso', 141, 0);
  end
  else if cbx_Estado.ItemIndex = 12 then
  begin
    //
    ConsultaCidade('Mato Grosso do Sul', 78, 0);
  end
  else if cbx_Estado.ItemIndex = 13 then
  begin
    //
    ConsultaCidade('Minas Gerais', 853, 0);
  end

  else if cbx_Estado.ItemIndex = 14 then
  begin
    //
    ConsultaCidade('Pará', 143, 0);
  end
  else if cbx_Estado.ItemIndex = 15 then
  begin
    //
    ConsultaCidade('Paraíba', 223, 0);
  end
  else if cbx_Estado.ItemIndex = 16 then
  begin
    //
    ConsultaCidade('Paraná', 399, 0);
  end
  else if cbx_Estado.ItemIndex = 17 then
  begin
    //
    ConsultaCidade('Pernambuco', 185, 0);
  end
  else if cbx_Estado.ItemIndex = 18 then
  begin
    //
    ConsultaCidade('Piauí', 223, 0);
  end
  else if cbx_Estado.ItemIndex = 19 then
  begin
    //
    ConsultaCidade('Rio de Janeiro', 92, 0);
  end
  else if cbx_Estado.ItemIndex = 20 then
  begin
    //
    ConsultaCidade('Rio Grande do Norte', 167, 0);
  end
  else if cbx_Estado.ItemIndex = 21 then
  begin
    //
    ConsultaCidade('Rio Grande do Sul', 496, 0);
  end
  else if cbx_Estado.ItemIndex = 22 then
  begin
    //
    ConsultaCidade('Rondônia', 52, 0);
  end
  else if cbx_Estado.ItemIndex = 23 then
  begin
    //
    ConsultaCidade('Roraima', 15, 0);
  end
  else if cbx_Estado.ItemIndex = 24 then
  begin
    //
    ConsultaCidade('Santa Catarina', 293, 0);
  end
  else if cbx_Estado.ItemIndex = 25 then
  begin
    //
    ConsultaCidade('São Paulo', 645, 0);
  end
  else if cbx_Estado.ItemIndex = 26 then
  begin
    //
    ConsultaCidade('Sergipe', 75, 0);
  end
  else if cbx_Estado.ItemIndex = 27 then
  begin
    //
    ConsultaCidade('Tocantins', 139, 0);
  end;
end;

procedure TFrmCadPessoa.cbx_TipoPessoaChange(Sender: TObject);
begin
  inherited;
  if (cbx_TipoPessoa.ItemIndex <> 0) and (cbx_TipoPessoa.ItemIndex <> -1) then
  begin
    HabilitaCampos;
  end
  else
  begin
    DesabilitaCampos;
    cbx_TipoPessoa.Enabled := true;
  end;
end;

procedure TFrmCadPessoa.ConsultaBancoPessoas;
const
  _SQLbanco = 'select id, nome, cpf_pessoa, telefone from agrojun.pessoas ';
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

      item := lst_Principal.Items.Add;

      with item do
      begin
        txt := TListItemText(Objects.FindDrawable('codigo'));
        txt.Text := formatfloat('0000', QBanco.FieldByName('id').AsFloat);
        txt.TagString := QBanco.FieldByName('id').AsString;

        txt := TListItemText(Objects.FindDrawable('nome'));
        txt.Text := QBanco.FieldByName('nome').AsString;

        txt := TListItemText(Objects.FindDrawable('cpf'));
        txt.Text := QBanco.FieldByName('cpf_pessoa').AsString;

        txt := TListItemText(Objects.FindDrawable('telefone'));
        txt.Text := QBanco.FieldByName('telefone').AsString;
      end;

      QBanco.Next
    end;
  finally
    lst_Principal.EndUpdate;
    FreeAndNil(QBanco);
  end;
end;

procedure TFrmCadPessoa.ConsultaCidade(Estado: string; QtdMun: integer;
  extra: integer);
const
  _SQL = 'select m.nome, m.id  from agrojun.municipio as m, agrojun.estado as e where e.Nome = :estado and e.uf = m.uf;';
  _SQL2 = 'select m.nome, m.id from agrojun.municipio as m, agrojun.estado as e where e.id = :id and e.uf = m.uf';
var
  vCampo, cont: integer;
  vResultado: TStringList;
  Query2: TFDQuery;
  valid: string;
begin
  Query2 := TFDQuery.Create(nil);
  Query2.Connection := dm.FDConnection;
  vResultado := TStringList.Create;
  vResultado.Clear;
  try
    Query2.Active := false;
    Query2.SQL.Clear;
    if extra = 2 then
    begin
      Query2.SQL.Text := _SQL2;
      Query2.ParamByName('id').AsInteger := StrToInt(Estado);
    end
    else
    begin
      Query2.SQL.Text := _SQL;
      Query2.ParamByName('estado').AsString := Estado;
    end;
    Query2.Active := true;
    try
      vResultado.BeginUpdate;
      if not Query2.IsEmpty then
      begin
        Query2.First;
        vCampo := 0;
        cont := 1;
        vResultado.Add('INFORME A CIDADE...');
        while vCampo < QtdMun do
        begin
          valid := IntToStr(cont);
          if valid.Length = 1 then
            valid := '00' + valid;
          if valid.Length = 2 then
            valid := '0' + valid;
          vResultado.Add(valid + ' - ' + formatfloat('0000',Query2.FieldByName('id').AsFloat) + ' - ' + Query2.FieldByName('nome').AsString);
          Query2.Next;
          cont := cont + 1;
          vCampo := vCampo + 1;
        end;
      end;
      vResultado.EndUpdate;

      cbx_Cidade.Items := vResultado;
    except
      //
    end;
  finally
    if Query2.Active then
      FreeAndNil(Query2);
  end;
end;

procedure TFrmCadPessoa.ConsultaEstado;
const
  _SQL = 'SELECT nome FROM estado';
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
        cont := 1;
        vResultado.Add('INFORME O ESTADO...');
        while vCampo < 27 do
        begin
          valid := IntToStr(cont);
          if valid.Length = 1 then
            valid := '00' + valid;
          if valid.Length = 2 then
            valid := '0' + valid;
          vResultado.Add(valid + ' - ' + dm.QAux.FieldByName('nome').AsString);
          dm.QAux.Next;
          cont := cont + 1;
          vCampo := vCampo + 1;
        end;
      end;
      vResultado.EndUpdate;

      cbx_Estado.Items := vResultado;
    except
      //
    end;
  finally
    if dm.QAux.Active then
      FreeAndNil(dm.QAux);
  end;
end;

procedure TFrmCadPessoa.desativaCampos;
var
  cont: integer;
begin
  for cont := 0 To ComponentCount - 1 Do
  begin
    If Components[cont] Is TEdit Then
      TEdit(Components[cont]).Enabled := false;

    If Components[cont] Is TMemo Then
      TMemo(Components[cont]).Enabled := false;
  end;
end;

procedure TFrmCadPessoa.ed_CpfExit(Sender: TObject);
begin
  inherited;
  if (Length(ed_Cpf.Text) = 11) or (Length(ed_Cpf.Text) = 14) then
  begin
    if (Length(ed_Cpf.Text) = 11) then
      ed_Cpf.Text := formacpf(ed_Cpf.Text)
    else
      ed_Cpf.Text := formacnpj(ed_Cpf.Text);
  end
end;

procedure TFrmCadPessoa.FormCreate(Sender: TObject);
begin
  inherited;
  ConsultaBancoPessoas;
  ed_pesq.Enabled := true;
end;

procedure TFrmCadPessoa.Img_BtnCancelarClick(Sender: TObject);
const
  SQL = 'select p.*, e.QtdMun from agrojun.pessoas as p left outer join agrojun.estado as e on (p.estado = e.id) where p.id = :id';
var
  Query: TFDQuery;
begin
  inherited;
  LimparComboCidade;
  DesabilitaCampos;
  if Acao = 1 then
  begin
    cbx_TipoPessoa.Enabled := false;
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
  end
  else
    cbx_TipoPessoa.Enabled := true;
  ed_pesq.Enabled := true;
end;

procedure TFrmCadPessoa.Img_BtnExcluirClick(Sender: TObject);
const
  SQL = 'DELETE FROM agrojun.pessoas WHERE id = :id';
var
  Query: TFDQuery;
begin
  inherited;
  // APAGAR REGISTROS
  try
    Query := TFDQuery.Create(self);
    Query.Connection := dm.FDConnection;
    Query.FetchOptions.RowsetSize := 50000;
    Query.Active := false;
    Query.SQL.Clear;
    Query.SQL.Add(SQL);
    Query.ParamByName('id').AsInteger := Cod_Selecao;
    Query.ExecSQL;
  finally
    FreeAndNil(Query);
    LimpaCampos;
    ShowMessage('Registro excluído com sucesso!');
    ConsultaBancoPessoas;
    LogPessoas;
    tab_Crud.ActiveTab := TabItem1;
  end;
end;

procedure TFrmCadPessoa.Img_BtnNovoClick(Sender: TObject);
begin
  inherited;
  DesabilitaCampos;
  cbx_TipoPessoa.Enabled := true;
  ConsultaEstado;
end;

procedure TFrmCadPessoa.Img_BtnSalvarClick(Sender: TObject);
const
  SQLInsert =
    'INSERT INTO agrojun.pessoas (nome, email, cidade, estado, endereco, bairro, complemento, '
    + '                telefone, tipo_pessoa, cpf_pessoa, observacao, fornecedor, cliente, funcionario, id_cidade)             '
    + '                VALUES (:nome, :email, :cidade, :estado, :endereco, :bairro, '
    + '                :complemento, :telefone, :tipo_pessoa, :cpf_pessoa, :observacao, :fornecedor, '
    + '                :cliente, :funcionario, :id_cidade)';
  SQLUpdate =
    'UPDATE agrojun.pessoas SET nome = :nome, email = :email, cidade = :cidade, estado = :estado, '
    + ' endereco = :endereco, bairro = :bairro, complemento = :complemento, ' +
    '                telefone = :telefone, tipo_pessoa = :tipo_pessoa, ' +
    'cpf_pessoa = :cpf_pessoa, observacao = :observacao, fornecedor = :fornecedor, '
    + ' cliente = :cliente, funcionario = :funcionario, id_cidade = :id_cidade ' + 'WHERE id = :id';

var
  Query: TFDQuery;
begin
  inherited;
  Validar(0);
//  if (ValidarPessoa(ed_Cpf.Text).Equals('1')) and (Acao = 0) then
//  begin
//    ShowMessage('Já existe uma pessoa cadastrada com esse CPF.');
//    abort
//  end;

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

    Query.ParamByName('nome').AsString := ed_Nome.Text;
    Query.ParamByName('endereco').AsString := ed_Endereco.Text;
    Query.ParamByName('bairro').AsString := ed_Bairro.Text;
    Query.ParamByName('complemento').AsString := ed_Complemento.Text;
    Query.ParamByName('telefone').AsString := ed_Telefone.Text;
    Query.ParamByName('email').AsString := ed_Email.Text;
    Query.ParamByName('tipo_pessoa').AsString :=
      copy(cbx_TipoPessoa.Items[cbx_TipoPessoa.ItemIndex], 0, 5);;
    Query.ParamByName('cpf_pessoa').AsString := ed_Cpf.Text;
    Query.ParamByName('observacao').AsString := ed_Obs.Text;
    if cbx_Cidade.ItemIndex = 0 then
      Query.ParamByName('cidade').AsString := '0'
    else
      Query.ParamByName('cidade').AsString :=
        copy(cbx_Cidade.Items[cbx_Cidade.ItemIndex], 0, 3);


        if cbx_Cidade.ItemIndex = 0 then
      Query.ParamByName('id_cidade').AsString := '0'
    else
      Query.ParamByName('id_cidade').AsString :=
        copy(cbx_Cidade.Items[cbx_Cidade.ItemIndex], 7, 4);

    if cbx_Estado.ItemIndex = 0 then
      Query.ParamByName('estado').AsString := '0'
    else
      Query.ParamByName('estado').AsString :=
        copy(cbx_Estado.Items[cbx_Estado.ItemIndex], 0, 3);

    if ckb_fornecedor.IsChecked then
      Query.ParamByName('fornecedor').AsInteger := 1
    else
      Query.ParamByName('fornecedor').AsInteger := 0;

    if ckb_cliente.IsChecked then
      Query.ParamByName('cliente').AsInteger := 1
    else
      Query.ParamByName('cliente').AsInteger := 0;

    if ckb_funcionario.IsChecked then
      Query.ParamByName('funcionario').AsInteger := 1
    else
      Query.ParamByName('funcionario').AsInteger := 0;

    Query.ExecSQL;
    LogPessoas;

  finally
    limpaCampos;
    ConsultaBancoPessoas;
    tab_Crud.ActiveTab := TabItem1;
    LimparComboCidade;
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

procedure TFrmCadPessoa.LimparComboCidade;
var
  vCampo: integer;
  vResultado: TStringList;
begin
  vResultado := TStringList.Create;
  vResultado.Clear;
  vResultado.BeginUpdate;
  vResultado.Add('INFORME A CIDADE...');
  vResultado.EndUpdate;

  cbx_Cidade.Items := vResultado;

end;

procedure TFrmCadPessoa.LogPessoas;
var
  func, forn, cli : string;
begin
  if Acao = 0 then
  begin
    if ckb_fornecedor.IsChecked then
      forn := '1'
    else
      forn :=  '0';

    if ckb_cliente.IsChecked then
      cli := '1'
    else
      cli := '0';

    if ckb_funcionario.IsChecked then
      func := '1'
    else
      func := '0';

    log(0004, MaxCod('pessoas'), '', ' tipo_pessoa: ' + copy(cbx_TipoPessoa.Text, 0, 5) + ' nome: ' + ed_nome.Text + ' estado: ' + copy(cbx_Estado.Text, 0, 3) +
      ' cidade: ' + copy(cbx_Cidade.Text, 0, 3) + ' endereco: ' + ed_Endereco.Text + ' bairro: ' + ed_bairro.Text + ' complemento: ' + ed_Complemento.Text +
      ' cliente ' + cli + ' fornecedor: ' + forn + ' funcionario: ' + func + ' cpf/cnpj: ' + ed_Cpf.Text + ' telefone: ' + ed_Telefone.Text + ' email: ' + ed_Email.Text +
      ' observacao: ' + ed_Obs.Text);
  end;

  if Acao = 1 then
  begin

    log(0004, cds_log.FieldByName('id').AsInteger, ' tipo_pessoa: ' + cds_log.FieldByName('tipo_pessoa').AsString + ' nome: ' +
      cds_log.FieldByName('nome').AsString + ' estado: ' + cds_log.FieldByName('estado').AsString + ' cidade: ' +
      cds_log.FieldByName('cidade').AsString + ' endereco: ' + cds_log.FieldByName('endereco').AsString + ' bairro: ' +
      cds_log.FieldByName('bairro').AsString + ' cliente: ' + cds_log.FieldByName('cliente').AsString +
      ' fornecedor: ' + cds_log.FieldByName('fornecedor').AsString + ' funcionario: ' + cds_log.FieldByName('funcionario').AsString +
      ' cpf/cnpj: ' + cds_log.FieldByName('cpf_pessoa').AsString + ' telefone: ' + cds_log.FieldByName('telefone').AsString +
      ' email: ' + cds_log.FieldByName('email').AsString + ' observacao: ' + cds_log.FieldByName('observacao').AsString,

      ' tipo_pessoa: ' + copy(cbx_TipoPessoa.Text, 0, 5) + ' nome: ' + ed_nome.Text + ' estado: ' + copy(cbx_Estado.Text, 0, 3) +
      ' cidade: ' + copy(cbx_Cidade.Text, 0, 3) + ' endereco: ' + ed_Endereco.Text + ' bairro: ' + ed_bairro.Text + ' complemento: ' + ed_Complemento.Text +
      ' cliente ' + cli + ' fornecedor: ' + forn + ' funcionario: ' + func + ' cpf/cnpj: ' + ed_Cpf.Text + ' telefone: ' + ed_Telefone.Text + ' email: ' + ed_Email.Text +
      ' observacao: ' + ed_Obs.Text);
  end;

  if Acao = 2 then
  begin
    log(0004, cds_log.FieldByName('id').AsInteger, ' tipo_pessoa: ' + cds_log.FieldByName('tipo_pessoa').AsString + ' nome: ' +
      cds_log.FieldByName('nome').AsString + ' estado: ' + cds_log.FieldByName('estado').AsString + ' cidade: ' +
      cds_log.FieldByName('cidade').AsString + ' endereco: ' + cds_log.FieldByName('endereco').AsString + ' bairro: ' +
      cds_log.FieldByName('bairro').AsString + ' cliente: ' + cds_log.FieldByName('cliente').AsString +
      ' fornecedor: ' + cds_log.FieldByName('fornecedor').AsString + ' funcionario: ' + cds_log.FieldByName('funcionario').AsString +
      ' cpf/cnpj: ' + cds_log.FieldByName('cpf_pessoa').AsString + ' telefone: ' + cds_log.FieldByName('telefone').AsString +
      ' email: ' + cds_log.FieldByName('email').AsString + ' observacao: ' + cds_log.FieldByName('observacao').AsString, '')
  end;
end;

procedure TFrmCadPessoa.lst_PrincipalItemClick(const Sender: TObject;
  const AItem: TListViewItem);
const
  _SQLView =
    'select p.*, e.QtdMun from agrojun.pessoas as p left outer join agrojun.estado as e on (p.estado = e.id) where p.id = :id';
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
        cds_log.FieldByName('id').AsString                := IntToStr(Cod_Selecao);
        cds_log.FieldByName('nome').AsString       := Query.FieldByName('nome').AsString;
        cds_log.FieldByName('email').AsString             := Query.FieldByName('email').AsString;;
        cds_log.FieldByName('cidade').AsString           := Query.FieldByName('cidade').AsString;
        cds_log.FieldByName('estado').AsString         := Query.FieldByName('estado').AsString;
        cds_log.FieldByName('endereco').AsString           := Query.FieldByName('endereco').AsString;
        cds_log.FieldByName('bairro').AsString             := Query.FieldByName('bairro').AsString;
        cds_log.FieldByName('complemento').AsString := Query.FieldByName('complemento').AsString;
        cds_log.FieldByName('telefone').AsString        := Query.FieldByName('telefone').AsString;
        cds_log.FieldByName('tipo_pessoa').AsString             := Query.FieldByName('tipo_pessoa').AsString;
        cds_log.FieldByName('cpf_pessoa').AsString           := Query.FieldByName('cpf_pessoa').AsString;
        cds_log.FieldByName('observacao').AsString             := Query.FieldByName('observacao').AsString;
        cds_log.FieldByName('fornecedor').AsString := IntToStr(Query.FieldByName('fornecedor').AsInteger);
        cds_log.FieldByName('funcionario').AsString        := IntToStr(Query.FieldByName('funcionario').AsInteger);
        cds_log.FieldByName('cliente').AsString             := IntToStr(Query.FieldByName('cliente').AsInteger);
        cds_log.Post;

        if Query.RecordCount > 0 then
        begin
          PopularCampos(Query);

          tab_Crud.ActiveTab := TabItem2;
        end
        else
        begin
          ShowMessage
            ('Não foi possível carregar o dados dessa pessoa. Tente outra vez.');
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

procedure TFrmCadPessoa.PopularCampos(Query: TFDQuery);
begin
  ConsultaEstado;
  cbx_Estado.ItemIndex := StrToInt(Query.FieldByName('estado').AsString);
  ConsultaCidade(Query.FieldByName('estado').AsString,
    Query.FieldByName('QtdMun').AsInteger, 2);
  ed_Nome.Text := Query.FieldByName('nome').AsString;
  ed_Bairro.Text := Query.FieldByName('bairro').AsString;
  ed_Endereco.Text := Query.FieldByName('endereco').AsString;
  ed_Email.Text := Query.FieldByName('email').AsString;
  ed_Complemento.Text := Query.FieldByName('complemento').AsString;
  ed_Telefone.Text := Query.FieldByName('telefone').AsString;
  cbx_TipoPessoa.ItemIndex := StrToInt(Query.FieldByName('tipo_pessoa')
    .AsString);
  cbx_Cidade.ItemIndex := StrToInt(Query.FieldByName('cidade').AsString);
  ed_Cpf.Text := Query.FieldByName('cpf_pessoa').AsString;
  ed_Obs.Text := Query.FieldByName('observacao').AsString;

  if Query.FieldByName('fornecedor').AsInteger = 0 then
    ckb_fornecedor.IsChecked := false
  else
    ckb_fornecedor.IsChecked := true;

  if Query.FieldByName('funcionario').AsInteger = 0 then
    ckb_funcionario.IsChecked := false
  else
    ckb_funcionario.IsChecked := true;

  if Query.FieldByName('cliente').AsInteger = 0 then
    ckb_cliente.IsChecked := false
  else
    ckb_cliente.IsChecked := true;

end;

procedure TFrmCadPessoa.Validar(cod_vali: integer);
begin
//  if (cod_vali = 1) then
//  begin
//    lay_error.Visible := true;
//    lbl_Erro.Text := 'Erro 3001 : ' + sLineBreak + 'Informe um CPF válido!';
//    ed_Cpf.SetFocus;
//    abort;
//  end
//  else
//    lay_error.Visible := false;

//  if cbx_TipoPessoa.ItemIndex = 1 then
//  begin
//    if (ed_Cpf.Text = EmptyStr) or (ed_Cpf.Text.Length < 14) then
//    begin
//      lay_error.Visible := true;
//      lbl_Erro.Text := 'Erro 3001 : ' + sLineBreak + 'Informe o CPF válido!';
//      ed_Cpf.SetFocus;
//      abort;
//    end;
//  end
//  else
//  begin
//    if (ed_Cpf.Text = EmptyStr) or (ed_Cpf.Text.Length < 18) then
//    begin
//      lay_error.Visible := true;
//      lbl_Erro.Text := 'Erro 3002 : ' + sLineBreak + 'Informe o CNPJ válido!';
//      ed_Cpf.SetFocus;
//      abort;
//    end;
//  end;

  if (ed_Nome.Text = EmptyStr) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 3003 : ' + sLineBreak + 'Informe o NOME!';
    ed_Nome.SetFocus;
    abort;
  end;

  if (cbx_Estado.ItemIndex = 0) and (cbx_Estado.ItemIndex = -1) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 3004: ' + sLineBreak + 'Informe uma CIDADE!';
    cbx_Estado.SetFocus;
    abort;
  end;

  if (cbx_Cidade.ItemIndex = 0) or (cbx_Cidade.ItemIndex = -1) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 3005: ' + sLineBreak + 'Informe um ESTADO!';
    cbx_Cidade.SetFocus;
    abort;
  end;

  if (not ckb_fornecedor.IsChecked) and ( not ckb_cliente.IsChecked) and (not ckb_funcionario.IsChecked) then
  begin
    lay_error.Visible := true;
    lbl_Erro.Text := 'Erro 3006: ' + sLineBreak + 'Selecione um tipo de função para essa pessoa!';
    lytFuncaoPessoa.SetFocus;
    abort;
  end;
end;

function TFrmCadPessoa.ValidarPessoa(cpf: string): string;
var
  Query : TFDQuery;
const
  SQL = 'select cpf_pessoa from agrojun.pessoas where cpf_pessoa = :cpf';
begin
  Query := TFDQuery.Create(self);
  Query.Connection := dm.FDConnection;
  Query.FetchOptions.RowsetSize := 50000;
  try
    Query.Active := false;
    Query.SQL.Clear;
    Query.SQL.Text := SQL;
    Query.ParamByName('cpf').AsString := cpf;
    Query.Active := true;
    if Query.IsEmpty then
      Result := '0'
    else
      Result := '1';
  finally
    FreeAndNil(Query);
  end;
end;

end.
