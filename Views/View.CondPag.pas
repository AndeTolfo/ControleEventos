unit View.CondPag;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls,
  DmModule, Vcl.Mask, Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCondicaoPag = class(TForm)
    pnlTopo: TPanel;
    pnlCentro: TPanel;
    PG: TPageControl;
    PGCadastro: TTabSheet;
    PGListagem: TTabSheet;
    lblTitulo: TLabel;
    Label1: TLabel;
    edtCod: TDBEdit;
    Label2: TLabel;
    edtNome: TDBEdit;
    Label3: TLabel;
    edtNParcelas: TDBEdit;
    Label4: TLabel;
    edtIntervaloParc: TDBEdit;
    btnSalvar: TButton;
    btnNovo: TButton;
    btnExcluir: TButton;
    btnSair: TButton;
    rOpcao: TRadioGroup;
    lblNome: TLabel;
    edtConsulta: TEdit;
    btnPesquisar: TButton;
    dbListagem: TDBGrid;
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PGCadastroShow(Sender: TObject);
    procedure PGListagemShow(Sender: TObject);
    procedure rOpcaoClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure dbListagemDblClick(Sender: TObject);
  private
    var Varcontrol : boolean;
  public
  FUltimoCodigoCondPag: Integer;
  FUltimoNomeCondPag: string;
  Tabela : String;
  end;

var
  frmCondicaoPag: TfrmCondicaoPag;

implementation

{$R *.dfm}

uses Funcoes;

procedure TfrmCondicaoPag.btnExcluirClick(Sender: TObject);
begin
    if Dm.QueryCond.RecordCount > 0 then
    begin
        DM.QueryCond.Delete;
        ShowMessage('Cadastro Exclu�do');
        DM.QueryCond.EmptyDataSet;

    end
    else
    begin
        ShowMessage('Erro na Exclus�o');
    end;

end;

procedure TfrmCondicaoPag.btnNovoClick(Sender: TObject);
begin
  DM.QueryCond.Insert;
end;

procedure TfrmCondicaoPag.btnPesquisarClick(Sender: TObject);
var TempInt : Integer;
begin
        Dm.QueryCond.Close;
        Dm.QueryCond.SQL.Clear;
    if (rOpcao.ItemIndex = 0)  then
    begin

        Dm.QueryCond.SQL.Add('select * from cond_pag where upper(nome_cond) like :pNome');
        Dm.QueryCond.ParamByName('pNome').AsString := AnsiUpperCase(edtConsulta.Text + '%');
    end
    else if (rOpcao.ItemIndex = 1) and TryStrToInt(edtConsulta.Text, TempInt) then
      begin
        DM.QueryCond.sql.Add('select * from cond_pag where upper(cod_cond) = :pCod');
        DM.QueryCond.ParamByName('pCod').AsString := AnsiUpperCase(edtConsulta.Text);
      end
     else if (rOpcao.ItemIndex = -1) or (edtConsulta.Text = '') then
      begin

        DM.QueryCond.sql.Add('select * from cond_pag ');
      end
      else
      begin
        ShowMessage('Valor Inv�lido');
        Exit;
      end;
      DM.QueryCond.Open;

end;

procedure TfrmCondicaoPag.btnSairClick(Sender: TObject);
begin
  frmCondicaoPag.Close;
end;

procedure TfrmCondicaoPag.btnSalvarClick(Sender: TObject);
begin
    if not Funcoes.VerificarCamposVazios([edtNome, edtNParcelas, edtIntervaloParc]) then
        begin
         ShowMessage('Preencha todos os campos corretamente');
         Exit;
         end;
     if Tabela = 'CondP' then
     begin
        if dm.QueryCond.State in dsEditModes then
       begin
        DM.QueryCond.Post;
        ShowMessage('Condi��o Cadastrada com Sucesso');
        FUltimoCodigoCondPag := DM.QueryCond.FieldByName('cod_cond').AsInteger;
        FUltimoNomeCondPag := DM.QueryCond.FieldByName('nome_cond').AsString;
        DM.QueryCond.EmptyDataSet;
        ModalResult := mrOk; // Fechar o formul�rio com resultado "mrOk"
       end
       else
        begin
        ShowMessage('Verifique os campos');
        end;
     end
     else
     begin
       if dm.QueryCond.State in dsEditModes then
       begin
        DM.QueryCond.Post;
        ShowMessage('Condi��o Cadastrada com Sucesso');
        DM.QueryCond.EmptyDataSet;
       end
       else
        begin
        ShowMessage('Verifique os campos');
        end;
     end;




end;

procedure TfrmCondicaoPag.dbListagemDblClick(Sender: TObject);
begin
    VarControl := True;
    PG.ActivePage := PGCadastro;
end;

procedure TfrmCondicaoPag.FormResize(Sender: TObject);
begin
      Left := (Screen.Width - Width) div 2;
      Top := (Screen.Height - Height) div 2;
end;

procedure TfrmCondicaoPag.FormShow(Sender: TObject);
begin
  PG.ActivePage := pgCadastro;
  edtNome.SetFocus;
end;

procedure TfrmCondicaoPag.PGCadastroShow(Sender: TObject);
begin
    lblTitulo.Caption := 'Cadastro Condi��es de Pagamentos';
   // frmCondicaoPag.Width := 425  ;
   // frmCondicaoPag.Height := 409 ;
  if VarControl then
    begin

    end
    else
    begin
      DM.QueryCond.Open;
      DM.QueryCond.EmptyDataSet;
    end;
    VarControl := False;
end;

procedure TfrmCondicaoPag.PGListagemShow(Sender: TObject);
var ConfirmaAlteracoes :  Integer;
begin
    lblTitulo.Caption := 'Listagem Condi��es de Pagamento';
   // frmCondicaoPag.Width := 550;
   // frmCondicaoPag.Height := 463;

  if DM.QueryCond.State in [dsEdit, dsInsert] then
  begin
    ConfirmaAlteracoes := MessageDlg('Deseja salvar as altera��es?', mtConfirmation, [mbYes, mbNo], 0);
    case ConfirmaAlteracoes of
      mrYes: // Salvar as altera��es
      begin
      if not Funcoes.VerificarCamposVazios([edtNome, edtNParcelas, edtIntervaloParc]) then
        begin
         ShowMessage('Valores incorretos, altera��es canceladas');
         end
        else
        begin
           DM.QueryCond.Post;
           ShowMessage('Altera��es salvas com sucesso!');
        end;
      end;
      mrNo: // N�o salvar e ir para a p�gina de listagem
      begin
        DM.QueryCond.Cancel;
      end;
    end;
  end;


    rOpcao.SetFocus;
    DM.QueryCond.SQL.Clear;
    DM.QueryCond.SQL.Add('select * from cond_pag order by 1');
    DM.QueryCond.Open;
end;

procedure TfrmCondicaoPag.rOpcaoClick(Sender: TObject);
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
