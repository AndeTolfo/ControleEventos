unit View.Contas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, DmModule, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, View.Pesquisas,
  View.Pagamento, View.LancContas, View.HistPagamento, ppProd, ppClass,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDesignLayer, ppBands, ppCtrls,
  ppVar, ppPrnabl, ppCache, ppParameter, Vcl.Menus, Vcl.ComCtrls,DateUtils;

type
  TfrmContas = class(TForm)
    pnlCentro: TPanel;
    pnlTopo: TPanel;
    pnlRodape: TPanel;
    cbTipoConta: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    edtCodEvento: TEdit;
    Label3: TLabel;
    edtCodPalestrantes: TEdit;
    Label4: TLabel;
    edtCodParticipante: TEdit;
    btnAtualizar: TButton;
    btnPagar: TButton;
    btnHist: TButton;
    dbListagem: TDBGrid;
    btnPesquisaEv: TSpeedButton;
    btnPesquisarPart: TSpeedButton;
    btnPesquisaPal: TSpeedButton;
    btnNovaConta: TSpeedButton;
    ppReport: TppReport;
    dsParcelas: TDataSource;
    ppParameterList1: TppParameterList;
    btnRel: TButton;
    ppRel: TPopupMenu;
    relListagem: TMenuItem;
    ppPipeline: TppDBPipeline;
    AgrupadoFavorecido1: TMenuItem;
    dtIni: TDateTimePicker;
    dtFim: TDateTimePicker;
    Label5: TLabel;
    Label6: TLabel;
    cbSit: TComboBox;
    Label10: TLabel;
    ppHeaderBand1: TppHeaderBand;
    ppEmpresa: TppLabel;
    ppLine1: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppLabel1: TppLabel;
    ppLabel4: TppLabel;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText2: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    EUCRIEI_Grupo14: TppDBCalc;
    ppLine2: TppLine;
    ppDBCalc1: TppDBCalc;
    procedure FormShow(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnPesquisaEvClick(Sender: TObject);
    procedure btnPesquisarPartClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCodEventoChange(Sender: TObject);
    procedure edtCodParticipanteChange(Sender: TObject);
    procedure btnPesquisaPalClick(Sender: TObject);
    procedure edtCodPalestrantesChange(Sender: TObject);
    procedure btnNovaContaClick(Sender: TObject);
    procedure btnHistClick(Sender: TObject);
    procedure dbListagemCellClick(Column: TColumn);
    procedure btnPagarClick(Sender: TObject);
    procedure btnRelClick(Sender: TObject);
    procedure relListagemClick(Sender: TObject);
    procedure AgrupadoFavorecido1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FSelectedCodesEv, FSelectedCodesPart, FSelectedCodesPal: TStringList;
    SelectedCodParcela : integer;
  public
    { Public declarations }
  end;

var
  frmContas: TfrmContas;

implementation

{$R *.dfm}


  procedure TfrmContas.AgrupadoFavorecido1Click(Sender: TObject);
var scaminho: string;
begin

  DM. QueryParcelas.SQL.Add('order by favorecido');
// Obtenha o diretório de aplicativo
  scaminho := ExtractFilePath(Application.ExeName);

  // Combine o diretório de aplicativo com o caminho relativo para a pasta "Relatorios"
  scaminho := IncludeTrailingPathDelimiter(scaminho) + 'Relatorios\';

  // Defina o nome e caminho completo do arquivo do relatório
  scaminho := scaminho + 'RelFinAgrupadoFav.rtm';

  // Verifique se o arquivo do relatório existe antes de carregá-lo
  if FileExists(scaminho) then
  begin
    ppReport.Template.FileName := scaminho;
    ppReport.Template.LoadFromFile;
    ppReport.PrintReport;
     btnAtualizar.OnClick(btnRel);
  end
  else
  begin
    ShowMessage('O arquivo do relatório não foi encontrado.');
  end;
end;

procedure TfrmContas.btnAtualizarClick(Sender: TObject);
  var
    SitConta : string;
    SQLWhere: string;
    TipoConta: string;
    i: Integer;
    DataIni, DataFim: TDate;
  begin
    SQLWhere := '';
    TipoConta := '';

    // Verifica o valor selecionado no combobox cbtipoconta
    case cbtipoconta.ItemIndex of
      0: ; // Todas as opções selecionadas, não é necessário adicionar a cláusula WHERE
      1: TipoConta := 'R'; // Receber
      2: TipoConta := 'P'; // Pagar
    end;

    // Verifica se foi selecionado um tipo de conta
    if TipoConta <> '' then
    begin
      if SQLWhere <> '' then
        SQLWhere := SQLWhere + ' AND ';
      SQLWhere := SQLWhere + 'F.Tipo_Conta = ' + QuotedStr(TipoConta);
    end;

    // Verifica Situação da Conta
    case cbSit.ItemIndex of
      0: ; // faz nada
      1: SitConta := '0';//pendente
      2: SitConta := '1'; //quitada
    end;

    if SitConta <> '' then
    begin
      if SQLWhere <> '' then
      begin
        SQLWhere := SQLWhere + ' AND ';
        SQLWhere := SQLWhere + 'P.situacao_parcela = ' + QuotedStr(SitConta);
      end
      else if SQLWhere = '' then
        begin
        SQLWhere := SQLWhere + 'P.situacao_parcela = ' + QuotedStr(SitConta);
        end;
    end;

     //Verifica se foi informado o código do evento
    if edtCodEvento.Text <> '' then
    begin
      if SQLWhere <> '' then
      begin
      SQLWhere := SQLWhere + ' AND ';
      SQLWhere := SQLWhere + 'F.Cod_evento in (' + edtCodEvento.Text +')';
      end
      else if SQLWhere = '' then
      begin
      SQLWhere := SQLWhere + 'F.Cod_evento in (' + edtCodEvento.Text +')';
      end;

    end;

    // Verifica se foi informado o código do participante
    if edtCodParticipante.Text <> '' then
    begin
      if SQLWhere <> '' then
      begin
          ShowMessage('laço participante');
          SQLWhere := SQLWhere + ' AND ';
          SQLWhere := SQLWhere + 'Part.COD_PART in (' + edtCodParticipante.Text +')';
      end
      else if SQLWhere = '' then
      begin
          SQLWhere := SQLWhere + 'Part.COD_PART in (' + edtCodParticipante.Text +')';
      end;


    end;

    // Verifica se foi informado o código do palestrante
    if edtCodPalestrantes.Text <> '' then
    begin
      if SQLWhere <> '' then
      begin
      ShowMessage('laço palestrante');
      SQLWhere := SQLWhere + ' AND ';
      SQLWhere := SQLWhere + 'PAL.COD_PAL in (' + edtCodPalestrantes.Text +')';
      end
      else if SQLWhere = '' then
      begin
        SQLWhere := SQLWhere + 'PAL.COD_PAL in (' + edtCodPalestrantes.Text +')';
      end;
    end;

     // Verifica se foi informado o período de datas
    if (dtIni.Date <> 0) and (dtFim.Date <> 0) then
    begin
       DataIni := dtIni.Date;
       DataFim := dtFim.Date;
     if SQLWhere <> '' then
       SQLWhere := SQLWhere + ' AND ';
        SQLWhere := SQLWhere + 'P.data_venc_parcela >= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', DataIni)) +
         ' AND P.data_venc_parcela <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', DataFim));
    end;

    // Monta a consulta SQL com a cláusula WHERE
        DM.QueryParcelas.SQL.Clear;
        DM.QueryParcelas.SQL.Add('SELECT P.cod_parcela, P.COD_CONTA_PARCELA, P.NUM_PARCELA, F.TIPO_CONTA, P.DATA_VENC_PARCELA, P.VALOR_PARCELA, case p.situacao_parcela when ''0'' then ''PDNT'' when ''1'' then ''QTD'' when ''2'' then ''CANC'' end as Situacao_parcela,');
        DM.QueryParcelas.SQL.Add('P.VALOR_PAGO_PARCELA,sum(p.valor_parcela - p.valor_pago_parcela) as Valor_Restante,');
        DM.QueryParcelas.SQL.Add('CASE F.tipofavorecido WHEN ''PAR'' THEN Part.NOME_Part WHEN ''PAL'' THEN PAL.nome_pal WHEN ''EVE'' THEN FAV.nome_fav END AS FAVORECIDO, F.Cod_evento, ev.TITULO_EV');
        DM.QueryParcelas.SQL.Add('FROM PARCELAS P');
        DM.QueryParcelas.SQL.Add('INNER JOIN FINANCEIRO F ON P.COD_CONTA_PARCELA = F.COD_CONTA');
        DM.QueryParcelas.SQL.Add('left JOIN PARTICIPANTES Part ON Part.COD_PART = F.COD_FAVORECIDO and f.tipofavorecido = ''PAR''');
        DM.QueryParcelas.SQL.Add('left JOIN favorecidos FAV ON FAV.cod_fav = F.cod_favorecido and f.tipofavorecido = ''EVE''');
        DM.QueryParcelas.SQL.Add('left JOIN palestrantes PAL ON PAL.cod_pal = F.cod_favorecido and f.tipofavorecido = ''PAL''');
        DM.QueryParcelas.SQL.Add('INNER JOIN EVENTOS EV ON EV.COD_EVENTO = F.COD_EVENTO');

  if SQLWhere <> '' then
  begin
    DM.QueryParcelas.SQL.Add('WHERE ' + SQLWhere + 'group by 1,2,3,4,5,6,7,8,10,11,12');
  end
  else
  begin
     DM.QueryParcelas.SQL.Add('group by 1,2,3,4,5,6,7,8,10,11,12');
  end;


  DM.QueryParcelas.Open;
  end;



  procedure TfrmContas.btnHistClick(Sender: TObject);
  var ValorPag, Valorparcela: double;
  begin
  if (SelectedCodParcela <> 0) then
    begin
      frmHistPag := TfrmHistPag.Create(Self);
      try
    // Monta a consulta SQL com a cláusula WHERE
       DM.SqlHistPag.SQL.Clear;
       DM.SqlHistPag.SQL.Add('SELECT P.cod_parcela, f.descricao_conta,f.data_conta, f.cod_cond,C.nome_cond,P.COD_CONTA_PARCELA,P.NUM_PARCELA,case F.TIPO_CONTA when ''P'' then ''Pagar'' when ''R'' then ''Receber'' end as "TIPO_CONTA",');
       DM.SqlHistPag.SQL.Add('P.DATA_VENC_PARCELA,P.VALOR_PARCELA,case p.situacao_parcela when ''0'' then ''PENDENTE'' when ''1'' then ''QUITADA'' when ''2'' then ''CANC'' end as Situacao_parcela,');
       DM.SqlHistPag.SQL.Add('P.VALOR_PAGO_PARCELA,sum(valor_parcela - valor_pago_parcela) as Valor_Restante,Part.NOME_Part,F.Cod_evento');
       DM.SqlHistPag.SQL.Add('FROM PARCELAS P');
       DM.SqlHistPag.SQL.Add('INNER JOIN FINANCEIRO F ON P.COD_CONTA_PARCELA = F.COD_CONTA');
       DM.SqlHistPag.SQL.Add('INNER JOIN COND_PAG C ON C.COD_COND = F.COD_COND');
       DM.SqlHistPag.SQL.Add('INNER JOIN PARTICIPANTES Part ON Part.COD_PART = F.COD_FAVORECIDO');
       DM.SqlHistPag.SQL.Add('INNER JOIN EVENTOS EV ON EV.COD_EVENTO = F.COD_EVENTO');
       DM.SqlHistPag.SQL.Add('WHERE p.cod_parcela = :cod group by 1,2,3,4,5,6,7,8,9,10,11,12,14,15');
       DM.SqlHistPag.ParamByName('cod').AsInteger := SelectedCodParcela;
       DM.SqlHistPag.Open;
        //preencher formulário
          frmHistPag.edtCodParcela.Text := DM.SqlHistPag.FieldByName('cod_parcela').AsString;
          frmHistPag.edtCodConta.Text := DM.SqlHistPag.FieldByName('cod_conta_parcela').AsString;
          frmHistPag.edtOrdem.Text := DM.SqlHistPag.FieldByName('num_parcela').AsString;
          frmHistPag.edtDescConta.Text := DM.SqlHistPag.FieldByName('descricao_conta').AsString;
          frmHistPag.edtFav.Text := DM.SqlHistPag.FieldByName('nome_part').AsString;
          frmHistPag.edtCodCond.Text := DM.SqlHistPag.FieldByName('cod_cond').AsString;
          frmHistPag.edtNomeCond.Text := DM.SqlHistPag.FieldByName('nome_cond').AsString;
          frmHistPag.edtSitParcela.Text := DM.SqlHistPag.FieldByName('situacao_parcela').AsString;
          frmHistPag.edtDataVenc.Text := DM.SqlHistPag.FieldByName('DATA_VENC_PARCELA').AsString;
          frmHistPag.edtDataConta.Text := DM.SqlHistPag.FieldByName('DATA_CONTA').AsString;
          frmHistPag.edtTipoConta.Text := DM.SqlHistPag.FieldByName('TIPO_CONTA').AsString;
          valorpag := dbListagem.DataSource.DataSet.FieldByName('valor_pago_parcela').AsFloat;
          valorparcela := dbListagem.DataSource.DataSet.FieldByName('valor_parcela').AsFloat;
          frmHistPag.edtValorPar.Text := FormatFloat('#,##0.00',valorparcela);
          frmHistPag.edtValorPago.Text := FormatFloat('#,##0.00',valorpag);
          frmHistPag.edtValorRestante.Text := FormatFloat('#,##0.00', valorparcela - valorpag);



          frmHistPag.cod_parcela := SelectedCodParcela;
        // Exibe o formulário frmHistPagamento
        frmHistPag.ShowModal;
      finally
        frmHistPag.Free;
      end;
    end;
  end;

  procedure TfrmContas.btnNovaContaClick(Sender: TObject);
  begin
    frmLancContas := TfrmLancContas.Create(Self);

      try
        frmLancContas.ShowModal;
      finally
        frmLancContas.Free;
      end;

  end;

  procedure TfrmContas.btnPagarClick(Sender: TObject);
