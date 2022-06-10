unit Views.Base.Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Buttons,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Generics.Collections,Vcl.Menus, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Services.Base.Cadastro, Views.Base;

type
  TArray = Array of Integer;

type
  TFrmCadastroBase = class(TFrmBase)
    dsCadastro: TDataSource;
    pnlHeader: TPanel;
    pclManutencao: TPageControl;
    tabPesquisa: TTabSheet;
    tabManutencao: TTabSheet;
    pnlTabFiltroGrid: TPanel;
    lblPesquisa: TLabel;
    edtPesquisa: TEdit;
    DBGridVisualizar: TDBGrid;
    pnlManutencao: TPanel;
    pnlDadosRegistro: TPanel;
    Label19: TLabel;
    btnFecharRegistro: TButton;
    btnVisualizarRegistro: TButton;
    btnExcluirRegistro: TButton;
    btnAlterarRegistro: TButton;
    btnIncluirRegistro: TButton;
    pnlFooter: TPanel;
    btnUltimoRegistro: TButton;
    btnProximoRegistro: TButton;
    btnRegistroAnterior: TButton;
    btnPrimeiroRegistro: TButton;
    btnConfirmarOperacao: TButton;
    btnCancelarOperacao: TButton;
    btnVoltar: TButton;
    btnPesquisar: TSpeedButton;
    imgCadastro: TImageList;
    Panel1: TPanel;
    lblTitle: TLabel;
    procedure btnIncluirRegistroClick(Sender: TObject);
    procedure btnAlterarRegistroClick(Sender: TObject);
    procedure btnExcluirRegistroClick(Sender: TObject);
    procedure btnVisualizarRegistroClick(Sender: TObject);
    procedure btnFecharRegistroClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnPrimeiroRegistroClick(Sender: TObject);
    procedure btnRegistroAnteriorClick(Sender: TObject);
    procedure btnProximoRegistroClick(Sender: TObject);
    procedure btnUltimoRegistroClick(Sender: TObject);
    procedure btnConfirmarOperacaoClick(Sender: TObject);
    procedure btnCancelarOperacaoClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure edtPesquisaEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure dsCadastroStateChange(Sender: TObject);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    procedure BuscarRegistro;
    procedure ControleBotoesNavegacao;
    procedure AutoSizeDBGrid(const xDBGrid: TDBGrid);
    procedure AjustarColumns(xDBGrid: TDBGrid; Swidth, TSize: Integer; Asize: TArray);
  protected
    FDataModule: TDMCadastroBase;
    function SomenteNumero(str : string) : string; virtual;
    procedure FiltrarGrid(const DataModule: TDMCadastroBase; const DataSet: TDataSet); virtual;


  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrmCadastroBase.AjustarColumns(xDBGrid: TDBGrid; Swidth, TSize: Integer; Asize: TArray);
  var
    idx: Integer;
begin
  if TSize = 0 then
  begin
    TSize := xDBGrid.Columns.count;
    for idx := 0 to xDBGrid.Columns.count - 1 do
      xDBGrid.Columns[idx].Width := (xDBGrid.Width - xDBGrid.Canvas.TextWidth('AAAAAA')) div TSize
  end else begin
    for idx := 0 to xDBGrid.Columns.count - 1 do
      xDBGrid.Columns[idx].Width := xDBGrid.Columns[idx].Width +(Swidth * Asize[idx] div TSize);
  end;
end;

procedure TFrmCadastroBase.AutoSizeDBGrid(const xDBGrid: TDBGrid);
var
  idx, Twidth, TSize, Swidth: Integer;
  AWidth: TArray;
  Asize: TArray;
  NomeColuna: String;
