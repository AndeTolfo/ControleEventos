unit View.Participantes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, DmModule,
  Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  View.Pesquisas, View.Inscricao;

type
  TfrmParticipantes = class(TForm)
    pnlParticipantes: TPanel;
    lbltitulo: TLabel;
    Label2: TLabel;
    edtCod: TDBEdit;
    Label3: TLabel;
    edtNome: TDBEdit;
    Label4: TLabel;
    edtEmail: TDBEdit;
    Label5: TLabel;
    edtTelefone: TDBEdit;
    Label6: TLabel;
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
    edtConsulta: TEdit;
    Label7: TLabel;
    btnPesquisar: TButton;
    edtArea: TDBEdit;
    Label1: TLabel;
    edtCpf: TDBEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure pgListagemShow(Sender: TObject);
    procedure dbListagemDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure pgCadastroShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    VarControl : Boolean;
  public
    Tabela, FUltimoNomeEv : string;
    FUltimoCodEv : Integer;
  end;

var
  frmParticipantes: TfrmParticipantes;

implementation

{$R *.dfm}

uses View.EventosInfo, View.EventosDisp, Funcoes, View.RelEventos;

  procedure TfrmParticipantes.btnExcluirClick(Sender: TObject);
  begin
      if DM.QueryParticipantes.RecordCount > 0 then
      begin
        DM.QueryParticipantes.Delete;
        ShowMessage('Participante Deletado Com Sucesso');
        DM.QueryParticipantes.EmptyDataSet
      end
      else
      begin
        ShowMessage('Erro na Exclus�o');
      end;

  end;

  procedure TfrmParticipantes.btnNovoClick(Sender: TObject);
  begin
        DM.QueryParticipantes.Insert;
  end;

  procedure TfrmParticipantes.btnPesquisarClick(Sender: TObject);
  var TempInt : Integer;
  begin
       DM.QueryParticipantes.Close;
       DM.QueryParticipantes.sql.Clear;
      if (rOpcao.ItemIndex = 0)  then
      begin

          DM.QueryParticipantes.SQL.Add('Select * from participantes where upper(nome_part) like :pNome');
          DM.QueryParticipantes.ParamByName('pNome').AsString := AnsiUpperCase('%' + edtConsulta.Text + '%');
      end
      else if (rOpcao.ItemIndex = 1)and TryStrToInt(edtConsulta.Text, TempInt) then
      begin

          DM.QueryParticipantes.SQL.Add('Select * from participantes where cod_part = :pID');
          DM.QueryParticipantes.ParamByName('pID').AsString := edtConsulta.Text;
      end
      else if(rOpcao.ItemIndex = -1)or (edtConsulta.Text = '') then
      begin
         DM.QueryParticipantes.SQL.Add('Select * from participantes');
      end
      else
      begin
        ShowMessage('Valor Inv�lido');
        Exit;
      end;



      DM.QueryParticipantes.Open;
  end;

  procedure TfrmParticipantes.btnSairClick(Sender: TObject);
  begin

      frmParticipantes.Close;
  end;

  procedure TfrmParticipantes.btnSalvarClick(Sender: TObject);
  begin
          if not Funcoes.VerificarCamposVazios([edtNome, edtEmail, edtTelefone, edtArea])then
          begin
          ShowMessage('Preencha todos os campos antes de prosseguir.');
          Exit; // Impede a execu��o do INSERT
          end;

       if (DM.QueryParticipantes.State in dsEditModes) and (Tabela = '') then
       begin
          DM.QueryParticipantes.Post;
          ShowMessage('Participante Cadastrado com Sucesso');
          DM.QueryParticipantes.EmptyDataSet;
       end
       else if(DM.QueryParticipantes.State in dsEditModes) and (Tabela = 'EventosInfoInscri��o')then
       begin
          DM.QueryParticipantes.Post;
          ShowMessage('Participante Cadastrado com Sucesso');
          frmInscricao := TfrmInscricao.Create(Self);
         try
          //Preencha as propriedades do frmInscricao com os valores necess�rios
         frmInscricao.lblTitulo.Caption := frmEventosInfo.lbltitulo.Caption;
         frmInscricao.lblData.Caption := frmEventosInfo.lblData.Caption;
         frmInscricao.lblValor.Caption := frmEventosInfo.lblValor.Caption;
         frmInscricao.lblParticipantes.Caption := dbListagem.DataSource.DataSet.FieldByName('NOME_PART').AsString;
         frmInscricao.CodParticipante := dbListagem.DataSource.DataSet.FieldByName('cod_part').AsInteger;
         frmInscricao.CodEvento := frmRelEventos.CodEvento;
        // Abra o frmInscricao
            frmInscricao.ShowModal;
        finally
          frmInscricao.Free;
        end;
         end
       else if (DM.QueryParticipantes.State in dsEditModes) and (Tabela = 'LancContasCadPart') then
          begin
           DM.QueryParticipantes.Post;
           ShowMessage('Participante Cadastrado com Sucesso');
           FUltimoCodEv := DM.QueryParticipantes.FieldByName('cod_part').AsInteger;
           FUltimoNomeEv := DM.QueryParticipantes.FieldByName('nome_part').AsString;
           DM.QueryParticipantes.EmptyDataSet;
           ModalResult := mrOk;
          end
       else
         begin
            ShowMessage('Verifique os campos');
         end;

  end;

  procedure TfrmParticipantes.dbListagemDblClick(Sender: TObject);
  begin
      VarControl := True;
      PG.ActivePage := PGCadastro;
  end;

  procedure TfrmParticipantes.FormResize(Sender: TObject);
  begin
    Left := (Screen.Width - Width) div 2;
    Top := (Screen.Height - Height) div 2;
  end;

  procedure TfrmParticipantes.FormShow(Sender: TObject);
  begin
        PG.ActivePage := pgCadastro;
        edtNome.SetFocus;
  end;

  procedure TfrmParticipantes.pgCadastroShow(Sender: TObject);
  begin
     lbltitulo.Caption := 'Cadastro de Participantes';
   // frmParticipantes.Width := 401  ;
   // frmParticipantes.Height := 440 ;
    if VarControl then
      begin

      end
      else
      begin
       DM.QueryParticipantes.Open;
       DM.QueryParticipantes.EmptyDataSet;
      end;
      VarControl := False;
  end;

  procedure TfrmParticipantes.pgListagemShow(Sender: TObject);
  var ConfirmaAlteracoes : integer;
  begin

  //  frmParticipantes.Width := 730;
  //  frmParticipantes.Height := 471;
    lbltitulo.Caption := 'Listagem de Participantes';

      if DM.QueryParticipantes.State in [dsEdit, dsInsert] then
  begin
    ConfirmaAlteracoes := MessageDlg('Deseja salvar as altera��es?', mtConfirmation, [mbYes, mbNo], 0);
    case ConfirmaAlteracoes of
      mrYes: // Salvar as altera��es
      begin
        if not Funcoes.VerificarCamposVazios([edtNome, edtEmail, edtTelefone, edtArea])then
          begin
          ShowMessage('Valores incorretos, altera��o cancelada');
          end
          else
          begin
          DM.QueryParticipantes.Post;
          ShowMessage('Altera��es salvas com sucesso!');
          end;
      end;
      mrNo: // N�o salvar e ir para a p�gina de listagem
      begin
        DM.QueryParticipantes.Cancel;
      end;
    end;
  end;

      rOpcao.SetFocus;
      DM.QueryParticipantes.SQL.Clear;
      DM.QueryParticipantes.SQL.Add('select * from participantes order by 1');
      DM.QueryParticipantes.Open;
  end;

  end.
