-- 1)
SELECT COUNT(*)
FROM especialidade;

-- 2)
SELECT COUNT(*)
FROM paciente p
WHERE date_part('year', p.data_nasc) < 2000;

SELECT COUNT(*)
FROM paciente p
WHERE EXTRACT('year' FROM p.data_nasc) < 2000;

-- 3)
SELECT COUNT(*)
FROM medico m
WHERE m.num_registro IS NOT NULL;

-- 4)
SELECT c.status, COUNT(*)
FROM consulta c
GROUP BY c.status
ORDER BY COUNT(*) DESC;

-- 5)
SELECT e.id, e.nome, COUNT(*)
FROM especialidade e
JOIN tem_especialidade t ON (e.id = t.id_espec)
GROUP BY e.id
ORDER BY COUNT(*) DESC, e.nome ASC;

-- 6)
SELECT COUNT(*)
FROM consulta c
WHERE DATE(c.dh_agendamento) = '10/05/2021';

-- 7)
SELECT COUNT(*)
FROM consulta c
JOIN paciente p ON (c.id_paciente = p.id)
WHERE DATE(c.dh_agendamento) < p.data_nasc;

-- 8)
SELECT DATE(c.dh_agendamento), COUNT(*)
FROM consulta c
GROUP BY DATE(c.dh_agendamento)
ORDER BY DATE(c.dh_agendamento) ASC;

-- 9)
SELECT e.id, e.nome, COUNT(e.id)
FROM especialidade e
JOIN tem_especialidade t ON (e.id = t.id_espec)
GROUP BY e.id
ORDER BY COUNT(e.id) DESC, e.id ASC;

-- 10)
SELECT e.id, e.nome, COUNT(e.id)
FROM especialidade e
JOIN tem_especialidade t ON (e.id = t.id_espec)
GROUP BY e.id
HAVING COUNT(e.id) >= 2
ORDER BY COUNT(e.id) DESC, e.id ASC;

-- 11)
SELECT m.id, m.nome, COUNT(t.id_medico)
FROM medico m
JOIN tem_especialidade t ON (m.id = t.id_medico)
GROUP BY m.id
ORDER BY COUNT(t.id_medico) DESC, m.nome ASC;

-- 12)
SELECT m.id, m.nome, COUNT(t.id_medico)
FROM medico m
JOIN tem_especialidade t ON (m.id = t.id_medico)
GROUP BY m.id
HAVING COUNT(t.id_medico) >= 2
ORDER BY COUNT(t.id_medico) DESC, m.nome ASC;