begin
  SetLength(AWidth, xDBGrid.Columns.count);
  SetLength(Asize, xDBGrid.Columns.count);
  Twidth := 0;
  TSize := 0;
  for idx := 0 to xDBGrid.Columns.count - 1 do
  begin
    NomeColuna := xDBGrid.Columns[idx].Title.Caption;
    xDBGrid.Columns[idx].Width := xDBGrid.Canvas.TextWidth
      (xDBGrid.Columns[idx].Title.Caption + 'A');
    AWidth[idx] := xDBGrid.Columns[idx].Width;
    Twidth := Twidth + AWidth[idx];

    if Assigned(xDBGrid.Columns[idx].Field) then
      Asize[idx] := xDBGrid.Columns[idx].Field.Size
    else
      Asize[idx] := 1;

    TSize := TSize + Asize[idx];
  end;
  if TDBGridOption.dgColLines in xDBGrid.Options then
    Twidth := Twidth + xDBGrid.Columns.count;

  // adiciona a largura da coluna indicada do cursor
  if TDBGridOption.dgIndicator in xDBGrid.Options then
    Twidth := Twidth + IndicatorWidth;

  Swidth := xDBGrid.ClientWidth - Twidth;
  AjustarColumns(xDBGrid ,Swidth, TSize, Asize);
end;

procedure TFrmCadastroBase.btnAlterarRegistroClick(Sender: TObject);
begin
  inherited;
  if FDataModule.Alterar(dsCadastro.DataSet) then
  begin
    pclManutencao.ActivePage := tabManutencao;
    btnVisualizarRegistro.Enabled := (pclManutencao.ActivePage = tabPesquisa);
    pnlManutencao.Enabled := True;
  end;
end;

procedure TFrmCadastroBase.btnCancelarOperacaoClick(Sender: TObject);
begin
  inherited;
 if FDataModule.Cancelar(dsCadastro.DataSet) then
 begin
   pclManutencao.ActivePage := tabPesquisa;
   btnVisualizarRegistro.Enabled := (pclManutencao.ActivePage = tabPesquisa);
 end;
end;

procedure TFrmCadastroBase.btnConfirmarOperacaoClick(Sender: TObject);
begin
  inherited;
  if FDataModule.Gravar(dsCadastro.DataSet) then
  begin
    pclManutencao.ActivePage := tabPesquisa;
    btnVisualizarRegistro.Enabled := (pclManutencao.ActivePage = tabPesquisa);
  end;
end;

procedure TFrmCadastroBase.btnExcluirRegistroClick(Sender: TObject);
begin
  inherited;
  FDataModule.Excluir(dsCadastro.DataSet);
end;

procedure TFrmCadastroBase.btnFecharRegistroClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmCadastroBase.btnIncluirRegistroClick(Sender: TObject);
begin
  inherited;
  if FDataModule.Incluir(dsCadastro.DataSet)then
  begin
    pclManutencao.ActivePage := tabManutencao;
    btnVisualizarRegistro.Enabled := (pclManutencao.ActivePage = tabPesquisa);
    pnlManutencao.Enabled := True;
  end;
end;

procedure TFrmCadastroBase.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  BuscarRegistro;
end;

procedure TFrmCadastroBase.btnPrimeiroRegistroClick(Sender: TObject);
begin
  inherited;
  FDataModule.cdsCadastro.First;
end;

procedure TFrmCadastroBase.btnProximoRegistroClick(Sender: TObject);
begin
  inherited;
  FDataModule.cdsCadastro.Next;
end;

procedure TFrmCadastroBase.btnRegistroAnteriorClick(Sender: TObject);
begin
  inherited;
  FDataModule.cdsCadastro.Prior;
end;

procedure TFrmCadastroBase.btnUltimoRegistroClick(Sender: TObject);
begin
  inherited;
  FDataModule.cdsCadastro.Last;
end;

procedure TFrmCadastroBase.btnVisualizarRegistroClick(Sender: TObject);
begin
  inherited;
  pclManutencao.ActivePage := tabManutencao;
  btnVisualizarRegistro.Enabled := (pclManutencao.ActivePage = tabPesquisa);
  pnlManutencao.Enabled := False;
  ControleBotoesNavegacao;
end;

procedure TFrmCadastroBase.btnVoltarClick(Sender: TObject);
begin
  inherited;
  pclManutencao.ActivePage := tabPesquisa;
  btnVisualizarRegistro.Enabled := (pclManutencao.ActivePage = tabPesquisa);
