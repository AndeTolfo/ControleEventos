object frmHistPag: TfrmHistPag
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  ClientHeight = 423
  ClientWidth = 517
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
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 517
    Height = 51
    Align = alTop
    TabOrder = 0
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 515
      Height = 50
      Align = alTop
      TabOrder = 0
      object lblTitulo: TLabel
        Left = 144
        Top = 16
        Width = 203
        Height = 19
        Caption = 'Hist'#243'rico de Pagamentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object pnlCentro: TPanel
    Left = 0
    Top = 51
    Width = 517
    Height = 316
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 17
      Top = 17
      Width = 75
      Height = 14
      Caption = 'Cod Parcela:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 145
      Top = 15
      Width = 69
      Height = 14
      Caption = 'Cod Conta:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 271
      Top = 15
      Width = 44
      Height = 14
      Caption = 'Ordem:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 339
      Top = 149
      Width = 53
      Height = 14
      Caption = 'DT Venc:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblfav: TLabel
      Left = 23
      Top = 87
      Width = 69
      Height = 14
      Caption = 'Favorecido:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 32
      Top = 55
      Width = 61
      Height = 14
      Caption = 'Descri'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 34
      Top = 119
      Width = 59
      Height = 14
      Caption = 'CondPag:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 35
      Top = 150
      Width = 57
      Height = 14
      Caption = 'Situa'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 184
      Top = 150
      Width = 61
      Height = 14
      Caption = 'DT Conta:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 372
      Top = 15
      Width = 30
      Height = 14
      Caption = 'Tipo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCodParcela: TEdit
      Left = 98
      Top = 14
      Width = 41
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object edtCodConta: TEdit
      Left = 220
      Top = 13
      Width = 45
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object edtOrdem: TEdit
      Left = 321
      Top = 13
      Width = 39
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object edtDataVenc: TEdit
      Left = 401
      Top = 148
      Width = 64
      Height = 21
      ReadOnly = True
      TabOrder = 3
    end
    object edtDescConta: TEdit
      Left = 99
      Top = 53
      Width = 366
      Height = 21
      ReadOnly = True
      TabOrder = 4
    end
    object edtFav: TEdit
      Left = 98
      Top = 90
      Width = 367
      Height = 21
      ReadOnly = True
      TabOrder = 5
    end
    object edtNomeCond: TEdit
      Left = 145
      Top = 117
      Width = 320
      Height = 21
      ReadOnly = True
      TabOrder = 6
    end
    object edtCodCond: TEdit
      Left = 98
      Top = 117
      Width = 41
      Height = 21
      TabOrder = 7
    end
    object edtSitParcela: TEdit
      Left = 98
      Top = 148
      Width = 65
      Height = 21
      TabOrder = 8
    end
    object edtDataConta: TEdit
      Left = 252
      Top = 148
      Width = 66
      Height = 21
      ReadOnly = True
      TabOrder = 9
    end
    object dbListagem: TDBGrid
      Left = 17
      Top = 175
      Width = 488
      Height = 120
      DataSource = DM.dsHistPag
      ReadOnly = True
      TabOrder = 10
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_PAGAMENTO'
          Title.Caption = 'Cod Pag'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_FPG'
          Title.Caption = 'Cod Fpg'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_FPG'
          Title.Caption = 'Forma Pag'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 98
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_HORA'
          Title.Caption = 'Data'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_PAGAMENTO'
          Title.Caption = 'Valor Pago'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EXTORNADO'
          Title.Caption = 'Extorno'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 59
          Visible = True
        end>
    end
    object edtTipoConta: TEdit
      Left = 406
      Top = 13
      Width = 59
      Height = 21
      ReadOnly = True
      TabOrder = 11
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 367
    Width = 517
    Height = 56
    Align = alBottom
    TabOrder = 2
    object Label3: TLabel
      Left = 31
      Top = 18
      Width = 82
      Height = 14
      Caption = 'Valor Parcela:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 189
      Top = 18
      Width = 70
      Height = 14
      Caption = 'Valor Pago:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 335
      Top = 18
      Width = 60
      Height = 14
      Caption = 'Restante:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtValorPar: TEdit
      Left = 118
      Top = 17
      Width = 64
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object edtValorPago: TEdit
      Left = 264
      Top = 17
      Width = 64
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object edtValorRestante: TEdit
      Left = 400
      Top = 17
      Width = 64
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
  end
end
