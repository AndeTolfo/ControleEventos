unit View.Pesquisas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Comp.Client,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, Datasnap.DBClient, DmModule, Vcl.Menus, View.Inscricao;

type
  TfrmPesquisa = class(TForm)
    plnCentro: TPanel;
    dbListagem: TDBGrid;
    pnlRodape: TPanel;
    pnlTopo: TPanel;
    rOpcao: TRadioGroup;
    edtConsulta: TEdit;
    btnPesquisar: TButton;
    lblTituloPesquisa: TLabel;
    procedure btnPesquisarClick(Sender: TObject);
    procedure dbListagemDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private

  public
    Tabela, Click, CodSelect, NomeSelect: string;


  end;

var
  frmPesquisa: TfrmPesquisa;

implementation

{$R *.dfm}

uses View.EventosInfo, View.EventosDisp, View.RelEventos;

procedure TfrmPesquisa.btnPesquisarClick(Sender: TObject);
  var TempInt : Integer;
begin
      //tabela palestrantes
      if (Tabela = 'Palestrantes') or ((Tabela = 'Palestrantes') and (Click = 'Sim')) then
      begin
        DM.QueryPalestrantes.Close;
        DM.QueryPalestrantes.SQL.Clear;
        if (rOpcao.ItemIndex = 0) then
          begin
             DM.QueryPalestrantes.SQL.Add('Select * from palestrantes where upper(nome_pal) like :pNome');
             DM.QueryPalestrantes.ParamByName('pNome').AsString := AnsiUpperCase('%' + edtConsulta.Text + '%');
             DM.QueryPalestrantes.Open;
             dbListagem.DataSource:= DM.dsPalestrantes;
          end
        else if (rOpcao.ItemIndex = 1) and TryStrToInt(edtConsulta.Text, TempInt) then
          begin
            DM.QueryPalestrantes.SQL.Add('Select * from palestrantes where cod_pal = :pCod');
            DM.QueryPalestrantes.ParamByName('pCod').AsString := edtConsulta.Text;
            DM.QueryPalestrantes.Open;
            dbListagem.DataSource := DM.dsPalestrantes;
          end
        else if (rOpcao.ItemIndex = -1) or (edtConsulta.Text = '') then
          begin
             DM.QueryPalestrantes.SQL.Add('Select * from palestrantes');
             DM.QueryPalestrantes.Open;
             dbListagem.DataSource := DM.dsPalestrantes;
          end
        else
        begin
          ShowMessage('Valor Inválido');
        end;
      end

      //tabela participantes
      else if (Tabela = 'Participantes') or ((Tabela = 'Participantes') and (Click = 'Sim'))  then
      begin
        DM.QueryParticipantes.Close;
        DM.QueryParticipantes.SQL.Clear;
        if (rOpcao.ItemIndex = 0) then
          begin
             DM.QueryParticipantes.SQL.Add('Select * from participantes where upper(nome_part) like :pNome');
             DM.QueryParticipantes.ParamByName('pNome').AsString := AnsiUpperCase('%' + edtConsulta.Text + '%');
             DM.QueryParticipantes.Open;
             dbListagem.DataSource:= DM.dsParticipantes;
          end
        else if (rOpcao.ItemIndex = 1) and TryStrToInt(edtConsulta.Text, TempInt) then
          begin
            DM.QueryParticipantes.SQL.Add('Select * from participantes where cod_part = :pCod');
            DM.QueryParticipantes.ParamByName('pCod').AsString := edtConsulta.Text;
            DM.QueryParticipantes.Open;
            dbListagem.DataSource := DM.dsParticipantes;
          end
        else if (rOpcao.ItemIndex = -1) or (edtConsulta.Text = '') then
          begin
             DM.QueryParticipantes.SQL.Add('Select * from participantes');
             DM.QueryParticipantes.Open;
             dbListagem.DataSource := DM.dsParticipantes;
          end
        else
        begin
          ShowMessage('Valor Inválido');
        end;
      end

      // tabela areas

       else if (Tabela = 'AreaConhec') or ((Tabela = 'AreaConhec') and (Click = 'Sim'))  then
      begin
        DM.QueryAreas.Close;
        DM.QueryAreas.SQL.Clear;
        if (rOpcao.ItemIndex = 0) then
          begin
             DM.QueryAreas.SQL.Add('Select * from area_conhecimento where upper(nome_area) like :pNome');
             DM.QueryAreas.ParamByName('pNome').AsString := AnsiUpperCase('%' + edtConsulta.Text + '%');
             DM.QueryAreas.Open;
             dbListagem.DataSource:= DM.dsAreas;
          end
        else if (rOpcao.ItemIndex = 1) and TryStrToInt(edtConsulta.Text, TempInt) then
          begin
            DM.QueryAreas.SQL.Add('Select * from area_conhecimento where cod_area = :pCod');
            DM.QueryAreas.ParamByName('pCod').AsString := edtConsulta.Text;
            DM.QueryAreas.Open;
            dbListagem.DataSource := DM.dsAreas;
          end
        else if (rOpcao.ItemIndex = -1) or (edtConsulta.Text = '') then
          begin
             DM.QueryAreas.SQL.Add('Select * from area_conhecimento');
             DM.QueryAreas.Open;
             dbListagem.DataSource := DM.dsAreas;
          end
        else
        begin
          ShowMessage('Valor Inválido');
        end;
      end

      // tabela eventos

       else if (Tabela = 'Eventos') or ((Tabela = 'Eventos') and (Click = 'Sim')) then
      begin
        DM.QueryEventos.Close;
        DM.QueryEventos.SQL.Clear;
        if (rOpcao.ItemIndex = 0) then
          begin
             DM.QueryEventos.SQL.Add('Select * from eventos where upper(titulo_ev) like :pNome');
             DM.QueryEventos.ParamByName('pNome').AsString := AnsiUpperCase('%' + edtConsulta.Text + '%');
             DM.QueryEventos.Open;
             dbListagem.DataSource:= DM.dsEventos;
          end
        else if (rOpcao.ItemIndex = 1) and TryStrToInt(edtConsulta.Text, TempInt) then
          begin
            DM.QueryEventos.SQL.Add('Select * from eventos where cod_evento = :pCod');
            DM.QueryEventos.ParamByName('pCod').AsString := edtConsulta.Text;
            DM.QueryEventos.Open;
            dbListagem.DataSource := DM.dsEventos;
          end
        else if (rOpcao.ItemIndex = -1) or (edtConsulta.Text = '') then
          begin
             DM.QueryEventos.SQL.Add('Select * from eventos');
             DM.QueryEventos.Open;
             dbListagem.DataSource := DM.dsEventos;
          end
        else
        begin
          ShowMessage('Valor Inválido');
        end;
      end


      // tabela favorecidos
      else if (Tabela = 'Favorecidos') or (Tabela = 'FavorecidosClick') then
      begin
        DM.QueryFavorecidos.Close;
        DM.QueryFavorecidos.SQL.Clear;
        if (rOpcao.ItemIndex = 0) then
          begin
             DM.QueryFavorecidos.SQL.Add('Select * from favorecidos where upper(nome_fav) like :pNome');
             DM.QueryFavorecidos.ParamByName('pNome').AsString := AnsiUpperCase('%' + edtConsulta.Text + '%');
             DM.QueryFavorecidos.Open;
             dbListagem.DataSource:= DM.dsFavorecidos;
          end
        else if (rOpcao.ItemIndex = 1) and TryStrToInt(edtConsulta.Text, TempInt) then
          begin
            DM.QueryFavorecidos.SQL.Add('Select * from favorecidos where cod_fav = :pCod');
            DM.QueryFavorecidos.ParamByName('pCod').AsString := edtConsulta.Text;
            DM.QueryFavorecidos.Open;
            dbListagem.DataSource := DM.dsFavorecidos;
          end
        else if (rOpcao.ItemIndex = -1) or (edtConsulta.Text = '') then
          begin
             DM.QueryFavorecidos.SQL.Add('Select * from favorecidos');
             DM.QueryFavorecidos.Open;
             dbListagem.DataSource := DM.dsFavorecidos;
          end
        else
        begin
          ShowMessage('Valor Inválido');
        end;
      end

      // tabela de condições de pagamento
      else if (Tabela = 'CondP') or (Tabela = 'CondPClick') then
      begin
        DM.QueryCond.Close;
        DM.QueryCond.SQL.Clear;
        if (rOpcao.ItemIndex = 0) then
          begin
             DM.QueryCond.SQL.Add('Select * from cond_pag where upper(nome_cond) like :pNome');
             DM.QueryCond.ParamByName('pNome').AsString := AnsiUpperCase('%' + edtConsulta.Text + '%');
             DM.QueryCond.Open;
             dbListagem.DataSource:= DM.dsCond;
          end
        else if (rOpcao.ItemIndex = 1) and TryStrToInt(edtConsulta.Text, TempInt) then
          begin
            DM.QueryCond.SQL.Add('Select * from cond_pag where cod_cond = :pCod');
            DM.QueryCond.ParamByName('pCod').AsString := edtConsulta.Text;
            DM.QueryCond.Open;
            dbListagem.DataSource := DM.dsCond;
          end
        else if (rOpcao.ItemIndex = -1) or (edtConsulta.Text = '') then
          begin
             DM.QueryCond.SQL.Add('Select * from cond_pag');
             DM.QueryCond.Open;
             dbListagem.DataSource := DM.dsCond;
          end
        else
        begin
          ShowMessage('Valor Inválido');
        end;
      end

            // tabela de formas de pagamento
      else if (Tabela = 'FormasPag') or (Tabela = 'FormasPagClick') then
      begin
        DM.QueryFormasPag.Close;
        DM.QueryFormasPag.SQL.Clear;
        if (rOpcao.ItemIndex = 0) then
          begin
             DM.QueryFormasPag.SQL.Add('Select * from formaspag where upper(nome_fpg) like :pNome');
             DM.QueryFormasPag.ParamByName('pNome').AsString := AnsiUpperCase('%' + edtConsulta.Text + '%');
             DM.QueryFormasPag.Open;
             dbListagem.DataSource:= DM.dsFormasPag;
          end
        else if (rOpcao.ItemIndex = 1) and TryStrToInt(edtConsulta.Text, TempInt) then
          begin
            DM.QueryFormasPag.SQL.Add('Select * from formaspag where cod_fpg = :pCod');
            DM.QueryFormasPag.ParamByName('pCod').AsString := edtConsulta.Text;
            DM.QueryFormasPag.Open;
            dbListagem.DataSource := DM.dsFormasPag;
          end
        else if (rOpcao.ItemIndex = -1) or (edtConsulta.Text = '') then
          begin
             DM.QueryFormasPag.SQL.Add('Select * from formaspag');
             DM.QueryFormasPag.Open;
             dbListagem.DataSource := DM.dsFormasPag;
          end
        else
        begin
          ShowMessage('Valor Inválido');
        end;
      end


