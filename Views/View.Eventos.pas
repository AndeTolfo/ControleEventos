unit View.Eventos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, DmModule,
  Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  View.Pesquisas, Vcl.Buttons;

type
  TfrmEventos = class(TForm)
    pnlAgendamentos: TPanel;
    pnlTopo: TPanel;
    lbltitulo: TLabel;
    lblCod: TLabel;
    edtCodEv: TDBEdit;
    Label3: TLabel;
    edtTitulo: TDBEdit;
    Label4: TLabel;
    edtDescricao: TDBEdit;
    Label5: TLabel;
    edtData: TDBEdit;
    Label6: TLabel;
    edtLocal: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtNumPessoas: TDBEdit;
    Label10: TLabel;
    edtValor: TDBEdit;
    btnSalvar: TButton;
    btnNovo: TButton;
    btnExcluir: TButton;
    btnSair: TButton;
    PG: TPageControl;
    pgCadastro: TTabSheet;
    pgListagem: TTabSheet;
    DBListagem: TDBGrid;
    cbArea: TDBLookupComboBox;
    edtCodPales: TDBEdit;
    rOpcao: TRadioGroup;
    btnPesquisaListagem: TButton;
    edtConsultaListagem: TEdit;
    btnPesquisaPal: TSpeedButton;
    lblNome: TLabel;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisaListagemClick(Sender: TObject);
    procedure pgListagemShow(Sender: TObject);
    procedure DBListagemDblClick(Sender: TObject);
    procedure pgCadastroShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnPesquisaPalClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure rOpcaoClick(Sender: TObject);
  private
     FSelectedCodes: TStringList;
     var Varcontrol : Boolean;
  public
    Tabela, FUltimoNomeEv : String;
    FUltimoCodEv : Integer;
  end;

var
  frmEventos: TfrmEventos;

implementation

{$R *.dfm}

