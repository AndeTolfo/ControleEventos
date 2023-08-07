object frmParticipantes: TfrmParticipantes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 447
  ClientWidth = 367
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
  object pnlParticipantes: TPanel
    Left = 0
    Top = 0
    Width = 367
    Height = 447
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 314
    ExplicitHeight = 211
    object pnlTopo: TPanel
      Left = 0
      Top = 0
      Width = 367
      Height = 57
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      ExplicitWidth = 314
      object lbltitulo: TLabel
        Left = 96
        Top = 22
        Width = 211
        Height = 19
        Caption = 'Cadastro de Participantes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object PG: TPageControl
      AlignWithMargins = True
      Left = 3
      Top = 60
      Width = 361
      Height = 384
      ActivePage = pgListagem
      Align = alClient
      TabOrder = 1
      ExplicitWidth = 365
      ExplicitHeight = 374
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
          Width = 107
          Height = 13
          Caption = 'Nome Participante:'
          FocusControl = edtNome
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 16
          Top = 116
          Width = 37
          Height = 13
          Caption = 'E-Mail:'
          FocusControl = edtEmail
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 184
          Top = 167
          Width = 52
          Height = 13
          Caption = 'Telefone:'
          FocusControl = edtTelefone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 16
          Top = 222
          Width = 105
          Height = 13
          Caption = #193'rea de Interesse:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 16
          Top = 170
          Width = 23
          Height = 13
          Caption = 'CPF:'
          FocusControl = edtCpf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnExcluir: TButton
          Left = 183
          Top = 289
          Width = 75
          Height = 33
          Caption = 'Excluir'
          TabOrder = 7
          OnClick = btnExcluirClick
        end
        object btnNovo: TButton
          Left = 102
          Top = 289
          Width = 75
          Height = 33
          Caption = 'Novo'
          TabOrder = 6
          OnClick = btnNovoClick
        end
        object btnSair: TButton
          Left = 264
          Top = 289
          Width = 75
          Height = 33
          Caption = 'Sair'
          TabOrder = 8
          OnClick = btnSairClick
        end
        object btnSalvar: TButton
          Left = 21
          Top = 289
          Width = 75
          Height = 33
          Caption = 'Salvar'
          TabOrder = 5
          OnClick = btnSalvarClick
        end
        object edtCod: TDBEdit
          Left = 16
          Top = 32
          Width = 62
          Height = 21
          DataField = 'COD_PART'
          DataSource = DM.dsParticipantes
          ReadOnly = True
          TabOrder = 9
        end
        object edtEmail: TDBEdit
          Left = 16
          Top = 132
          Width = 300
          Height = 21
          DataField = 'EMAIL_PART'
          DataSource = DM.dsParticipantes
          TabOrder = 1
        end
        object edtNome: TDBEdit
          Left = 16
          Top = 80
          Width = 300
          Height = 21
          DataField = 'NOME_PART'
          DataSource = DM.dsParticipantes
          TabOrder = 0
        end
        object edtTelefone: TDBEdit
          Left = 184
          Top = 186
          Width = 132
          Height = 21
          DataField = 'TELEFONE_PART'
          DataSource = DM.dsParticipantes
          MaxLength = 16
          TabOrder = 3
        end
        object edtArea: TDBEdit
          Left = 16
          Top = 237
          Width = 300
          Height = 21
          DataField = 'AREA_INTERESSE'
          DataSource = DM.dsParticipantes
          TabOrder = 4
        end
        object edtCpf: TDBEdit
          Left = 16
          Top = 186
          Width = 113
          Height = 21
          DataField = 'CPF'
          DataSource = DM.dsParticipantes
          MaxLength = 16
          TabOrder = 2
        end
      end
      object pgListagem: TTabSheet
        Caption = 'Listagem'
        ImageIndex = 1
        OnShow = pgListagemShow
        object Label7: TLabel
          Left = 112
          Top = 40
          Width = 3
          Height = 13
        end
        object dbListagem: TDBGrid
          Left = -4
          Top = 39
          Width = 357
          Height = 317
          DataSource = DM.dsParticipantes
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
              FieldName = 'COD_PART'
              Title.Caption = 'Cod'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 33
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_PART'
              Title.Caption = 'Nome'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 195
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMAIL_PART'
              Title.Caption = 'Email'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'TELEFONE_PART'
              Title.Caption = 'Telefone'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CPF'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'AREA_INTERESSE'
              Title.Caption = 'Area'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Visible = False
            end>
        end
        object rOpcao: TRadioGroup
          Left = 8
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
          Left = 151
          Top = 12
          Width = 98
          Height = 21
          TabOrder = 1
        end
        object btnPesquisar: TButton
          Left = 255
          Top = 10
          Width = 75
          Height = 25
          Caption = 'Pesquisar'
          TabOrder = 2
          OnClick = btnPesquisarClick
        end
      end
    end
  end
end
