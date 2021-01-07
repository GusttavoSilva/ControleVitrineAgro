program Agrojun;

uses
  System.StartUpCopy,
  FMX.Forms,
  u_Login in 'Source\u_Login.pas' {FrmLogin},
  u_CrudCad in 'Source\u_CrudCad.pas' {FrmCrud},
  u_Principal in 'Source\u_Principal.pas' {FrmPrincipal},
  u_Library in 'Source\u_Library.pas',
  u_DM in 'Source\u_DM.pas' {DM: TDataModule},
  u_Splash in 'Source\u_Splash.pas' {frmSplash},
  u_CrudRelat in 'Source\u_CrudRelat.pas' {FrmCrudRelat},
  u_RelatDespesa in 'Source\u_RelatDespesa.pas' {FrmRelatDespesa},
  u_RelatPessoas in 'Source\u_RelatPessoas.pas' {FrmRelatorioPessoa},
  u_RelatCompra in 'Source\u_RelatCompra.pas' {FrmRelatCompra},
  u_RelatVendas in 'Source\u_RelatVendas.pas' {frmRelatVenda},
  u_Grafico_Explore in 'Source\u_Grafico_Explore.pas' {FrmGraficoExplore},
  u_CadCompra in 'Source\u_CadCompra.pas' {FrmCadCompra},
  u_CadContaBanco in 'Source\u_CadContaBanco.pas' {FrmCadContaBanco},
  u_CadDespesas in 'Source\u_CadDespesas.pas' {FrmCadDespesas},
  u_CadLote in 'Source\u_CadLote.pas' {FrmCadLote},
  u_CadPessoa in 'Source\u_CadPessoa.pas' {FrmCadPessoa},
  u_CadUsuario in 'Source\u_CadUsuario.pas' {FrmCadUsuario},
  u_CadVenda in 'Source\u_CadVenda.pas' {FrmCadVenda},
  Repositorio.Conexao in 'Source\BackupFiremonkey\Repositorio.Conexao.pas',
  Repositorio.Dump in 'Source\BackupFiremonkey\Repositorio.Dump.pas',
  u_Parametros in 'Source\u_Parametros.pas' {FrmParametro},
  u_ContasRecebPagar in 'Source\u_ContasRecebPagar.pas' {FrmContasRecebPagar};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TFrmCrud, FrmCrud);
  Application.CreateForm(TFrmCrudRelat, FrmCrudRelat);
  Application.Run;
end.
