unit View.Balancete;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, DmModule, Vcl.Buttons,DateUtils,
  View.Pesquisas, Vcl.Menus, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppDB,
  ppDBPipe, ppDesignLayer, ppBands, ppCtrls, ppVar, ppPrnabl, ppCache,
  ppParameter, ppModule, raCodMod;

type
  TfrmBalancete = class(TForm)
    pnlTopo: TPanel;
    pnlRodape: TPanel;
    pnlCentro: TPanel;
    PG: TPageControl;
    pgPeriodo: TTabSheet;
    dtIni: TDateTimePicker;
    Label1: TLabel;
    Label5: TLabel;
    dtFim: TDateTimePicker;
    Label2: TLabel;
    cbTipoConta: TComboBox;
    dbListagem: TDBGrid;
    dsBalancete: TDataSource;
    Label3: TLabel;
    edtCodPag: TEdit;
    Label4: TLabel;
    edtCodParc: TEdit;
    Label6: TLabel;
    edtCodConta: TEdit;
    Label7: TLabel;
    edtCodEvento: TEdit;
    Label8: TLabel;
    cbTipoFav: TComboBox;
    Label9: TLabel;
    edtCodFav: TEdit;
    btnPesquisarFav: TSpeedButton;
    SpeedButton1: TSpeedButton;
    PpRel: TPopupMenu;
    relListagem: TMenuItem;
    RelAgrFav: TMenuItem;
    RelAgrEv: TMenuItem;
    btnImp: TButton;
    RelTotEv: TMenuItem;
    ppReport: TppReport;
    ppListagem: TppDBPipeline;
    ppParameterList1: TppParameterList;
    Label10: TLabel;
    cbSit: TComboBox;
    ppListagemppField16: TppField;
    dsDebCred: TDataSource;
    ppCredDeb: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppEmpresa: TppLabel;
    ppLine1: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppLabel4: TppLabel;
    ppLabel1: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    EUCRIEI_Grupo14: TppDBCalc;
    raCodeModule1: TraCodeModule;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    btnAtualizar: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPesquisarFavClick(Sender: TObject);
    procedure btnImpClick(Sender: TObject);
    procedure relListagemClick(Sender: TObject);
    procedure RelAgrFavClick(Sender: TObject);
    procedure RelAgrEvClick(Sender: TObject);
    procedure RelTotEvClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FSelectedCodesEv, FSelectedCodesPart, FSelectedCodesPal, FSelectedCodesFav: TStringList;
    TipoFav: String;
  public
    { Public declarations }
  end;

var
  frmBalancete: TfrmBalancete;

implementation

{$R *.dfm}

