unit Funcoes;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;
 function VerificarCamposVazios(const AControls: array of TControl): Boolean;
 function VerificarValorReais(const AEdit: TEdit): Boolean;
 function VerificarValorReaisTDB(const ADBEdit: TDBEdit): Boolean;
implementation


function VerificarCamposVazios(const AControls: array of TControl): Boolean;
var
  Control: TControl;
begin
  Result := True;

  for Control in AControls do
  begin
    if (Control is TCustomEdit) and (Trim(TCustomEdit(Control).Text) = '') then
    begin
      Result := False;
      Break;
    end
    else if (Control is TComboBox) and (TComboBox(Control).ItemIndex = -1) then
    begin
      Result := False;
      Break;
    end
    else if (Control is TDBEdit) and ((TDBEdit(Control).DataSource = nil) or (TDBEdit(Control).DataField = '')) then
    begin
      Result := False;
      Break;
    end;
    // Adicione aqui outras verificações para outros tipos de controles, se necessário
  end;
end;

function VerificarValorReais(const AEdit: TEdit): Boolean;
var
  Valor: Double;
begin
  Result := False;

  if TryStrToFloat(AEdit.Text, Valor) then
  begin
    if Valor > 0 then
      Result := True
  end
  else
  if not Result then
    AEdit.SetFocus;
end;

function VerificarValorReaisTDB(const ADBEdit: TDBEdit): Boolean;
var
  Valor: Double;
begin
  Result := False;

  if TryStrToFloat(ADBEdit.Text, Valor) then
  begin
    if Valor > 0 then
      Result := True
  end
  else
  if not Result then
    ADBEdit.SetFocus;
end;




end.


