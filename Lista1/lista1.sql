-- 1)
-- a)
UPDATE paciente
SET nome = 'Maria Lívia'
WHERE id = 1;

-- b)
UPDATE medico
SET data_nasc = '24/10/1998'
WHERE id = 3;

-- c)
DELETE FROM consulta
WHERE id = 3;

-- 2)
-- a)
SELECT *
FROM medico;

-- b)
SELECT id, nome
FROM especialidade;

-- c)
SELECT nome, data_nasc
FROM paciente
WHERE data_nasc < '01/01/1990';

-- d)
SELECT nome, num_registro
FROM medico
WHERE num_registro BETWEEN 10000 AND 19999;

-- e)
SELECT id, id_paciente, dh_agendamento
FROM consulta
WHERE id_medico = 1;