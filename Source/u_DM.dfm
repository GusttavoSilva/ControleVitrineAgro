object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 293
  Width = 310
  object QLog: TFDQuery
    Connection = FDConnection
    Left = 224
    Top = 72
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 48
    Top = 88
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 88
    Top = 184
  end
  object QAux: TFDQuery
    Connection = FDConnection
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = 30000
    SQL.Strings = (
      
        'select LPAD(d.id, 4, '#39'0'#39') as id, DATE_FORMAT( d.data_despesa, '#39'%' +
        'd/%m/%Y'#39' ) AS data, C.conta,   d.descricao ,  concat(LPAD(p.id, ' +
        '4, '#39'0'#39'), '#39' - '#39', p.nome) as pessoa ,'
      'CASE d.tipo_despesa'
      '    WHEN  1 THEN '#39'VITRINE'#39
      '    WHEN 2 THEN '#39'ESCRIT'#211'RIO'#39
      '    WHEN 3 THEN '#39'FUNCION'#193'RIO'#39
      '    WHEN 4 THEN '#39'GADO'#39
      '    ELSE '#39'OUTROS'#39
      'END as tipo_despesa,  d.valor'
      'from despesas d'
      'left outer join pessoas p on (d.id_pessoa = p.id)'
      'left outer join contas_bancarias c on (d.id_conta = c.Id)'
      'left outer join lotes l on (d.id_lote = l.Id)')
    Left = 216
    Top = 8
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection
    Left = 200
    Top = 120
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'Server='
      'Port='
      'Compress='
      'UseSSL='
      'Pooled='
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 32
    Top = 24
  end
end
