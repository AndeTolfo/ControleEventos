unit View.Controle.Presencas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, DmModule, Vcl.Menus,DateUtils,
  View.Pesquisas, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport,
  ppDesignLayer, ppBands, ppCtrls, ppVar, ppPrnabl, ppCache, ppParameter;

type
  TfrmControlePresencas = class(TForm)
    pnlTopo: TPanel;
    pnlCentro: TPanel;
    pnlRodape: TPanel;
    Label1: TLabel;
    dtIni: TDateTimePicker;
    dtFim: TDateTimePicker;
    Label5: TLabel;
    Label6: TLabel;
    edtCodArea: TEdit;
    btnPesquisaArea: TSpeedButton;
    Label2: TLabel;
    edtCodEvento: TEdit;
    btnPesquisaEv: TSpeedButton;
    Label4: TLabel;
    edtCodParticipante: TEdit;
    btnPesquisarPart: TSpeedButton;
    Label3: TLabel;
    edtCodPalestrantes: TEdit;
    btnPesquisaPal: TSpeedButton;
    dbListagem: TDBGrid;
    dsControlPresencas: TDataSource;
    btnAtualizar: TButton;
    Button1: TButton;
    PpRel: TPopupMenu;
    relListagem: TMenuItem;
    Media1: TMenuItem;
    ParticipantesPorEventos1: TMenuItem;
    Label10: TLabel;
    cbPresen: TComboBox;
    ppReport: TppReport;
    ppPipeline: TppDBPipeline;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppEmpresa: TppLabel;
    ppLine1: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisaAreaClick(Sender: TObject);
    procedure btnPesquisaEvClick(Sender: TObject);
    procedure btnPesquisarPartClick(Sender: TObject);
    procedure btnPesquisaPalClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure relListagemClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FSelectedCodesEv, FSelectedCodesPart, FSelectedCodesPal, FSelectedCodesArea: TStringList;
  public
    { Public declarations }
  end;

var
  frmControlePresencas: TfrmControlePresencas;

implementation

{$R *.dfm}



procedure TfrmControlePresencas.btnAtualizarClick(Sender: TObject);
 var i: Integer;
  DataIni, DataFim: TDate;
  SQLWhere, SitPresen: string;
begin
  SQLWhere := '';

    //Verifica se foi informado o c�digo do evento

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

        // Verifica o valor selecionado no combobox cbtipoconta
    case cbPresen.ItemIndex of
      0: ; // Todas as op��es selecionadas, n�o � necess�rio adicionar a cl�usula WHERE
      1: SitPresen := 'Inscrito';
      2: SitPresen := 'Presente';
      3: SitPresen := 'Faltou';
    end;

    // Verifica se foi selecionado um tipo de presen�a
  if SitPresen <> '' then
  begin
    if SQLWhere <> '' then
      SQLWhere := SQLWhere + ' AND ';
    SQLWhere := SQLWhere + '(CASE WHEN pc.data_presenca IS NOT NULL THEN ''Presente'' WHEN PC.data_presenca IS NULL AND EV.data_ev < current_date THEN ''Faltou'' ELSE ''Inscrito'' END) = ' + QuotedStr(SitPresen);
  end;


    // Verifica se foi informado o c�digo do participante
    if edtCodParticipante.Text <> '' then
    begin
      if SQLWhere <> '' then
      begin
          ShowMessage('la�o participante');
          SQLWhere := SQLWhere + ' AND ';
          SQLWhere := SQLWhere + 'part.Cod_part in (' + edtCodParticipante.Text +')';
      end
      else if SQLWhere = '' then
      begin
          SQLWhere := SQLWhere + 'part.cod_part in (' + edtCodParticipante.Text +')';
      end;


    end;

    // Verifica se foi informado o c�digo do palestrante
    if edtCodPalestrantes.Text <> '' then
    begin
      if SQLWhere <> '' then
      begin
      ShowMessage('la�o palestrante');
      SQLWhere := SQLWhere + ' AND ';
      SQLWhere := SQLWhere + 'EV.COD_PALESTRANTE_EV in (' + edtCodPalestrantes.Text +')';
      end
      else if SQLWhere = '' then
      begin
        SQLWhere := SQLWhere + 'EV.COD_PALESTRANTE_EV in (' + edtCodPalestrantes.Text +')';
      end;
    end;

 // Verifica se foi informado o per�odo de datas
if (dtIni.Date <> 0) and (dtFim.Date <> 0) then
begin
  DataIni := dtIni.Date;
  DataFim := dtFim.Date;
  if SQLWhere <> '' then
    SQLWhere := SQLWhere + ' AND ';
  SQLWhere := SQLWhere + 'f.DATA_CONTA >= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', DataIni)) +
    ' AND f.DATA_CONTA <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', DataFim));