end;

procedure TFrmCadastroBase.BuscarRegistro;
begin
  edtPesquisa.SetFocus;
  if not Trim(edtPesquisa.Text).IsEmpty then
    Self.FiltrarGrid(FDataModule, dsCadastro.DataSet)
  else if FDataModule.cdsCadastro.Filtered then
    dsCadastro.DataSet.Filtered := false;
  edtPesquisa.SetFocus;
end;

procedure TFrmCadastroBase.ControleBotoesNavegacao;
begin
  btnPrimeiroRegistro.Enabled := (dsCadastro.DataSet.RecNo > 1) and (dsCadastro.DataSet.State = dsBrowse);
  btnRegistroAnterior.Enabled := btnPrimeiroRegistro.Enabled;
  btnUltimoRegistro.Enabled := (dsCadastro.DataSet.RecNo <> dsCadastro.DataSet.RecordCount) and (dsCadastro.DataSet.State = dsBrowse);
  btnProximoRegistro.Enabled := btnUltimoRegistro.Enabled;
end;

procedure TFrmCadastroBase.dsCadastroDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  ControleBotoesNavegacao;
end;

procedure TFrmCadastroBase.dsCadastroStateChange(Sender: TObject);
begin
  inherited;
  btnAlterarRegistro.Enabled := dsCadastro.DataSet.State = dsBrowse;
  btnExcluirRegistro.Enabled := dsCadastro.DataSet.State = dsBrowse;
  btnIncluirRegistro.Enabled := dsCadastro.DataSet.State = dsBrowse;
  btnFecharRegistro.Enabled := dsCadastro.DataSet.State = dsBrowse;

  btnConfirmarOperacao.Visible := dsCadastro.DataSet.State in dsEditModes;
  btnCancelarOperacao.Visible := dsCadastro.DataSet.State in dsEditModes;
  btnVoltar.Visible := dsCadastro.DataSet.State = dsBrowse;
end;

procedure TFrmCadastroBase.edtPesquisaEnter(Sender: TObject);
begin
  inherited;
  BuscarRegistro;
end;

procedure TFrmCadastroBase.FiltrarGrid(const DataModule: TDMCadastroBase; const DataSet: TDataSet);
var
  I: Integer;
  Fields: TList<string>;
begin
  Fields := TList<string>.Create;
  try
    for I := 0 to Pred(Self.DBGridVisualizar.Columns.Count) do
    begin
      if Self.DBGridVisualizar.Columns[I].Visible then
        Fields.Add(Self.DBGridVisualizar.Columns[I].FieldName);
      DataModule.FiltroGrid(edtPesquisa.Text, Fields, DataSet);
    end;
  finally
    Fields.free;
  end;
end;

procedure TFrmCadastroBase.FormCreate(Sender: TObject);
begin
  inherited;
  tabPesquisa.TabVisible := False;
  tabManutencao.TabVisible := False;
  pclManutencao.ActivePage := tabPesquisa;
  FDataModule := TDMCadastroBase.Create(Self);
end;

procedure TFrmCadastroBase.FormDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(FDataModule) then
    FreeAndNil(FDataModule);
end;

procedure TFrmCadastroBase.FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
   sc_DragMove = $f012;
begin
  inherited;
  ReleaseCapture;
  Perform(wm_SysCommand, sc_DragMove, 0);
end;

procedure TFrmCadastroBase.FormResize(Sender: TObject);
begin
  inherited;
  AutoSizeDBGrid(DBGridVisualizar);
end;

procedure TFrmCadastroBase.Panel1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
   sc_DragMove = $f012;
begin
  inherited;
  ReleaseCapture;
  Perform(wm_SysCommand, sc_DragMove, 0);
end;

function TFrmCadastroBase.SomenteNumero(str: string): string;
var
    x : integer;
begin
    Result := '';
    for x := 0 to Length(str) - 1 do
        if (str.Chars[x] In ['0'..'9']) then
            Result := Result + str.Chars[x];
end;

end.