procedure TfrmBalancete.btnAtualizarClick(Sender: TObject);
  var
    SQLWhere: String;
    TipoConta: string;
    SitConta : string;
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

      //Verifica se foi informado o código do Pagamento
    if edtCodPag.Text <> '' then
    begin
      if SQLWhere <> '' then
      begin
      SQLWhere := SQLWhere + ' AND ';
      SQLWhere := SQLWhere + 'pag.cod_pagamento in (' + edtCodPag.Text +')';
      end
      else if SQLWhere = '' then
      begin
      SQLWhere := SQLWhere + 'pag.cod_pagamento in (' + edtCodPag.Text +')';
      end;
    end;

      //Verifica se foi informado o código da Parcela
    if edtCodParc.Text <> '' then
    begin
      if SQLWhere <> '' then
      begin
      SQLWhere := SQLWhere + ' AND ';
      SQLWhere := SQLWhere + 'p.cod_parcela in (' + edtCodParc.Text +')';
      end
      else if SQLWhere = '' then
      begin
      SQLWhere := SQLWhere + 'p.cod_parcela in (' + edtCodParc.Text +')';
      end;
    end;

      //Verifica se foi informado o código da Conta
    if edtCodConta.Text <> '' then
    begin
      if SQLWhere <> '' then
      begin
      SQLWhere := SQLWhere + ' AND ';
      SQLWhere := SQLWhere + 'f.cod_conta in (' + edtCodConta.Text +')';
      end
      else if SQLWhere = '' then
      begin
      SQLWhere := SQLWhere + 'f.cod_conta in (' + edtCodConta.Text +')';
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

        // Filtro Por Favorecido
    //Participante
    if edtCodFav.Text <> '' then
    begin
      if TipoFav = 'Part' then
      begin
      if SQLWhere <> '' then
          begin
          SQLWhere := SQLWhere + ' AND ';
          SQLWhere := SQLWhere + 'Part.COD_PART in (' + edtCodFav.Text +')';
          end
          else if SQLWhere = '' then
            begin
              SQLWhere := SQLWhere + 'Part.COD_PART in (' + edtCodFav.Text +')';
          end;
      end
    //Palestrante
      else if TipoFav = 'Pal' then
      begin
      if SQLWhere <> '' then
          begin
          SQLWhere := SQLWhere + ' AND ';
          SQLWhere := SQLWhere + 'PAL.cod_pal in (' + edtCodFav.Text +')';
          end
          else if SQLWhere = '' then
            begin
              SQLWhere := SQLWhere + 'PAL.cod_pal in (' + edtCodFav.Text +')';
          end;
      end
     //Favorecido
     else if TipoFav = 'Fav' then
      begin
      if SQLWhere <> '' then
          begin
          SQLWhere := SQLWhere + ' AND ';
          SQLWhere := SQLWhere + 'FAV.cod_fav in (' + edtCodFav.Text +')';
          end
          else if SQLWhere = '' then
            begin
              SQLWhere := SQLWhere + 'FAV.cod_fav in (' + edtCodFav.Text +')';
          end;
      end
    end;




    // Monta a consulta SQL com a cláusula WHERE
  DM.QueryRelBalancete.SQL.Clear;
  DM.QueryRelBalancete.SQL.Add('select pag.cod_pagamento, pag.data_hora, pag.valor_pagamento, pag.cod_parcela, p.num_parcela, p.data_venc_parcela, f.tipo_conta, f.cod_conta, p.valor_parcela,');
  DM.QueryRelBalancete.SQL.Add('p.valor_pago_parcela, f.valor_conta,sum(p.valor_parcela - p.valor_pago_parcela) as Valor_Restante, case p.situacao_parcela when ''0'' then ''PDNT'' when ''1'' then ''QTD'' when ''2'' then ''CANC'' end as Situacao_parcela,');
  DM.QueryRelBalancete.SQL.Add('CASE F.tipofavorecido WHEN ''PAR'' THEN Part.NOME_Part WHEN ''PAL'' THEN PAL.nome_pal WHEN ''EVE'' THEN FAV.nome_fav END AS FAVORECIDO, f.cod_evento, ev.titulo_ev');
  DM.QueryRelBalancete.SQL.Add('from pagamentos pag');
  DM.QueryRelBalancete.SQL.Add('join parcelas p on p.cod_parcela = pag.cod_parcela');
  DM.QueryRelBalancete.SQL.Add('join financeiro f on f.cod_conta = p.cod_conta_parcela');
  DM.QueryRelBalancete.SQL.Add('left JOIN PARTICIPANTES Part ON Part.COD_PART = F.COD_FAVORECIDO and f.tipofavorecido = ''PAR''');
  DM.QueryRelBalancete.SQL.Add('left JOIN favorecidos FAV ON FAV.cod_fav = F.cod_favorecido and f.tipofavorecido = ''EVE''');
  DM.QueryRelBalancete.SQL.Add('left JOIN palestrantes PAL ON PAL.cod_pal = F.cod_favorecido and f.tipofavorecido = ''PAL''');
  DM.QueryRelBalancete.SQL.Add('join eventos ev on ev.cod_evento = f.cod_evento');
    //Monta o relatório totalizado por ev
  DM.QueryRelCredDeb.sql.Clear;
  DM.QueryRelCredDeb.SQL.Add('select ev.titulo_ev,SUM(CASE WHEN f.tipo_conta = ''R'' THEN pag.valor_pagamento ELSE 0 END) AS Credito,');
  DM.QueryRelCredDeb.SQL.Add('SUM(CASE WHEN f.tipo_conta = ''P'' THEN pag.valor_pagamento ELSE 0 END) AS Debito,');
  DM.QueryRelCredDeb.SQL.Add('SUM(CASE WHEN f.tipo_conta = ''R'' THEN pag.valor_pagamento ELSE -pag.valor_pagamento END) AS Saldo');
  DM.QueryRelCredDeb.SQL.Add('From Pagamentos pag');
  DM.QueryRelCredDeb.SQL.Add('JOIN parcelas p ON p.cod_parcela = pag.cod_parcela');
  DM.QueryRelCredDeb.SQL.Add('JOIN financeiro f ON f.cod_conta = p.cod_conta_parcela');
  DM.QueryRelCredDeb.SQL.Add('JOIN eventos ev ON ev.cod_evento = f.cod_evento');

  if SQLWhere <> '' then
  begin
    DM.QueryRelBalancete.SQL.Add('WHERE ' + SQLWhere + 'group by 1,2,3,4,5,6,7,8,9,10,11,13,14,15,16');
  end
  else
  begin
    DM.QueryRelBalancete.SQL.Add('group by 1,2,3,4,5,6,7,8,9,10,11,13,14,15');
  end;

  // where somente do evento totalizado
  if edtCodEvento.Text <> '' then
  begin
    DM.QueryRelCredDeb.SQL.Add('Where ev.cod_evento in (' + edtCodEvento.Text + ') GROUP BY ev.titulo_ev');
  end
  else
  begin
    DM.QueryRelCredDeb.SQL.Add('GROUP BY ev.titulo_ev');
  end;


  DM.QueryRelBalancete.Open;
  DM.QueryRelCredDeb.Open;
