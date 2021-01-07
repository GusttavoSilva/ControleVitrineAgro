unit u_DM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.UI, System.IniFiles;

type
  TDM = class(TDataModule)
    QLog: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    QAux: TFDQuery;
    FDQuery1: TFDQuery;
    FDConnection: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses
  FMX.Dialogs, u_Library;

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
var
  ArquivoINI: TIniFile;
begin
  ArquivoINI := TIniFile.Create(GetCurrentDir + '\ConfiguracaoINI.ini');

  try

    try
      FDConnection.Params.Clear;
      FDConnection.Params.Values['DriverID'] :=DesCriptografa(ArquivoINI.ReadString('Servidor', 'DriverID', ''));
      FDConnection.Params.Values['Server'] := DesCriptografa(ArquivoINI.ReadString('Servidor', 'Server', ''));
      FDConnection.Params.Values['Port'] := DesCriptografa(ArquivoINI.ReadString('Servidor', 'Port', ''));
      FDConnection.Params.Values['DataBase'] := DesCriptografa(ArquivoINI.ReadString('Servidor', 'DataBase', ''));
      FDConnection.Params.Values['User_name'] := DesCriptografa(ArquivoINI.ReadString('Servidor', 'User_name', ''));
      FDConnection.Params.Values['Password'] := DesCriptografa(ArquivoINI.ReadString('Servidor', 'Password', ''));
      FDConnection.Connected := true;
    except
        ShowMessage('Problema ao conectar ao Bando de Dados!');
    end;
  finally
    ArquivoINI.Free;
  end;

end;

end.