var ValorPag, Valorparcela: double; codConta : integer; descconta,SitConta : string;
  begin
        if (SelectedCodParcela <> 0) then
    begin

      frmPagamentos := TfrmPagamentos.Create(Self);
      try
      codconta := dbListagem.DataSource.DataSet.FieldByName('cod_conta_parcela').AsInteger;

      // Obter Descrição Conta
      DM.QueryFinanceiro.SQL.Clear;
      DM.QueryFinanceiro.SQL.Add('SELECT * FROM financeiro WHERE COD_CONTA = :CodConta');
      DM.QueryFinanceiro.ParamByName('CodConta').AsInteger := CodConta;

      DM.QueryFinanceiro.Open;
      if not DM.QueryFinanceiro.IsEmpty then
      DescConta := DM.QueryFinanceiro.FieldByName('DESCRICAO_CONTA').AsString;
      SitConta := DM.QueryFinanceiro.FieldByName('SITUACAO_CONTA').AsString;
      if SitConta = 'Q' then
      begin
        ShowMessage('Parcela está quitada');
        exit
      end
      else if SitConta = 'C' then
      begin
         ShowMessage('Parcela está cancelada');
         exit
      end;

      // Preencha as propriedades do frmPagamentos com os valores necessários
       frmPagamentos.edtCodParcela.Text := IntToStr(dbListagem.DataSource.DataSet.FieldByName('cod_parcela').AsInteger);
       frmPagamentos.edtCodConta.Text := IntToStr(dbListagem.DataSource.DataSet.FieldByName('cod_conta_parcela').AsInteger);
       frmPagamentos.edtOrdem.Text := IntToStr(dbListagem.DataSource.DataSet.FieldByName('num_parcela').AsInteger);
       frmPagamentos.edtValorPar.Text := FormatFloat('#,##0.00', dbListagem.DataSource.DataSet.FieldByName('valor_parcela').AsFloat);
       valorpag := dbListagem.DataSource.DataSet.FieldByName('valor_pago_parcela').AsFloat;
       valorparcela := dbListagem.DataSource.DataSet.FieldByName('valor_parcela').AsFloat;
       frmPagamentos.edtValorRestante.Text := (valorparcela - valorpag).ToString;
       frmPagamentos.edtDescConta.Text := descconta;
       frmPagamentos.edtFav.Text := dbListagem.DataSource.DataSet.FieldByName('favorecido').AsString;
       // Exibir a data de vencimento da parcela
       frmPagamentos.edtDataVenc.Text := DateToStr(dbListagem.DataSource.DataSet.FieldByName('data_venc_Parcela').AsDateTime);


      // Abra o Pagamento
        frmPagamentos.ShowModal;
      finally
        frmPagamentos.Free;

        dm.QueryParcelas.Refresh;
      end;
    end;
  end;

