unit View.RelEventos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, DmModule, View.Pesquisas,
  Vcl.Menus, System.Actions, Vcl.ActnList, ppDB, ppDBPipe, ppComm, ppRelatv,
  ppProd, ppClass, ppReport, ppBands, ppCache, ppDesignLayer, ppParameter,
  ppCtrls, ppPrnabl, ppVar,DateUtils, View.EventosInfo;

type
  TfrmRelEventos = class(TForm)
    pnlCentro: TPanel;
    pnlTopo: TPanel;
    pnlRodape: TPanel;
    PG: TPageControl;
    pgPeriodo: TTabSheet;
    dbListagem: TDBGrid;
    Label2: TLabel;
    edtCodEvento: TEdit;
    btnPesquisaEv: TSpeedButton;
    Label4: TLabel;
    edtCodParticipante: TEdit;
    btnPesquisarPart: TSpeedButton;
    Label3: TLabel;
    edtCodPalestrantes: TEdit;
    btnPesquisaPal: TSpeedButton;
    dsRelEventos: TDataSource;
    Button1: TButton;
    ppReport: TppReport;
    ppPipeline: TppDBPipeline;
    ppParameterList1: TppParameterList;
    PpRel: TPopupMenu;
    relListagem: TMenuItem;
    Media1: TMenuItem;
    dsRelMedia: TDataSource;
    ppMedia: TppDBPipeline;
    dsRelPart: TDataSource;
    ParticipantesPorEventos1: TMenuItem;
    ppPart: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppEmpresa: TppLabel;
    ppLine1: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText3: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText4: TppDBText;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppDBText5: TppDBText;
    dtFim: TDateTimePicker;
    dtIni: TDateTimePicker;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtCodArea: TEdit;
    btnPesquisaArea: TSpeedButton;
    ppLine2: TppLine;
    btnInfo: TButton;
    btnAtualizar: TButton;
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnPesquisaEvClick(Sender: TObject);
    procedure btnPesquisarPartClick(Sender: TObject);
    procedure btnPesquisaPalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure relListagemClick(Sender: TObject);
    procedure Media1Click(Sender: TObject);
    procedure ParticipantesPorEventos1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisaAreaClick(Sender: TObject);
    procedure btnInfoClick(Sender: TObject);
    procedure dbListagemCellClick(Column: TColumn);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
     FSelectedCodesEv, FSelectedCodesPart, FSelectedCodesPal, FSelectedCodesArea: TStringList;
    SelectedCodEv : integer;
    SQLWhere: string;
  public
    CodEvento : integer;
  end;

var
  frmRelEventos: TfrmRelEventos;

implementation

{$R *.dfm}

procedure TfrmRelEventos.btnAtualizarClick(Sender: TObject);
 var i: Integer;
  DataIni, DataFim: TDate;
begin
  SQLWhere := '';

    //Verifica se foi informado o código do evento

    if edtCodEvento.Text <> '' then
    begin
      if SQLWhere <> '' then
      begin
      SQLWhere := SQLWhere + ' AND ';
      SQLWhere := SQLWhere + 'ev.Cod_evento in (' + edtCodEvento.Text +')';
      end
      else if SQLWhere = '' then
      begin
      SQLWhere := SQLWhere + 'ev.Cod_evento in (' + edtCodEvento.Text +')';
      end;

    end;

    // Verifica se foi informado o código do participante
    if edtCodParticipante.Text <> '' then
    begin
      if SQLWhere <> '' then
      begin
          ShowMessage('laço participante');
          SQLWhere := SQLWhere + ' AND ';
          SQLWhere := SQLWhere + 'part.Cod_part in (' + edtCodParticipante.Text +')';
      end
      else if SQLWhere = '' then
      begin
          SQLWhere := SQLWhere + 'part.cod_part in (' + edtCodParticipante.Text +')';
      end;


    end;

    // Verifica se foi informado o código do palestrante
    if edtCodPalestrantes.Text <> '' then
    begin
      if SQLWhere <> '' then
      begin
      ShowMessage('laço palestrante');
      SQLWhere := SQLWhere + ' AND ';
      SQLWhere := SQLWhere + 'EV.COD_PALESTRANTE_EV in (' + edtCodPalestrantes.Text +')';
      end
      else if SQLWhere = '' then
      begin
        SQLWhere := SQLWhere + 'EV.COD_PALESTRANTE_EV in (' + edtCodPalestrantes.Text +')';
      end;
    end;

 // Verifica se foi informado o período de datas
