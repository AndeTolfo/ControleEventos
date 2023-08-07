object frmCondicaoPag: TfrmCondicaoPag
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  ClientHeight = 422
  ClientWidth = 390
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 390
    Height = 57
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 534
    object lblTitulo: TLabel
      Left = 64
      Top = 17
      Width = 258
      Height = 19
      Caption = 'Cadastro Condi'#231#245'es Pagamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnlCentro: TPanel
    Left = 0
    Top = 57
    Width = 390
    Height = 365
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 534
    ExplicitHeight = 367
    object PG: TPageControl
      Left = 1
      Top = 1
      Width = 388
      Height = 363
      ActivePage = PGCadastro
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 532
      ExplicitHeight = 365
      object PGCadastro: TTabSheet
        Caption = 'Cadastro'
        OnShow = PGCadastroShow
        object Label1: TLabel
          Left = 19
          Top = 16
          Width = 24
          Height = 13
          Caption = 'Cod:'
          FocusControl = edtCod
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 19
          Top = 61
          Width = 89
          Height = 13
          Caption = 'Nome Condi'#231#227'o:'
          FocusControl = edtNome
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 19
          Top = 111
          Width = 115
          Height = 13
          Caption = 'N'#250'mero de Parcelas:'
          FocusControl = edtNParcelas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 19
          Top = 165
          Width = 156
          Height = 13
          Caption = 'Intervalo Entre as Parcelas:'
          FocusControl = edtIntervaloParc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtCod: TDBEdit
          Left = 19
          Top = 32
          Width = 57
          Height = 21
          DataField = 'COD_COND'
          DataSource = DM.dsCond
          ReadOnly = True
          TabOrder = 7
        end
        object edtNome: TDBEdit
          Left = 19
          Top = 80
          Width = 200
          Height = 21
          DataField = 'NOME_COND'
          DataSource = DM.dsCond
          TabOrder = 0
        end
        object edtNParcelas: TDBEdit
          Left = 19
          Top = 130
          Width = 134
          Height = 21
          DataField = 'N_PARCELAS'
          DataSource = DM.dsCond
          TabOrder = 1
        end
        object edtIntervaloParc: TDBEdit
          Left = 19
          Top = 184
          Width = 134
          Height = 21
          DataField = 'INTERVALO_PARCELAS'
          DataSource = DM.dsCond
          TabOrder = 2
        end
        object btnSalvar: TButton
          Left = 12
          Top = 264
          Width = 75
          Height = 33
          Caption = 'Salvar'
          TabOrder = 3
          OnClick = btnSalvarClick
        end
        object btnNovo: TButton
          Left = 108
          Top = 264
          Width = 75
          Height = 33
          Caption = 'Novo'
          TabOrder = 4
          OnClick = btnNovoClick
        end
        object btnExcluir: TButton
          Left = 204
          Top = 264
          Width = 75
          Height = 33
          Caption = 'Excluir'
          TabOrder = 5
          OnClick = btnExcluirClick
        end
        object btnSair: TButton
          Left = 295
          Top = 264
          Width = 75
          Height = 33
          Caption = 'Sair'
          TabOrder = 6
          OnClick = btnSairClick
        end
      end
      object PGListagem: TTabSheet
        Caption = 'Listagem'
        ImageIndex = 1
        OnShow = PGListagemShow
        object lblNome: TLabel
          Left = 145
          Top = 0
          Width = 93
          Height = 16
          Caption = 'Digite o Nome:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rOpcao: TRadioGroup
          Left = 3
          Top = 11
          Width = 137
          Height = 33
          Caption = 'Op'#231#245'es de Consulta'
          Columns = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ItemIndex = 0
          Items.Strings = (
            'Nome'
            'Cod')
          ParentFont = False
          TabOrder = 0
          OnClick = rOpcaoClick
        end
        object edtConsulta: TEdit
          Left = 143
          Top = 20
          Width = 162
          Height = 21
          TabOrder = 1
        end
        object btnPesquisar: TButton
          Left = 306
          Top = 18
          Width = 75
          Height = 25
          Caption = 'Pesquisar'
          TabOrder = 2
          OnClick = btnPesquisarClick
        end
        object dbListagem: TDBGrid
          Left = 0
          Top = 47
          Width = 381
          Height = 287
          DataSource = DM.dsCond
          ReadOnly = True
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = dbListagemDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'COD_COND'
              Title.Caption = 'Cod'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_COND'
              Title.Caption = 'Nome'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 118
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'N_PARCELAS'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INTERVALO_PARCELAS'
              Title.Caption = 'Intervalo Parcelas'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 83
              Visible = True
            end>
        end
      end
    end
  end
end
