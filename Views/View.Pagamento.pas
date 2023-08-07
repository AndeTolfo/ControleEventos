unit View.Pagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, DmModule,
  Vcl.DBCtrls;

type
  TfrmPagamentos = class(TForm)
    pnlTopo: TPanel;
    pnlCentro: TPanel;
    lblTitulo: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edtCodParcela: TEdit;
    edtCodConta: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtValorPar: TEdit;
    edtValorRestante: TEdit;
    Label5: TLabel;
    edtOrdem: TEdit;
    Label6: TLabel;
    edtDataVenc: TEdit;
    Label7: TLabel;
    edtDescConta: TEdit;
    Label8: TLabel;
    edtValorPag: TEdit;
    Label9: TLabel;
    btnConfirmar: TButton;
    btnSair: TButton;
    edtFav: TEdit;
    lblfav: TLabel;
    cbFormasPag: TDBLookupComboBox;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPagamentos: TfrmPagamentos;

implementation

{$R *.dfm}

uses Funcoes;



procedure TfrmPagamentos.btnConfirmarClick(Sender: TObject);
var
  CodFormaPagamento: Integer;
  ValorPago, ValorRestante, Troco: Double;
begin
  ValorRestante := StrToFloatDef(StringReplace(edtValorRestante.Text, '.', '', [rfReplaceAll]), 0);

  if not Funcoes.VerificarCamposVazios([edtValorPag]) or VarIsNull(cbFormasPag.KeyValue) then
  begin
    ShowMessage('Preencha todos os campos antes de prosseguir.');
    Exit; // Impede a execu��o do INSERT

  end;

  if ValorRestante = 0 then
  begin
    ShowMessage('Parcela est� quitada');
    Exit; // Impede a execu��o do INSERT
  end;

  if edtValorPag.Text = '' then
  begin
    ShowMessage('Digite um Valor V�lido');
    Exit;
  end;
  if StrToFloat(edtValorPag.Text) <= 0 then
  begin
    ShowMessage('Digite um Valor V�lido');
    Exit;
  end;

  ValorPago := StrToFloat(edtValorPag.Text);

  if ValorRestante < ValorPago then
  begin
    Troco := ValorPago - ValorRestante;
    ShowMessage('Troco = ' + FloatToStr(Troco));
    ValorPago := ValorRestante;
  end;

  CodFormaPagamento := cbFormasPag.KeyValue;

  DM.QueryPagamentos.SQL.Clear;
  DM.QueryPagamentos.SQL.Add('INSERT INTO PAGAMENTOS (COD_PARCELA, COD_FPG, VALOR_PAGAMENTO, DATA_HORA, EXTORNADO) VALUES (:COD_PARC, :COD_FPG, :VALOR_PAG, :DATA_HORA, :EXTORNADO);');
  DM.QueryPagamentos.ParamByName('COD_PARC').AsInteger := StrToInt(edtCodParcela.Text);
  DM.QueryPagamentos.ParamByName('COD_FPG').AsInteger := CodFormaPagamento;
  DM.QueryPagamentos.ParamByName('VALOR_PAG').AsFloat := ValorPago;
  DM.QueryPagamentos.ParamByName('DATA_HORA').AsDateTime := Now;
  DM.QueryPagamentos.ParamByName('EXTORNADO').AsString := 'N';
  DM.QueryPagamentos.ExecSQL;
  DM.QueryPagamentos.Close;
  Close;
end;


  procedure TfrmPagamentos.btnSairClick(Sender: TObject);
  begin
      frmPagamentos.Close;
  end;

  procedure TfrmPagamentos.FormShow(Sender: TObject);
  begin
     DM.QueryFormasPag.Open('select * from formaspag order by nome_fpg');
     DM.QueryPagamentos.Open('select * from pagamentos');
     DM.QueryPagamentos.EmptyDataSet;
     edtValorPag.SetFocus;
  end;

end.
