unit Repositorio.Dump;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, DADump, MyDump,
  Data.DB, MemDS, DBAccess, MyAccess, MemData, MyClasses, DAScript,
  Repositorio.Conexao;

type
  TRepositorioDump = class
  private
    FDumpFile: TMyDump;
    FDiretorio: String;
    FArquivo: String;
    procedure BackupEstrutura;
    procedure BackupDados;
    procedure BackupCompleto;
    procedure FOnRestoreProgressEvent(Sender: TObject; Percent: integer);
    procedure FBackupProgressEvent(Sender: TObject; ObjectName: string;
      ObjectNum: integer; ObjectCount: integer; Percent: integer);
    procedure FOnError(Sender: TObject; E: Exception;
      SQL: string; var Action: TErrorAction);
  public
    constructor Cria_Se(const Conn: TRepositorioConexao);
    destructor Destrua_Se;
    function Backup(const aPath, aArq: String):Boolean;
    procedure Restaurar(const aDumpFileSQL: String);
  end;

implementation

{ TRepositorioDump }

function TRepositorioDump.Backup(const aPath, aArq: String): Boolean;
begin
  FDiretorio:=aPath;
  FArquivo:=aArq;
  if not (DirectoryExists(FDiretorio)) then
    ForceDirectories(FDiretorio);
  BackupCompleto;
  BackupDados;
  BackupEstrutura;
end;

procedure TRepositorioDump.BackupCompleto;
begin
  FDumpFile.Objects:=[doDatabase, doTables, doData];
  FDumpFile.BackupToFile(FDiretorio+'\'+FArquivo+'_completo.sql');
end;

procedure TRepositorioDump.BackupDados;
begin
  FDumpFile.Objects:=[doData];
  FDumpFile.BackupToFile(FDiretorio+'\'+FArquivo+'_dados.sql');
end;

procedure TRepositorioDump.BackupEstrutura;
begin
  FDumpFile.Objects:=[doTables];
  FDumpFile.BackupToFile(FDiretorio+'\'+FArquivo+'_estrutura.sql');
end;

constructor TRepositorioDump.Cria_Se(const Conn: TRepositorioConexao);
begin
  inherited Create;
  FDumpFile:=TMyDump.Create(nil);
  FDumpFile.OnRestoreProgress:=FOnRestoreProgressEvent;
  FDumpFile.OnBackupProgress:=FBackupProgressEvent;
  FDumpFile.OnError:=FOnError;
  FDumpFile.Connection:=Conn.GetConn;
  FDumpFile.Options.DisableKeys:=True;
  FDumpFile.Options.GenerateHeader:=False;
  FDumpFile.Options.CompleteInsert:=True;
  FDumpFile.Options.QuoteNames:=True;

end;

destructor TRepositorioDump.Destrua_Se;
begin
  FreeAndNil(FDumpFile);
  inherited Destroy;
end;

procedure TRepositorioDump.FBackupProgressEvent(Sender: TObject;
  ObjectName: string; ObjectNum, ObjectCount, Percent: integer);
begin

end;

procedure TRepositorioDump.FOnError(Sender: TObject; E: Exception; SQL: string;
  var Action: TErrorAction);
begin
  Action:=eaContinue;
end;

procedure TRepositorioDump.FOnRestoreProgressEvent(Sender: TObject;
  Percent: integer);
begin

end;

procedure TRepositorioDump.Restaurar(const aDumpFileSQL: String);
begin
  FDumpFile.Connection.Connected:=False;
  FDumpFile.Connection.Database:='mysql';
  FDumpFile.Connection.Connected:=True;
  FDumpFile.RestoreFromFile(aDumpFileSQL);

end;

end.
