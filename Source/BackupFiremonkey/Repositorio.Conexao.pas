unit Repositorio.Conexao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, DADump, MyDump,
  Data.DB, MemDS, DBAccess, MyAccess, MemData, MyClasses;

type
  TRepositorioConexao = class
  private
   FConexao: TMyConnection;
    FErroConexao: String;
    FConectado: Boolean;
    procedure OnConnect(Sender: TObject);
    procedure Conexao1Error(Sender: TObject; E: EDAError;
      var Fail: Boolean);
    procedure ConexaoConnectionLost(Sender: TObject;
      Component: TComponent; ConnLostCause: TConnLostCause;
      var RetryMode: TRetryMode);
  public
    constructor Cria_Se;
    destructor Destrua_Se;
    function Conectar(const aHost: String; const aBase: String;
      const aPorta: Integer; const aUser, aSenha: string; Testar: Boolean):Boolean;
    function GetConn:TMyConnection;
  end;

implementation

{ TRepositorioConexao }

function TRepositorioConexao.Conectar(const aHost, aBase: String;
  const aPorta: Integer; const aUser, aSenha: string; Testar: Boolean): Boolean;
begin
  with FConexao do
  begin
    Connected:=False;
    Server:=aHost;
    Database:=aBase;
    Port:=aPorta;
    IsolationLevel := ilReadCommitted;
    Password:= aSenha;
    Username:= aUser;
    Options.Charset := 'utf8mb4';

    try
      Result:=True;
      Connected:=True;
    except
      on E: Exception do
      begin
        Result:=False;
        Connected:=False;
      end;
    end;

    if not (Testar) then
    begin
      Connected:=False;
      Server:='';
      Database:='';
      Port:=0;
      FConectado:=False;
    end
    else
      FConectado:=Result;
  end;
end;

procedure TRepositorioConexao.Conexao1Error(Sender: TObject; E: EDAError;
  var Fail: Boolean);
begin
  FErroConexao:='Erro de Conexão:'+#13+IntToStr(E.ErrorCode)+'-'+E.Message;
  FConectado:=Fail;
end;

procedure TRepositorioConexao.ConexaoConnectionLost(Sender: TObject;
  Component: TComponent; ConnLostCause: TConnLostCause;
  var RetryMode: TRetryMode);
begin
  RetryMode := rmReconnect;
end;

constructor TRepositorioConexao.Cria_Se;
begin
  inherited Create;
  FErroConexao:='';
  FConexao := TMyConnection.Create(nil);
  FConexao.AfterConnect := OnConnect;
  FConexao.OnError := Conexao1Error;
  FConexao.OnConnectionLost := ConexaoConnectionLost;
  //FConexao.Options.DisconnectedMode:=True;
  FConectado:=False;
end;

destructor TRepositorioConexao.Destrua_Se;
begin
  FreeAndNil(FConexao);
  inherited Destroy;
end;

function TRepositorioConexao.GetConn: TMyConnection;
begin
  Result:=FConexao;
end;

procedure TRepositorioConexao.OnConnect(Sender: TObject);
begin

end;

end.
