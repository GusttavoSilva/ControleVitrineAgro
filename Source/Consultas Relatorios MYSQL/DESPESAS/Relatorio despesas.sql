select LPAD(d.id, 4, '0') as id, DATE_FORMAT( d.data_despesa, '%d/%m/%Y' ) AS data, C.conta,   d.descricao ,  concat(LPAD(p.id, 4, '0'), ' - ', p.nome) as pessoa ,
CASE d.tipo_despesa
    WHEN 1 THEN 'VITRINE'
    WHEN 2 THEN 'ESCRITÓRIO'
    WHEN 3 THEN 'FUNCIONÁRIO'
    WHEN 4 THEN 'GADO'
    ELSE 'OUTROS'
END as tipo_despesa,  d.valor
from despesas d
left outer join pessoas p on (d.id_pessoa = p.id)
left outer join contas_bancarias c on (d.id_conta = c.Id)
left outer join lotes l on (d.id_lote = l.Id)
/*
where DATE_FORMAT( d.data_despesa, '%d/%m/%Y' ) BETWEEN  '02/01/2020' and  '03/01/2020' 

where p.nome = 'ANA CARLA OLIVEIRA' and DATE_FORMAT( d.data_despesa, '%d/%m/%Y' ) BETWEEN  '02/01/2020' and  '03/01/2020'

WHERE c.conta = '17093-3' and DATE_FORMAT( d.data_despesa, '%d/%m/%Y' ) BETWEEN  '02/01/2020' and  '03/01/2020'

where tipo_despesa = '1' and DATE_FORMAT( d.data_despesa, '%d/%m/%Y' ) BETWEEN  '02/01/2020' and  '03/01/2020'
*/











