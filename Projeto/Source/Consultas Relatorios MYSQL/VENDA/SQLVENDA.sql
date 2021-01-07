select  LPAD(v.id, 4, '0') as id, DATE_FORMAT( v.data_venda, '%d/%m/%Y' ) AS data_compra,
LPAD(v.lote, 4, '0') as lote, pcl.nome as cliente, cb.conta, LPAD(v.quantidade_cbs, 4, '0') as quantidade_cbs,
v.valortotal_venda, v.valorporcbs_venda, ia.idade_animal, 
case v.sexo_animal
when 1 then 'FÊMEA'
when 2 then 'MACHO'
else 'MISTO' end sexo_animal, rc.raca, v.etiqueta, tc.tipo_caminhao, v.placa_caminhao, pm.nome as motorista,
v.valortotal_frete, v.valorporcbs_frete, pc.nome as corretor, v.valortotal_comissao, v.valorporcbs_comissao,
v.valortotal_animais, v.valorporcbs_animais, v.descricao
from vendas v
left outer join  tipo_caminhao tc on (v.tipo_caminhao = tc.id)
left outer join raca_animal rc on (v.raca_animal = rc.id)
left outer join pessoas pcl on (v.cliente = pcl.id)
left outer join pessoas pm on (v.motorista = pm.id)
left outer join pessoas pc on (v.corretor = pc.id)
left outer join lotes l on (v.lote = l.id)
left outer join idade_animal ia on (v.idade_animal = ia.id)
left outer join contas_bancarias cb on (v.conta_bancaria = cb.id)
