-- 1)
SELECT p.nome, p.data_nasc
FROM paciente p
WHERE p.id IN (SELECT c.id_paciente
				FROM consulta c
				WHERE c.id = 1);

-- 2)
SELECT p.nome, p.data_nasc
FROM paciente p
WHERE EXISTS (SELECT c.id_paciente
				FROM consulta c
				WHERE c.id = 1 AND p.id = c.id_paciente);

-- 3)
SELECT *
FROM consulta c
WHERE c.id_medico IN (SELECT m.id
						FROM medico m
						WHERE m.num_registro = 1234)
ORDER BY c.dh_agendamento DESC;

-- 4)
SELECT e.id, e.nome, e.descricao
FROM especialidade e
WHERE EXISTS (SELECT t.id_espec
				FROM tem_especialidade t
				WHERE t.id_espec = e.id AND EXISTS (SELECT m.id
													FROM medico m
													WHERE m.id = t.id_medico AND m.num_registro = 5678))
ORDER BY e.nome ASC, e.id ASC;

/*
SELECT e.id, e.nome, e.descricao
FROM especialidade e
WHERE e.id IN (SELECT t.id_espec
				FROM tem_especialidade t
				WHERE t.id_medico IN (SELECT m.id
										FROM medico m
										WHERE m.num_registro = 5678))
ORDER BY e.nome ASC, e.id ASC;
*/

-- 5)
SELECT m.num_registro, m.nome
FROM medico m
WHERE m.id IN (SELECT t.id_medico
				FROM tem_especialidade t
				WHERE t.id_espec IN (SELECT e.id
									FROM especialidade e
									WHERE e.nome = 'Pediatria'))
ORDER BY m.nome ASC, m.num_registro ASC;

-- 6)
SELECT DISTINCT p.id, p.nome, p.data_nasc
FROM paciente p
WHERE EXISTS (SELECT c.id_paciente
			FROM consulta c
			WHERE p.id = c.id_paciente AND EXISTS (SELECT m.id
													FROM medico m
													WHERE c.id_medico = m.id AND EXISTS (SELECT t.id_medico
																						FROM tem_especialidade t
																						WHERE m.id = t.id_medico AND EXISTS (SELECT e.id
																															FROM especialidade e
																															WHERE t.id_espec = e.id AND e.nome = 'Pediatria'))))
ORDER BY p.nome ASC, p.id ASC;
																															
-- 7)
SELECT DISTINCT m.num_registro, m.nome
FROM medico m
WHERE m.id IN (SELECT c.id_medico
				FROM consulta c)
ORDER BY m.nome ASC, m.num_registro ASC;

/*
SELECT m.num_registro, m.nome
FROM medico m
WHERE EXISTS (SELECT c.id_medico
				FROM consulta c
				WHERE c.id_medico = m.id)
ORDER BY m.nome ASC, m.num_registro ASC;
*/
-- 8)
SELECT DISTINCT m.num_registro, m.nome
FROM medico m
WHERE EXISTS (SELECT t.id_medico
			FROM tem_especialidade t
			WHERE m.id = t.id_medico)
ORDER BY m.nome ASC, m.num_registro ASC;

-- 9)
SELECT *
FROM paciente p
WHERE p.data_nasc > ANY (SELECT p.data_nasc
						FROM paciente p
						WHERE p.id = 1);

-- 10)
SELECT *
FROM medico m
WHERE m.num_registro < ANY (SELECT m.num_registro
							FROM medico m
							WHERE m.id = 2);

-- 11)
SELECT *
FROM medico m1
WHERE m1.num_registro <= ALL (SELECT m2.num_registro
							FROM medico m2
							WHERE m2.num_registro IS NOT NULL);

-- 12)
SELECT *
FROM paciente p1
WHERE p1.data_nasc <= ALL (SELECT p2.data_nasc
							FROM paciente p2
							WHERE data_nasc IS NOT NULL);