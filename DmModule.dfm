object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 499
  Width = 660
  object conexao: TFDConnection
    Params.Strings = (
      'User_Name=SUPS'
      'Password=maps3880'
      'Protocol=TCPIP'
      'Server=localhost'
      'Port=3051'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    LoginPrompt = False
    Left = 24
    Top = 48
  end
  object QueryAreas: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'SELECT * FROM AREA_CONHECIMENTO')
    Left = 104
    Top = 40
    object QueryAreasCOD_AREA: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'COD_AREA'
      Origin = 'COD_AREA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryAreasNOME_AREA: TStringField
      FieldName = 'NOME_AREA'
      Origin = 'NOME_AREA'
      Size = 200
    end
  end
  object QueryEventos: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'select * from eventos')
    Left = 168
    Top = 40
    object QueryEventosCOD_EVENTO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'COD_EVENTO'
      Origin = 'COD_EVENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryEventosTITULO_EV: TStringField
      FieldName = 'TITULO_EV'
      Origin = 'TITULO_EV'
      Size = 200
    end
    object QueryEventosDESCRICAO_EV: TStringField
      FieldName = 'DESCRICAO_EV'
      Origin = 'DESCRICAO_EV'
      Size = 250
    end
    object QueryEventosDATA_EV: TDateField
      FieldName = 'DATA_EV'
      Origin = 'DATA_EV'
      EditMask = '##/##/####;1;_'
    end
    object QueryEventosLOCAL_EV: TStringField
      FieldName = 'LOCAL_EV'
      Origin = 'LOCAL_EV'
      Size = 200
    end
    object QueryEventosCOD_AREA: TIntegerField
      FieldName = 'COD_AREA'
      Origin = 'COD_AREA'
      Required = True
    end
    object QueryEventosVALOR_INSCRICAO_EV: TFMTBCDField
      FieldName = 'VALOR_INSCRICAO_EV'
      Origin = 'VALOR_INSCRICAO_EV'
      Precision = 18
      Size = 2
    end
    object QueryEventosCOD_PALESTRANTE_EV: TIntegerField
      FieldName = 'COD_PALESTRANTE_EV'
      Origin = 'COD_PALESTRANTE_EV'
      Required = True
    end
    object QueryEventosVAGAS_EV: TIntegerField
      FieldName = 'VAGAS_EV'
      Origin = 'VAGAS_EV'
    end
  end
  object QueryParticipantes: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'select * from participantes')
    Left = 232
    Top = 40
    object QueryParticipantesCOD_PART: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'COD_PART'
      Origin = 'COD_PART'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryParticipantesNOME_PART: TStringField
      FieldName = 'NOME_PART'
      Origin = 'NOME_PART'
      Size = 200
    end
    object QueryParticipantesEMAIL_PART: TStringField
      FieldName = 'EMAIL_PART'
      Origin = 'EMAIL_PART'
      Size = 200
    end
    object QueryParticipantesTELEFONE_PART: TStringField
      FieldName = 'TELEFONE_PART'
      Origin = 'TELEFONE_PART'
      EditMask = '(##) # ####-####;0;_'
      Size = 15
    end
    object QueryParticipantesAREA_INTERESSE: TStringField
      FieldName = 'AREA_INTERESSE'
      Origin = 'AREA_INTERESSE'
      Size = 200
    end
    object QueryParticipantesCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      EditMask = '###.###.###-##;1;_'
      Size = 15
    end
  end
  object QueryPalestrantes: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'select * from palestrantes')
    Left = 312
    Top = 40
    object QueryPalestrantesCOD_PAL: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'COD_PAL'
      Origin = 'COD_PAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryPalestrantesNOME_PAL: TStringField
      FieldName = 'NOME_PAL'
      Origin = 'NOME_PAL'
      Size = 200
    end
    object QueryPalestrantesCOD_AREA: TIntegerField
      FieldName = 'COD_AREA'
      Origin = 'COD_AREA'
      Required = True
    end
  end
  object dsAreas: TDataSource
    DataSet = QueryAreas
    Left = 104
    Top = 96
  end
  object dsEventos: TDataSource
    DataSet = QueryEventos
    Left = 168
    Top = 96
  end
  object dsParticipantes: TDataSource
    DataSet = QueryParticipantes
    Left = 232
    Top = 96
  end
  object dsPalestrantes: TDataSource
    DataSet = QueryPalestrantes
    Left = 312
    Top = 96
  end
  object WaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 42
    Top = 248
  end
  object FBDriverLink: TFDPhysFBDriverLink
    Left = 42
    Top = 312
  end
  object QueryInscricoes: TFDQuery
    Connection = conexao
    Left = 384
    Top = 40
  end
  object dsInscricoes: TDataSource
    DataSet = QueryInscricoes
    Left = 392
    Top = 104
  end
  object QueryFinanceiro: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'select * from financeiro')
    Left = 456
    Top = 40
    object QueryFinanceiroCOD_CONTA: TIntegerField
      FieldName = 'COD_CONTA'
      Origin = 'COD_CONTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryFinanceiroCOD_EVENTO: TIntegerField
      FieldName = 'COD_EVENTO'
      Origin = 'COD_EVENTO'
      Required = True
    end
    object QueryFinanceiroDESCRICAO_CONTA: TStringField
      FieldName = 'DESCRICAO_CONTA'
      Origin = 'DESCRICAO_CONTA'
      Size = 100
    end
    object QueryFinanceiroTIPO_CONTA: TStringField
      FieldName = 'TIPO_CONTA'
      Origin = 'TIPO_CONTA'
      Size = 1
    end
    object QueryFinanceiroDATA_CONTA: TDateField
      FieldName = 'DATA_CONTA'
      Origin = 'DATA_CONTA'
    end
    object QueryFinanceiroNNOTA_CONTA: TStringField
      FieldName = 'NNOTA_CONTA'
      Origin = 'NNOTA_CONTA'
      Size = 30
    end
    object QueryFinanceiroVALOR_CONTA: TFMTBCDField
      FieldName = 'VALOR_CONTA'
      Origin = 'VALOR_CONTA'
      Precision = 18
      Size = 2
    end
    object QueryFinanceiroQTDPARCELAS_CONTA: TIntegerField
      FieldName = 'QTDPARCELAS_CONTA'
      Origin = 'QTDPARCELAS_CONTA'
    end
    object QueryFinanceiroCOD_FAVORECIDO: TIntegerField
      FieldName = 'COD_FAVORECIDO'
      Origin = 'COD_FAVORECIDO'
    end
    object QueryFinanceiroTIPOFAVORECIDO: TStringField
      FieldName = 'TIPOFAVORECIDO'
      Origin = 'TIPOFAVORECIDO'
      Size = 1
    end
    object QueryFinanceiroSITUACAO_CONTA: TStringField
      FieldName = 'SITUACAO_CONTA'
      Origin = 'SITUACAO_CONTA'
      Size = 10
    end
  end
  object dsFinanceiro: TDataSource
    DataSet = QueryFinanceiro
    Left = 456
    Top = 104
  end
  object dsPagamentos: TDataSource
    DataSet = QueryPagamentos
    Left = 544
    Top = 104
  end
  object QueryPagamentos: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'select * from pagamentos')
    Left = 544
    Top = 40
    object QueryPagamentosCOD_PAGAMENTO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'COD_PAGAMENTO'
      Origin = 'COD_PAGAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryPagamentosCOD_PARCELA: TIntegerField
      FieldName = 'COD_PARCELA'
      Origin = 'COD_PARCELA'
      Required = True
    end
    object QueryPagamentosCOD_FPG: TIntegerField
      FieldName = 'COD_FPG'
      Origin = 'COD_FPG'
      Required = True
    end
    object QueryPagamentosVALOR_PAGAMENTO: TFMTBCDField
      FieldName = 'VALOR_PAGAMENTO'
      Origin = 'VALOR_PAGAMENTO'
      Precision = 18
      Size = 2
    end
    object QueryPagamentosDATA_HORA: TSQLTimeStampField
      FieldName = 'DATA_HORA'
      Origin = 'DATA_HORA'
    end
    object QueryPagamentosEXTORNADO: TStringField
      FieldName = 'EXTORNADO'
      Origin = 'EXTORNADO'
      Size = 1
    end
  end
  object QueryParcelas: TFDQuery
    MasterSource = dsFinanceiro
    MasterFields = 'COD_FAVORECIDO'
    Connection = conexao
    SQL.Strings = (
      'SELECT P.cod_parcela,'
      'P.COD_CONTA_PARCELA,'
      'P.NUM_PARCELA,'
      'F.TIPO_CONTA,'
      'P.DATA_VENC_PARCELA,'
      'P.VALOR_PARCELA,'
      
        'case p.situacao_parcela when '#39'0'#39' then '#39'PDNT'#39' when '#39'1'#39' then '#39'QTD'#39 +
        ' when '#39'2'#39' then '#39'CANC'#39' end as Situacao_parcela,'
      'P.VALOR_PAGO_PARCELA,'
      'sum(valor_parcela - valor_pago_parcela) as Valor_Restante,'
      
        'CASE F.tipofavorecido WHEN '#39'PAR'#39' THEN Part.NOME_Part WHEN '#39'PAL'#39' ' +
        'THEN PAL.nome_pal WHEN '#39'EVE'#39' THEN FAV.nome_fav END AS FAVORECIDO' +
        ','
      'ev.cod_evento,'
      'ev.TITULO_EV'
      'FROM PARCELAS P'
      'INNER JOIN FINANCEIRO F ON P.COD_CONTA_PARCELA = F.COD_CONTA'
      
        'left JOIN PARTICIPANTES Part ON Part.COD_PART = F.COD_FAVORECIDO' +
        ' and f.tipofavorecido = '#39'PAR'#39
      
        'left JOIN favorecidos FAV ON FAV.cod_fav = F.cod_favorecido and ' +
        'f.tipofavorecido = '#39'EVE'#39
      
        'left JOIN palestrantes PAL ON PAL.cod_pal = F.cod_favorecido and' +
        ' f.tipofavorecido = '#39'PAL'#39
      
        'INNER JOIN EVENTOS EV ON EV.COD_EVENTO = F.cod_evento group by 1' +
        ',2,3,4,5,6,7,8,10,11,12')
    Left = 248
    Top = 160
    object QueryParcelasCOD_PARCELA: TIntegerField
      FieldName = 'COD_PARCELA'
      Origin = 'COD_PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryParcelasCOD_CONTA_PARCELA: TIntegerField
      FieldName = 'COD_CONTA_PARCELA'
      Origin = 'COD_CONTA_PARCELA'
      Required = True
    end
    object QueryParcelasNUM_PARCELA: TIntegerField
      FieldName = 'NUM_PARCELA'
      Origin = 'NUM_PARCELA'
    end
    object QueryParcelasDATA_VENC_PARCELA: TDateField
      FieldName = 'DATA_VENC_PARCELA'
      Origin = 'DATA_VENC_PARCELA'
    end
    object QueryParcelasVALOR_PARCELA: TFMTBCDField
      FieldName = 'VALOR_PARCELA'
      Origin = 'VALOR_PARCELA'
      currency = True
      Precision = 18
      Size = 2
    end
    object QueryParcelasSITUACAO_PARCELA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'SITUACAO_PARCELA'
      Origin = 'SITUACAO_PARCELA'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 4
    end
    object QueryParcelasVALOR_PAGO_PARCELA: TFMTBCDField
      FieldName = 'VALOR_PAGO_PARCELA'
      Origin = 'VALOR_PAGO_PARCELA'
      currency = True
      Precision = 18
      Size = 2
    end
    object QueryParcelasCOD_EVENTO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_EVENTO'
      Origin = 'COD_EVENTO'
      ProviderFlags = []
      ReadOnly = True
    end
    object QueryParcelasVALOR_RESTANTE: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_RESTANTE'
      Origin = 'VALOR_RESTANTE'
      ProviderFlags = []
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 2
    end
    object QueryParcelasTIPO_CONTA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO_CONTA'
      Origin = 'TIPO_CONTA'
      ProviderFlags = []
      ReadOnly = True
      Size = 1
    end
    object QueryParcelasFAVORECIDO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FAVORECIDO'
      Origin = 'FAVORECIDO'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
    object QueryParcelasTITULO_EV: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TITULO_EV'
      Origin = 'TITULO_EV'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
  end
  object QueryFormasPag: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'select * from formaspag')
    Left = 328
    Top = 160
    object QueryFormasPagCOD_FPG: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'COD_FPG'
      Origin = 'COD_FPG'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryFormasPagNOME_FPG: TStringField
      FieldName = 'NOME_FPG'
      Origin = 'NOME_FPG'
      Size = 200
    end
    object QueryFormasPagDESCRICAO_FPG: TStringField
      FieldName = 'DESCRICAO_FPG'
      Origin = 'DESCRICAO_FPG'
      Size = 200
    end
  end
  object dsFormasPag: TDataSource
    DataSet = QueryFormasPag
    Left = 328
    Top = 216
  end
  object QueryFavorecidos: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'select * from favorecidos')
    Left = 168
    Top = 160
    object QueryFavorecidosCOD_FAV: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'COD_FAV'
      Origin = 'COD_FAV'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryFavorecidosNOME_FAV: TStringField
      FieldName = 'NOME_FAV'
      Origin = 'NOME_FAV'
      Size = 200
    end
  end
  object dsFavorecidos: TDataSource
    DataSet = QueryFavorecidos
    Left = 168
    Top = 216
  end
  object QueryCond: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'select * from cond_pag')
    Left = 104
    Top = 160
    object QueryCondCOD_COND: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'COD_COND'
      Origin = 'COD_COND'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryCondNOME_COND: TStringField
      FieldName = 'NOME_COND'
      Origin = 'NOME_COND'
      Size = 200
    end
    object QueryCondN_PARCELAS: TIntegerField
      FieldName = 'N_PARCELAS'
      Origin = 'N_PARCELAS'
    end
    object QueryCondINTERVALO_PARCELAS: TSmallintField
      FieldName = 'INTERVALO_PARCELAS'
      Origin = 'INTERVALO_PARCELAS'
    end
  end
  object dsCond: TDataSource
    DataSet = QueryCond
    Left = 96
    Top = 216
  end
  object ConsultaGen: TFDQuery
    Connection = conexao
    Left = 168
    Top = 384
  end
  object QueryHistPag: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'select '
      'p.cod_pagamento,'
      'p.cod_fpg,'
      'f.nome_fpg,'
      'p.cod_parcela,'
      'p.data_hora,'
      'p.valor_pagamento,'
      'p.extornado'
      'from pagamentos p'
      'inner join formaspag f on f.cod_fpg = p.cod_fpg'
      ''
      '')
    Left = 408
    Top = 160
    object QueryHistPagCOD_PAGAMENTO: TIntegerField
      FieldName = 'COD_PAGAMENTO'
      Origin = 'COD_PAGAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryHistPagCOD_FPG: TIntegerField
      FieldName = 'COD_FPG'
      Origin = 'COD_FPG'
      Required = True
    end
    object QueryHistPagDATA_HORA: TSQLTimeStampField
      FieldName = 'DATA_HORA'
      Origin = 'DATA_HORA'
    end
    object QueryHistPagVALOR_PAGAMENTO: TFMTBCDField
      FieldName = 'VALOR_PAGAMENTO'
      Origin = 'VALOR_PAGAMENTO'
      currency = True
      Precision = 18
      Size = 2
    end
    object QueryHistPagEXTORNADO: TStringField
      FieldName = 'EXTORNADO'
      Origin = 'EXTORNADO'
      Size = 1
    end
    object QueryHistPagNOME_FPG: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_FPG'
      Origin = 'NOME_FPG'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
  end
  object dsHistPag: TDataSource
    DataSet = QueryHistPag
    Left = 416
    Top = 216
  end
  object SqlHistPag: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'SELECT'
      'P.cod_parcela,'
      'f.descricao_conta,'
      'f.cod_cond,'
      'f.data_conta,'
      'C.nome_cond,'
      'P.COD_CONTA_PARCELA,'
      'P.NUM_PARCELA,'
      
        'case F.TIPO_CONTA when '#39'P'#39' then '#39'Pagar'#39' when '#39'R'#39' then '#39'Receber'#39' ' +
        'end as Tipo_Conta,'
      'P.DATA_VENC_PARCELA,'
      'P.VALOR_PARCELA,'
      
        'case p.situacao_parcela when '#39'0'#39' then '#39'PENDENTE'#39' when '#39'1'#39' then '#39 +
        'QUITADA'#39' when '#39'2'#39' then '#39'CANC'#39' end as Situacao_parcela,'
      'P.VALOR_PAGO_PARCELA,'
      'sum(valor_parcela - valor_pago_parcela) as Valor_Restante,'
      'Part.NOME_Part,'
      'F.Cod_evento'
      'FROM PARCELAS P'
      'INNER JOIN FINANCEIRO F ON P.COD_CONTA_PARCELA = F.COD_CONTA'
      'INNER JOIN COND_PAG C ON C.cod_cond = F.cod_cond'
      
        'INNER JOIN PARTICIPANTES Part ON Part.COD_PART = F.COD_FAVORECID' +
        'O'
      'INNER JOIN EVENTOS EV ON EV.COD_EVENTO = F.COD_EVENTO ')
    Left = 240
    Top = 384
    object SqlHistPagCOD_PARCELA: TIntegerField
      FieldName = 'COD_PARCELA'
      Origin = 'COD_PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SqlHistPagDESCRICAO_CONTA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_CONTA'
      Origin = 'DESCRICAO_CONTA'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object SqlHistPagCOD_COND: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_COND'
      Origin = 'COD_COND'
      ProviderFlags = []
      ReadOnly = True
    end
    object SqlHistPagNOME_COND: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_COND'
      Origin = 'NOME_COND'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
    object SqlHistPagCOD_CONTA_PARCELA: TIntegerField
      FieldName = 'COD_CONTA_PARCELA'
      Origin = 'COD_CONTA_PARCELA'
      Required = True
    end
    object SqlHistPagNUM_PARCELA: TIntegerField
      FieldName = 'NUM_PARCELA'
      Origin = 'NUM_PARCELA'
    end
    object SqlHistPagTIPO_CONTA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO_CONTA'
      Origin = 'TIPO_CONTA'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object SqlHistPagDATA_VENC_PARCELA: TDateField
      FieldName = 'DATA_VENC_PARCELA'
      Origin = 'DATA_VENC_PARCELA'
    end
    object SqlHistPagVALOR_PARCELA: TFMTBCDField
      FieldName = 'VALOR_PARCELA'
      Origin = 'VALOR_PARCELA'
      Precision = 18
      Size = 2
    end
    object SqlHistPagSITUACAO_PARCELA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'SITUACAO_PARCELA'
      Origin = 'SITUACAO_PARCELA'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object SqlHistPagVALOR_PAGO_PARCELA: TFMTBCDField
      FieldName = 'VALOR_PAGO_PARCELA'
      Origin = 'VALOR_PAGO_PARCELA'
      Precision = 18
      Size = 2
    end
    object SqlHistPagVALOR_RESTANTE: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_RESTANTE'
      Origin = 'VALOR_RESTANTE'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object SqlHistPagNOME_PART: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_PART'
      Origin = 'NOME_PART'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
    object SqlHistPagCOD_EVENTO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_EVENTO'
      Origin = 'COD_EVENTO'
      ProviderFlags = []
      ReadOnly = True
    end
    object SqlHistPagDATA_CONTA: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATA_CONTA'
      Origin = 'DATA_CONTA'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object QueryPresencas: TFDQuery
    Connection = conexao
    Left = 488
    Top = 160
  end
  object dsPresencas: TDataSource
    DataSet = QueryPresencas
    Left = 496
    Top = 216
  end
  object QueryTeste: TFDQuery
    Connection = conexao
    Left = 312
    Top = 384
  end
  object QueryRelEventos: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'select * from eventos ev'
      'left join inscricoes inc on inc.cod_evento = ev.cod_evento'
      'left join presencas pr on pr.cod_inscricao = inc.cod_inscricao'
      
        'left join participantes part on part.cod_part = inc.cod_particip' +
        'ante'
      'left join palestrantes pl on pl.cod_pal = ev.cod_palestrante_ev'
      'left join area_conhecimento ar on ar.cod_area = ev.cod_area')
    Left = 384
    Top = 384
    object QueryRelEventosCOD_EVENTO: TIntegerField
      FieldName = 'COD_EVENTO'
      Origin = 'COD_EVENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryRelEventosTITULO_EV: TStringField
      FieldName = 'TITULO_EV'
      Origin = 'TITULO_EV'
      Size = 200
    end
    object QueryRelEventosDATA_EV: TDateField
      FieldName = 'DATA_EV'
      Origin = 'DATA_EV'
    end
    object QueryRelEventosCOD_AREA: TIntegerField
      FieldName = 'COD_AREA'
      Origin = 'COD_AREA'
      Required = True
    end
    object QueryRelEventosVALOR_INSCRICAO_EV: TFMTBCDField
      FieldName = 'VALOR_INSCRICAO_EV'
      Origin = 'VALOR_INSCRICAO_EV'
      currency = True
      Precision = 18
      Size = 2
    end
    object QueryRelEventosNOME_PAL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_PAL'
      Origin = 'NOME_PAL'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
    object QueryRelEventosNOME_AREA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_AREA'
      Origin = 'NOME_AREA'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
    object QueryRelEventosCOD_PALESTRANTE_EV: TIntegerField
      FieldName = 'COD_PALESTRANTE_EV'
      Origin = 'COD_PALESTRANTE_EV'
      Required = True
    end
    object QueryRelEventosVAGAS_EV: TIntegerField
      FieldName = 'VAGAS_EV'
      Origin = 'VAGAS_EV'
    end
    object QueryRelEventosLOCAL_EV: TStringField
      FieldName = 'LOCAL_EV'
      Origin = 'LOCAL_EV'
      Size = 200
    end
    object QueryRelEventosDESCRICAO_EV: TStringField
      FieldName = 'DESCRICAO_EV'
      Origin = 'DESCRICAO_EV'
      Size = 250
    end
  end
  object QueryRelMedia: TFDQuery
    Connection = conexao
    SQL.Strings = (
      
        'select ev.cod_evento, ev.titulo_ev, ev.data_ev, ev.valor_inscric' +
        'ao_ev, ev.vagas_ev as Vagas, count(inc.cod_inscricao) as QTD_Ins' +
        'critos, count(pr.cod_presenca) as QTD_Presentes from eventos ev'
      'left join inscricoes inc on inc.cod_evento = ev.cod_evento'
      'left join presencas pr on pr.cod_inscricao = inc.cod_inscricao'
      
        'left join participantes part on part.cod_part = inc.cod_particip' +
        'ante'
      'left join palestrantes pl on pl.cod_pal = ev.cod_palestrante_ev'
      'group by 1,2,3,4,5'
      '')
    Left = 480
    Top = 384
    object QueryRelMediaCOD_EVENTO: TIntegerField
      FieldName = 'COD_EVENTO'
      Origin = 'COD_EVENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryRelMediaTITULO_EV: TStringField
      FieldName = 'TITULO_EV'
      Origin = 'TITULO_EV'
      Size = 200
    end
    object QueryRelMediaDATA_EV: TDateField
      FieldName = 'DATA_EV'
      Origin = 'DATA_EV'
    end
    object QueryRelMediaVALOR_INSCRICAO_EV: TFMTBCDField
      FieldName = 'VALOR_INSCRICAO_EV'
      Origin = 'VALOR_INSCRICAO_EV'
      Precision = 18
      Size = 2
    end
    object QueryRelMediaVAGAS: TIntegerField
      FieldName = 'VAGAS'
      Origin = 'NUM_PALESTRANTES_EV'
    end
    object QueryRelMediaQTD_INSCRITOS: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_INSCRITOS'
      Origin = 'QTD_INSCRITOS'
      ProviderFlags = []
      ReadOnly = True
    end
    object QueryRelMediaQTD_PRESENTES: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_PRESENTES'
      Origin = 'QTD_PRESENTES'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object SqlEvPart: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'select'
      'ev.cod_evento,'
      'ev.titulo_ev,'
      'part.nome_part,'
      'ev.data_ev,'
      
        'case when pr.cod_presenca is null then '#39#39' else '#39'Presente'#39'  end a' +
        's "Presenca"'
      'from eventos ev'
      'left join inscricoes inc on inc.cod_evento = ev.cod_evento'
      
        'left join participantes part on part.cod_part = inc.cod_particip' +
        'ante'
      'left join palestrantes pl on pl.cod_pal = ev.cod_palestrante_ev'
      'left join presencas pr on pr.cod_inscricao = inc.cod_inscricao')
    Left = 544
    Top = 384
    object SqlEvPartCOD_EVENTO: TIntegerField
      FieldName = 'COD_EVENTO'
      Origin = 'COD_EVENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SqlEvPartTITULO_EV: TStringField
      FieldName = 'TITULO_EV'
      Origin = 'TITULO_EV'
      Size = 200
    end
    object SqlEvPartNOME_PART: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_PART'
      Origin = 'NOME_PART'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
    object SqlEvPartDATA_EV: TDateField
      FieldName = 'DATA_EV'
      Origin = 'DATA_EV'
    end
    object SqlEvPartPresenca: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Presenca'
      Origin = '"Presenca"'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 8
    end
  end
  object QueryRelBalancete: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'select'
      'pag.cod_pagamento,'
      'pag.data_hora,'
      'pag.valor_pagamento,'
      'pag.cod_parcela,'
      'p.num_parcela,'
      'p.data_venc_parcela,'
      'f.tipo_conta,'
      'f.cod_conta,'
      'p.valor_parcela,'
      'p.valor_pago_parcela,'
      'f.valor_conta,'
      'sum(p.valor_parcela - p.valor_pago_parcela) as Valor_Restante,'
      
        'case p.situacao_parcela when '#39'0'#39' then '#39'PDNT'#39' when '#39'1'#39' then '#39'QTD'#39 +
        ' when '#39'2'#39' then '#39'CANC'#39' end as Situacao_parcela,'
      
        'CASE F.tipofavorecido WHEN '#39'PAR'#39' THEN Part.NOME_Part WHEN '#39'PAL'#39' ' +
        'THEN PAL.nome_pal WHEN '#39'EVE'#39' THEN FAV.nome_fav END AS FAVORECIDO' +
        ','
      'f.cod_evento, ev.titulo_ev'
      'from pagamentos pag'
      'join parcelas p on p.cod_parcela = pag.cod_parcela'
      'join financeiro f on f.cod_conta = p.cod_conta_parcela'
      
        'left JOIN PARTICIPANTES Part ON Part.COD_PART = F.COD_FAVORECIDO' +
        ' and f.tipofavorecido = '#39'PAR'#39
      
        'left JOIN favorecidos FAV ON FAV.cod_fav = F.cod_favorecido and ' +
        'f.tipofavorecido = '#39'EVE'#39
      
        'left JOIN palestrantes PAL ON PAL.cod_pal = F.cod_favorecido and' +
        ' f.tipofavorecido = '#39'PAL'#39
      'join eventos ev on ev.cod_evento = f.cod_evento'
      'group by 1,2,3,4,5,6,7,8,9,10,11,13,14,15,16')
    Left = 248
    Top = 216
    object QueryRelBalanceteCOD_PAGAMENTO: TIntegerField
      FieldName = 'COD_PAGAMENTO'
      Origin = 'COD_PAGAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryRelBalanceteDATA_HORA: TSQLTimeStampField
      FieldName = 'DATA_HORA'
      Origin = 'DATA_HORA'
    end
    object QueryRelBalanceteVALOR_PAGAMENTO: TFMTBCDField
      FieldName = 'VALOR_PAGAMENTO'
      Origin = 'VALOR_PAGAMENTO'
      currency = True
      Precision = 18
      Size = 2
    end
    object QueryRelBalanceteCOD_PARCELA: TIntegerField
      FieldName = 'COD_PARCELA'
      Origin = 'COD_PARCELA'
      Required = True
    end
    object QueryRelBalanceteNUM_PARCELA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NUM_PARCELA'
      Origin = 'NUM_PARCELA'
      ProviderFlags = []
      ReadOnly = True
    end
    object QueryRelBalanceteDATA_VENC_PARCELA: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATA_VENC_PARCELA'
      Origin = 'DATA_VENC_PARCELA'
      ProviderFlags = []
      ReadOnly = True
    end
    object QueryRelBalanceteTIPO_CONTA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO_CONTA'
      Origin = 'TIPO_CONTA'
      ProviderFlags = []
      ReadOnly = True
      Size = 1
    end
    object QueryRelBalanceteCOD_CONTA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_CONTA'
      Origin = 'COD_CONTA'
      ProviderFlags = []
      ReadOnly = True
    end
    object QueryRelBalanceteVALOR_PARCELA: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_PARCELA'
      Origin = 'VALOR_PARCELA'
      ProviderFlags = []
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 2
    end
    object QueryRelBalanceteVALOR_PAGO_PARCELA: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_PAGO_PARCELA'
      Origin = 'VALOR_PAGO_PARCELA'
      ProviderFlags = []
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 2
    end
    object QueryRelBalanceteVALOR_CONTA: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_CONTA'
      Origin = 'VALOR_CONTA'
      ProviderFlags = []
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 2
    end
    object QueryRelBalanceteSITUACAO_PARCELA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'SITUACAO_PARCELA'
      Origin = 'SITUACAO_PARCELA'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 4
    end
    object QueryRelBalanceteFAVORECIDO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FAVORECIDO'
      Origin = 'FAVORECIDO'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
    object QueryRelBalanceteCOD_EVENTO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_EVENTO'
      Origin = 'COD_EVENTO'
      ProviderFlags = []
      ReadOnly = True
    end
    object QueryRelBalanceteVALOR_RESTANTE: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_RESTANTE'
      Origin = 'VALOR_RESTANTE'
      ProviderFlags = []
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 2
    end
    object QueryRelBalanceteTITULO_EV: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TITULO_EV'
      Origin = 'TITULO_EV'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
  end
  object QueryRelCredDeb: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'SELECT'
      '  ev.titulo_ev,'
      
        '  SUM(CASE WHEN f.tipo_conta = '#39'R'#39' THEN pag.valor_pagamento ELSE' +
        ' 0 END) AS Credito,'
      
        '  SUM(CASE WHEN f.tipo_conta = '#39'P'#39' THEN pag.valor_pagamento ELSE' +
        ' 0 END) AS Debito,'
      
        '  SUM(CASE WHEN f.tipo_conta = '#39'R'#39' THEN pag.valor_pagamento ELSE' +
        ' -pag.valor_pagamento END) AS Saldo'
      'FROM'
      '  pagamentos pag'
      '  JOIN parcelas p ON p.cod_parcela = pag.cod_parcela'
      '  JOIN financeiro f ON f.cod_conta = p.cod_conta_parcela'
      '  JOIN eventos ev ON ev.cod_evento = f.cod_evento'
      'GROUP BY'
      '  ev.titulo_ev;')
    Left = 240
    Top = 312
    object QueryRelCredDebTITULO_EV: TStringField
      FieldName = 'TITULO_EV'
      Origin = 'TITULO_EV'
      Size = 200
    end
    object QueryRelCredDebCREDITO: TFMTBCDField
      FieldName = 'CREDITO'
      Origin = 'CREDITO'
      Precision = 18
      Size = 2
    end
    object QueryRelCredDebDEBITO: TFMTBCDField
      FieldName = 'DEBITO'
      Origin = 'DEBITO'
      Precision = 18
      Size = 2
    end
    object QueryRelCredDebSALDO: TFMTBCDField
      FieldName = 'SALDO'
      Origin = 'SALDO'
      Precision = 18
      Size = 2
    end
  end
  object QueryRelControlPresen: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'SELECT'
      '  part.cod_part,'
      '  part.nome_part,'
      '  ev.descricao_ev,'
      '  ev.data_ev,'
      '  inc.cod_inscricao,'
      
        '  CASE WHEN pc.data_presenca IS NOT NULL THEN '#39'Inscrito'#39' WHEN PC' +
        '.data_presenca IS NULL AND EV.data_ev < current_date THEN '#39'Falto' +
        'u'#39' ELSE '#39'Inscrito'#39' END AS Presenca,'
      '  pc.data_presenca,'
      '  f.situacao_conta,'
      '  f.valor_conta,'
      '  a.nome_area,'
      '  pal.nome_pal'
      'FROM'
      '  inscricoes inc'
      'LEFT JOIN presencas pc ON pc.cod_inscricao = inc.cod_inscricao'
      'JOIN eventos ev ON ev.cod_evento = inc.cod_evento'
      'JOIN palestrantes pal ON pal.cod_pal = ev.cod_palestrante_ev'
      'JOIN area_conhecimento a ON a.cod_area = ev.cod_area'
      'JOIN financeiro f ON f.cod_conta = inc.cod_conta'
      'JOIN participantes part ON part.cod_part = inc.cod_participante;')
    Left = 352
    Top = 312
    object QueryRelControlPresenCOD_PART: TIntegerField
      FieldName = 'COD_PART'
      Origin = 'COD_PART'
      Required = True
    end
    object QueryRelControlPresenNOME_PART: TStringField
      FieldName = 'NOME_PART'
      Origin = 'NOME_PART'
      Size = 200
    end
    object QueryRelControlPresenDESCRICAO_EV: TStringField
      FieldName = 'DESCRICAO_EV'
      Origin = 'DESCRICAO_EV'
      Size = 250
    end
    object QueryRelControlPresenDATA_EV: TDateField
      FieldName = 'DATA_EV'
      Origin = 'DATA_EV'
    end
    object QueryRelControlPresenCOD_INSCRICAO: TIntegerField
      FieldName = 'COD_INSCRICAO'
      Origin = 'COD_INSCRICAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryRelControlPresenDATA_PRESENCA: TSQLTimeStampField
      FieldName = 'DATA_PRESENCA'
      Origin = 'DATA_PRESENCA'
    end
    object QueryRelControlPresenSITUACAO_CONTA: TStringField
      FieldName = 'SITUACAO_CONTA'
      Origin = 'SITUACAO_CONTA'
      Size = 1
    end
    object QueryRelControlPresenVALOR_CONTA: TFMTBCDField
      FieldName = 'VALOR_CONTA'
      Origin = 'VALOR_CONTA'
      currency = True
      Precision = 18
      Size = 2
    end
    object QueryRelControlPresenNOME_AREA: TStringField
      FieldName = 'NOME_AREA'
      Origin = 'NOME_AREA'
      Size = 200
    end
    object QueryRelControlPresenNOME_PAL: TStringField
      FieldName = 'NOME_PAL'
      Origin = 'NOME_PAL'
      Size = 200
    end
    object QueryRelControlPresenPRESENCA: TStringField
      FieldName = 'PRESENCA'
      Origin = 'PRESENCA'
      Size = 25
    end
  end
end
