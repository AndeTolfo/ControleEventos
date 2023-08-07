unit View.EventosInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DmModule, Vcl.ExtCtrls, Vcl.StdCtrls,
  View.Pesquisas, View.Participantes, View.Inscricao;

type
  TfrmEventosInfo = class(TForm)
    pnlCenter: TPanel;
    lbltitulo: TLabel;
    lblData: TLabel;
    lblLocal: TLabel;
    lblValor: TLabel;
    lblVagas: TLabel;
    lblPalestrantes: TLabel;
    lblArea: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblDescricao: TLabel;
    btnInscricao: TButton;
    btnSair: TButton;
    procedure btnSairClick(Sender: TObject);
    procedure btnInscricaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    var tituloev : string;valorev : double;
  end;

var
  frmEventosInfo: TfrmEventosInfo;

implementation

{$R *.dfm}

  procedure TfrmEventosInfo.btnInscricaoClick(Sender: TObject);
  begin
   if MessageDlg('Tem cadastro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      // Código para localizar o cadastro do participante
      // Abra a tela FRMPesquisa para buscar o cadastro do participante
      frmPesquisa := TfrmPesquisa.Create(Self);

      try
        frmPesquisa.Tabela := 'Participantes';
        frmPesquisa.Click := 'Inscricao';
        if frmPesquisa.ShowModal = mrOk then
        begin

        end;
      finally
        frmPesquisa.Free;
      end;
    end
    else
    begin
      frmParticipantes := TfrmParticipantes.Create(Self);
       try
        FRMParticipantes.PG.ActivePage := FRMParticipantes.pgCadastro;
        FRMParticipantes.Tabela := 'EventosInfoInscrição';
        if frmParticipantes.ShowModal = mrOk then
        begin

        end;
      finally
        frmParticipantes.Free;
      end;
    end;

  end;

  procedure TfrmEventosInfo.btnSairClick(Sender: TObject);
  begin
      frmEventosInfo.Close;
  end;

  end.
