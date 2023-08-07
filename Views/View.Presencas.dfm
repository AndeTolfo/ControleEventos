object frmPresencas: TfrmPresencas
  Left = 0
  Top = 0
  Caption = 'frmPresencas'
  ClientHeight = 327
  ClientWidth = 495
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCentro: TPanel
    Left = 0
    Top = 65
    Width = 495
    Height = 189
    Align = alClient
    TabOrder = 0
    object lblTipo: TLabel
      Left = 24
      Top = 19
      Width = 61
      Height = 13
      Caption = 'Participante:'
    end
    object btnPesquisaCliente: TSpeedButton
      Left = 383
      Top = 15
      Width = 25
      Height = 22
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7E6E6E6CBCBCBA5A5
        A57D7D7D797979F0F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
        F7F7E1E1E1CACACAB7B7B7A8A8A8A0A0A03030302D2D2D9D9D9EFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF9F9F9F8F8F8FBFBFBF3F3F34F4E
        4E2D2C2D797979F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFF3F3F35150502D2C2D797979F3F3F3FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F45150502D2C2D7979
        79F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF9D98964A4848797979F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        D5D5D5979695969594969694939392BBBBBABCB9B8908A88B1ADACF4F4F4FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFBDBDBDA6A6A3C7C7C5C5C5C4C5C4C3C6C6C5B6
        B6B3787574C7C5C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5999997
        B9B9B7B4B4B2B2B2AFB2B2AFB4B4B1B7B7B4ADADAABDBDBCFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFA6A6A6A9A9A6A7A7A4A7A7A4A7A7A4A7A7A4A7A8A4A8
        A8A4A9A9A691918FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9292919F9F9C
        9FA09DA0A09DA0A09DA0A09DA0A19EA1A19EA1A19E848583FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF939492A0A19EA3A3A1A4A5A2A5A5A3A5A6A3A5A6A3A5
        A5A3A5A5A2838482FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0B0B0ABABA9
        B9B9B8B9B9B8B9BAB8B9BAB8B9BAB8B9BAB8B6B6B5929291FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFF4F4F4868786CCCDCCD3D3D3D3D4D3D3D4D3D3D4D3D3
        D3D2989998D4D4D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDC
        898A89CCCDCCEEEEEEF1F2F2D9D9D9999A99BDBDBDFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4B1B1B1959595929392A7A7A7E4
        E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = btnPesquisaClienteClick
    end
    object btnCadCliente: TSpeedButton
      Left = 410
      Top = 15
      Width = 25
      Height = 22
      Glyph.Data = {
        26040000424D2604000000000000360000002800000012000000120000000100
        180000000000F0030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFF00000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000FFFFFF
        0000FFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000FFFFFF0000FFFFFFFFFFFF
        FFFFFF0808080000000000000000000000000000000000000000000000000000
        00000000000000000000080808FFFFFF0000FFFFFFFFFFFFFFFFFF6060600000
        0000000000000000000000000000000000000000000000000000000000000000
        0000606060FFFFFF0000FFFFFFFFFFFFFFFFFFF9F9F976767608080800000000
        0000000000000000000000000000000000000000080808767676F9F9F9FFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEAA0A0A05858582727270D0D0D
        000000242424585858A0A0A0EAEAEAFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF000000000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000FFFFFFF9
        F9F9787878191919191919787878FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000000000000000000000000000000000000000FFFFFF777777000000000000
        000000000000797979FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        000000000000FFFFFFFFFFFFFFFFFF1A1A1A0000000000000000000000001C1C
        1CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF000000000000FFFF
        FFFFFFFFFFFFFF1A1A1A0000000000000000000000001C1C1CFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF77
        7777000000000000000000000000797979FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9787878191919
        191919787878FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000}
      OnClick = btnCadClienteClick
    end
    object edtCodFav: TEdit
      Left = 91
      Top = 16
      Width = 38
      Height = 21
      TabOrder = 0
      OnChange = edtCodFavChange
    end
    object edtNomeFav: TEdit
      Left = 143
      Top = 16
      Width = 234
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object dbListagem: TDBGrid
      Left = 14
      Top = 43
      Width = 473
      Height = 137
      DataSource = DsInscricoes
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = dbListagemCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'cod_inscricao'
          Title.Caption = 'Inscricao'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cod_evento'
          Title.Caption = 'Cod_Ev'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 46
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'titulo_ev'
          Title.Caption = 'Titulo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 163
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor_conta'
          Title.Caption = 'Valor'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Situacao'
          Title.Caption = 'Situa'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'restante'
          Title.Caption = 'Restante'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 59
          Visible = True
        end>
    end
  end
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 495
    Height = 65
    Align = alTop
    TabOrder = 1
    object lbltitulo: TLabel
      Left = 176
      Top = 21
      Width = 157
      Height = 19
      Caption = 'Check In no Evento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 254
    Width = 495
    Height = 73
    Align = alBottom
    TabOrder = 2
    object btnConfirmarPres: TButton
      Left = 176
      Top = 18
      Width = 113
      Height = 39
      Caption = 'Confirmar Presen'#231'a'
      TabOrder = 0
      OnClick = btnConfirmarPresClick
    end
  end
  object DsInscricoes: TDataSource
    DataSet = DM.QueryInscricoes
    Left = 40
    Top = 353
  end
end
