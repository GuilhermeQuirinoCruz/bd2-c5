-- 1)
SELECT *
FROM paciente
WHERE nome LIKE 'J%';

-- 2)
SELECT *
FROM paciente
WHERE nome SIMILAR TO 'A%';

-- 3)
SELECT *
FROM paciente
WHERE nome LIKE '%José%' OR nome LIKE '%João%';

-- 4)
SELECT *
FROM paciente
WHERE nome SIMILAR TO '%(José|João)%';

-- 5)
SELECT nome, data_nasc
FROM paciente
WHERE date_part('year', data_nasc) = 1990;

-- 6)
SELECT DISTINCT status
FROM consulta;

-- 7)
SELECT *
FROM consulta
WHERE observacao IS NULL;

-- 8)
SELECT *
FROM consulta
WHERE observacao IS NULL
ORDER BY id_medico ASC, id DESC;

-- 9)
SELECT *
FROM paciente
ORDER BY nome ASC
LIMIT 5;

-- 10)
SELECT *
FROM consulta
ORDER BY dh_agendamento ASC
LIMIT 1;

-- 11)
SELECT *
FROM consulta
ORDER BY dh_agendamento ASC
LIMIT 4
OFFSET 1;