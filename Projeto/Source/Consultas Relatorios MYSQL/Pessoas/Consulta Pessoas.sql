select  LPAD(p.id, 4, '0') as id, p.nome, p.cpf_pessoa,p.telefone,  
case p.tipo_pessoa 
  WHEN 1 THEN 'FÍSICA'
    ELSE 'JURÍDICA'
END as tipo_pessoa,
case
  WHEN p.funcionario = 1 THEN 'FUNCIONARIO'
   WHEN p.fornecedor = 1 THEN 'FORNECEDOR'
    WHEN p.CLIENTE = 1 THEN 'CLIENTE'   
    ELSE ''
END as funcao_pessoa, 
 concat(m.Nome, ' - ',  m.Uf) as municipio
from pessoas p
left outer join municipio m on (p.cidade = m.Id)
/*
where p.funcionario = 1
where p.fornecedor = 1 
where p.CLIENTE = 1
where p.nome = ''
where p.tipo_pessoa = 1,2 
*/






