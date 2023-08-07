object frmEventosDisp: TfrmEventosDisp
  Left = 0
  Top = 0
  ClientHeight = 484
  ClientWidth = 793
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCentro: TPanel
    Left = 0
    Top = 49
    Width = 793
    Height = 435
    Align = alClient
    TabOrder = 0
    object dbListagem: TDBGrid
      Left = 1
      Top = 1
      Width = 791
      Height = 424
      DataSource = DM.dsEventos
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = dbListagemDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_EVENTO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DATA_EV'
          Title.Caption = 'Data'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO_EV'
          Title.Caption = 'T'#237'tulo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO_EV'
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LOCAL_EV'
          Title.Caption = 'Local'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 175
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_AREA'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'VALOR_INSCRICAO_EV'
          Title.Caption = 'Valor'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_PALESTRANTE_EV'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'VAGAS_EV'
          Title.Caption = 'Vagas'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 42
          Visible = True
        end>
    end
  end
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 793
    Height = 49
    Align = alTop
    ParentBackground = False
    TabOrder = 1
    object lbltitulo: TLabel
      Left = 40
      Top = 16
      Width = 161
      Height = 19
      Caption = 'Eventos Dispon'#237'veis'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
end