end;

procedure TfrmBalancete.btnPesquisarFavClick(Sender: TObject);
var CodSelect : integer;
begin
  //Verifica o tipo de favorecido
    case cbTipoFav.ItemIndex of
      0: TipoFav := 'Part';
      1: TipoFav := 'Pal';
      2: TipoFav := 'Fav';
    end;

   frmPesquisa := TfrmPesquisa.Create(Self);
  // Pesquisa por Participante
  if TipoFav = 'Part' then
  begin
      try
        frmPesquisa.Tabela := 'Participantes';
        frmPesquisa.Click := 'Sim';
        if frmPesquisa.ShowModal = mrOk then
        begin
          CodSelect := StrToInt(frmPesquisa.CodSelect);
          if (CodSelect <> 0) and (FSelectedCodesPart.IndexOf(IntToStr(CodSelect)) = -1) then
          begin
            if edtCodFav.Text <> '' then
            begin
              edtCodFav.Text := edtCodFav.Text + ',';
              edtCodFav.Text := edtCodFav.text + IntToStr(CodSelect);
              FSelectedCodesPart.Add(IntToStr(CodSelect));
            end
            else if (edtCodFav.Text = '') then
                 begin
                   edtCodFav.text := edtCodFav.text + inttostr(codselect);
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

  // Pesquisa por Palestrante

  if TipoFav = 'Pal' then
  begin
    try
        frmPesquisa.Tabela := 'Palestrantes';
        frmPesquisa.Click := 'Sim';
        if frmPesquisa.ShowModal = mrOk then
        begin
          CodSelect := StrToInt(frmPesquisa.CodSelect);
          if (CodSelect <> 0) and (FSelectedCodesPal.IndexOf(IntToStr(CodSelect)) = -1) then
           begin
               if edtCodFav.Text <> '' then
               begin
                  edtCodFav.Text := edtCodFav.Text + ',';
                  edtCodFav.text := edtCodFav.text + inttostr(codselect);
                  FSelectedCodesPal.Add(IntToStr(CodSelect));
               end
               else if (edtCodFav.Text = '') then
                    begin
                      edtCodFav.text := edtCodFav.text + inttostr(codselect);
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

  // Pesquisa por Favorecidos
 if TipoFav = 'Fav' then
  begin
    try
        frmPesquisa.Tabela := 'Favorecidos';
        frmPesquisa.Click := 'Sim';
        if frmPesquisa.ShowModal = mrOk then
        begin
          CodSelect := StrToInt(frmPesquisa.CodSelect);
          if (CodSelect <> 0) and (FSelectedCodesFav.IndexOf(IntToStr(CodSelect)) = -1) then
           begin
               if edtCodFav.Text <> '' then
               begin
                  edtCodFav.Text := edtCodFav.Text + ',';
                  edtCodFav.text := edtCodFav.text + inttostr(codselect);
                  FSelectedCodesFav.Add(IntToStr(CodSelect));
               end
               else if (edtCodFav.Text = '') then
                    begin
                      edtCodFav.text := edtCodFav.text + inttostr(codselect);
                      FSelectedCodesFav.Add(IntToStr(CodSelect));
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




end;

procedure TfrmBalancete.btnImpClick(Sender: TObject);
begin
     PpRel.Popup(Mouse.CursorPos.X, Mouse.CursorPos.y);
end;

procedure TfrmBalancete.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FSelectedCodesEv.Free;
  FSelectedCodesPart.Free;
  FSelectedCodesPal.Free;
  FSelectedCodesFav.Free;
end;

procedure TfrmBalancete.FormCreate(Sender: TObject);
begin
  dtIni.Date := StartOfTheMonth(Date);
  dtFim.Date := EndOfTheMonth(Date);
end;

procedure TfrmBalancete.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmBalancete.FormShow(Sender: TObject);
begin

  FSelectedCodesEv := TStringList.Create;
  FSelectedCodesPart := TStringList.Create;
  FSelectedCodesPal := TStringList.Create;
  FSelectedCodesFav := TStringList.Create;