if (dtIni.Date <> 0) and (dtFim.Date <> 0) then
begin
  DataIni := dtIni.Date;
  DataFim := dtFim.Date;
  if SQLWhere <> '' then
    SQLWhere := SQLWhere + ' AND ';
  SQLWhere := SQLWhere + 'ev.data_ev >= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', DataIni)) +
    ' AND ev.data_ev <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', DataFim));
end;

  // Verifica se foi informado cod categoria
  if edtCodArea.Text <> '' then
    begin
      if SQLWhere <> '' then
      begin
     // ShowMessage('laço palestrante');
      SQLWhere := SQLWhere + ' AND ';
      SQLWhere := SQLWhere + 'EV.COD_AREA in (' + edtCodArea.Text +')';
      end
      else if SQLWhere = '' then
      begin
        SQLWhere := SQLWhere + 'EV.COD_AREA in (' + edtCodArea.Text +')';
      end;
    end;



   // Monta a consulta SQL com a cláusula WHERE Da Listagem de Eventos
    DM.QueryRelEventos.SQL.Clear;
    DM.QueryRelEventos.SQL.Add('select distinct ev.cod_evento, ev.titulo_ev,ev.local_ev,ev.descricao_ev, ev.data_ev, ev.valor_inscricao_ev,ev.cod_palestrante_ev, ev.vagas_ev, ev.cod_area,ar.nome_area, pl.nome_pal from eventos ev');
    DM.QueryRelEventos.SQL.Add('left join inscricoes inc on inc.cod_evento = ev.cod_evento');
    DM.QueryRelEventos.SQL.Add('left join presencas pr on pr.cod_inscricao = inc.cod_inscricao');
    DM.QueryRelEventos.SQL.Add('left join participantes part on part.cod_part = inc.cod_participante');
    DM.QueryRelEventos.SQL.Add('left join palestrantes pl on pl.cod_pal = ev.cod_palestrante_ev');
    DM.QueryRelEventos.SQL.Add('left join area_conhecimento ar on ar.cod_area = ev.cod_area');


   // Monta a consulta SQL com a cláusula WHERE Da Media de Eventos
    DM.QueryRelMedia.SQL.Clear;
    DM.QueryRelMedia.SQL.Add('select ev.cod_evento, ev.titulo_ev, ev.data_ev, ev.valor_inscricao_ev, ev.vagas_ev as Vagas, count(inc.cod_inscricao) as QTD_Inscritos, count(pr.cod_presenca) as QTD_Presentes from eventos ev');
    DM.QueryRelMedia.SQL.Add('left join inscricoes inc on inc.cod_evento = ev.cod_evento');
    DM.QueryRelMedia.SQL.Add('left join presencas pr on pr.cod_inscricao = inc.cod_inscricao');
    DM.QueryRelMedia.SQL.Add('left join participantes part on part.cod_part = inc.cod_participante');
    DM.QueryRelMedia.SQL.Add('left join palestrantes pl on pl.cod_pal = ev.cod_palestrante_ev');
  // Monta a consulta Sql com a cláusula where ddo Participantes por Eventos
    DM.SqlEvPart.SQL.Clear;
    DM.SqlEvPart.SQL.Add('select ev.cod_evento,ev.titulo_ev,part.nome_part,ev.data_ev, case when pr.cod_presenca is null then '''' else ''Presente'' end as "Presenca" from eventos ev');
    DM.SqlEvPart.SQL.Add('inner join inscricoes inc on inc.cod_evento = ev.cod_evento');
    DM.SqlEvPart.SQL.Add('inner join participantes part on part.cod_part = inc.cod_participante');
    DM.SqlEvPart.SQL.Add('inner join palestrantes pl on pl.cod_pal = ev.cod_palestrante_ev');
    DM.SqlEvPart.SQL.Add('left join presencas pr on pr.cod_inscricao = inc.cod_inscricao');

  if SQLWhere <> '' then
  begin
   DM.QueryRelEventos.SQL.Add('WHERE ' + SQLWhere);
   DM.QueryRelMedia.SQL.Add('WHERE ' + SQLWhere + ' group by 1,2,3,4,5');
   DM.SqlEvPart.SQL.Add('WHERE ' + SQLWhere);
   end
   else
   begin
     DM.QueryRelMedia.SQL.Add('group by 1,2,3,4,5');
   end;


  DM.QueryRelMedia.Open;
  DM.QueryRelEventos.Open;
  DM.SqlEvPart.Open;


end;

procedure TfrmRelEventos.btnInfoClick(Sender: TObject);
var CodArea, Vagas,VagasUsadas, CodPalestrante : integer;
begin
  if SelectedCodEv <> 0 then
  begin
    frmEventosInfo := TfrmEventosInfo.Create(Self);
  try
      ///////////////Identificar Area//////////////////////
      CodArea := DM.QueryRelEventos.FieldByName('COD_AREA').AsInteger;
      DM.QueryAreas.SQL.Clear;
      DM.QueryAreas.SQL.Add('SELECT * FROM AREA_CONHECIMENTO WHERE COD_AREA = :pCOD');
      DM.QueryAreas.ParamByName('pCOD').AsInteger := CodArea;
      DM.QueryAreas.Open;
      frmEventosInfo.lblArea.Caption := DM.QueryAreas.FieldByName('NOME_AREA').AsString;
      ///////////////Identificar Palestrantes//////////////////////
      CodPalestrante := DM.QueryRelEventos.FieldByName('COD_PALESTRANTE_EV').AsInteger;
      DM.QueryPalestrantes.SQL.Clear;
      DM.QueryPalestrantes.SQL.Add('SELECT * FROM palestrantes WHERE cod_pal = :CodPales');
      dm.QueryPalestrantes.ParamByName('CodPales').AsInteger := Codpalestrante;
      DM.QueryPalestrantes.Open;
      frmEventosInfo.lblPalestrantes.Caption := DM.QueryPalestrantes.FieldByName('NOME_PAL').AsString;
       ///////////////////Calcular Vagas/////////////////////
      Vagas := DM.QueryRelEventos.FieldByName('VAGAS_EV').AsInteger;
      CodEvento := DM.QueryRelEventos.FieldByName('COD_EVENTO').AsInteger;
      DM.QueryInscricoes.SQL.Clear;
      DM.QueryInscricoes.SQL.Add('SELECT COUNT(*) FROM inscricoes WHERE cod_evento = :pCod');
      DM.QueryInscricoes.ParamByName('pCod').AsInteger := CodEvento;
      DM.QueryInscricoes.Open;
      VagasUsadas := DM.QueryInscricoes.Fields[0].AsInteger;
      frmEventosInfo.lblVagas.Caption := IntToStr(Vagas - VagasUsadas);
      frmEventosInfo.lblTitulo.Caption := DM.QueryRelEventos.FieldByName('TITULO_EV').AsString;
      frmEventosInfo.lblData.Caption := DM.QueryRelEventos.FieldByName('DATA_EV').AsString;
      frmEventosInfo.lblLocal.Caption := DM.QueryRelEventos.FieldByName('LOCAL_EV').AsString;
      frmEventosInfo.lblDescricao.Caption := StringReplace(DM.QueryRelEventos.FieldByName('DESCRICAO_EV').AsString, '\n', sLineBreak, [rfReplaceAll]);
      frmEventosInfo.lblValor.Caption := FloatToStrF(DM.QueryRelEventos.FieldByName('VALOR_INSCRICAO_EV').AsFloat, ffCurrency, 10, 2);
      frmEventosInfo.valorev := (DM.QueryRelEventos.FieldByName('VALOR_INSCRICAO_EV').AsFloat);
      DM.QueryAreas.Close; // Fechar a consulta
      frmEventosInfo.ShowModal;
      finally
      frmEventosInfo.Free;
    end;
  end;
end;

procedure TfrmRelEventos.btnPesquisaAreaClick(Sender: TObject);
Var CodSelect : integer;
begin
      frmPesquisa := TfrmPesquisa.Create(Self);
      try
        frmPesquisa.Tabela := 'AreaConhec';
        frmPesquisa.Click := 'Sim';
        if frmPesquisa.ShowModal = mrOk then
        begin
          CodSelect := StrToInt(frmPesquisa.CodSelect);
          if(CodSelect <> 0) and (FSelectedCodesArea.IndexOf(IntToStr(CodSelect))= -1) then
          begin
            if edtCodArea.Text <> '' then
            begin
              edtCodArea.Text := edtCodArea.Text + ',';
              edtCodArea.Text := edtCodArea.Text + IntToStr(CodSelect);
              FSelectedCodesArea.Add(IntToStr(CodSelect));
            end
            else if(edtCodArea.Text = '') then
            begin
              edtCodArea.Text := edtCodArea.Text + IntToStr(CodSelect);
              FSelectedCodesArea.Add(IntToStr(CodSelect));
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

procedure TfrmRelEventos.btnPesquisaEvClick(Sender: TObject);
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
procedure TfrmRelEventos.btnPesquisaPalClick(Sender: TObject);
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

procedure TfrmRelEventos.btnPesquisarPartClick(Sender: TObject);
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

procedure TfrmRelEventos.Button1Click(Sender: TObject);
begin
    PpRel.Popup(Mouse.CursorPos.X, Mouse.CursorPos.y);
end;

procedure TfrmRelEventos.dbListagemCellClick(Column: TColumn);
begin
  SelectedCodEv := dbListagem.DataSource.DataSet.FieldByName('cod_evento').AsInteger;
end;

procedure TfrmRelEventos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      FSelectedCodesEv.Free;
      FSelectedCodesPart.Free;
      FSelectedCodesPal.Free;
      FSelectedCodesArea.Free;
end;

procedure TfrmRelEventos.FormCreate(Sender: TObject);
begin
  dtIni.Date := StartOfTheMonth(Date);
  dtFim.Date := EndOfTheMonth(Date);
end;

procedure TfrmRelEventos.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmRelEventos.FormShow(Sender: TObject);
begin
      FSelectedCodesEv := TStringList.Create;
      FSelectedCodesPart := TStringList.Create;
      FSelectedCodesPal := TStringList.Create;
      FSelectedCodesArea := TStringList.Create;
//    //Montar Relatório Listagem Eventos
//    DM.QueryRelEventos.SQL.Clear;
//    DM.QueryRelEventos.SQL.Add('select distinct ev.cod_evento, ev.titulo_ev, ev.data_ev, ev.valor_inscricao_ev,ev.cod_palestrante_ev, ev.vagas_ev, ev.cod_area, pl.nome_pal,ar.nome_area from eventos ev');
//    DM.QueryRelEventos.SQL.Add('left join inscricoes inc on inc.cod_evento = ev.cod_evento');
//    DM.QueryRelEventos.SQL.Add('left join presencas pr on pr.cod_inscricao = inc.cod_inscricao');
//    DM.QueryRelEventos.SQL.Add('left join participantes part on part.cod_part = inc.cod_participante');
//    DM.QueryRelEventos.SQL.Add('left join palestrantes pl on pl.cod_pal = ev.cod_palestrante_ev');
//    DM.QueryRelEventos.SQL.Add('left join area_conhecimento ar on ar.cod_area = ev.cod_area');
//    DM.QueryRelEventos.Open;
//    //Monta Relatório Media eventos
//    DM.QueryRelMedia.SQL.Clear;
//    DM.QueryRelMedia.SQL.Add('select ev.cod_evento, ev.titulo_ev, ev.data_ev, ev.valor_inscricao_ev, ev.vagas_ev as Vagas, count(inc.cod_inscricao) as QTD_Inscritos, count(pr.cod_presenca) as QTD_Presentes from eventos ev');
//    DM.QueryRelMedia.SQL.Add('left join inscricoes inc on inc.cod_evento = ev.cod_evento');
//    DM.QueryRelMedia.SQL.Add('left join presencas pr on pr.cod_inscricao = inc.cod_inscricao');
//    DM.QueryRelMedia.SQL.Add('left join participantes part on part.cod_part = inc.cod_participante');
//    DM.QueryRelMedia.SQL.Add('left join palestrantes pl on pl.cod_pal = ev.cod_palestrante_ev');
//    DM.QueryRelMedia.sql.Add('group by 1,2,3,4,5');
//    DM.QueryRelMedia.Open;
//    //Monta Relatório Participantes Eventos
//    DM.SqlEvPart.SQL.Clear;
//    DM.SqlEvPart.SQL.Add('select ev.cod_evento,ev.titulo_ev,part.nome_part,ev.data_ev, case when pr.cod_presenca is null then ''Não'' else ''Sim'' end as "Presenca" from eventos ev');
//    DM.SqlEvPart.SQL.Add('inner join inscricoes inc on inc.cod_evento = ev.cod_evento');
//    DM.SqlEvPart.SQL.Add('inner join participantes part on part.cod_part = inc.cod_participante');
//    DM.SqlEvPart.SQL.Add('inner join palestrantes pl on pl.cod_pal = ev.cod_palestrante_ev');
//    DM.SqlEvPart.SQL.Add('left join presencas pr on pr.cod_inscricao = inc.cod_inscricao');
//    DM.SqlEvPart.Open;
     btnAtualizarClick(frmRelEventos);


end;

procedure TfrmRelEventos.Media1Click(Sender: TObject);
var scaminho: string;
begin
// Obtenha o diretório de aplicativo
  scaminho := ExtractFilePath(Application.ExeName);

  // Combine o diretório de aplicativo com o caminho relativo para a pasta "Relatorios"
  scaminho := IncludeTrailingPathDelimiter(scaminho) + 'Relatorios\';

  // Defina o nome e caminho completo do arquivo do relatório
  scaminho := scaminho + 'RelEvMedia.rtm';

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

procedure TfrmRelEventos.ParticipantesPorEventos1Click(Sender: TObject);
var scaminho: string;
begin
// Obtenha o diretório de aplicativo
  scaminho := ExtractFilePath(Application.ExeName);

  // Combine o diretório de aplicativo com o caminho relativo para a pasta "Relatorios"
  scaminho := IncludeTrailingPathDelimiter(scaminho) + 'Relatorios\';

  // Defina o nome e caminho completo do arquivo do relatório
  scaminho := scaminho + 'RelEvPart.rtm';

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

procedure TfrmRelEventos.relListagemClick(Sender: TObject);
var scaminho: string;
begin
// Obtenha o diretório de aplicativo
  scaminho := ExtractFilePath(Application.ExeName);

  // Combine o diretório de aplicativo com o caminho relativo para a pasta "Relatorios"
  scaminho := IncludeTrailingPathDelimiter(scaminho) + 'Relatorios\';

  // Defina o nome e caminho completo do arquivo do relatório
  scaminho := scaminho + 'RelEvListagem.rtm';

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
