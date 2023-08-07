unit View.LancContas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,System.DateUtils,
  View.Pesquisas, Vcl.Mask, View.CondPag;

type
  TfrmLancContas = class(TForm)
    pnlCentro: TPanel;
    pnlTopo: TPanel;
    pnlRodape: TPanel;
    lblTitulo: TLabel;
    lblTipo: TLabel;
    edtCodFav: TEdit;
    edtNomeFav: TEdit;
    btnPesquisaCliente: TSpeedButton;
    rbtipo: TRadioGroup;
    lblNota: TLabel;
    edtNota: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    cbTipo: TComboBox;
    Label3: TLabel;
    edtCodEv: TEdit;
    edtNomeEv: TEdit;
    btnPesquisaEv: TSpeedButton;
    Label4: TLabel;
    edtDescricao: TEdit;
    Label5: TLabel;
    edtCodCond: TEdit;
    edtNomeCond: TEdit;
    btnPesquisaCond: TSpeedButton;
    Label6: TLabel;
    edtValor: TEdit;
    btnConfirmar: TButton;
    btnSair: TButton;
    btnCadCliente: TSpeedButton;
    btnCadCond: TSpeedButton;
    btnCadEv: TSpeedButton;
    edtData: TMaskEdit;
    procedure rbtipoClick(Sender: TObject);
    procedure btnPesquisaClienteClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnPesquisaEvClick(Sender: TObject);
    procedure btnPesquisaCondClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCadCondClick(Sender: TObject);
    procedure btnCadEvClick(Sender: TObject);
    procedure btnCadClienteClick(Sender: TObject);

  private
   codselectpar,codcond,codev, codselectpal, codselectfav : integer; Nomeselectpar,nomeev, nomeselectpal,nomeselectfav, nomecond : string;
  public
    { Public declarations }
  end;

var
  frmLancContas: TfrmLancContas;

implementation

{$R *.dfm}

uses DmModule, View.Eventos, View.Participantes, View.Palestrantes,
  View.Favorecido, Funcoes, View.Contas;

    procedure TfrmLancContas.btnConfirmarClick(Sender: TObject);
    var
      TipoFav: string;
      CodFav, CodEvento, CodCondPag, N_Parcelas, N_dias, CodConta, i: Integer;
      DataConta, DataVencParcela: TDate;
      TipoConta, NumeroNota, Descricao: string;
      Valor: Double;
    begin

    // PEGAR VALOR TIPO FAVORECIDO
        case rbtipo.ItemIndex of
        0: TipoFav := 'PAR';
        1: TipoFav := 'PAL';
        2: TipoFav := 'EVE';
      end;
    // Pegar Valor Tipo Conta
     case cbTipo.ItemIndex of
        0: TipoConta := 'R';
        1 : TipoConta := 'P';
     end;

