unit u_CrudRelat;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,
  FMX.frxClass, FMX.Edit, FMX.ComboEdit, FMX.TabControl;

type
  TFrmCrudRelat = class(TForm)
    Layout4: TLayout;
    Rectangle6: TRectangle;
    lbl_tela: TLabel;
    Rectangle7: TRectangle;
    lay_corpo: TLayout;
    lay_Principal: TLayout;
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    cbx_TipoRelat: TComboEdit;
    lay_menubtn: TLayout;
    rct_menuboton: TRectangle;
    Layout6: TLayout;
    Img_GerarRelatorio: TImage;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    img_selecionado: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Img_GerarRelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCrudRelat: TFrmCrudRelat;

implementation

{$R *.fmx}

uses u_DM;

procedure TFrmCrudRelat.FormCreate(Sender: TObject);
begin

 TabControl1.ActiveTab := TabItem1;
lbl_tela.Text := Self.Caption;
cbx_TipoRelat.ItemIndex := 0;
end;

procedure TFrmCrudRelat.Img_GerarRelatorioClick(Sender: TObject);
begin
//
end;

end.
