unit u_ParametroIni;

interface

const
  sSECAO = 'SRV';

type
  TDBDriver = (drFB, drPG, drMySQL, drMSSQL, drSQLite);

  TParametroIni = class(TObject)
  private
    FDWUser: string;
    FDWPorta: Integer;
    FDBPorta: Integer;
    FDWATag: string;
    FDBPass: string;
    FDWAuthentic: Boolean;
    FDBDataBase: string;
    FDBHost: string;
    FDBUser: string;
    FDBDriver: TDBDriver;
    FDWPass: string;
    FIniFile: string;
    FDWHost: string;
    procedure SetDBDataBase(const Value: string);
    procedure SetDBDriver(const Value: TDBDriver);
    procedure SetDBHost(const Value: string);
    procedure SetDBPass(const Value: string);
    procedure SetDBPorta(const Value: Integer);
    procedure SetDBUser(const Value: string);
    procedure SetDWATag(const Value: string);
    procedure SetDWAuthentic(const Value: Boolean);
    procedure SetDWPass(const Value: string);
    procedure SetDWPorta(const Value: Integer);
    procedure SetDWUser(const Value: string);
    function GetDBDriveverFireDAC: string;
    function GetDBDriveverZeos: string;
    function GetDBPortaStr: string;
    function GetDWPortaStr: string;
    function GetDBDriverInt: Integer;
    procedure SetDBDriverInt(const Value: Integer);
    procedure SetDBPortaStr(const Value: string);
    procedure SetDWPortaStr(const Value: string);
    procedure SetDWHost(const Value: string);
  public
    constructor Create(aIniFile: string = '');
    destructor Destroy; override;

    procedure ReadIni;
    procedure WriteIni;

    property DWAuthentic: Boolean read FDWAuthentic write SetDWAuthentic;
    property DWHost: string read FDWHost write SetDWHost;
    property DWPorta: Integer read FDWPorta write SetDWPorta;
    property DWPortaStr: string read GetDWPortaStr write SetDWPortaStr;
    property DWUser: string read FDWUser write SetDWUser;
    property DWPass: string read FDWPass write SetDWPass;
    property DWATag: string read FDWATag write SetDWATag;

    property DBDriver: TDBDriver read FDBDriver write SetDBDriver;
    property DBDriverInt: Integer read GetDBDriverInt write SetDBDriverInt;
    property DBDriveverFireDAC: string read GetDBDriveverFireDAC;
    property DBDriveverZeos: string read GetDBDriveverZeos;
    property DBHost: string read FDBHost write SetDBHost;
    property DBPorta: Integer read FDBPorta write SetDBPorta;
    property DBPortaStr: string read GetDBPortaStr write SetDBPortaStr;
    property DBDataBase: string read FDBDataBase write SetDBDataBase;
    property DBUser: string read FDBUser write SetDBUser;
    property DBPass: string read FDBPass write SetDBPass;
  end;

implementation

uses
  System.SysUtils, System.IniFiles;

{ TParametroIni }

constructor TParametroIni.Create(aIniFile: string);
var
  lFile: string;
begin
  if (aIniFile <> '') then
    FIniFile := aIniFile + '.ini'
  else
  begin
    lFile := StringReplace(ExtractFileName(ParamStr(0)), '.exe', '', [rfReplaceAll]);
    FIniFile := ExtractFilePath(ParamStr(0)) + lFile + '.ini';
  end;

  ReadIni;
end;

destructor TParametroIni.Destroy;
begin

  inherited;
end;

function TParametroIni.GetDBDriverInt: Integer;
begin
  Result := Ord(FDBDriver);
end;

function TParametroIni.GetDBDriveverFireDAC: string;
begin
  case FDBDriver of
    drFB    : Result := 'FB';
    drPG    : Result := 'PG';
    drMySQL : Result := 'MySQL';
    drMSSQL : Result := 'MSSQL';
    drSQLite: Result := 'SQLite';
  end;
end;

function TParametroIni.GetDBDriveverZeos: string;
begin
  case FDBDriver of
    drFB    : Result := 'firebird';
    drPG    : Result := 'postgresql';
    drMySQL : Result := 'mysql';
    drMSSQL : Result := 'mssql';
    drSQLite: Result := '';
  end;
end;

function TParametroIni.GetDBPortaStr: string;
begin
  Result := IntToStr(FDBPorta);
end;

function TParametroIni.GetDWPortaStr: string;
begin
  Result := IntToStr(FDWPorta);
end;