// func�o verificar campos vazios
    if not Funcoes.VerificarCamposVazios([edtCodEv, edtCodCond, edtNota, edtDescricao, edtValor, edtData]) then
    begin
     ShowMessage('Preencha todos os campos corretamente');
      Exit;
    end;

    if strtofloat(edtValor.Text) <= 0 then
    begin
      ShowMessage('Digite um valor v�lido');
      exit;
    end;

     // Pegar valores para Insert
     CodFav := StrToInt(edtCodFav.Text);
     CodEvento := StrToInt(edtCodEv.Text);
     CodCondPag := StrToInt(edtCodCond.text);
     DataConta := StrToDate(edtData.Text);
     NumeroNota := edtNota.Text;
     Valor := StrToFloat(edtValor.Text);
     Descricao := edtDescricao.Text;

     // Pegar informa��es Condi��o Pagamento
        DM.QueryCond.SQL.Clear;
        DM.QueryCond.SQL.add('SELECT * FROM cond_pag WHERE COD_COND = :COD_COND');
        DM.QueryCond.ParamByName('COD_COND').AsInteger := CodCondPag;
        DM.QueryCond.Open();
        N_Parcelas := DM.QueryCond.FieldByName('N_PARCELAS').AsInteger;
        N_Dias := DM.QueryCond.FieldByName('INTERVALO_PARCELAS').AsInteger;
        DM.QueryCond.Close;

    // Inserir dados no financeiro
      DM.QueryFinanceiro.SQL.Clear;
      DM.QueryFinanceiro.SQL.Add('INSERT INTO financeiro (COD_EVENTO, DESCRICAO_CONTA, TIPO_CONTA, DATA_CONTA, COD_COND, NNOTA_CONTA, VALOR_CONTA, QTDPARCELAS_CONTA, COD_FAVORECIDO, TIPOFAVORECIDO, SITUACAO_CONTA)');
      DM.QueryFinanceiro.SQL.Add('VALUES (:COD_EVENTO, :DESCRICAO_CONTA, :TIPO_CONTA, :DATA_CONTA, :COD_COND, :NNOTA_CONTA, :VALOR_CONTA, :QTDPARCELAS_CONTA, :COD_FAVORECIDO, :TIPOFAVORECIDO, :SITUACAO_CONTA)');
      DM.QueryFinanceiro.ParamByName('COD_EVENTO').AsInteger := CodEvento;
      DM.QueryFinanceiro.ParamByName('DESCRICAO_CONTA').AsString := Descricao;
      DM.QueryFinanceiro.ParamByName('TIPO_CONTA').AsString := TipoConta;
      DM.QueryFinanceiro.ParamByName('COD_COND').AsInteger := CodCondPag;
      DM.QueryFinanceiro.ParamByName('DATA_CONTA').AsDate := DataConta;
      DM.QueryFinanceiro.ParamByName('NNOTA_CONTA').AsString := NumeroNota;
      DM.QueryFinanceiro.ParamByName('VALOR_CONTA').AsFloat := Valor;
      DM.QueryFinanceiro.ParamByName('QTDPARCELAS_CONTA').AsInteger := N_Parcelas;
      DM.QueryFinanceiro.ParamByName('COD_FAVORECIDO').AsInteger := CodFav;
      DM.QueryFinanceiro.ParamByName('TIPOFAVORECIDO').AsString := TipoFav;
      DM.QueryFinanceiro.ParamByName('SITUACAO_CONTA').AsString := 'P';
      DM.QueryFinanceiro.ExecSQL;

    // Obter o c�digo da conta inserida
      DM.QueryFinanceiro.SQL.Clear;
      DM.QueryFinanceiro.SQL.add('SELECT first 1 * FROM financeiro WHERE COD_EVENTO = :COD_EVENTO order by cod_conta desc');
      DM.QueryFinanceiro.ParamByName('COD_EVENTO').AsInteger := CodEvento;
      DM.QueryFinanceiro.Open();
      CodConta := DM.QueryFinanceiro.FieldByName('COD_CONTA').AsInteger;
      DM.QueryFinanceiro.Close;

    // Insert Parcelas
    DM.QueryParcelas.SQL.Clear;
    DM.QueryParcelas.SQL.Add('INSERT INTO PARCELAS (COD_CONTA_PARCELA, NUM_PARCELA, DATA_VENC_PARCELA, VALOR_PARCELA, SITUACAO_PARCELA, VALOR_PAGO_PARCELA)');
    DM.QueryParcelas.SQL.Add('VALUES (:COD_CONTA_PARCELA, :NUM_PARCELA, :DATA_VENC_PARCELA, :VALOR_PARCELA, :SITUACAO_PARCELA, :VALOR_PAGO_PARCELA)');

      // Define os valores para as parcelas
     for i := 1 to N_Parcelas do
    begin
        DataVencParcela := IncDay(DataConta, N_Dias * (i));

        // Define os valores dos par�metros para a parcela atual
        DM.QueryParcelas.ParamByName('COD_CONTA_PARCELA').AsInteger := CodConta;
        DM.QueryParcelas.ParamByName('NUM_PARCELA').AsInteger := i;
        DM.QueryParcelas.ParamByName('DATA_VENC_PARCELA').AsDate := DataVencParcela;
        DM.QueryParcelas.ParamByName('VALOR_PARCELA').AsFloat := Valor / N_Parcelas;
        DM.QueryParcelas.ParamByName('SITUACAO_PARCELA').AsInteger := 0; // Situa��o inicial da parcela
        DM.QueryParcelas.ParamByName('VALOR_PAGO_PARCELA').AsFloat := 0; // Valor pago inicial da parcela

        // Executa o comando SQL para inserir a parcela atual
        DM.QueryParcelas.ExecSQL;
      end;

     // Exiba uma mensagem informando que a inscri��o foi realizada com sucesso
      ShowMessage('Conta Lan�ada com sucesso.');
       edtCodFav.Text := '';
       edtNomeFav.Text := '';
       edtNota.Text := '';
       edtCodEv.Text := '';
       edtNomeEv.Text := '';
       edtDescricao.Text := '';
       edtCodCond.Text := '';
       edtNomeCond.Text := '';
       edtValor.Text := '';


      //atualizar o frmContas


      // Feche o formul�rio de inscri��o


    end;

    procedure TfrmLancContas.btnPesquisaClienteClick(Sender: TObject);
    begin

       if(rbtipo.ItemIndex = 0)then
        begin
           frmPesquisa := TfrmPesquisa.Create(Self);
           try
          frmPesquisa.Tabela := 'Participantes';
          frmPesquisa.Click := 'Sim';
           if edtCodFav.Text <> '' then
              begin
                frmPesquisa.edtConsulta.Text := edtCodFav.Text; // Passa o valor do campo para a pesquisa
                frmPesquisa.rOpcao.ItemIndex := 1;
                frmPesquisa.btnPesquisar.OnClick(btnPesquisaEv);
              end;

          if frmPesquisa.ShowModal = mrOk then
          begin
            CodSelectpar := StrToInt(frmPesquisa.CodSelect);
            Nomeselectpar := frmPesquisa.NomeSelect;

            if (CodSelectpar <> 0) then
            begin
                edtCodFav.Text := IntToStr(CodSelectpar);
                edtNomeFav.Text := Nomeselectpar;
              end
              else
              begin
                  ShowMessage('Erro no Participante');
              end;
          end;
        finally
          frmPesquisa.Free;
        end;
        end
        else if(rbtipo.ItemIndex = 1) then
        begin
          frmPesquisa := TfrmPesquisa.Create(Self);
            try
              frmPesquisa.Tabela := 'Palestrantes';
              frmPesquisa.Click := 'Sim';
              if edtCodFav.Text <> '' then
              begin
                frmPesquisa.edtConsulta.Text := edtCodFav.Text; // Passa o valor do campo para a pesquisa
                frmPesquisa.rOpcao.ItemIndex := 1;
                frmPesquisa.btnPesquisar.OnClick(btnPesquisaEv);
              end;
                if frmPesquisa.ShowModal = mrOk then
                begin
                  CodSelectpal := StrToInt(frmPesquisa.CodSelect);
                  Nomeselectpal := frmPesquisa.NomeSelect;
                  if codselectpal <> 0 then
                  begin
                   edtCodFav.Text := IntToStr(CodSelectpal);
                   edtNomeFav.Text := Nomeselectpal;
                  end
                  else
                 begin
                  ShowMessage('Erro no Palestrante');
                 end;
                end;
            finally
              frmPesquisa.Free;
            end;
        end
        else if(rbtipo.ItemIndex = 2) then
        begin
          frmPesquisa := TfrmPesquisa.Create(Self);
            try
              frmPesquisa.Tabela := 'Favorecidos';
              frmPesquisa.Click := 'Sim';
               if edtCodFav.Text <> '' then
              begin
                frmPesquisa.edtConsulta.Text := edtCodFav.Text; // Passa o valor do campo para a pesquisa
                frmPesquisa.rOpcao.ItemIndex := 1;
                frmPesquisa.btnPesquisar.OnClick(btnPesquisaEv);
              end;
                if frmPesquisa.ShowModal = mrOk then
                begin
                  CodSelectfav := StrToInt(frmPesquisa.CodSelect);
                  Nomeselectfav := frmPesquisa.NomeSelect;
                  if codselectfav <> 0 then
                  begin
                   edtCodFav.Text := IntToStr(CodSelectfav);
                   edtNomeFav.Text := Nomeselectfav;
                  end
                  else
                 begin
                  ShowMessage('Erro no Favorecido');
                 end;
                end;
            finally
              frmPesquisa.Free;
            end;
        end;
    end;

    procedure TfrmLancContas.btnPesquisaCondClick(Sender: TObject);
    var codselect : integer ; nomeselect : string;
    begin
      frmPesquisa := TfrmPesquisa.Create(Self);
      try
        frmPesquisa.Tabela := 'CondP';
        frmPesquisa.Click := 'Sim';
          if edtCodCond.Text <> '' then
        begin
          frmPesquisa.edtConsulta.Text := edtCodCond.Text; // Passa o valor do campo para a pesquisa
          frmPesquisa.rOpcao.ItemIndex := 1;
          frmPesquisa.btnPesquisar.OnClick(btnPesquisaEv);
        end;

        if frmPesquisa.ShowModal = mrOk then
        begin
          codselect := StrToInt(frmPesquisa.CodSelect);
          nomeselect := frmPesquisa.NomeSelect;
          if codselect <> 0 then
          begin
            edtCodCond.Text := IntToStr(codselect);
            edtNomeCond.Text := nomeselect;
          end
          else
          begin
            ShowMessage('Erro na Condi��o');
          end;
        end;
      finally
        frmPesquisa.Free;
      end;
    end;


    procedure TfrmLancContas.btnPesquisaEvClick(Sender: TObject);
    var
      codselect: Integer;
      nomeselect: string;

    begin
      frmPesquisa := TfrmPesquisa.Create(Self);
      try
        frmPesquisa.Tabela := 'Eventos';
        frmPesquisa.Click := 'Sim';

        if edtCodev.Text <> '' then
        begin
          frmPesquisa.edtConsulta.Text := edtCodev.Text; // Passa o valor do campo para a pesquisa
          frmPesquisa.rOpcao.ItemIndex := 1;
          frmPesquisa.btnPesquisar.OnClick(btnPesquisaEv);
        end;

        if frmPesquisa.ShowModal = mrOk then
        begin
          codselect := StrToInt(frmPesquisa.CodSelect);
          nomeselect := frmPesquisa.NomeSelect;

          if codselect <> 0 then
          begin
            edtCodEv.Text := IntToStr(codselect);
            edtNomeEv.Text := nomeselect;
          end
          else
          begin
            ShowMessage('Erro no Evento');
          end;
        end;
      finally
        frmPesquisa.Free;
      end;
    end;

    procedure TfrmLancContas.btnSairClick(Sender: TObject);
    begin
        frmLancContas.Close;
    end;



