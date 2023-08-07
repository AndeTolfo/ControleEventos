unit View.Areas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, View.Pesquisas;

type
  TfrmAreas = class(TForm)
    pnlAreas: TPanel;
    Label1: TLabel;
    edtCodArea: TDBEdit;
    Label2: TLabel;
    edtNomeArea: TDBEdit;
    lblTitulo: TLabel;
    btnSalvar: TButton;
    btnNovo: TButton;
    btnExcluir: TButton;
    btnSair: TButton;
    pnlTopo: TPanel;
    PG: TPageControl;
    pgCadastro: TTabSheet;
    pgListagem: TTabSheet;
    dbListagem: TDBGrid;
    rOpcao: TRadioGroup;
    btnPesquisar: TButton;
    edtConsulta: TEdit;
    lblNome: TLabel;
    procedure btnSairClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure pgListagemShow(Sender: TObject);
    procedure dbListagemDblClick(Sender: TObject);
    procedure pgCadastroShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure rOpcaoClick(Sender: TObject);
  private
    var Varcontrol : Boolean;
  public
    { Public declarations }
  end;

var
  frmAreas: TfrmAreas;

implementation

{$R *.dfm}

uses DmModule, Funcoes;

procedure TfrmAreas.btnExcluirClick(Sender: TObject);
begin
   if Dm.QueryAreas.RecordCount > 0 then
    begin
        DM.QueryAreas.Delete;
        ShowMessage('Cadastro Exclu�do');
        DM.QueryAreas.EmptyDataSet;
    end
    else
    begin
        ShowMessage('Erro na Exclus�o');
    end;

end;

procedure TfrmAreas.btnNovoClick(Sender: TObject);
begin
    DM.QueryAreas.Insert;
end;

procedure TfrmAreas.btnPesquisarClick(Sender: TObject);
var TempInt : Integer;
begin
        Dm.QueryAreas.Close;
        Dm.QueryAreas.SQL.Clear;
    if (rOpcao.ItemIndex = 0)  then
    begin

        Dm.QueryAreas.SQL.Add('select * from area_conhecimento where upper(nome_area) like :pNome');
        Dm.QueryAreas.ParamByName('pNome').AsString := AnsiUpperCase(edtConsulta.Text + '%');
    end
    else if (rOpcao.ItemIndex = 1) and TryStrToInt(edtConsulta.Text, TempInt) then
      begin
        DM.QueryAreas.sql.Add('select * from area_conhecimento where upper(cod_area) = :pCod');
        DM.QueryAreas.ParamByName('pCod').AsString := AnsiUpperCase(edtConsulta.Text);
      end
     else if (rOpcao.ItemIndex = -1) or (edtConsulta.Text = '') then
      begin

        DM.QueryAreas.sql.Add('select * from area_conhecimento ');
      end
      else
      begin
        ShowMessage('Valor Inv�lido');
        Exit;
      end;
      DM.QueryAreas.Open;


end;

procedure TfrmAreas.btnSairClick(Sender: TObject);
begin
    frmAreas.Close;
end;

procedure TfrmAreas.btnSalvarClick(Sender: TObject);
begin
  if not Funcoes.VerificarCamposVazios([edtNomeArea]) then
begin
  ShowMessage('Preencha todos os campos corretamente');
  Exit;
end;
    if dm.QueryAreas.State in dsEditModes then
     begin
        DM.QueryAreas.Post;
        ShowMessage('Cadastro Conclu�do');
        DM.QueryAreas.EmptyDataSet;
     end
     else
     begin
        ShowMessage('Verifique os Campos');
     end;

end;

procedure TfrmAreas.dbListagemDblClick(Sender: TObject);
begin
    VarControl := True;
    PG.ActivePage := PGCadastro;
end;

procedure TfrmAreas.FormResize(Sender: TObject);
begin
      Left := (Screen.Width - Width) div 2;
      Top := (Screen.Height - Height) div 2;
end;

procedure TfrmAreas.FormShow(Sender: TObject);
begin

  PG.ActivePage := pgCadastro;
  edtNomeArea.SetFocus;
end;

procedure TfrmAreas.pgCadastroShow(Sender: TObject);
begin
    lblTitulo.Caption := 'Cadastro �reas Conhecimento';
    //  frmAreas.AutoSize := false;
//      frmAreas.Width := 420  ;
//      frmAreas.Height := 305 ;
  if VarControl then
    begin

    end
    else
    begin
      DM.QueryAreas.Open;
      DM.QueryAreas.EmptyDataSet;
    end;
    VarControl := False;
end;

procedure TfrmAreas.pgListagemShow(Sender: TObject);
var
  ConfirmaAlteracoes: Integer;
begin

  lblTitulo.Caption := 'Listagem �reas Conhecimento';
 // frmAreas.AutoSize := false;
//    frmAreas.Width := 640;
//    frmAreas.Height := 420;
  rOpcao.SetFocus;

  if DM.QueryAreas.State in [dsEdit, dsInsert] then
  begin
    ConfirmaAlteracoes := MessageDlg('Deseja salvar as altera��es?', mtConfirmation, [mbYes, mbNo], 0);
    case ConfirmaAlteracoes of
      mrYes: // Salvar as altera��es
      begin
      if not Funcoes.VerificarCamposVazios([edtNomeArea]) then
      begin
      ShowMessage('Valores incorretos, altera��es canceladas');
      end
      else
      begin
        DM.QueryAreas.Post;
        ShowMessage('Altera��es salvas com sucesso!');
      end;
      end;
      mrNo: // N�o salvar e ir para a p�gina de listagem
      begin
        DM.QueryAreas.Cancel;
      end;
    end;
  end;

  DM.QueryAreas.SQL.Clear;
  DM.QueryAreas.SQL.Add('select * from area_conhecimento order by 1');
  DM.QueryAreas.Open;
end;


procedure TfrmAreas.rOpcaoClick(Sender: TObject);
begin
   if(rOpcao.ItemIndex = 0)then
    begin
      lblNome.Caption := 'Digite o Nome:';
    end;
    if(rOpcao.ItemIndex = 1) then
    begin
      lblNome.Caption := 'Digite o Cod:';
    end;
end;

end.