procedure TParametroIni.ReadIni;
var
  lIni: TIniFile;
begin
  lIni := TIniFile.Create(FIniFile);
  try
    //Servidor
    FDWAuthentic := lIni.ReadBool   (sSECAO, 'DW_Aut',  True);
    FDWHost      := lIni.ReadString (sSECAO, 'DW_Host', '');
    FDWPorta     := lIni.ReadInteger(sSECAO, 'DW_Port', 8082);
    FDWUser      := lIni.ReadString (sSECAO, 'DW_User', 'admin');
    FDWPass      := lIni.ReadString (sSECAO, 'DW_Pass', 'admin');
    FDWATag      := lIni.ReadString (sSECAO, 'DW_ATag', 'restdw');
    //DataBase
    FDBDriver    := TDBDriver(lIni.ReadInteger(sSECAO,      'DB_Driver',  -1));
    FDBHost      := lIni.ReadString(sSECAO,  'DB_Host',     '127.0.0.1');
    FDBPorta     := lIni.ReadInteger(sSECAO, 'DB_Port',     0);
    FDBDataBase  := lIni.ReadString(sSECAO,  'DB_DataBase', 'db_rdw');
    FDBUser      := lIni.ReadString(sSECAO,  'DB_User',     'SYSDBA');
    FDBPass      := lIni.ReadString(sSECAO,  'DB_Pass',     'masterkey');
  finally
    lIni.Free;
  end;
end;

procedure TParametroIni.SetDBDataBase(const Value: string);
begin
  FDBDataBase := Value;
end;

procedure TParametroIni.SetDBDriver(const Value: TDBDriver);
begin
  FDBDriver := Value;
end;

procedure TParametroIni.SetDBDriverInt(const Value: Integer);
begin
  FDBDriver := TDBDriver(Value);
end;

procedure TParametroIni.SetDBHost(const Value: string);
begin
  FDBHost := Value;
end;

procedure TParametroIni.SetDBPass(const Value: string);
begin
  FDBPass := Value;
end;

procedure TParametroIni.SetDBPorta(const Value: Integer);
begin
  FDBPorta := Value;
end;

procedure TParametroIni.SetDBPortaStr(const Value: string);
begin
  if (Trim(Value) <> '') then
    FDBPorta := StrToInt(Value);
end;

procedure TParametroIni.SetDBUser(const Value: string);
begin
  FDBUser := Value;
end;

procedure TParametroIni.SetDWATag(const Value: string);
begin
  FDWATag := Value;
end;

procedure TParametroIni.SetDWAuthentic(const Value: Boolean);
begin
  FDWAuthentic := Value;
end;

procedure TParametroIni.SetDWHost(const Value: string);
begin
  FDWHost := Value;
end;

procedure TParametroIni.SetDWPass(const Value: string);
begin
  FDWPass := Value;
end;

procedure TParametroIni.SetDWPorta(const Value: Integer);
begin
  FDWPorta := Value;
end;

procedure TParametroIni.SetDWPortaStr(const Value: string);
begin
  if (Trim(Value) <> '') then
    FDWPorta := StrToInt(Value);
end;

procedure TParametroIni.SetDWUser(const Value: string);
begin
  FDWUser := Value;
end;

procedure TParametroIni.WriteIni;
var
  lIni: TIniFile;
begin
  lIni := TIniFile.Create(FIniFile);
  try
    //Servidor
    lIni.WriteBool  (sSECAO,  'DW_Aut',   FDWAuthentic);
    lIni.WriteString(sSECAO,  'DW_Host',  FDWHost);
    lIni.WriteInteger(sSECAO, 'DW_Port',  FDWPorta);
    lIni.WriteString(sSECAO,  'DW_User',  FDWUser);
    lIni.WriteString(sSECAO,  'DW_Pass',  FDWPass);
    lIni.WriteString(sSECAO,  'DW_ATag',  FDWATag);
    //DataBase
    lIni.WriteInteger(sSECAO, 'DB_Driver',   Ord(FDBDriver));
    lIni.WriteString (sSECAO, 'DB_Host',     FDBHost);
    lIni.WriteInteger(sSECAO, 'DB_Port',     FDBPorta);
    lIni.WriteString (sSECAO, 'DB_DataBase', FDBDataBase);
    lIni.WriteString (sSECAO, 'DB_User',     FDBUser);
    lIni.WriteString (sSECAO, 'DB_Pass',     FDBPass);
  finally
    lIni.Free;
  end;
end;

end.

