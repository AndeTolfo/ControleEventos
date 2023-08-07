unit View.HistPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmHistPag = class(TForm)
    pnlTopo: TPanel;
    pnlCentro: TPanel;
    pnlRodape: TPanel;
    Panel1: TPanel;
    lblTitulo: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtCodParcela: TEdit;
    edtCodConta: TEdit;
    edtOrdem: TEdit;
    edtDataVenc: TEdit;
    edtDescConta: TEdit;
    edtFav: TEdit;
    lblfav: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtNomeCond: TEdit;
    edtCodCond: TEdit;
    Label9: TLabel;
    edtSitParcela: TEdit;
    Label10: TLabel;
    edtDataConta: TEdit;
    dbListagem: TDBGrid;
    edtTipoConta: TEdit;
    Label3: TLabel;
    edtValorPar: TEdit;
    Label4: TLabel;
    edtValorPago: TEdit;
    Label11: TLabel;
    edtValorRestante: TEdit;
    Label12: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    cod_parcela : integer;
  end;

var
  frmHistPag: TfrmHistPag;

implementation

{$R *.dfm}

uses DmModule;

procedure TfrmHistPag.FormShow(Sender: TObject);
begin
    DM.QueryHistPag.SQL.Clear;
    DM.QueryHistPag.SQL.Add('select p.cod_pagamento, p.cod_fpg, p.data_hora, f.nome_fpg, p.valor_pagamento, p.extornado from pagamentos p');
    DM.QueryHistPag.SQL.Add('inner join formaspag f on f.cod_fpg = p.cod_fpg');
    DM.QueryHistPag.SQL.Add('where p.cod_parcela = :COD order by 1');
    DM.QueryHistPag.ParamByName('COD').AsInteger := cod_parcela;
    DM.QueryHistPag.Open;
end;

end.
