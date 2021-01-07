select  LPAD(c.id, 4, '0') as id, DATE_FORMAT( c.data_compra, '%d/%m/%Y' ) AS data_compra,
LPAD(c.lote, 4, '0') as lote, pf.nome as fornecedor, cb.conta, LPAD(c.quantidade_cbs, 4, '0') as quantidade_cbs,
c.valortotal_compra, c.valorporcbs_compra, ia.idade_animal, 
case c.sexo_animal
when 1 then 'FÊMEA'
when 2 then 'MACHO'
else 'MISTO' end sexo_animal, rc.raca, c.etiqueta, tc.tipo_caminhao, c.placa_caminhao, pm.nome as motorista,
c.valortotal_frete, c.valorporcbs_frete, pc.nome as corretor, c.valortotal_comissao, c.valorporcbs_comissao,
c.valortotal_animais, c.valorporcbs_animais, c.descricao
from compras c
left outer join  tipo_caminhao tc on (c.tipo_caminhao = tc.id)
left outer join raca_animal rc on (c.raca_animal = rc.id)
left outer join pessoas pf on (c. fornecedor = pf.id)
left outer join pessoas pm on (c.motorista = pm.id)
left outer join pessoas pc on (c.corretor = pc.id)
left outer join lotes l on (c.lote = l.id)
left outer join idade_animal ia on (c.idade_animal = ia.id)
left outer join contas_bancarias cb on (c.conta_bancaria = cb.id)
where c.id = 22