end;

  // Verifica se foi informado cod categoria
  if edtCodArea.Text <> '' then
    begin
      if SQLWhere <> '' then
      begin
     // ShowMessage('la�o palestrante');
      SQLWhere := SQLWhere + ' AND ';
      SQLWhere := SQLWhere + 'EV.COD_AREA in (' + edtCodArea.Text +')';
      end
      else if SQLWhere = '' then
      begin
        SQLWhere := SQLWhere + 'EV.COD_AREA in (' + edtCodArea.Text +')';
      end;
    end;



   // Monta a consulta SQL com a cl�usula WHERE Das Presen�as
    DM.QueryRelControlPresen.SQL.Clear;
    DM.QueryRelControlPresen.SQL.Add('select part.cod_part, part.nome_part, ev.descricao_ev, ev.data_ev, inc.cod_inscricao,f.situacao_conta,');
    DM.QueryRelControlPresen.SQL.Add('pc.data_presenca, CASE WHEN pc.data_presenca IS NOT NULL THEN ''Presente'' WHEN PC.data_presenca IS NULL AND EV.data_ev < current_date THEN ''Faltou'' ELSE ''Inscrito'' END AS Presenca, f.valor_conta, a.nome_area, pal.nome_pal');
    DM.QueryRelControlPresen.SQL.Add('from inscricoes inc');
    DM.QueryRelControlPresen.SQL.Add('left join presencas pc on pc.cod_inscricao = inc.cod_inscricao');
    DM.QueryRelControlPresen.SQL.Add('join eventos ev on ev.cod_evento = inc.cod_evento');
    DM.QueryRelControlPresen.SQL.Add('join palestrantes pal on pal.cod_pal = ev.cod_palestrante_ev');
    DM.QueryRelControlPresen.SQL.Add('join area_conhecimento a on a.cod_area = ev.cod_area');
    DM.QueryRelControlPresen.SQL.Add('join financeiro f on f.cod_conta = inc.cod_conta');
    DM.QueryRelControlPresen.SQL.Add('join participantes part on part.cod_part = inc.cod_participante');
  if SQLWhere <> '' then
  begin
   DM.QueryRelControlPresen.SQL.Add('WHERE ' + SQLWhere);

   end
   else
   begin

   end;

  DM.QueryRelControlPresen.Open;



end;

procedure TfrmControlePresencas.btnPesquisaAreaClick(Sender: TObject);
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
             ShowMessage('C�digo j� adicionado');
            end;
          end;
        end;
      finally
         frmPesquisa.Free;
      end;
end;

procedure TfrmControlePresencas.btnPesquisaEvClick(Sender: TObject);
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
                      ShowMessage('C�digo j� adicionado');
                    end;
           end;
          end;
      finally
             frmPesquisa.Free;
      end;
  end;

procedure TfrmControlePresencas.btnPesquisaPalClick(Sender: TObject);
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
                      ShowMessage('C�digo j� adicionado');
                    end;
           end;

        end;
      finally
      frmPesquisa.Free;

      end;
  end;

procedure TfrmControlePresencas.btnPesquisarPartClick(Sender: TObject);
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
                ShowMessage('C�digo j� adicionado');
            end;
          end;

        end;
      finally
        frmPesquisa.Free;
      end;
  end;

procedure TfrmControlePresencas.Button1Click(Sender: TObject);
begin
      PpRel.Popup(Mouse.CursorPos.X, Mouse.CursorPos.y);
end;

procedure TfrmControlePresencas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      FSelectedCodesEv.Free;
      FSelectedCodesPart.Free;
      FSelectedCodesPal.Free;
      FSelectedCodesArea.Free;
end;

procedure TfrmControlePresencas.FormCreate(Sender: TObject);
begin
  dtIni.Date := StartOfTheMonth(Date);
  dtFim.Date := EndOfTheMonth(Date);
end;

procedure TfrmControlePresencas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // Verifique se a tecla pressionada � a tecla F5 (c�digo da tecla F5 � 116)
  if Key = VK_F5 then
  begin
    // Chame o m�todo OnClick do bot�o "Atualizar"
    btnAtualizar.Click;
    // Impedir que o evento OnClick do bot�o "Atualizar" seja acionado novamente
    // quando a tecla F5 for liberada
    Key := 0;
  end;
end;

procedure TfrmControlePresencas.FormShow(Sender: TObject);
begin
      FSelectedCodesEv := TStringList.Create;
      FSelectedCodesPart := TStringList.Create;
      FSelectedCodesPal := TStringList.Create;
      FSelectedCodesArea := TStringList.Create;
      btnAtualizarClick(frmControlePresencas);
end;

procedure TfrmControlePresencas.relListagemClick(Sender: TObject);
var scaminho: string;
begin
// Obtenha o diret�rio de aplicativo
  scaminho := ExtractFilePath(Application.ExeName);

  // Combine o diret�rio de aplicativo com o caminho relativo para a pasta "Relatorios"
  scaminho := IncludeTrailingPathDelimiter(scaminho) + 'Relatorios\';

  // Defina o nome e caminho completo do arquivo do relat�rio
  scaminho := scaminho + 'RelPresencaListagem.rtm';

  // Verifique se o arquivo do relat�rio existe antes de carreg�-lo
  if FileExists(scaminho) then
  begin
    ppReport.Template.FileName := scaminho;
    ppReport.Template.LoadFromFile;
    ppReport.PrintReport;
  end
  else
  begin
    ShowMessage('O arquivo do relat�rio n�o foi encontrado.');
  end;
end;

end.
