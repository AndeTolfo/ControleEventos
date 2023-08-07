unit View.Palestrantes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, DmModule, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,View.Pesquisas;

type
  TfrmPalestrantes = class(TForm)
    pnlPalestrantes: TPanel;
    lblTitulo: TLabel;
    Label2: TLabel;
    edtCod: TDBEdit;
    Label3: TLabel;
    edtNome: TDBEdit;
    Label4: TLabel;
    btnSalvar: TButton;
    btnNovo: TButton;
    btnExcluir: TButton;
    btnSair: TButton;
    pnlTopo: TPanel;
    PG: TPageControl;
    pgCadastro: TTabSheet;
    pgListagem: TTabSheet;
    dbListagem: TDBGrid;
    btnPesquisar: TButton;
    rOpcao: TRadioGroup;
    edtConsulta: TEdit;
    cbArea: TDBLookupComboBox;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure dbListagemDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pgCadastroShow(Sender: TObject);
    procedure pgListagemShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    var VarControl : Boolean;
  public
    Tabela, FUltimoNomePal : String;
    FUltimoCodPal : Integer;

  end;

var
  frmPalestrantes: TfrmPalestrantes;

implementation

{$R *.dfm}

uses Funcoes;

procedure TfrmPalestrantes.btnExcluirClick(Sender: TObject);
begin
    if DM.QueryPalestrantes.RecordCount > 0 then
    begin
        DM.QueryPalestrantes.Delete;
        ShowMessage('Cadastro Deletado!');
        DM.QueryPalestrantes.EmptyDataSet;
    end
    else
    begin
        ShowMessage('Erro na Exclus�o');
    end;


end;

procedure TfrmPalestrantes.btnNovoClick(Sender: TObject);
begin
    DM.QueryPalestrantes.Insert;
end;

procedure TfrmPalestrantes.btnPesquisarClick(Sender: TObject);
var TempInt : Integer;
begin
  DM.QueryPalestrantes.Close;
  DM.QueryPalestrantes.SQL.Clear;
   if (rOpcao.ItemIndex = 0) then
   begin
      DM.QueryPalestrantes.SQL.Add('Select * from palestrantes where upper(nome_pal) like :pNome');
      DM.QueryPalestrantes.ParamByName('pNome').AsString := AnsiUpperCase('%' + edtConsulta.Text + '%');
   end
   else if (rOpcao.ItemIndex = 1) and (TryStrToint(edtConsulta.Text, TempInt)) then
   begin
      DM.QueryPalestrantes.SQL.Add('Select * from palestrantes where cod_pal = :pCod');
      DM.QueryPalestrantes.ParamByName('pCod').AsString := edtConsulta.Text;
   end
   else if (rOpcao.ItemIndex = -1) or (edtConsulta.Text = '') then
   begin
     DM.QueryPalestrantes.SQL.Add('Select * from palestrantes');
   end
   else
   begin
     ShowMessage('Valor Inv�lido');
     Exit;
   end;

   DM.QueryPalestrantes.Open;

end;

procedure TfrmPalestrantes.btnSairClick(Sender: TObject);
begin
    frmPalestrantes.Close;
end;

procedure TfrmPalestrantes.btnSalvarClick(Sender: TObject);
begin
  if not Funcoes.VerificarCamposVazios([edtNome]) or VarIsNull(cbArea.KeyValue) then
  begin
    ShowMessage('Preencha todos os campos antes de prosseguir.');
    Exit; // Impede a execu��o do INSERT

  end;
    if (dm.QueryPalestrantes.State in dsEditModes) and ( Tabela = '') then
    begin
        DM.QueryPalestrantes.Post;
        ShowMessage('Palestrante Cadastrado com Sucesso');
        DM.QueryPalestrantes.EmptyDataSet;

    end
    else if (DM.QueryPalestrantes.State in dsEditModes) and (Tabela = 'LancContasCadPal') then
    begin
        DM.QueryPalestrantes.Post;
        ShowMessage('Palestrante Cadastrado com Sucesso');
        FUltimoCodPal := DM.QueryPalestrantes.FieldByName('cod_pal').AsInteger;
        FUltimoNomePal := DM.QueryPalestrantes.FieldByName('nome_pal').AsString;
        DM.QueryPalestrantes.EmptyDataSet;
        ModalResult := mrOk;
    end
    else
    begin
        ShowMessage('Verifique os campos');
    end;


end;

procedure TfrmPalestrantes.dbListagemDblClick(Sender: TObject);
begin
      VarControl := True;
      Pg.ActivePage := pgCadastro;

end;

procedure TfrmPalestrantes.FormResize(Sender: TObject);
begin
        Left := (Screen.Width - Width) div 2;
        Top := (Screen.Height - Height) div 2;
end;

procedure TfrmPalestrantes.FormShow(Sender: TObject);
begin
  PG.ActivePage := pgCadastro;
  edtNome.SetFocus;
  DM.QueryAreas.Open('select * from area_conhecimento order by nome_area');
end;

procedure TfrmPalestrantes.pgCadastroShow(Sender: TObject);
begin
    lblTitulo.Caption := 'Cadastro Palestrantes';
   // frmPalestrantes.Width := 443  ;
   // frmPalestrantes.Height := 350 ;
  if VarControl then
    begin

    end
    else
    begin
      DM.QueryPalestrantes.Open;
      DM.QueryPalestrantes.EmptyDataSet;
    end;
    VarControl := False;
end;

procedure TfrmPalestrantes.pgListagemShow(Sender: TObject);
var ConfirmaAlteracoes : Integer;
begin
    lblTitulo.Caption := 'Listagem Palestrantes';
  //  frmPalestrantes.Width := 669;
  //  frmPalestrantes.Height := 416;

     if DM.QueryPalestrantes.State in [dsEdit, dsInsert] then
  begin
    ConfirmaAlteracoes := MessageDlg('Deseja salvar as altera��es?', mtConfirmation, [mbYes, mbNo], 0);
    case ConfirmaAlteracoes of
      mrYes: // Salvar as altera��es
      begin
       if not Funcoes.VerificarCamposVazios([edtNome]) or VarIsNull(cbArea.KeyValue) then
         begin
          ShowMessage('Valores incorretos, altera��o cancelada');
         end
         else
         begin
          DM.QueryPalestrantes.Post;
          ShowMessage('Altera��es salvas com sucesso!');
         end;
      end;
      mrNo: // N�o salvar e ir para a p�gina de listagem
      begin
        DM.QueryPalestrantes.Cancel;
      end;
    end;
  end;

    rOpcao.SetFocus;
    DM.QueryPalestrantes.SQL.Clear;
    DM.QueryPalestrantes.SQL.Add('select * from palestrantes order by 1');
    DM.QueryPalestrantes.Open;
end;

end.