procedure TfrmLancContas.FormShow(Sender: TObject);
    begin
      edtData.Text := DateToStr(now);
    end;

    procedure TfrmLancContas.rbtipoClick(Sender: TObject);
    begin
        if(rbtipo.ItemIndex = 0)then
        begin
          lblTipo.Caption := 'Participante:';
             if(codselectpar <> 0) or (Nomeselectpar <> '') then
             begin
             edtCodFav.Text := IntToStr(codselectpar);
             edtNomeFav.Text := Nomeselectpar;
             end
             else
             begin
             edtCodFav.Text := '';
             edtNomeFav.Text := '';
             end;
        end;
        if(rbtipo.ItemIndex = 1) then
        begin
          lblTipo.Caption := 'Palestrante:';
             if(codselectpal <> 0) or (Nomeselectpal <> '') then
             begin
             edtCodFav.Text := IntToStr(codselectpal);
             edtNomeFav.Text := Nomeselectpal;
             end
             else
             begin
             edtCodFav.Text := '';
             edtNomeFav.Text := '';
             end;
        end;
        if(rbtipo.ItemIndex = 2) then
        begin
          lblTipo.Caption := 'Favorecido:';
             if(codselectfav <> 0) or (Nomeselectfav <> '') then
             begin
             edtCodFav.Text := IntToStr(codselectfav);
             edtNomeFav.Text := Nomeselectfav;
             end
             else
             begin
             edtCodFav.Text := '';
             edtNomeFav.Text := '';
             end;
        end;

    end;

    procedure TfrmLancContas.btnCadClienteClick(Sender: TObject);
    begin
      if(rbtipo.ItemIndex = 0) then
      begin
         frmParticipantes := TfrmParticipantes.Create(Self);
          try
          frmParticipantes.Tabela := 'LancContasCadPart';
          if frmParticipantes.ShowModal = mrOk then
          begin
           //definir nos edt
            edtCodFav.Text := IntToStr(frmParticipantes.FUltimoCodEv);
            edtNomeFav.Text := frmParticipantes.FUltimoNomeEv;
          //setar para as variaveis
            codselectpar := StrToInt(edtCodFav.Text);
            Nomeselectpar := edtNomeFav.Text;
          end;
          finally
            frmParticipantes.Free;
          end;
      end
      else if(rbtipo.ItemIndex = 1) then
      begin
        frmPalestrantes := TfrmPalestrantes.Create(Self);
        try
        frmPalestrantes.Tabela := 'LancContasCadPal';
        if frmPalestrantes.ShowModal = mrOk then
        begin
          //defnir nos edt
          edtCodFav.Text := IntToStr(frmPalestrantes.FUltimoCodPal);
          edtNomeFav.Text := frmPalestrantes.FUltimoNomePal;
          //setar nas var
           codselectpal := StrToInt(edtCodFav.Text);
           nomeselectpal := edtNomeFav.Text;
        end;
        finally
          frmPalestrantes.Free;
        end;

      end
      else if (rbtipo.ItemIndex = 2) then
        begin
         frmFavorecidos := TfrmFavorecidos.Create(Self);
         try
          frmFavorecidos.Tabela := 'LancContasCadFav';
          if frmFavorecidos.ShowModal = mrOk then
          begin
            //definir nos edt
            edtCodFav.Text := IntToStr(frmFavorecidos.FUltimoCodFav);
            edtNomeFav.Text := frmFavorecidos.FUltimoNomeFav;
            //setar nas var
            codselectfav := StrToInt(edtCodFav.Text);
            nomeselectfav := edtNomeFav.Text;
          end;
         finally
           frmFavorecidos.Free;
         end;



        end;


    end;

    procedure TfrmLancContas.btnCadEvClick(Sender: TObject);
    begin
      frmEventos := TfrmEventos.Create(Self);
      try
        frmEventos.Tabela := 'LancContas';
        if frmEventos.ShowModal = mrOk then
        begin
          edtCodEv.Text := IntToStr(frmEventos.FUltimoCodEv);
          edtNomeEv.Text := frmEventos.FUltimoNomeEv;
        end;
      finally
         frmEventos.Free;
      end;
    end;

    procedure TfrmLancContas.btnCadCondClick(Sender: TObject);
    begin
      frmCondicaoPag := TfrmCondicaoPag.Create(self);
      try
        frmCondicaoPag.Tabela := 'CondP';
        if frmCondicaoPag.ShowModal = mrOk then
        begin
          codcond := frmCondicaoPag.FUltimoCodigoCondPag;
          nomecond := frmCondicaoPag.FUltimoNomeCondPag;
          edtCodCond.Text := IntToStr(codcond);
          edtNomeCond.Text := nomecond;
        end;
      finally
        frmCondicaoPag.Free;
      end;
    end;

  end.
