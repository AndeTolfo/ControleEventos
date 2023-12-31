unit View.Favorecido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmFavorecidos = class(TForm)
    pnlTopo: TPanel;
    pnlCentro: TPanel;
    lblTitulo: TLabel;
    edtCodFav: TDBEdit;
    EdtNomeFav: TDBEdit;
    Label3: TLabel;
    Label1: TLabel;
    btnSalvar: TButton;
    btnNovo: TButton;
    btnExcluir: TButton;
    btnSair: TButton;
    PG: TPageControl;
    PGCadastro: TTabSheet;
    Listagem: TTabSheet;
    rOpcao: TRadioGroup;
    lblNome: TLabel;
    edtConsulta: TEdit;
    btnPesquisar: TButton;
    dbListagem: TDBGrid;
    procedure PGCadastroShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure dbListagemDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListagemShow(Sender: TObject);
    procedure rOpcaoClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    Varcontrol : Boolean;
  public
    Tabela, FUltimoNomeFav : String;
    FUltimoCodFav : Integer;
  end;

var
  frmFavorecidos: TfrmFavorecidos;

implementation

{$R *.dfm}

uses DmModule, Funcoes;

procedure TfrmFavorecidos.btnExcluirClick(Sender: TObject);
begin
  if Dm.QueryFavorecidos.RecordCount > 0 then
    begin
        DM.QueryFavorecidos.Delete;
        ShowMessage('Cadastro Exclu�do');
        DM.QueryFavorecidos.EmptyDataSet;

    end
    else
    begin
        ShowMessage('Erro na Exclus�o');
    end;
end;

procedure TfrmFavorecidos.btnNovoClick(Sender: TObject);
begin
  Dm.QueryFavorecidos.Insert;
end;

procedure TfrmFavorecidos.btnPesquisarClick(Sender: TObject);
var TempInt : Integer;
begin
        Dm.QueryFavorecidos.Close;
        Dm.QueryFavorecidos.SQL.Clear;
    if (rOpcao.ItemIndex = 0)  then
    begin

        Dm.QueryFavorecidos.SQL.Add('select * from favorecidos where upper(nome_fav) like :pNome');
        Dm.QueryFavorecidos.ParamByName('pNome').AsString := AnsiUpperCase(edtConsulta.Text + '%');
    end
    else if (rOpcao.ItemIndex = 1) and TryStrToInt(edtConsulta.Text, TempInt) then
      begin
        DM.QueryFavorecidos.sql.Add('select * from favorecidos where upper(cod_fav) = :pCod');
        DM.QueryFavorecidos.ParamByName('pCod').AsString := AnsiUpperCase(edtConsulta.Text);
      end
     else if (rOpcao.ItemIndex = -1) or (edtConsulta.Text = '') then
      begin

        DM.QueryFavorecidos.sql.Add('select * from favorecidos ');
      end
      else
      begin
        ShowMessage('Valor Inv�lido');
        Exit;
      end;
      DM.QueryFavorecidos.Open;


end;

procedure TfrmFavorecidos.btnSairClick(Sender: TObject);
begin
  frmFavorecidos.Close;
end;

procedure TfrmFavorecidos.btnSalvarClick(Sender: TObject);
begin
    if not Funcoes.VerificarCamposVazios([EdtNomeFav]) then
        begin
         ShowMessage('Preencha todos os campos corretamente');
         Exit;
         end;
    if (DM.QueryFavorecidos.State in dsEditModes) and (Tabela = '') then
     begin
        DM.QueryFavorecidos.Post;
        ShowMessage('Cadastro Conclu�do');
        DM.QueryFavorecidos.EmptyDataSet;
     end
    else if (DM.QueryFavorecidos.State in dsEditModes) and (Tabela = 'LancContasCadFav')then
     begin
        DM.QueryFavorecidos.Post;
        ShowMessage('Cadastro Conclu�do');
        FUltimoCodFav := DM.QueryFavorecidos.FieldByName('cod_fav').AsInteger;
        FUltimoNomeFav := DM.QueryFavorecidos.FieldByName('nome_fav').AsString;
        DM.QueryFavorecidos.EmptyDataSet;
        ModalResult := mrOk;
     end
     else
     begin
        ShowMessage('Verifique os Campos');
     end;
end;

procedure TfrmFavorecidos.PGCadastroShow(Sender: TObject);
begin
    lblTitulo.Caption := 'Cadastro de Favorecidos';
//    frmFavorecidos.Width := 471  ;
//    frmFavorecidos.Height := 317 ;
  if VarControl then
    begin

    end
    else
    begin
      DM.QueryFavorecidos.Open;
      DM.QueryFavorecidos.EmptyDataSet;
    end;
    VarControl := False;

end;

procedure TfrmFavorecidos.rOpcaoClick(Sender: TObject);
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

procedure TfrmFavorecidos.dbListagemDblClick(Sender: TObject);
begin
    VarControl := True;
    PG.ActivePage := PGCadastro;
end;

procedure TfrmFavorecidos.FormResize(Sender: TObject);
begin
      Left := (Screen.Width - Width) div 2;
      Top := (Screen.Height - Height) div 2;
end;

procedure TfrmFavorecidos.FormShow(Sender: TObject);
begin
  PG.ActivePage := pgCadastro;
  EdtNomeFav.SetFocus;
end;

procedure TfrmFavorecidos.ListagemShow(Sender: TObject);
var ConfirmaAlteracoes : integer;
begin
    lblTitulo.Caption := 'Listagem Favorecidos';
//    frmFavorecidos.Width := 669;
//    frmFavorecidos.Height := 416;

      if DM.QueryFavorecidos.State in [dsEdit, dsInsert] then
  begin
    ConfirmaAlteracoes := MessageDlg('Deseja salvar as altera��es?', mtConfirmation, [mbYes, mbNo], 0);
    case ConfirmaAlteracoes of
      mrYes: // Salvar as altera��es
      begin
        if not Funcoes.VerificarCamposVazios([EdtNomeFav]) then
        begin
         ShowMessage('Valores incorretos, altera��o cancelada');
         end
        else
        begin
        DM.QueryFavorecidos.Post;
        ShowMessage('Altera��es salvas com sucesso!');
        end;
      end;
      mrNo: // N�o salvar e ir para a p�gina de listagem
      begin
        DM.QueryFavorecidos.Cancel;
      end;
    end;
  end;



    rOpcao.SetFocus;
    DM.QueryFavorecidos.SQL.Clear;
    DM.QueryFavorecidos.SQL.Add('select * from favorecidos order by 1');
    DM.QueryFavorecidos.Open;
end;

end.