uses Funcoes;

  procedure TfrmEventos.btnExcluirClick(Sender: TObject);
  begin
      if DM.QueryEventos.RecordCount > 0 then
      begin
          DM.QueryEventos.Delete;
          ShowMessage('Evento Deletado!');
          DM.QueryEventos.EmptyDataSet;
      end
      else
      begin
          ShowMessage('Erro na Exclus�o');
      end;
  end;

  procedure TfrmEventos.btnNovoClick(Sender: TObject);
  begin
      DM.QueryEventos.Insert;
  end;

  procedure TfrmEventos.btnPesquisaListagemClick(Sender: TObject);
  var TempInt : Integer;
  begin
          Dm.QueryEventos.Close;
          Dm.QueryEventos.SQL.Clear;
         if (rOpcao.ItemIndex = 0)  then
      begin

          Dm.QueryEventos.SQL.Add('select * from eventos where upper(titulo_ev) like :pTitulo');
          Dm.QueryEventos.ParamByName('pTitulo').AsString := AnsiUpperCase('%' + edtConsultaListagem.Text + '%');
      end
      else if (rOpcao.ItemIndex = 1) and TryStrToInt(edtConsultaListagem.Text, TempInt) then
        begin
          DM.QueryEventos.sql.Add('select * from eventos where cod_evento = :pCod');
          DM.QueryEventos.ParamByName('pCod').AsString := edtConsultaListagem.Text;
        end
        else if (rOpcao.ItemIndex = -1) or (edtConsultaListagem.Text = '') then
        begin
          DM.QueryEventos.sql.Add('select * from eventos ');
        end
        else
        begin
          ShowMessage('Valor Inv�lido');
          Exit;
        end;
        DM.QueryEventos.Open;


  end;

  procedure TfrmEventos.btnSairClick(Sender: TObject);
  begin
        frmEventos.Close;
  end;

  procedure TfrmEventos.btnSalvarClick(Sender: TObject);
  begin
      if not Funcoes.VerificarCamposVazios([edtTitulo, edtDescricao, edtData, edtLocal, edtNumPessoas, edtValor, edtCodPales, cbArea]) then
        begin
         ShowMessage('Preencha todos os campos corretamente');
         Exit;
         end;

      if not VerificarValorReaisTDB(edtValor) then
    begin
        ShowMessage('Verifique o campo Valor');
        Exit
    end;


     if tabela = 'LancContas' then
     begin
       if dm.QueryEventos.State in dsEditModes then
      begin
          DM.QueryEventos.Post;
          ShowMessage('Evento Cadastrado com Sucesso');
          FUltimoCodEv := DM.QueryEventos.FieldByName('COD_EVENTO').AsInteger;
          FUltimoNomeEv := DM.QueryEventos.FieldByName('TITULO_EV').AsString;
          DM.QueryEventos.EmptyDataSet;
          ModalResult := mrOk; // Fechar o formul�rio com resultado "mrOk"
      end
      else
      begin
          ShowMessage('Verifique os campos');
      end;
     end
     else
     begin
       if dm.QueryEventos.State in dsEditModes then
      begin
          DM.QueryEventos.Post;
          ShowMessage('Evento Cadastrado com Sucesso');
          DM.QueryEventos.EmptyDataSet;

      end
      else
      begin
          ShowMessage('Verifique os campos');
      end;
     end;
  end;



  procedure TfrmEventos.DBListagemDblClick(Sender: TObject);
  begin
      VarControl := True;
      PG.ActivePage := PGCadastro;
  end;

  procedure TfrmEventos.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
      FSelectedCodes.Free;
  end;

  procedure TfrmEventos.FormResize(Sender: TObject);
  begin
        Left := (Screen.Width - Width) div 2;
        Top := (Screen.Height - Height) div 2;
  end;

  procedure TfrmEventos.FormShow(Sender: TObject);
  begin
     DM.QueryAreas.Open('select * from area_conhecimento order by 2');
     FSelectedCodes := TStringList.Create;
     PG.ActivePage := pgCadastro;
     edtData.SetFocus;

  end;


  procedure TfrmEventos.pgCadastroShow(Sender: TObject);
  begin
         lbltitulo.Caption := 'Cadastro de Eventos';
       // frmEventos.Width := 356  ;
       // frmEventos.Height := 462 ;
    if VarControl then
      begin

      end
      else
      begin
         DM.QueryEventos.Open;
         DM.QueryEventos.EmptyDataSet;
      end;
      VarControl := False;
  end;

  procedure TfrmEventos.pgListagemShow(Sender: TObject);
  var confirmaalteracoes : integer;
  begin
       lbltitulo.Caption := 'Listagem de Eventos';
      // frmEventos.Width := 700  ;
      // frmEventos.Height := 471 ;
        if DM.QueryEventos.State in [dsEdit, dsInsert] then
  begin
    ConfirmaAlteracoes := MessageDlg('Deseja salvar as altera��es?', mtConfirmation, [mbYes, mbNo], 0);
    case ConfirmaAlteracoes of
      mrYes: // Salvar as altera��es
      begin
      if not Funcoes.VerificarCamposVazios([edtTitulo, edtDescricao, edtData, edtLocal, edtNumPessoas, edtValor, edtCodPales, cbArea]) then
        begin
         ShowMessage('Valores incorretos, altera��o cancelada');
         end
         else
         begin
          DM.QueryEventos.Post;
          ShowMessage('Altera��es salvas com sucesso!');
         end;
      end;
      mrNo: // N�o salvar e ir para a p�gina de listagem
      begin
        DM.QueryEventos.Cancel;
      end;
    end;
  end;

      rOpcao.SetFocus;
      DM.QueryEventos.SQL.Clear;
      DM.QueryEventos.SQL.Add('select * from eventos order by 1');
      DM.QueryEventos.Open;
  end;

  procedure TfrmEventos.rOpcaoClick(Sender: TObject);
  begin
           if(rOpcao.ItemIndex = 0)then
      begin
        lblNome.Caption := 'Digite o T�tulo:';
      end;
      if(rOpcao.ItemIndex = 1) then
      begin
        lblNome.Caption := 'Digite o Cod:';
      end;
  end;

  procedure TfrmEventos.btnPesquisaPalClick(Sender: TObject);
  var CodSelect : Integer;
  begin
  frmPesquisa := TfrmPesquisa.Create(Self);
      try
        frmPesquisa.Tabela := 'Palestrantes';
        frmPesquisa.Click := 'Sim';
        if frmPesquisa.ShowModal = mrOk then
        begin
          CodSelect := StrToInt(frmPesquisa.CodSelect);
          if (CodSelect <> 0) then
           begin
              Dm.QueryEventos.Edit;
               if edtCodPales.Text <> '' then
               begin
                 edtCodPales.text := inttostr(codselect);
               end
               else if (edtCodPales.Text = '') then
                    begin
                      edtCodPales.text := inttostr(codselect);
                    end

                    else
                    begin
                      ShowMessage('C�digo j� adicionado');
                    end;
           end;

        end;
      finally
      frmPesquisa.Free;

      end;
  end;

  end.