end;

procedure TfrmPesquisa.dbListagemDblClick(Sender: TObject);
begin
    if (Tabela = 'Palestrantes') and (Click = 'Sim') then
    begin
       CodSelect := dbListagem.DataSource.DataSet.FieldByName('COD_PAL').AsString;
       NomeSelect := dbListagem.DataSource.DataSet.FieldByName('NOME_PAL').AsString;
       ModalResult := mrOk; // Fechar o formulário de pesquisa
    end
    else if (Tabela = 'Eventos') and (Click = 'Sim') then
    begin
      CodSelect := dbListagem.DataSource.DataSet.FieldByName('COD_EVENTO').AsString;
      NomeSelect := dbListagem.DataSource.DataSet.FieldByName('TITULO_EV').AsString;
      ModalResult := mrOk;
    end
    else if (Tabela = 'Participantes') and (Click = 'Sim') then
    begin
      CodSelect := dbListagem.DataSource.DataSet.FieldByName('COD_PART').AsString;
      NomeSelect := dbListagem.DataSource.DataSet.FieldByName('NOME_PART').AsString;
      ModalResult := mrOk;
    end
     else if (Tabela = 'Participantes') and (Click = 'Inscricao') then
    begin
  // Abre o frmInscricao com os campos preenchidos
    frmInscricao := TfrmInscricao.Create(Self);
    try
    // Preencha as propriedades do frmInscricao com os valores necessários
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
    else if (Tabela = 'Favorecidos') and (Click = 'Sim') then
    begin
      CodSelect := dbListagem.DataSource.DataSet.FieldByName('COD_FAV').AsString;
      NomeSelect := dbListagem.DataSource.DataSet.FieldByName('NOME_FAV').AsString;
      ModalResult := mrOk;
    end
    else if(Tabela = 'CondP') and (Click = 'Sim') then
    begin
      CodSelect := dbListagem.DataSource.DataSet.FieldByName('cod_cond').AsString;
      NomeSelect := dbListagem.DataSource.DataSet.FieldByName('nome_cond').AsString;
      ModalResult := mrOk;
    end
    else if (Tabela = 'AreaConhec') and (Click = 'Sim') then
    begin
      CodSelect := dbListagem.DataSource.DataSet.FieldByName('COD_AREA').AsString;
      NomeSelect := dbListagem.DataSource.DataSet.FieldByName('NOME_AREA').AsString;
      ModalResult := mrOk;
    end