//  DM.QueryRelBalancete.SQL.Clear;
//  DM.QueryRelBalancete.SQL.Add('select pag.cod_pagamento, pag.data_hora, pag.valor_pagamento, pag.cod_parcela, p.num_parcela, p.data_venc_parcela, f.tipo_conta, f.cod_conta, p.valor_parcela,');
//  DM.QueryRelBalancete.SQL.Add('p.valor_pago_parcela, f.valor_conta,sum(p.valor_parcela - p.valor_pago_parcela) as Valor_Restante, case p.situacao_parcela when ''0'' then ''PDNT'' when ''1'' then ''QTD'' when ''2'' then ''CANC'' end as Situacao_parcela,');
//  DM.QueryRelBalancete.SQL.Add('CASE F.tipofavorecido WHEN ''PAR'' THEN Part.NOME_Part WHEN ''PAL'' THEN PAL.nome_pal WHEN ''EVE'' THEN FAV.nome_fav END AS FAVORECIDO, f.cod_evento, ev.titulo_ev');
//  DM.QueryRelBalancete.SQL.Add('from pagamentos pag');
//  DM.QueryRelBalancete.SQL.Add('join parcelas p on p.cod_parcela = pag.cod_parcela');
//  DM.QueryRelBalancete.SQL.Add('join financeiro f on f.cod_conta = p.cod_conta_parcela');
//  DM.QueryRelBalancete.SQL.Add('left JOIN PARTICIPANTES Part ON Part.COD_PART = F.COD_FAVORECIDO and f.tipofavorecido = ''PAR''');
//  DM.QueryRelBalancete.SQL.Add('left JOIN favorecidos FAV ON FAV.cod_fav = F.cod_favorecido and f.tipofavorecido = ''EVE''');
//  DM.QueryRelBalancete.SQL.Add('left JOIN palestrantes PAL ON PAL.cod_pal = F.cod_favorecido and f.tipofavorecido = ''PAL''');
//  DM.QueryRelBalancete.SQL.Add('join eventos ev on ev.cod_evento = f.cod_evento group by 1,2,3,4,5,6,7,8,9,10,11,13,14,15,16');
//  DM.QueryRelBalancete.Open;
  btnAtualizarClick(frmBalancete);

end;

procedure TfrmBalancete.RelAgrFavClick(Sender: TObject);
var scaminho: string;
begin
   DM.QueryRelBalancete.SQL.Add('order by FAVORECIDO');
// Obtenha o diretório de aplicativo
  scaminho := ExtractFilePath(Application.ExeName);

  // Combine o diretório de aplicativo com o caminho relativo para a pasta "Relatorios"
  scaminho := IncludeTrailingPathDelimiter(scaminho) + 'Relatorios\';

  // Defina o nome e caminho completo do arquivo do relatório
  scaminho := scaminho + 'RelBalAgrupadoFav.rtm';

  // Verifique se o arquivo do relatório existe antes de carregá-lo
  if FileExists(scaminho) then
  begin
    ppReport.Template.FileName := scaminho;
    ppReport.Template.LoadFromFile;
    ppReport.PrintReport;
    btnAtualizar.OnClick(btnImp);
  end
  else
  begin
    ShowMessage('O arquivo do relatório não foi encontrado.');
  end;

end;

procedure TfrmBalancete.RelAgrEvClick(Sender: TObject);
var scaminho: string;
begin
DM.QueryRelBalancete.SQL.Add('order by ev.titulo_ev');
// Obtenha o diretório de aplicativo
  scaminho := ExtractFilePath(Application.ExeName);

  // Combine o diretório de aplicativo com o caminho relativo para a pasta "Relatorios"
  scaminho := IncludeTrailingPathDelimiter(scaminho) + 'Relatorios\';

  // Defina o nome e caminho completo do arquivo do relatório
  scaminho := scaminho + 'RelBalAgrupadoEv.rtm';

  // Verifique se o arquivo do relatório existe antes de carregá-lo
  if FileExists(scaminho) then
  begin
    ppReport.Template.FileName := scaminho;
    ppReport.Template.LoadFromFile;
    ppReport.PrintReport;
    btnAtualizar.OnClick(btnImp);
  end
  else
  begin
    ShowMessage('O arquivo do relatório não foi encontrado.');
  end;
end;

procedure TfrmBalancete.relListagemClick(Sender: TObject);
var scaminho: string;
begin
// Obtenha o diretório de aplicativo
  scaminho := ExtractFilePath(Application.ExeName);

  // Combine o diretório de aplicativo com o caminho relativo para a pasta "Relatorios"
  scaminho := IncludeTrailingPathDelimiter(scaminho) + 'Relatorios\';

  // Defina o nome e caminho completo do arquivo do relatório
  scaminho := scaminho + 'RelBalListagem.rtm';

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

procedure TfrmBalancete.RelTotEvClick(Sender: TObject);
var scaminho: string;
begin
// Obtenha o diretório de aplicativo
  scaminho := ExtractFilePath(Application.ExeName);

  // Combine o diretório de aplicativo com o caminho relativo para a pasta "Relatorios"
  scaminho := IncludeTrailingPathDelimiter(scaminho) + 'Relatorios\';

  // Defina o nome e caminho completo do arquivo do relatório
  scaminho := scaminho + 'RelBalTotEvento.rtm';

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

procedure TfrmBalancete.SpeedButton1Click(Sender: TObject);
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

end.
