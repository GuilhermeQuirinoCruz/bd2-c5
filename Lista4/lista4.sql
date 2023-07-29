-- 1)
SELECT p.nome, p.data_nasc
FROM paciente p
INNER JOIN consulta c ON (p.id = c.id_paciente)
WHERE c.id = 1;

-- 2)
SELECT m.num_registro, m.nome
FROM medico m
INNER JOIN consulta c ON (m.id = c.id_medico)
WHERE c.id = 2;

-- 3)
SELECT c.*
FROM consulta c
INNER JOIN medico m ON (c.id_medico = m.id)
WHERE m.num_registro = 1234
ORDER BY c.dh_agendamento DESC;

-- 4)
SELECT e.id, e.nome, e.descricao
FROM especialidade e
INNER JOIN tem_especialidade t ON (e.id = t.id_espec)
INNER JOIN medico m ON (t.id_medico = m.id)
WHERE m.num_registro = 5678
ORDER BY e.nome ASC;

-- 5)
SELECT m.num_registro, m.nome
FROM medico m
INNER JOIN tem_especialidade t ON (m.id = t.id_medico)
INNER JOIN especialidade e ON (t.id_espec = e.id)
WHERE e.nome = 'Pediatria';

-- 6)
SELECT DISTINCT p.id, p.nome, p.data_nasc
FROM paciente p
INNER JOIN consulta c ON (p.id = c.id_paciente)
INNER JOIN medico m ON (c.id_medico = m.id)
INNER JOIN tem_especialidade t ON (m.id = t.id_medico)
INNER JOIN especialidade e ON (t.id_espec = e.id)
WHERE e.nome = 'Pediatria';

-- 7)
SELECT DISTINCT m.num_registro, m.nome
FROM medico m
LEFT OUTER JOIN consulta c ON (m.id = c.id_medico)
WHERE c.id IS NOT NULL;

SELECT m.num_registro, m.nome
FROM medico m
EXCEPT
SELECT m.num_registro, m.nome
FROM medico m
LEFT OUTER JOIN consulta c ON (m.id = c.id_medico)
WHERE c.id IS NULL;

-- 8)
SELECT m.num_registro, m.nome
FROM medico m
LEFT OUTER JOIN consulta c ON (m.id = c.id_medico)
WHERE c.id IS NULL;

-- 9)
SELECT DISTINCT m.num_registro, m.nome
FROM medico m
LEFT OUTER JOIN tem_especialidade t ON (m.id = t.id_medico)
WHERE t.id IS NOT NULL;

SELECT DISTINCT m.num_registro, m.nome
FROM medico m
INNER JOIN tem_especialidade t ON (m.id = t.id_medico);

-- 10)
SELECT m.num_registro, m.nome
FROM medico m
LEFT OUTER JOIN tem_especialidade t ON (m.id = t.id_medico)
WHERE t.id IS NULL;

SELECT m.num_registro, m.nome
FROM medico m
EXCEPT
SELECT DISTINCT m.num_registro, m.nome
FROM medico m
INNER JOIN tem_especialidade t ON (m.id = t.id_medico);