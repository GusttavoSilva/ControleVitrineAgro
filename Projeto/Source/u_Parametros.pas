unit u_Parametros;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Layouts, FMX.Edit, FMX.ComboEdit;

type
  TFrmParametro = class(TForm)
    Layout2: TLayout;
    lay_bottonmenu: TLayout;
    rct_bottonmenu: TRectangle;
    Layout6: TLayout;
    Img_BtnSalvar: TImage;
    Img_BtnCancelar: TImage;
    Layout33: TLayout;
    Rectangle17: TRectangle;
    Label56: TLabel;
    Layout1: TLayout;
    Layout14: TLayout;
    Rectangle32: TRectangle;
    Label55: TLabel;
    TabControl1: TTabControl;
    tabDadosEmpresa: TTabItem;
    Layout3: TLayout;
    Rectangle1: TRectangle;
    img_Logo: TImage;
    Label14: TLabel;
    edt_razao: TEdit;
    lbl_razao: TLabel;
    Label1: TLabel;
    edt_Endereco: TEdit;
    Label2: TLabel;
    Edt_Cnpj: TEdit;
    Label3: TLabel;
    edt_Celular: TEdit;
    Label4: TLabel;
    edt_slogan: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    lbl_NomeFant: TLabel;
    edt_NomeFant: TEdit;
    Label8: TLabel;
    edt_Telefone: TEdit;
    OpenDialog: TOpenDialog;
    lay_Principal: TLayout;
    cbx_TipoPessoa: TComboEdit;
    Label7: TLabel;
    edt_NomeCompleto: TEdit;
    lbl_NomeCompleto: TLabel;
    edt_estado: TEdit;
    edt_cidade: TEdit;
    procedure mouseenter(Sender: TObject);
    procedure mouseleave(Sender: TObject);
    procedure Edt_CnpjExit(Sender: TObject);
    procedure edt_CelularExit(Sender: TObject);
    procedure edt_TelefoneExit(Sender: TObject);
    procedure img_LogoClick(Sender: TObject);
    procedure Img_BtnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbx_EstadoChange(Sender: TObject);
    procedure cbx_TipoPessoaChange(Sender: TObject);
  private
    { Private declarations }
    procedure ConsultaCidade(Estado: string; QtdMun: integer; extra: integer);
    procedure ConsultaEstado;
    procedure InserirDadosEmpresa;

  public
    { Public declarations }
  end;

var
  FrmParametro: TFrmParametro;

implementation

uses
  FireDAC.Comp.Client, u_Library, u_DM;

{$R *.fmx}

procedure TFrmParametro.cbx_EstadoChange(Sender: TObject);
begin
  (* cbx_Cidade.ItemIndex := 0;
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
    end; *)
end;

procedure TFrmParametro.cbx_TipoPessoaChange(Sender: TObject);
begin
  case cbx_TipoPessoa.ItemIndex of
    1:
      begin
        edt_NomeFant.Visible := false;
        edt_razao.Visible := false;
        edt_NomeCompleto.Visible := true;
        lbl_NomeFant.Visible := false;
        lbl_razao.Visible := false;
        lbl_NomeCompleto.Visible := true;
      end;
    2:
      begin
        edt_NomeFant.Visible := true;
        edt_razao.Visible := true;
        edt_NomeCompleto.Visible := false;
        lbl_NomeFant.Visible := true;
        lbl_razao.Visible := true;
        lbl_NomeCompleto.Visible := false;
      end;
  end;
end;

procedure TFrmParametro.ConsultaCidade(Estado: string; QtdMun: integer; extra: integer);
begin
  (*
    const
    _SQL = 'select m.nome from agrojun.municipio as m, agrojun.estado as e where e.Nome = :estado and e.uf = m.uf;';
    _SQL2 = 'select m.nome from agrojun.municipio as m, agrojun.estado as e where e.id = :id and e.uf = m.uf';
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
    vResultado.Add(valid + ' - ' + Query2.FieldByName('nome').AsString);
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
    end; *)
