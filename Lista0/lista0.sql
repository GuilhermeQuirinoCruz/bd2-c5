-- 1)
CREATE DATABASE bd_clinica;
-- \c bd_clinica

-- 2)
CREATE TABLE especialidade(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100),
	descricao VARCHAR(500)
);

CREATE TABLE medico(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100),
	num_registro INT,
	data_nasc DATE
);

CREATE TABLE paciente(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100),
	data_nasc DATE,
	endereco VARCHAR(200)
);

CREATE TABLE tem_especialidade(
	id SERIAL PRIMARY KEY,
	id_espec INT,
	id_medico INT,
	FOREIGN KEY (id_espec) REFERENCES especialidade(id),
	FOREIGN KEY (id_medico) REFERENCES medico(id)
);

CREATE TABLE consulta(
	id SERIAL PRIMARY KEY,
	id_medico INT,
	id_paciente INT,
	dh_agendamento TIMESTAMP,
	status VARCHAR(100),
	observacao VARCHAR(1000),
	FOREIGN KEY (id_medico) REFERENCES medico(id),
	FOREIGN KEY (id_paciente) REFERENCES paciente(id)
);

-- 3)
-- especialidade
INSERT INTO especialidade (nome, descricao)
VALUES ('Pediatria', 'Assistência à criança e ao adolescente');

INSERT INTO especialidade (nome, descricao)
VALUES ('Radiologia', 'Utiliza as radiações para a realização de diagnósticos, controle e tratamento de doenças');

INSERT INTO especialidade (nome, descricao)
VALUES ('Cardiologia', 'Diagnóstico e tratamento das doenças que acometem o coração bem como os outros componentes do sistema circulatório');

INSERT INTO especialidade (nome, descricao)
VALUES ('Dermatologia', 'Procedimentos clínicos, cirúrgicos e cosmiátricos');

INSERT INTO especialidade (nome, descricao)
VALUES ('Endoscopia', 'Diagnóstico e tratamento das doenças do aparelho gastrointestinal, vias biliares e pâncreas');

INSERT INTO especialidade (nome, descricao)
VALUES ('Infectologia', 'Doenças relacionadas a vírus, bactérias, fungos, entre outras');

INSERT INTO especialidade (nome, descricao)
VALUES ('Oftalmologia', 'Tratamento das doenças relacionadas ao olho, à refração e aos olhos e seus anexos');

INSERT INTO especialidade (nome, descricao)
VALUES ('Patologia', 'Exame de fluidos e tecidos corporais; necropsias e testes de laboratório');

INSERT INTO especialidade (nome, descricao)
VALUES ('Psiquiatria', 'Diagnóstico e tratamento dos Transtornos Mentais e de Comportamento');

INSERT INTO especialidade (nome, descricao)
VALUES ('Angiologia', 'Tratamento clínico das doenças que acometem vasos sanguíneos e vasos linfáticos');

-- medico
INSERT INTO medico (nome, num_registro, data_nasc)
VALUES ('Miguel', 1234, '30/10/2000');

INSERT INTO medico (nome, num_registro, data_nasc)
VALUES ('Helena', 5678, '27/09/1999');

INSERT INTO medico (nome, num_registro, data_nasc)
VALUES ('Sofia', 9012, '24/08/1998');

INSERT INTO medico (nome, num_registro, data_nasc)
VALUES ('José', NULL, NULL);

INSERT INTO medico (nome, num_registro, data_nasc)
VALUES ('Ana', 1324, '15/08/1998');

INSERT INTO medico (nome, num_registro, data_nasc)
VALUES ('Pedro', 1665, '19/07/1995');

INSERT INTO medico (nome, num_registro, data_nasc)
VALUES ('Luís', 9834, '02/10/1983');

INSERT INTO medico (nome, num_registro, data_nasc)
VALUES ('Horácio', 7349, '05/01/1968');

INSERT INTO medico (nome, num_registro, data_nasc)
VALUES ('Jorge', 5623, '28/09/1999');

INSERT INTO medico (nome, num_registro, data_nasc)
VALUES ('Renata', 9760, '30/12/2001');

-- paciente
INSERT INTO paciente (nome, data_nasc, endereco)
VALUES ('Júlia', '15/06/1990', 'Rua 9 de Julho, 100');

INSERT INTO paciente (nome, data_nasc, endereco)
VALUES ('José', '16/07/1991', 'Rua 15 de Novembro, 76');

INSERT INTO paciente (nome, data_nasc, endereco)
VALUES ('Alice', '17/08/1992', 'Rua 12 de Outubro, 11');

INSERT INTO paciente (nome, data_nasc, endereco)
VALUES ('Cícero', '15/06/2000', NULL);

INSERT INTO paciente (nome, data_nasc, endereco)
VALUES ('Marta', '18/08/1992', 'Rua das Flores, 90');