procedure TfrmContas.btnPesquisaEvClick(Sender: TObject);
   Var CodSelect : integer;
  begin
      frmPesquisa := TfrmPesquisa.Create(Self);
      try
          frmPesquisa.Tabela := 'Eventos';
          frmPesquisa.Click := 'Sim';
          if frmPesquisa.ShowModal = mrOk then
          begin
           CodSelect := StrToInt(frmPesquisa.CodSelect);
           if(CodSelect <> 0) and (FSelectedCodesEv.IndexOf(IntToStr(CodSelect)) = -1)then
           begin
              if edtCodEvento.Text <> '' then
              begin
                 edtCodEvento.Text := edtCodEvento.Text + ',';
                 edtCodEvento.Text := edtCodEvento.Text + IntToStr(CodSelect);
                 FSelectedCodesEv.Add(IntToStr(CodSelect));
              end
               else if (edtCodEvento.Text = '') then
                    begin
                      edtCodEvento.text := edtCodEvento.text + inttostr(codselect);
                      FSelectedCodesEv.Add(IntToStr(CodSelect));
                    end

                    else
                    begin
                      ShowMessage('Código já adicionado');
                    end;
           end;
          end;
        finally
             frmPesquisa.Free;
      end;
  end;

  procedure TfrmContas.btnPesquisaPalClick(Sender: TObject);
  var CodSelect : Integer;
  begin
  frmPesquisa := TfrmPesquisa.Create(Self);
      try
        frmPesquisa.Tabela := 'Palestrantes';
        frmPesquisa.Click := 'Sim';
        if frmPesquisa.ShowModal = mrOk then
        begin
          CodSelect := StrToInt(frmPesquisa.CodSelect);
          if (CodSelect <> 0) and (FSelectedCodesPal.IndexOf(IntToStr(CodSelect)) = -1) then
           begin
               if edtCodPalestrantes.Text <> '' then
               begin
                  edtCodPalestrantes.Text := edtCodPalestrantes.Text + ',';
                  edtCodPalestrantes.text := edtCodPalestrantes.text + inttostr(codselect);
                  FSelectedCodesPal.Add(IntToStr(CodSelect));
               end
               else if (edtCodPalestrantes.Text = '') then
                    begin
                      edtCodPalestrantes.text := edtCodPalestrantes.text + inttostr(codselect);
                      FSelectedCodesPal.Add(IntToStr(CodSelect));
                    end

                    else
                    begin
                      ShowMessage('Código já adicionado');
                    end;
           end;

        end;
      finally
      frmPesquisa.Free;

      end;
  end;

  procedure TfrmContas.btnPesquisarPartClick(Sender: TObject);
    var CodSelect : integer;
  begin
      frmPesquisa := TfrmPesquisa.Create(Self);
      try
        frmPesquisa.Tabela := 'Participantes';
        frmPesquisa.Click := 'Sim';
        if frmPesquisa.ShowModal = mrOk then
        begin
          CodSelect := StrToInt(frmPesquisa.CodSelect);
          if (CodSelect <> 0) and (FSelectedCodesPart.IndexOf(IntToStr(CodSelect)) = -1) then
          begin
            if edtCodParticipante.Text <> '' then
            begin
              edtCodParticipante.Text := edtCodParticipante.Text + ',';
              edtCodParticipante.Text := edtCodParticipante.text + IntToStr(CodSelect);
              FSelectedCodesPart.Add(IntToStr(CodSelect));
            end
            else if (edtCodParticipante.Text = '') then
                 begin
                   edtCodParticipante.text := edtCodParticipante.text + inttostr(codselect);
                   FSelectedCodesPart.Add(IntToStr(CodSelect));
                 end
            else
            begin
                ShowMessage('Código já adicionado');
            end;
          end;

        end;
      finally
        frmPesquisa.Free;
      end;
  end;

  procedure TfrmContas.btnRelClick(Sender: TObject);