end;

procedure TFrmParametro.edt_CelularExit(Sender: TObject);
begin
  if (Length(edt_Celular.Text) = 11) then
    edt_Celular.Text := formacelular(edt_Celular.Text)
  else if (Length(edt_Celular.Text) = 10) then
    edt_Celular.Text := formatelefone(edt_Celular.Text);

end;

procedure TFrmParametro.Edt_CnpjExit(Sender: TObject);
begin
  case cbx_TipoPessoa.ItemIndex of
    1:
      Edt_Cnpj.Text := formacpf(Edt_Cnpj.Text);
    2:
      Edt_Cnpj.Text := formacnpj(Edt_Cnpj.Text);
  end;
end;

procedure TFrmParametro.edt_TelefoneExit(Sender: TObject);
begin
  if (Length(edt_Celular.Text) = 11) then
    edt_Celular.Text := formacelular(edt_Celular.Text)
  else if (Length(edt_Celular.Text) = 10) then
    edt_Celular.Text := formatelefone(edt_Celular.Text);
end;

procedure TFrmParametro.FormCreate(Sender: TObject);
begin
  cbx_TipoPessoa.ItemIndex := 1;
  cbx_TipoPessoaChange(self);
  ConsultaEstado;
end;

procedure TFrmParametro.Img_BtnSalvarClick(Sender: TObject);
begin
  if TabControl1.ActiveTab = tabDadosEmpresa then
    InserirDadosEmpresa;
end;

procedure TFrmParametro.img_LogoClick(Sender: TObject);
begin
{$IFDEF MSWINDOWS}
  if OpenDialog.Execute then
    img_Logo.Bitmap.LoadFromFile(OpenDialog.FileName);
  exit;
{$ENDIF}
end;

procedure TFrmParametro.InserirDadosEmpresa;
const
  SQL = ' INSERT INTO agrojun.dados_empresa ' +
    ' (tipo_pessoa, nome, nome_fantasia, razao_social, cnpj, telefone, celular, endereco, estado, cidade, slogan, logo) VALUES ' +
    ' (:tipo_pessoa, :nome,:nome_fantasia, :razao_social, :cnpj, :telefone, :celular, :endereco, :estado, :cidade, :slogan, :logo); ';
var
  Query2: TFDQuery;
begin
  Query2 := TFDQuery.Create(nil);
  Query2.Connection := dm.FDConnection;
  Query2.Active := false;
  Query2.SQL.Clear;
  Query2.SQL.Add(SQL);
  Query2.ParamByName('tipo_pessoa').AsInteger := cbx_TipoPessoa.ItemIndex;
  Query2.ParamByName('nome').AsString := edt_NomeCompleto.Text;
  Query2.ParamByName('nome_fantasia').AsString := edt_NomeFant.Text;
  Query2.ParamByName('razao_social').AsString := edt_razao.Text;
  Query2.ParamByName('cnpj').AsString := Edt_Cnpj.Text;
  Query2.ParamByName('telefone').AsString := edt_Telefone.Text;
  Query2.ParamByName('celular').AsString := edt_Celular.Text;
  Query2.ParamByName('endereco').AsString := edt_Endereco.Text;
  Query2.ParamByName('estado').AsString := edt_estado.Text;
  Query2.ParamByName('cidade').AsString := edt_cidade.Text;
  Query2.ParamByName('slogan').AsString := edt_slogan.Text;
  Query2.ParamByName('logo').Assign(img_Logo.Bitmap);
  Query2.ExecSQL;
end;

procedure TFrmParametro.mouseenter(Sender: TObject);
begin
  TRectangle(Sender).Fill.Color := $FF4EC626;
end;

procedure TFrmParametro.mouseleave(Sender: TObject);
begin
  TRectangle(Sender).Fill.Color := $FFFBFBFB;
end;

procedure TFrmParametro.ConsultaEstado;
begin
  (*
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
  *)
end;

end.
