object frmInscricao: TfrmInscricao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 443
  ClientWidth = 491
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCentro: TPanel
    Left = 0
    Top = 57
    Width = 491
    Height = 321
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 7
      Top = 40
      Width = 88
      Height = 16
      Caption = 'Participante: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 40
      Top = 72
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
      Left = 54
      Top = 103
      Width = 36
      Height = 16
      Caption = 'Data:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 51
      Top = 136
      Width = 39
      Height = 16
      Caption = 'Valor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 12
      Top = 168
      Width = 78
      Height = 16
      Caption = 'Pagamento:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblParticipantes: TLabel
      Left = 101
      Top = 40
      Width = 79
      Height = 16
      Caption = 'Participante'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTitulo: TLabel
      Left = 101
      Top = 72
      Width = 45
      Height = 16
      Caption = 'Evento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblData: TLabel
      Left = 101
      Top = 103
      Width = 31
      Height = 16
      Caption = 'Data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValor: TLabel
      Left = 101
      Top = 136
      Width = 34
      Height = 16
      Caption = 'Valor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbPag: TComboBox
      Left = 96
      Top = 167
      Width = 73
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      Items.Strings = (
        'Online'
        'Presencial')
    end
  end
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 491
    Height = 57
    Align = alTop
    TabOrder = 1
    object lblInscricao: TLabel
      Left = 160
      Top = 19
      Width = 147
      Height = 19
      Caption = 'Tela de Inscri'#231#245'es'
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
    Top = 378
    Width = 491
    Height = 65
    Align = alBottom
    TabOrder = 2
    object btnConfirmar: TButton
      Left = 131
      Top = 12
      Width = 75
      Height = 43
      Caption = 'Confirmar'
      TabOrder = 0
      OnClick = btnConfirmarClick
    end
    object btnSair: TButton
      Left = 242
      Top = 12
      Width = 75
      Height = 43
      Caption = 'Sair'
      TabOrder = 1
      OnClick = btnSairClick
    end
  end
end