INSERT INTO paciente (nome, data_nasc, endereco)
VALUES ('Rogério', '02/09/1984', 'Rua Sexta, 299');

INSERT INTO paciente (nome, data_nasc, endereco)
VALUES ('Lucas', '17/01/2005', 'Rua Porto, 15');

INSERT INTO paciente (nome, data_nasc, endereco)
VALUES ('Thiago', '05/05/2017', 'Rua dos Cordeiros, 67');

INSERT INTO paciente (nome, data_nasc, endereco)
VALUES ('Fabiana', '28/04/2003', 'Rua Reta, 502');

INSERT INTO paciente (nome, data_nasc, endereco)
VALUES ('Patrícia', '23/10/1999', 'Rua Torta, 18');

-- tem_especialidade
INSERT INTO tem_especialidade (id_espec, id_medico)
VALUES (1, 1);

INSERT INTO tem_especialidade (id_espec, id_medico)
VALUES (1, 2);

INSERT INTO tem_especialidade (id_espec, id_medico)
VALUES (2, 2);

INSERT INTO tem_especialidade (id_espec, id_medico)
VALUES (3, 2);

INSERT INTO tem_especialidade (id_espec, id_medico)
VALUES (3, 3);

INSERT INTO tem_especialidade (id_espec, id_medico)
VALUES (6, 4);

INSERT INTO tem_especialidade (id_espec, id_medico)
VALUES (8, 4);

INSERT INTO tem_especialidade (id_espec, id_medico)
VALUES (9, 5);

INSERT INTO tem_especialidade (id_espec, id_medico)
VALUES (2, 6);

INSERT INTO tem_especialidade (id_espec, id_medico)
VALUES (5, 6);

INSERT INTO tem_especialidade (id_espec, id_medico)
VALUES (6, 6);

INSERT INTO tem_especialidade (id_espec, id_medico)
VALUES (3, 7);

INSERT INTO tem_especialidade (id_espec, id_medico)
VALUES (10, 7);

INSERT INTO tem_especialidade (id_espec, id_medico)
VALUES (1, 8);

INSERT INTO tem_especialidade (id_espec, id_medico)
VALUES (7, 8);

INSERT INTO tem_especialidade (id_espec, id_medico)
VALUES (9, 8);

INSERT INTO tem_especialidade (id_espec, id_medico)
VALUES (3, 9);

INSERT INTO tem_especialidade (id_espec, id_medico)
VALUES (6, 9);

INSERT INTO tem_especialidade (id_espec, id_medico)
VALUES (4, 10);

INSERT INTO tem_especialidade (id_espec, id_medico)
VALUES (9, 10);

-- consulta
INSERT INTO consulta (id_medico, id_paciente, dh_agendamento, status, observacao)
VALUES (1, 1, '10/08/2020 08:00:00', 'Finalizado', 'Nenhuma');

INSERT INTO consulta (id_medico, id_paciente, dh_agendamento, status, observacao)
VALUES (1, 2, '11/08/2020 14:00:00', 'Finalizado', 'Nenhuma');

INSERT INTO consulta (id_medico, id_paciente, dh_agendamento, status, observacao)
VALUES (2, 3, '17/08/2020 10:00:00', 'Agendado', 'Nenhuma');

INSERT INTO consulta (id_medico, id_paciente, dh_agendamento, status, observacao)
VALUES (6, 4, '11/08/2020 13:00:00', 'Finalizado', 'Nenhuma');

INSERT INTO consulta (id_medico, id_paciente, dh_agendamento, status, observacao)
VALUES (5, 5, '11/08/2020 09:15:00', 'Finalizado', 'Nenhuma');

INSERT INTO consulta (id_medico, id_paciente, dh_agendamento, status, observacao)
VALUES (6, 4, '25/08/2020 15:00:00', 'Agendado', 'Retorno de exames');

INSERT INTO consulta (id_medico, id_paciente, dh_agendamento, status, observacao)
VALUES (10, 7, '12/08/2020 16:00:00', 'Finalizado', 'Nenhuma');

INSERT INTO consulta (id_medico, id_paciente, dh_agendamento, status, observacao)
VALUES (8, 8, '20/08/2020 10:30:00', 'Cancelado', 'Nenhuma');

INSERT INTO consulta (id_medico, id_paciente, dh_agendamento, status, observacao)
VALUES (7, 9, '20/08/2020 11:00:00', 'Agendado', 'Nenhuma');

INSERT INTO consulta (id_medico, id_paciente, dh_agendamento, status, observacao)
VALUES (3, 10, '21/08/2020 08:45:00', 'Agendado', 'Nenhuma');

-- 4)
-- a)
SELECT *
FROM paciente;

-- b)
SELECT *
FROM especialidade;

-- c)
SELECT *
FROM medico;

-- d)
SELECT *
FROM consulta;