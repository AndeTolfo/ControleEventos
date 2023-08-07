unit View.EventosDisp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, DmModule, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, View.EventosInfo;

type
  TfrmEventosDisp = class(TForm)
    pnlCentro: TPanel;
    pnlTopo: TPanel;
    dbListagem: TDBGrid;
    lbltitulo: TLabel;
    procedure FormShow(Sender: TObject);
    procedure dbListagemDblClick(Sender: TObject);
  private
    { Private declarations }
  public
   var  CodEvento : integer; DataEv : string;
  end;

var
  frmEventosDisp: TfrmEventosDisp;

implementation

{$R *.dfm}

procedure TfrmEventosDisp.dbListagemDblClick(Sender: TObject);
var CodArea, Vagas,VagasUsadas : integer; CodPalestrantes : String ;
begin
  frmEventosInfo := TfrmEventosInfo.Create(Self);
   if not DM.QueryEventos.IsEmpty then
  begin
    ///////////////Identificar Area//////////////////////
    CodArea := DM.QueryEventos.FieldByName('COD_AREA').AsInteger;
    DM.QueryAreas.SQL.Clear;
    DM.QueryAreas.SQL.Add('SELECT * FROM AREA_CONHECIMENTO WHERE COD_AREA = :pCOD');
    DM.QueryAreas.ParamByName('pCOD').AsInteger := CodArea;
    DM.QueryAreas.Open;
    frmEventosInfo.lblArea.Caption := DM.QueryAreas.FieldByName('NOME_AREA').AsString;
    ///////////////Identificar Palestrantes//////////////////////
    CodPalestrantes := DM.QueryEventos.FieldByName('COD_PALESTRANTE_EV').AsString;
    DM.QueryPalestrantes.SQL.Clear;
    DM.QueryPalestrantes.SQL.Add('SELECT * FROM palestrantes WHERE cod_pal IN (' + CodPalestrantes + ')');
    DM.QueryPalestrantes.Open;

    frmEventosInfo.lblPalestrantes.Caption := '';
    DM.QueryPalestrantes.First;
    while not DM.QueryPalestrantes.Eof do
      begin
        if frmEventosInfo.lblPalestrantes.Caption <> '' then
        frmEventosInfo.lblPalestrantes.Caption := frmEventosInfo.lblPalestrantes.Caption + ', ';
        frmEventosInfo.lblPalestrantes.Caption := frmEventosInfo.lblPalestrantes.Caption + DM.QueryPalestrantes.FieldByName('NOME_PAL').AsString;
        DM.QueryPalestrantes.Next;
      end;
    ///////////////////Calcular Vagas/////////////////////
    Vagas := DM.QueryEventos.FieldByName('VAGAS_EV').AsInteger;
    CodEvento := DM.QueryEventos.FieldByName('COD_EVENTO').AsInteger;
    DM.QueryInscricoes.SQL.Clear;
    DM.QueryInscricoes.SQL.Add('SELECT COUNT(*) FROM inscricoes WHERE cod_evento = :pCod');
    DM.QueryInscricoes.ParamByName('pCod').AsInteger := CodEvento;
    DM.QueryInscricoes.Open;
    VagasUsadas := DM.QueryInscricoes.Fields[0].AsInteger;
    frmEventosInfo.lblVagas.Caption := IntToStr(Vagas - VagasUsadas);


    frmEventosInfo.lblTitulo.Caption := DM.QueryEventos.FieldByName('TITULO_EV').AsString;
    frmEventosInfo.lblData.Caption := DM.QueryEventos.FieldByName('DATA_EV').AsString;
    frmEventosInfo.lblLocal.Caption := DM.QueryEventos.FieldByName('LOCAL_EV').AsString;
    frmEventosInfo.lblDescricao.Caption := StringReplace(DM.QueryEventos.FieldByName('DESCRICAO_EV').AsString, '\n', sLineBreak, [rfReplaceAll]);
    frmEventosInfo.lblValor.Caption := FloatToStrF(DM.QueryEventos.FieldByName('VALOR_INSCRICAO_EV').AsFloat, ffCurrency, 10, 2);
    frmEventosInfo.valorev := (DM.QueryEventos.FieldByName('VALOR_INSCRICAO_EV').AsFloat);
    DM.QueryAreas.Close; // Fechar a consulta

    frmEventosInfo.ShowModal;


  end;
end;

procedure TfrmEventosDisp.FormShow(Sender: TObject);
begin
  DM.QueryEventos.Open('select * from eventos order by eventos.data_ev');

end;

end.