begin
    PpRel.Popup(Mouse.CursorPos.X, Mouse.CursorPos.y);
end;

procedure TfrmContas.dbListagemCellClick(Column: TColumn);
  begin
     SelectedCodParcela := dbListagem.DataSource.DataSet.FieldByName('cod_parcela').AsInteger;
  end;

  procedure TfrmContas.edtCodEventoChange(Sender: TObject);
  var
    CodEvento: Integer;
  begin
    if TryStrToInt(edtCodEvento.Text, CodEvento) then
    begin
      if FSelectedCodesEv.IndexOf(IntToStr(CodEvento)) = -1 then
      begin
        // Adicionar o código na lista
        FSelectedCodesEv.Add(IntToStr(CodEvento));
      end;
    end
    else
    begin
      // Remover todos os itens da lista
      FSelectedCodesEv.Clear;

      // Percorrer o campo edtCodEvento para adicionar os códigos novamente na lista
      if edtCodEvento.Text <> '' then
      begin
        // Separar os códigos por vírgula
        FSelectedCodesEv.Delimiter := ',';
        FSelectedCodesEv.StrictDelimiter := True;
        FSelectedCodesEv.DelimitedText := edtCodEvento.Text;
      end;
    end;
  end;

  procedure TfrmContas.edtCodPalestrantesChange(Sender: TObject);
  var
    CodPal: Integer;
  begin
    if TryStrToInt(edtCodPalestrantes.Text, CodPal) then
    begin
      if FSelectedCodesPal.IndexOf(IntToStr(CodPal)) = -1 then
      begin
        // Adicionar o código na lista
        FSelectedCodesPal.Add(IntToStr(CodPal));
      end;
    end
    else
    begin
      // Remover todos os itens da lista
      FSelectedCodesPal.Clear;

      // Percorrer o campo edtCodEvento para adicionar os códigos novamente na lista
      if edtCodPalestrantes.Text <> '' then
      begin
        // Separar os códigos por vírgula
        FSelectedCodesPal.Delimiter := ',';
        FSelectedCodesPal.StrictDelimiter := True;
        FSelectedCodesPal.DelimitedText := edtCodPalestrantes.Text;
      end;
    end;
  end;

  procedure TfrmContas.edtCodParticipanteChange(Sender: TObject);
  var
    CodPart: Integer;
  begin
    if TryStrToInt(edtCodEvento.Text, CodPart) then
    begin
      if FSelectedCodesPart.IndexOf(IntToStr(CodPart)) = -1 then
      begin
        // Adicionar o código na lista
        FSelectedCodesPart.Add(IntToStr(CodPart));
      end;
    end
    else
    begin
      // Remover todos os itens da lista
      FSelectedCodesPart.Clear;

      // Percorrer o campo edtCodEvento para adicionar os códigos novamente na lista
      if edtCodParticipante.Text <> '' then
      begin
        // Separar os códigos por vírgula
        FSelectedCodesPart.Delimiter := ',';
        FSelectedCodesPart.StrictDelimiter := True;
        FSelectedCodesPart.DelimitedText := edtCodParticipante.Text;
      end;
    end;
  end;



  procedure TfrmContas.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
      FSelectedCodesEv.Free;
      FSelectedCodesPart.Free;
      FSelectedCodesPal.Free;
  end;

  procedure TfrmContas.FormCreate(Sender: TObject);
