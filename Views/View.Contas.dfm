object frmContas: TfrmContas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 469
  ClientWidth = 815
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCentro: TPanel
    Left = 0
    Top = 57
    Width = 815
    Height = 337
    Align = alClient
    TabOrder = 0
    object dbListagem: TDBGrid
      Left = 1
      Top = 1
      Width = 813
      Height = 335
      Align = alClient
      DataSource = dsParcelas
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = dbListagemCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_PARCELA'
          Title.Caption = 'COD Parcela'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_CONTA_PARCELA'
          Title.Caption = 'COD Conta'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FAVORECIDO'
          Title.Caption = 'Favorecido'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 164
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUM_PARCELA'
          Title.Caption = 'Ordem'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_CONTA'
          Title.Caption = 'Tipo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_VENC_PARCELA'
          Title.Caption = 'DT Venc'
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
          FieldName = 'VALOR_PARCELA'
          Title.Caption = 'Valor'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_PAGO_PARCELA'
          Title.Caption = 'Valor Pago'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_RESTANTE'
          Title.Caption = 'Pendente'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SITUACAO_PARCELA'
          Title.Caption = 'Sit Parcela'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_EVENTO'
          Title.Caption = 'COD Evento'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO_EV'
          Visible = False
        end>
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 394
    Width = 815
    Height = 75
    Align = alBottom
    TabOrder = 1
    object btnNovaConta: TSpeedButton
      Left = 531
      Top = 16
      Width = 75
      Height = 41
      Caption = 'Nova Conta'
      OnClick = btnNovaContaClick
    end
    object btnAtualizar: TButton
      Left = 247
      Top = 16
      Width = 75
      Height = 41
      Caption = 'Atualizar'
      TabOrder = 0
      OnClick = btnAtualizarClick
    end
    object btnPagar: TButton
      Left = 347
      Top = 16
      Width = 75
      Height = 41
      Caption = 'Pagar'
      TabOrder = 1
      OnClick = btnPagarClick
    end
    object btnHist: TButton
      Left = 440
      Top = 16
      Width = 75
      Height = 41
      Caption = 'Hist Pag'
      TabOrder = 2
      OnClick = btnHistClick
    end
    object btnRel: TButton
      Left = 40
      Top = 16
      Width = 75
      Height = 41
      Caption = 'Relat'#243'rios'
      TabOrder = 3
      OnClick = btnRelClick
    end
  end
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 815
    Height = 57
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 11
      Top = 6
      Width = 31
      Height = 16
      Caption = 'Tipo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 247
      Top = 6
      Width = 50
      Height = 16
      Caption = 'Evento:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 604
      Top = 6
      Width = 81
      Height = 16
      Caption = 'Palestrante:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 412
      Top = 6
      Width = 84
      Height = 16
      Caption = 'Participante:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnPesquisaEv: TSpeedButton
      Left = 376
      Top = 5
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
      OnClick = btnPesquisaEvClick
    end
    object btnPesquisarPart: TSpeedButton
      Left = 573
      Top = 4
      Width = 25
      Height = 23
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
      OnClick = btnPesquisarPartClick
    end
    object btnPesquisaPal: TSpeedButton
      Left = 761
      Top = 5
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
      OnClick = btnPesquisaPalClick
    end
    object Label5: TLabel
      Left = 110
      Top = 8
      Width = 39
      Height = 16
      Caption = 'In'#237'cio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 124
      Top = 32
      Width = 25
      Height = 16
      Caption = 'Fim:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 21
      Top = 31
      Width = 22
      Height = 16
      Caption = 'Sit:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbTipoConta: TComboBox
      Left = 48
      Top = 5
      Width = 55
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 0
      Text = 'Todas'
      Items.Strings = (
        'Todas'
        'Receber'
        'Pagar')
    end
    object edtCodEvento: TEdit
      Left = 301
      Top = 5
      Width = 72
      Height = 21
      TabOrder = 1
      OnChange = edtCodEventoChange
    end
    object edtCodPalestrantes: TEdit
      Left = 687
      Top = 5
      Width = 72
      Height = 21
      TabOrder = 2
      OnChange = edtCodPalestrantesChange
    end
    object edtCodParticipante: TEdit
      Left = 498
      Top = 5
      Width = 72
      Height = 21
      TabOrder = 3
      OnChange = edtCodParticipanteChange
    end
    object dtIni: TDateTimePicker
      Left = 155
      Top = 5
      Width = 78
      Height = 21
      Date = 45123.000000000000000000
      Time = 0.684169942127482500
      TabOrder = 4
    end
    object dtFim: TDateTimePicker
      Left = 155
      Top = 30
      Width = 78
      Height = 21
      Date = 45123.000000000000000000
      Time = 0.684169942127482500
      TabOrder = 5
    end
    object cbSit: TComboBox
      Left = 49
      Top = 30
      Width = 55
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 6
      Text = 'Todas'
      Items.Strings = (
        'Todas'
        'Pendentes'
        'Quitadas')
    end
  end
  object ppReport: TppReport
    AutoStop = False
    DataPipeline = ppPipeline
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 
      'C:\Users\ander\Documents\Embarcadero\Studio\Projects\Siscomp\Pro' +
      'jeto Eventos\Win32\Debug\Relatorios\RelFinAgrupadoFav.rtm'
    Units = utMillimeters
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    EmailSettings.ConnectionSettings.MailService = 'SMTP'
    EmailSettings.ConnectionSettings.WebMail.GmailSettings.OAuth2.AuthStorage = [oasAccessToken, oasRefreshToken]
    EmailSettings.ConnectionSettings.WebMail.GmailSettings.OAuth2.RedirectURI = 'http://localhost'
    EmailSettings.ConnectionSettings.WebMail.GmailSettings.OAuth2.RedirectPort = 0
    EmailSettings.ConnectionSettings.WebMail.Outlook365Settings.OAuth2.AuthStorage = [oasAccessToken, oasRefreshToken]
    EmailSettings.ConnectionSettings.WebMail.Outlook365Settings.OAuth2.RedirectURI = 'http://localhost'
    EmailSettings.ConnectionSettings.WebMail.Outlook365Settings.OAuth2.RedirectPort = 0
    EmailSettings.ConnectionSettings.EnableMultiPlugin = False
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    ThumbnailSettings.PageHighlight.Width = 3
    ThumbnailSettings.ThumbnailSize = tsSmall
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.AllowExtract = True
    PDFSettings.EncryptSettings.AllowAssemble = True
    PDFSettings.EncryptSettings.AllowQualityPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.EncryptSettings.EncryptionType = etRC4
    PDFSettings.DigitalSignatureSettings.SignPDF = False
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PDFSettings.PDFAFormat = pafNone
    PreviewFormSettings.PageBorder.mmPadding = 0
    RTFSettings.AppName = 'ReportBuilder'
    RTFSettings.Author = 'ReportBuilder'
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    RTFSettings.Title = 'Report'
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    XLSSettings.WorksheetName = 'Report'
    CloudDriveSettings.DropBoxSettings.OAuth2.AuthStorage = [oasAccessToken, oasRefreshToken]
    CloudDriveSettings.DropBoxSettings.OAuth2.RedirectURI = 'http://localhost'
    CloudDriveSettings.DropBoxSettings.OAuth2.RedirectPort = 0
    CloudDriveSettings.DropBoxSettings.DirectorySupport = True
    CloudDriveSettings.GoogleDriveSettings.OAuth2.AuthStorage = [oasAccessToken, oasRefreshToken]
    CloudDriveSettings.GoogleDriveSettings.OAuth2.RedirectURI = 'http://localhost'
    CloudDriveSettings.GoogleDriveSettings.OAuth2.RedirectPort = 0
    CloudDriveSettings.GoogleDriveSettings.DirectorySupport = False
    CloudDriveSettings.OneDriveSettings.OAuth2.AuthStorage = [oasAccessToken, oasRefreshToken]
    CloudDriveSettings.OneDriveSettings.OAuth2.RedirectURI = 'http://localhost'
    CloudDriveSettings.OneDriveSettings.OAuth2.RedirectPort = 0
    CloudDriveSettings.OneDriveSettings.DirectorySupport = True
    Left = 688
    Top = 410
    Version = '22.0'
    mmColumnWidth = 0
    DataPipelineName = 'ppPipeline'
    object ppHeaderBand1: TppHeaderBand
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 12171
      mmPrintPosition = 0
      object ppEmpresa: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Empresa'
        AutoSize = False
        Border.Weight = 1.000000000000000000
        Border.mmPadding = 0
        Caption = 'Listagem Agrupada Fav'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 10cpi'
        Font.Size = 14
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 5821
        mmLeft = 2117
        mmTop = 0
        mmWidth = 58951
        BandType = 0
        LayerName = Foreground
      end
      object ppLine1: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 758
        mmLeft = 0
        mmTop = 11413
        mmWidth = 197300
        BandType = 0
        LayerName = Foreground
      end
      object ppSystemVariable1: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable1'
        Border.mmPadding = 0
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 164571
        mmTop = 1852
        mmWidth = 31221
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Parcela'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 5027
        mmLeft = 34131
        mmTop = 6615
        mmWidth = 17992
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label4'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 5027
        mmLeft = 54334
        mmTop = 6615
        mmWidth = 19334
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label3'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 5027
        mmLeft = 74442
        mmTop = 6615
        mmWidth = 24073
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label5'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Restante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 5027
        mmLeft = 100107
        mmTop = 6615
        mmWidth = 18197
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label6'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 5027
        mmLeft = 118892
        mmTop = 6615
        mmWidth = 10319
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel7: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label7'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Evento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 5027
        mmLeft = 130005
        mmTop = 6615
        mmWidth = 30163
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Border.mmPadding = 0
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 38629
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText1'
        Border.mmPadding = 0
        DataField = 'COD_PARCELA'
        DataPipeline = ppPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppPipeline'
        mmHeight = 4762
        mmLeft = 34131
        mmTop = 794
        mmWidth = 15081
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText3'
        Border.mmPadding = 0
        DataField = 'DATA_VENC_PARCELA'
        DataPipeline = ppPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppPipeline'
        mmHeight = 4763
        mmLeft = 74442
        mmTop = 794
        mmWidth = 23019
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText4'
        Border.mmPadding = 0
        DataField = 'VALOR_PARCELA'
        DataPipeline = ppPipeline
        DisplayFormat = '$#,0.00;-$#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPipeline'
        mmHeight = 4763
        mmLeft = 54334
        mmTop = 794
        mmWidth = 19334
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText5: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText5'
        Border.mmPadding = 0
        DataField = 'VALOR_RESTANTE'
        DataPipeline = ppPipeline
        DisplayFormat = '$#,0.00;-$#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPipeline'
        mmHeight = 4763
        mmLeft = 99842
        mmTop = 794
        mmWidth = 18576
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText6: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText6'
        Border.mmPadding = 0
        DataField = 'TIPO_CONTA'
        DataPipeline = ppPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppPipeline'
        mmHeight = 4762
        mmLeft = 118892
        mmTop = 794
        mmWidth = 10319
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText7: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText7'
        Border.mmPadding = 0
        DataField = 'TITULO_EV'
        DataPipeline = ppPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPipeline'
        mmHeight = 4763
        mmLeft = 130005
        mmTop = 794
        mmWidth = 60000
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppFooterBand1: TppFooterBand
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'FAVORECIDO'
      DataPipeline = ppPipeline
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppPipeline'
      NewFile = False
      object ppGroupHeaderBand1: TppGroupHeaderBand
        Border.mmPadding = 0
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppDBText2: TppDBText
          DesignLayer = ppDesignLayer1
          UserName = 'DBText2'
          Border.mmPadding = 0
          DataField = 'FAVORECIDO'
          DataPipeline = ppPipeline
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppPipeline'
          mmHeight = 4763
          mmLeft = 1588
          mmTop = 0
          mmWidth = 33073
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        Border.mmPadding = 0
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object EUCRIEI_Grupo14: TppDBCalc
          DesignLayer = ppDesignLayer1
          UserName = 'EUCRIEI_Grupo14'
          AutoSize = True
          Border.mmPadding = 0
          DataField = 'VALOR_PARCELA'
          DataPipeline = ppPipeline
          DisplayFormat = '$#,0.00;-$#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 12
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          DataPipelineName = 'ppPipeline'
          mmHeight = 5027
          mmLeft = 18416
          mmTop = 1852
          mmWidth = 49742
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLine2: TppLine
          DesignLayer = ppDesignLayer1
          UserName = 'Line2'
          Border.mmPadding = 0
          Weight = 0.750000000000000000
          mmHeight = 794
          mmLeft = 0
          mmTop = 7144
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBCalc1: TppDBCalc
          DesignLayer = ppDesignLayer1
          UserName = 'DBCalc1'
          AutoSize = True
          Border.mmPadding = 0
          DataField = 'VALOR_RESTANTE'
          DataPipeline = ppPipeline
          DisplayFormat = '$#,0.00;-$#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 12
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          DataPipelineName = 'ppPipeline'
          mmHeight = 5027
          mmLeft = 62621
          mmTop = 1852
          mmWidth = 52388
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
      end
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object dsParcelas: TDataSource
    DataSet = DM.QueryParcelas
    Left = 184
    Top = 416
  end
  object ppRel: TPopupMenu
    Left = 128
    Top = 418
    object relListagem: TMenuItem
      Caption = 'Listagem'
      OnClick = relListagemClick
    end
    object AgrupadoFavorecido1: TMenuItem
      Caption = 'Agrupado Favorecido'
      OnClick = AgrupadoFavorecido1Click
    end
  end
  object ppPipeline: TppDBPipeline
    DataSource = dsParcelas
    UserName = 'Pipeline'
    Left = 632
    Top = 410
    object ppPipelineppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'COD_PARCELA'
      FieldName = 'COD_PARCELA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppPipelineppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'COD_CONTA_PARCELA'
      FieldName = 'COD_CONTA_PARCELA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppPipelineppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUM_PARCELA'
      FieldName = 'NUM_PARCELA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object ppPipelineppField4: TppField
      FieldAlias = 'DATA_VENC_PARCELA'
      FieldName = 'DATA_VENC_PARCELA'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 3
    end
    object ppPipelineppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_PARCELA'
      FieldName = 'VALOR_PARCELA'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 4
    end
    object ppPipelineppField6: TppField
      FieldAlias = 'SITUACAO_PARCELA'
      FieldName = 'SITUACAO_PARCELA'
      FieldLength = 4
      DisplayWidth = 4
      Position = 5
    end
    object ppPipelineppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_PAGO_PARCELA'
      FieldName = 'VALOR_PAGO_PARCELA'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 6
    end
    object ppPipelineppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'COD_EVENTO'
      FieldName = 'COD_EVENTO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object ppPipelineppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_RESTANTE'
      FieldName = 'VALOR_RESTANTE'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 8
    end
    object ppPipelineppField10: TppField
      FieldAlias = 'TIPO_CONTA'
      FieldName = 'TIPO_CONTA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 9
    end
    object ppPipelineppField11: TppField
      FieldAlias = 'FAVORECIDO'
      FieldName = 'FAVORECIDO'
      FieldLength = 200
      DisplayWidth = 200
      Position = 10
    end
    object ppPipelineppField12: TppField
      FieldAlias = 'TITULO_EV'
      FieldName = 'TITULO_EV'
      FieldLength = 200
      DisplayWidth = 200
      Position = 11
    end
  end
end
