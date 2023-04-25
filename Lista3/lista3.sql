-- 1)
SELECT nome
FROM medico;

-- 2)
SELECT nome
FROM paciente;

-- 3)
SELECT nome
FROM medico
UNION ALL
SELECT nome
FROM paciente;

-- 4)
SELECT nome
FROM medico
UNION ALL
SELECT nome
FROM paciente
ORDER BY nome ASC;

-- 5)
SELECT id
FROM paciente;

-- 6)
SELECT id
FROM paciente
INTERSECT
SELECT id_paciente
FROM consulta;

-- 7)
SELECT id
FROM paciente
EXCEPT
SELECT id_paciente
FROM consulta;

-- 8)
SELECT id
FROM medico
INTERSECT
SELECT id_medico
FROM tem_especialidade;

-- 9)
SELECT id
FROM medico
INTERSECT
SELECT id_medico
FROM consulta;

-- 10)
SELECT id
FROM medico
INTERSECT
SELECT id_medico
FROM tem_especialidade
INTERSECT
SELECT id_medico
FROM consulta;

-- 11)
SELECT id
FROM medico
INTERSECT
SELECT id_medico
FROM tem_especialidade
EXCEPT
SELECT id_medico
FROM consulta;