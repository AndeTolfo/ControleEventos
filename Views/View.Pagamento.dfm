object frmPagamentos: TfrmPagamentos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  ClientHeight = 304
  ClientWidth = 478
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
    Width = 478
    Height = 49
    Align = alTop
    TabOrder = 0
    object lblTitulo: TLabel
      Left = 163
      Top = 14
      Width = 149
      Height = 18
      Caption = 'Tela de Pagamentos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnlCentro: TPanel
    Left = 0
    Top = 49
    Width = 478
    Height = 255
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
      Left = 180
      Top = 16
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
    object Label3: TLabel
      Left = 11
      Top = 50
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
      Top = 49
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
    object Label5: TLabel
      Left = 332
      Top = 16
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
      Left = 343
      Top = 49
      Width = 33
      Height = 14
      Caption = 'Venc:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 31
      Top = 90
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
      Left = 11
      Top = 156
      Width = 109
      Height = 14
      Caption = 'Valor Pagamento:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 203
      Top = 156
      Width = 68
      Height = 14
      Caption = 'Forma Pag:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblfav: TLabel
      Left = 24
      Top = 122
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
    object edtCodParcela: TEdit
      Left = 98
      Top = 14
      Width = 64
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object edtCodConta: TEdit
      Left = 255
      Top = 13
      Width = 64
      Height = 21
      ReadOnly = True
      TabOrder = 3
    end
    object edtValorPar: TEdit
      Left = 99
      Top = 47
      Width = 64
      Height = 21
      ReadOnly = True
      TabOrder = 4
    end
    object edtValorRestante: TEdit
      Left = 255
      Top = 47
      Width = 64
      Height = 21
      ReadOnly = True
      TabOrder = 5
    end
    object edtOrdem: TEdit
      Left = 386
      Top = 14
      Width = 64
      Height = 21
      ReadOnly = True
      TabOrder = 6
    end
    object edtDataVenc: TEdit
      Left = 386
      Top = 47
      Width = 64
      Height = 21
      ReadOnly = True
      TabOrder = 7
    end
    object edtDescConta: TEdit
      Left = 98
      Top = 88
      Width = 352
      Height = 21
      ReadOnly = True
      TabOrder = 8
    end
    object edtValorPag: TEdit
      Left = 126
      Top = 154
      Width = 64
      Height = 21
      TabOrder = 0
    end
    object edtFav: TEdit
      Left = 99
      Top = 120
      Width = 352
      Height = 21
      ReadOnly = True
      TabOrder = 9
    end
    object cbFormasPag: TDBLookupComboBox
      Left = 276
      Top = 154
      Width = 145
      Height = 21
      DataField = 'COD_FPG'
      DataSource = DM.dsPagamentos
      KeyField = 'COD_FPG'
      ListField = 'NOME_FPG'
      ListSource = DM.dsFormasPag
      TabOrder = 1
    end
    object btnSair: TButton
      Left = 229
      Top = 197
      Width = 75
      Height = 43
      Caption = 'Sair'
      TabOrder = 10
      OnClick = btnSairClick
    end
  end
  object btnConfirmar: TButton
    Left = 139
    Top = 246
    Width = 75
    Height = 43
    Caption = 'Confirmar'
    TabOrder = 2
    OnClick = btnConfirmarClick
  end
end
