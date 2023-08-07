object frmPalestrantes: TfrmPalestrantes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 346
  ClientWidth = 379
  Color = clWhite
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
  object pnlPalestrantes: TPanel
    Left = 0
    Top = 0
    Width = 379
    Height = 346
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 314
    ExplicitHeight = 211
    object pnlTopo: TPanel
      Left = 1
      Top = 1
      Width = 377
      Height = 48
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      ExplicitWidth = 312
      object lblTitulo: TLabel
        Left = 96
        Top = 12
        Width = 206
        Height = 19
        Caption = 'Cadastro de Palestrantes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object PG: TPageControl
      Left = 1
      Top = 49
      Width = 377
      Height = 296
      ActivePage = pgCadastro
      Align = alClient
      TabOrder = 1
      ExplicitWidth = 312
      ExplicitHeight = 161
      object pgCadastro: TTabSheet
        Caption = 'Cadastro'
        OnShow = pgCadastroShow
        object Label2: TLabel
          Left = 16
          Top = 16
          Width = 26
          Height = 13
          Caption = 'COD:'
          FocusControl = edtCod
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 16
          Top = 64
          Width = 104
          Height = 13
          Caption = 'Nome Palestrante:'
          FocusControl = edtNome
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 15
          Top = 117
          Width = 97
          Height = 13
          Caption = #193'rea de Atua'#231#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnExcluir: TButton
          Left = 199
          Top = 211
          Width = 66
          Height = 33
          Caption = 'Excluir'
          TabOrder = 4
          OnClick = btnExcluirClick
        end
        object btnNovo: TButton
          Left = 111
          Top = 211
          Width = 66
          Height = 33
          Caption = 'Novo'
          TabOrder = 3
          OnClick = btnNovoClick
        end
        object btnSair: TButton
          Left = 287
          Top = 211
          Width = 69
          Height = 33
          Caption = 'Sair'
          TabOrder = 5
          OnClick = btnSairClick
        end
        object btnSalvar: TButton
          Left = 16
          Top = 211
          Width = 66
          Height = 33
          Caption = 'Salvar'
          TabOrder = 2
          OnClick = btnSalvarClick
        end
        object edtCod: TDBEdit
          Left = 16
          Top = 32
          Width = 57
          Height = 21
          DataField = 'COD_PAL'
          DataSource = DM.dsPalestrantes
          TabOrder = 6
        end
        object edtNome: TDBEdit
          Left = 16
          Top = 80
          Width = 329
          Height = 21
          DataField = 'NOME_PAL'
          DataSource = DM.dsPalestrantes
          TabOrder = 0
        end
        object cbArea: TDBLookupComboBox
          Left = 16
          Top = 136
          Width = 145
          Height = 21
          DataField = 'COD_AREA'
          DataSource = DM.dsPalestrantes
          KeyField = 'COD_AREA'
          ListField = 'NOME_AREA'
          ListSource = DM.dsAreas
          TabOrder = 1
        end
      end
      object pgListagem: TTabSheet
        Caption = 'Listagem'
        ImageIndex = 1
        OnShow = pgListagemShow
        object dbListagem: TDBGrid
          Left = 3
          Top = 42
          Width = 366
          Height = 223
          DataSource = DM.dsPalestrantes
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
              FieldName = 'COD_PAL'
              Title.Caption = 'Cod'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_PAL'
              Title.Caption = 'Nome'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 179
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_AREA'
              Title.Caption = 'Cod Area '
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 109
              Visible = True
            end>
        end
        object btnPesquisar: TButton
          Left = 255
          Top = 11
          Width = 75
          Height = 25
          Caption = 'Pesquisar'
          TabOrder = 2
          OnClick = btnPesquisarClick
        end
        object rOpcao: TRadioGroup
          Left = 16
          Top = 3
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
        end
        object edtConsulta: TEdit
          Left = 159
          Top = 13
          Width = 90
          Height = 21
          TabOrder = 1
        end
      end
    end
  end
end
