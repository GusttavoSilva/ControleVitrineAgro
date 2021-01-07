unit u_Library;

interface

uses
  System.SysUtils, System.MaskUtils, StrUtils, FMX.Edit, u_DM,
  FMX.Dialogs, Classes, FMX.Controls, FMX.StdCtrls, Windows, System.UITypes;

const
  Caractere: array [1 .. 106] of Char = ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',
    'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
    'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '!', '#',
    '$', '%', '&', '/', '(', ')', '=', '?', '>', '^', '@', '£', '§', '{', '[',
    ']', '}', '´', '<', '~', '+', '*', '`', '''', 'ª', 'º', '¢', '-', '_', ',',
    '.', ';', ':', '|', '\', '¹', '²', '³', '¬', '°', '¨', ' ', 'a', 'b', 'c',
    'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r',
    's', 't', 'u', 'v', 'w', 'x', 'y', 'z');

const
  Subst: array [1 .. 106] of string = ('!9@8', '@7!7', '#4$5', '$5%4', '%8$8',
    '^1%1', '&3^5', '*7&6', '(6*6', ')3(3', '-2)8', '=1-7', '+0-9', '/0@1',
    '\9$7', '!3@2', '@3&6', '#1*4', '$2#4', '%6(8', '^9!5', '&4=4', '*3@4',
    '(8*4', ')4!7', '-0^5', '=1@9', '+2!0', '/8%2', '\7@5', '!3@7', '@4!8',
    '#7&4', '$6$3', '%2&7', '^1*3', '&1@0', '*3$9', '#3^1', '!4-2', '&6(5',
    '!5@8', ')7!8', '4&1-', 'a2$1', '*9z6', '@7c3', '1%^5', '0&*6', '$5^6',
    '!18)', '(38)', '@30&', '#69]', '[70]', '{26}', '-93#', 'l52h', 'h71i',
    'w80&', '%50%', '#401', '@87-', 'b46x', 'r55^', '!2*2', 'o08y', '&89)',
    '%03%', '\59q', 't85*', '^29-', '@02%', '#99)', '#255', '@23~', '~91t',
    '6%4n', '~5a1', '0=+0', 'Za*a', '%yB-', 'Xc#C', 'wl#d', 'V*@e', '&UF)',
    '!tG$', '-sh@', '%rij', '%QJ)', '%pk&', '@oL*', '!nm=', '!MN*', '@lO-',
    '$kpy', 'Ojq;', ':Ir-', 'h:;s', 'Gx%T', 'f}{U', 'E#tv', 'd1W+', '&cxk',
    'pby$', 'aZ');

Function formacpf(numtexto: String): String;
Function formacnpj(numtexto: String): String;
Function formatelefone(numtexto: String): String;
Function formacelular(numtexto: String): String;
function FNUMD(Objeto: TEdit; Texto, VKey: String;
  Espaco, Decimal: Integer): String;
function DataHoje: String;
function StrToFloat_Universal(pText: string): Extended;
procedure FormatarMoeda(Componente: TObject; var Key: Char);

procedure log(Cod_Tela, id_registro: Integer;
  DadosAnterior, NovosDados: String);

function mensagemConfirmacao(pMensagem: String): TModalResult;

function Criptografa(Palavra: string): string;
function DesCriptografa(Palavra: String): string;

function MaxCod(tabela: string): Integer;

function DiaSemana(Data: TDateTime): String;
function ExtensoMes(n: Integer): String;

function PrimeiroNome(Nome: String): String;

function valorPorExtenso(vlr: real): string;
function IIf(Expressao: Variant; ParteTRUE, ParteFALSE: Variant): Variant;

function OriginalidadeLoteCompra(Lote : Integer): Integer;


var
  Cod_User: Integer;
  Acao: Integer; // 0= INSERT; 1= UPDATE; 2= DELETE

implementation

uses
  FireDAC.Comp.Client, FMX.Forms;

function valorPorExtenso(vlr: real): string;
const
  unidade: array [1 .. 19] of string = ('um', 'dois', 'três', 'quatro', 'cinco', 'seis', 'sete', 'oito', 'nove', 'dez', 'onze', 'doze',
    'treze', 'quatorze', 'quinze', 'dezesseis', 'dezessete', 'dezoito', 'dezenove');
  centena: array [1 .. 9] of string = ('cento', 'duzentos', 'trezentos', 'quatrocentos', 'quinhentos', 'seiscentos', 'setecentos',
    'oitocentos', 'novecentos');
  dezena: array [2 .. 9] of string = ('vinte', 'trinta', 'quarenta', 'cinquenta', 'sessenta', 'setenta', 'oitenta', 'noventa');
  qualificaS: array [0 .. 4] of string = ('', 'mil', 'milhão', 'bilhão', 'trilhão');
  qualificaP: array [0 .. 4] of string = ('', 'mil', 'milhões', 'bilhões', 'trilhões');
var
  inteiro: Int64;
  resto: real;
  vlrS, s, saux, vlrP, centavos: string;
  n, unid, dez, cent, tam, i: integer;
  umReal, tem: boolean;
begin
  if (vlr = 0) then
  begin
    valorPorExtenso := 'zero';
    exit;
  end;

  inteiro := trunc(vlr); // parte inteira do valor
  resto := vlr - inteiro; // parte fracionária do valor
  vlrS := inttostr(inteiro);
  if (length(vlrS) > 15) then
  begin
    valorPorExtenso := 'Erro: valor superior a 999 trilhões.';
    exit;
  end;

  s := '';
  centavos := inttostr(round(resto * 100));

  // definindo o extenso da parte inteira do valor
  i := 0;
  umReal := false;
  tem := false;
  while (vlrS <> '0') do
  begin
    tam := length(vlrS);
    // retira do valor a 1a. parte, 2a. parte, por exemplo, para 123456789:
    // 1a. parte = 789 (centena)
    // 2a. parte = 456 (mil)
    // 3a. parte = 123 (milhões)
    if (tam > 3) then
    begin
      vlrP := copy(vlrS, tam - 2, tam);
      vlrS := copy(vlrS, 1, tam - 3);
    end
    else
    begin // última parte do valor
      vlrP := vlrS;
      vlrS := '0';
    end;
    if (vlrP <> '000') then
    begin
      saux := '';
      if (vlrP = '100') then
        saux := 'cem'
      else
      begin
        n := strtoint(vlrP); // para n = 371, tem-se:
        cent := n div 100; // cent = 3 (centena trezentos)
        dez := (n mod 100) div 10; // dez  = 7 (dezena setenta)
        unid := (n mod 100) mod 10; // unid = 1 (unidade um)
        if (cent <> 0) then
          saux := centena[cent];
        if ((dez <> 0) or (unid <> 0)) then
        begin
          if ((n mod 100) <= 19) then
          begin
            if (length(saux) <> 0) then
              saux := saux + ' e ' + unidade[n mod 100]
            else
              saux := unidade[n mod 100];
          end
          else
          begin
            if (length(saux) <> 0) then
              saux := saux + ' e ' + dezena[dez]
            else
              saux := dezena[dez];
            if (unid <> 0) then
              if (length(saux) <> 0) then
                saux := saux + ' e ' + unidade[unid]
              else
                saux := unidade[unid];
          end;
        end;
      end;
      if ((vlrP = '1') or (vlrP = '001')) then
      begin
        if (i = 0) // 1a. parte do valor (um real)
        then
          umReal := true
        else
          saux := saux + ' ' + qualificaS[i];
      end
      else if (i <> 0) then
        saux := saux + ' ' + qualificaP[i];
      if (length(s) <> 0) then
        s := saux + ', ' + s
      else
        s := saux;
    end;
    if (((i = 0) or (i = 1)) and (length(s) <> 0)) then
      tem := true; // tem centena ou mil no valor
    i := i + 1; // próximo qualificador: 1- mil, 2- milhão, 3- bilhão, ...
  end;

  if (length(s) <> 0) then
  begin
    if (umReal) then
      s := s + ' real'
    else if (tem) then
      s := s + ' reais'
    else
      s := s + ' de reais';
  end;
  // definindo o extenso dos centavos do valor
  if (centavos <> '0') // valor com centavos
  then
  begin
    if (length(s) <> 0) // se não é valor somente com centavos
    then
      s := s + ' e ';
    if (centavos = '1') then
      s := s + 'um centavo'
    else
    begin
      n := strtoint(centavos);
      if (n <= 19) then
        s := s + unidade[n]
      else
      begin // para n = 37, tem-se:
        unid := n mod 10; // unid = 37 % 10 = 7 (unidade sete)
        dez := n div 10; // dez  = 37 / 10 = 3 (dezena trinta)
        s := s + dezena[dez];
        if (unid <> 0) then
          s := s + ' e ' + unidade[unid];
      end;
      s := s + ' centavos';
    end;
  end;
  valorPorExtenso := s;
end;

function Criptografa(Palavra: string): string;
Var
  vet: Integer; // vetor
  ct: Integer; // vetor da constante
  aux: string; // variável auxiliar
begin
  result := '';
  ct := 0;
  vet := 0;
  aux := '';
  // palavra := uppercase(palavra);
  for vet := 1 to Length(Palavra) do
  begin
    for ct := 1 to 106 do
    begin
      if (Palavra[vet] = Caractere[ct]) then
      begin
        aux := aux + Subst[ct];
      end;
    end;
  end;
  result := aux;
end;

function DesCriptografa(Palavra: String): string;
Var
  iVetor: Integer;
  iContador: Integer;
  iContAux: Integer;
  sAuxiliar: string;
begin
  result := '';
  iContador := 0;
  iContAux := 0;
  iVetor := 0;
  sAuxiliar := '';
  for iVetor := 1 to Length(Palavra) do
  begin
    for iContador := 1 to 106 do
    begin
      if (Copy(Palavra, iContAux + 1, 4) = Subst[iContador]) then
      begin
        sAuxiliar := sAuxiliar + Caractere[iContador];
      end;
    end;
    inc(iContAux, 4);
  end;
  result := sAuxiliar;
end;

// Formata número CPF
Function formacpf(numtexto: String): String;
begin
  Delete(numtexto, ansipos('.', numtexto), 1); // Remove ponto .
  Delete(numtexto, ansipos('.', numtexto), 1);
  Delete(numtexto, ansipos('-', numtexto), 1); // Remove traço -
  Delete(numtexto, ansipos('/', numtexto), 1); // Remove barra /
  result := FormatmaskText('000\.000\.000\-00;0;', numtexto);
  // Formata os numero

end;

// Formata número CNPJ
Function formacnpj(numtexto: String): String;
begin
  Delete(numtexto, ansipos('.', numtexto), 1); // Remove ponto .
  Delete(numtexto, ansipos('.', numtexto), 1);
  Delete(numtexto, ansipos('-', numtexto), 1); // Remove traço -
  Delete(numtexto, ansipos('/', numtexto), 1); // Remove barra /
  result := FormatmaskText('00\.000\.000\/0000\-00;0;', numtexto);

end;

// Formata número telefone fixo
Function formatelefone(numtexto: String): String;
begin
  Delete(numtexto, ansipos('-', numtexto), 1); // Remove traço -
  Delete(numtexto, ansipos('-', numtexto), 1);
  Delete(numtexto, ansipos('(', numtexto), 1); // Remove parenteses  (
  Delete(numtexto, ansipos(')', numtexto), 1); // Remove parenteses  )
  result := FormatmaskText('\(00\)0000\-0000;0;', numtexto);
  // Formata os numero
end;

// Formata número celular
Function formacelular(numtexto: String): String;
begin
  Delete(numtexto, ansipos('-', numtexto), 1); // Remove traço -
  Delete(numtexto, ansipos('-', numtexto), 1);
  Delete(numtexto, ansipos('(', numtexto), 1); // Remove parenteses  (
  Delete(numtexto, ansipos(')', numtexto), 1); // Remove parenteses  )
  result := FormatmaskText('\(00\)00000\-0000;0;', numtexto);
  // Formata os numero
end;

// fomatar edit caixa eletronico
function FNUMD(Objeto: TEdit; Texto, VKey: String;
  Espaco, Decimal: Integer): String;
Var
  vChar, vDiv: String;
  I: Integer;
begin
  vDiv := '1';
  For I := 1 to Decimal do
    vDiv := vDiv + '0';

  vChar := Copy(Texto, 1, Length(Texto));

  if (vChar = '') or (vChar = '0') then
    vChar := VKey
  else
    vChar := vChar + VKey;

  While (pos(',', vChar) > 0) or (pos('.', vChar) > 0) do
  begin
    Delete(vChar, pos('.', vChar), 1);
    Delete(vChar, pos(',', vChar), 1);
  end;
  Objeto.MaxLength := Espaco;
  Objeto.Text := Format('%*.*n', [Espaco, Decimal,
    StrToFloat(vChar) / StrToInt(vDiv)]);
  Objeto.SelStart := Length(Objeto.Text);
end;

function DataHoje;
begin
  result := FormatDateTime('dd/mm/yyyy', Date);
end;

procedure FormatarMoeda(Componente: TObject; var Key: Char);
var
  valor_str: String;
  valor: double;
begin

  if Componente is TEdit then
  begin
    // Se tecla pressionada é um numero, backspace ou delete...
    if (Key in ['0' .. '9', #8, #9]) then
    begin
      // Salva valor do edit...
      valor_str := TEdit(Componente).Text;

      // Valida vazio...
      if valor_str = EmptyStr then
        valor_str := '0,00';

      // Se valor numerico, insere na string...
      if Key in ['0' .. '9'] then
        valor_str := Concat(valor_str, Key);

      // Retira pontos e virgulas...
      valor_str := Trim(StringReplace(valor_str, '.', '',
        [rfReplaceAll, rfIgnoreCase]));
      valor_str := Trim(StringReplace(valor_str, ',', '',
        [rfReplaceAll, rfIgnoreCase]));

      // Inserindo 2 casas decimais...
      valor := StrToFloat_Universal(valor_str);
      valor := (valor / 100);

      // Retornando valor tratado ao edit...
      TEdit(Componente).Text := FormatFloat('###,##0.00', valor);

      // Reposiciona cursor...
      TEdit(Componente).SelStart := Length(TEdit(Componente).Text);
    end;

    // Se nao é key importante, reseta...
    if Not(Key in [#8, #9]) then
      Key := #0;
  end;

end;

function StrToFloat_Universal(pText: string): Extended;
const
  BRAZILIAN_ST = ',';
  AMERICAN_ST = '.';
var
  lformatSettings: TFormatSettings;
  lFinalValue: string;
  lAmStDecimalPos: Integer;
  lIndx: Byte;
  lIsAmerican: Boolean;
  lIsEuropean: Boolean;

begin

  lFinalValue := StringReplace(pText, '.', '', [rfReplaceAll]);

  result := StrToFloatDef(lFinalValue, 0, FormatSettings);

end;

procedure log(Cod_Tela, id_registro: Integer;
  DadosAnterior, NovosDados: String);
const
  _SQLLog = 'INSERT INTO `agrojun`.`log_sistema` ' + '(`Data`, ' +
    '`cod_Usuario`, ' + '`cod_tela`, ' + '`Tipo_Ocorrencia`, ' +
    '`id_registro`, ' + '`Dados_Anteriores`, ' + '`Dados_Depois`) ' + 'VALUES '
    + '(:Data, ' + ':cod_Usuario, ' + ':cod_tela, ' + ':Tipo_Ocorrencia, ' +
    ':id_registro, ' + ':Dados_Anteriores, ' + ':Dados_Depois) ';

var
  x: Integer;
begin

  try
    Dm.QLog.Active := false;
    Dm.QLog.SQL.Clear;
    Dm.QLog.SQL.Add(_SQLLog);
    Dm.QLog.ParamByName('Data').AsDateTime := now;
    Dm.QLog.ParamByName('cod_Usuario').asInteger := Cod_User;
    Dm.QLog.ParamByName('Tipo_Ocorrencia').asInteger := Acao;

    Dm.QLog.ParamByName('cod_tela').asInteger := Cod_Tela;
    Dm.QLog.ParamByName('id_registro').asInteger := id_registro;
    Dm.QLog.ParamByName('Dados_Anteriores').AsString := DadosAnterior;
    Dm.QLog.ParamByName('Dados_Depois').AsString := NovosDados;
    Dm.QLog.ExecSQL;

  finally
    Dm.QLog.Close;
  end;
end;

function mensagemConfirmacao(pMensagem: String): TModalResult;
var
  MR: TModalResult;
begin
  MessageDlg(pMensagem, System.UITypes.TMsgDlgType.mtConfirmation,
    [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo], 0,
    procedure(const AResult: TModalResult)
    begin
      MR := AResult;
    end);

  while MR = mrNone do
    Application.ProcessMessages;
  result := MR;
end;

function MaxCod(tabela: string): Integer;
var
  qry: TFDQuery;
begin

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := Dm.FDConnection;
    qry.Close;
    qry.SQL.Clear;
    qry.Active := false;
    qry.SQL.Clear;
    qry.SQL.Add('SELECT MAX(ID) + 1 AS CODIGO FROM ' + tabela);
    qry.open;
    if qry.FieldByName('CODIGO').asInteger = 0 then
      result := 1
    else
      result := qry.FieldByName('CODIGO').asInteger;
  finally
    FreeAndNil(qry);
  end;
end;

function DiaSemana(Data: TDateTime): String;
{ Retorna dia da semana }
var
  NoDia: Integer;
  DiaDaSemana: array [1 .. 7] of String[13];
begin
  { Dias da Semana }
  DiaDaSemana[1] := 'Domingo';
  DiaDaSemana[2] := 'Segunda-feira';
  DiaDaSemana[3] := 'Terça-feira';
  DiaDaSemana[4] := 'Quarta-feira';
  DiaDaSemana[5] := 'Quinta-feira';
  DiaDaSemana[6] := 'Sexta-feira';
  DiaDaSemana[7] := 'Sábado';
  NoDia := DayOfWeek(Data);
  DiaSemana := DiaDaSemana[NoDia];
end;

function ExtensoMes(n: Integer): String;
begin
  Case n Of
    01:
      result := 'Janeiro';
    02:
      result := 'Fevereiro';
    03:
      result := 'Março';
    04:
      result := 'Abril';
    05:
      result := 'Maio';
    06:
      result := 'Junho';
    07:
      result := 'Julho';
    08:
      result := 'Agosto';
    09:
      result := 'Setembro';
    10:
      result := 'Outubro';
    11:
      result := 'Novembro';
    12:
      result := 'Dezembro';
  end;
end;

function PrimeiroNome(Nome: String): String;
var
  PNome: String;
begin
  PNome := '';

  if pos(' ', Nome) <> 0 then
    PNome := Copy(Nome, 1, pos(' ', Nome) - 1)
  else
    PNome := Nome;

  result := Trim(PNome);
end;

function IIf(Expressao: Variant; ParteTRUE, ParteFALSE: Variant): Variant;
begin
  if Expressao then
    Result := ParteTRUE
  else
    Result := ParteFALSE;
end;

function OriginalidadeLoteCompra(Lote: Integer): Integer;
const
  SQL = 'SELECT li.id, li.quantidade, l.id as id_lote, c.id as id_compra FROM agrojun.lotes_itens as li '+
  'left outer join lotes as l on (li.id_compra = l.id_compra)                                                                   '+
  'left outer join compras as c on (li.id_compra = c.id)                                                                        '+
  ' where li.ativo = 1 and l.ativo = 1 and li.id_lote <> l.id and c.id = l.id_compra  and l.id = :idlote                        ';
var
  Query : TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := dm.FDConnection;
  Query.FetchOptions.RowsetSize := 50000;
  Query.Active := false;
  Query.SQL.Clear;
  Query.SQL.Add(SQL);
  Query.ParamByName('idlote').AsInteger :=  Lote;
  Query.Active := true;
  if Query.RecordCount = 0 then
    Result := 0
  else
    Result := 1;
end;

end.