begin
  dtIni.Date := StartOfTheMonth(Date);
  dtFim.Date := EndOfTheMonth(Date);
end;

procedure TfrmContas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // Verifique se a tecla pressionada é a tecla F5 (código da tecla F5 é 116)
  if Key = VK_F5 then
  begin
    // Chame o método OnClick do botão "Atualizar"
    btnAtualizar.Click;
    // Impedir que o evento OnClick do botão "Atualizar" seja acionado novamente
    // quando a tecla F5 for liberada
    Key := 0;
  end;
end;

procedure TfrmContas.FormShow(Sender: TObject);
  begin

      FSelectedCodesEv := TStringList.Create;
      FSelectedCodesPart := TStringList.Create;
      FSelectedCodesPal := TStringList.Create;
//        DM.QueryParcelas.SQL.Clear;
//        DM.QueryParcelas.SQL.Add('SELECT P.cod_parcela, P.COD_CONTA_PARCELA, P.NUM_PARCELA, F.TIPO_CONTA, P.DATA_VENC_PARCELA, P.VALOR_PARCELA, case p.situacao_parcela when ''0'' then ''PDNT'' when ''1'' then ''QTD'' when ''2'' then ''CANC'' end as Situacao_parcela,');
//        DM.QueryParcelas.SQL.Add('P.VALOR_PAGO_PARCELA,sum(p.valor_parcela - p.valor_pago_parcela) as Valor_Restante,');
//        DM.QueryParcelas.SQL.Add('CASE F.tipofavorecido WHEN ''PAR'' THEN Part.NOME_Part WHEN ''PAL'' THEN PAL.nome_pal WHEN ''EVE'' THEN FAV.nome_fav END AS FAVORECIDO, F.Cod_evento, ev.TITULO_EV');
//        DM.QueryParcelas.SQL.Add('FROM PARCELAS P');
//        DM.QueryParcelas.SQL.Add('INNER JOIN FINANCEIRO F ON P.COD_CONTA_PARCELA = F.COD_CONTA');
//        DM.QueryParcelas.SQL.Add('left JOIN PARTICIPANTES Part ON Part.COD_PART = F.COD_FAVORECIDO and f.tipofavorecido = ''PAR''');
//        DM.QueryParcelas.SQL.Add('left JOIN favorecidos FAV ON FAV.cod_fav = F.cod_favorecido and f.tipofavorecido = ''EVE''');
//        DM.QueryParcelas.SQL.Add('left JOIN palestrantes PAL ON PAL.cod_pal = F.cod_favorecido and f.tipofavorecido = ''PAL''');
//        DM.QueryParcelas.SQL.Add('INNER JOIN EVENTOS EV ON EV.COD_EVENTO = F.COD_EVENTO group by 1,2,3,4,5,6,7,8,10,11,12');
//        DM.QueryParcelas.Open;
     btnAtualizarClick(frmContas);
  end;

procedure TfrmContas.relListagemClick(Sender: TObject);
var scaminho: string;
begin
// Obtenha o diretório de aplicativo
  scaminho := ExtractFilePath(Application.ExeName);

  // Combine o diretório de aplicativo com o caminho relativo para a pasta "Relatorios"
  scaminho := IncludeTrailingPathDelimiter(scaminho) + 'Relatorios\';

  // Defina o nome e caminho completo do arquivo do relatório
  scaminho := scaminho + 'RelFinListagem.rtm';

  // Verifique se o arquivo do relatório existe antes de carregá-lo
  if FileExists(scaminho) then
  begin
    ppReport.Template.FileName := scaminho;
    ppReport.Template.LoadFromFile;
    ppReport.PrintReport;
  end
  else
  begin
    ShowMessage('O arquivo do relatório não foi encontrado.');
  end;
end;

end.