end;

  procedure TfrmPesquisa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // Verifique se a tecla pressionada é a tecla F5 (código da tecla F5 é 116)
  if Key = VK_F5 then
  begin
    // Chame o método OnClick do botão "Atualizar"
    btnPesquisar.Click;
    // Impedir que o evento OnClick do botão "Atualizar" seja acionado novamente
    // quando a tecla F5 for liberada
    Key := 0;
  end;
end;

procedure TfrmPesquisa.FormShow(Sender: TObject);
  begin
      if (Tabela = 'Participantes') or ((Tabela = 'Participantes') and ((Click = 'Sim')or (Click = 'Inscricao'))) then
      begin
         lblTituloPesquisa.Caption := 'Pesquisa Por Participantes';
         dbListagem.Columns[0].FieldName := 'cod_part';
         dbListagem.Columns[0].Title.Caption := 'Cod';
         dbListagem.Columns[1].FieldName := 'nome_part';
         dbListagem.Columns[1].Title.Caption := 'Nome';
      end
      else if (Tabela = 'Palestrantes') or ((Tabela = 'Palestrantes') and (Click = 'Sim')) then
      begin
        lblTituloPesquisa.Caption := 'Pesquisa Por Palestrantes';
         dbListagem.Columns[0].FieldName := 'cod_pal';
         dbListagem.Columns[0].Title.Caption := 'Cod';
         dbListagem.Columns[1].FieldName := 'nome_pal';
         dbListagem.Columns[1].Title.Caption := 'Nome';
      end
      else if (Tabela = 'AreaConhec') or ((Tabela = 'AreaConhec') and (Click = 'Sim')) then
      begin
        lblTituloPesquisa.Caption := 'Pesquisa Por Area de Conhecimento';
        dbListagem.Columns[0].FieldName := 'cod_area';
        dbListagem.Columns[0].Title.Caption := 'Cod';
        dbListagem.Columns[1].FieldName := 'nome_area';
        dbListagem.Columns[1].Title.Caption := 'Nome';
      end
      else if (Tabela = 'Eventos') or ((Tabela = 'Eventos') and (Click = 'Sim')) then
      begin
        lblTituloPesquisa.Caption := 'Pesquisa Por Eventos';
         dbListagem.Columns[0].FieldName := 'cod_evento';
         dbListagem.Columns[0].Title.Caption := 'Cod';
         dbListagem.Columns[1].FieldName := 'titulo_ev';
         dbListagem.Columns[1].Title.Caption := 'Título';
      end
      else if (Tabela = 'CondP') or ((Tabela = 'CondP') and (Click = 'Sim')) then
      begin
        lblTituloPesquisa.Caption := 'Pesquisa Por Condição';
        dbListagem.Columns[0].FieldName := 'cod_cond';
        dbListagem.Columns[0].Title.Caption := 'Cod';
        dbListagem.Columns[1].FieldName := 'nome_cond';
        dbListagem.Columns[1].Title.Caption := 'Nome';
      end
      else if (Tabela = 'Favorecidos') or ((Tabela = 'Favorecidos') and (Click = 'Sim')) then
      begin
        lblTituloPesquisa.Caption := 'Pesquisa por Favorecidos';
        dbListagem.Columns[0].FieldName := 'cod_fav';
        dbListagem.Columns[0].Title.Caption := 'Cod';
        dbListagem.Columns[1].FieldName := 'nome_fav';
        dbListagem.Columns[1].Title.Caption := 'Nome';
      end
      else if (Tabela = 'FormasPag') or ((Tabela = 'FormasPag')and (Click = 'Sim')) then
      begin
        lblTituloPesquisa.Caption := 'Pesquisa por Formas de Pagamento';
        dbListagem.Columns[0].FieldName := 'cod_fpg';
        dbListagem.Columns[0].Title.Caption := 'Cod';
        dbListagem.Columns[1].FieldName := 'nome_fpg';
        dbListagem.Columns[1].Title.Caption := 'Nome';
      end;


  end;

  end.
