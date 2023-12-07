/*Todos os selects*/
SELECT * FROM aluno;
SELECT * FROM curso;
SELECT * FROM disciplina;
SELECT * FROM historico;
SELECT * FROM faculdade;
SELECT * FROM prerequisito;
SELECT * FROM professor;
SELECT * FROM turma;

-- Questão 1
--SELECT cod_curso, nome_curso, nome_prof
SELECT c.nome_curso
FROM curso As c
	JOIN faculdade As f ON c.campus = f.cod_uni
	JOIN professor As p ON f.cod_uni = p.alocacao
WHERE f.nome = 'Campus Três Lagoas'
GROUP BY c.nome_curso
HAVING count(*) < 10;

--Questão 2
SELECT d.cod_disc, d.nome_disciplina, t.cod_turma, t.semestre
FROM disciplina As d
	JOIN curso As c ON d.curso = c.cod_curso
	JOIN turma As t ON d.cod_disc = t.disc
WHERE c.nome_curso = 'Sistemas de Informação' and t.ano = 2015 and t.semestre = 1
EXCEPT 
SELECT d.cod_disc, d.nome_disciplina, t.cod_turma, t.semestre
FROM disciplina As d
	JOIN curso As c ON d.curso = c.cod_curso
	JOIN turma As t ON d.cod_disc = t.disc
WHERE c.nome_curso = 'Sistemas de Informação' and t.ano = 2015 and t.semestre = 2;

--Questão 3
SELECT d1.nome_disciplina As disciplina, d2.nome_disciplina As prerequesito
FROM disciplina As d1
	JOIN prerequisito As pr ON d1.cod_disc = pr.cod_disciplina
	JOIN disciplina As d2 ON pr.cod_prereq = d2.cod_disc;

--Questão 4
--a)
CREATE OR REPLACE FUNCTION cadastrar_aluno(rga integer, disciplina varchar) 
RETURNS void As $$
DECLARE
	sem integer;
	codigo_turma integer;
BEGIN 
	IF(EXTRACT('MONTH' FROM now()) < 7) THEN
		sem := 1;
	ELSE 
		sem := 2;
	END IF;
	
	SELECT t.cod_turma INTO codigo_turma
	FROM disciplina As d
		JOIN turma As t ON d.cod_disc = t.disc
	WHERE d.nome_disciplina = disciplina and t.ano = EXTRACT('YEAR' FROM now()) and t.semestre = sem;
	
	INSERT INTO historico (cod_aluno, cod_turma, resultado)
	VALUES (rga, codigo_turma, 'MA');
END;
$$ language 'plpgsql';

--b)
SELECT cadastrar_aluno(7430002, 'Banco de Dados II');
SELECT cadastrar_aluno(7430002, 'Engenharia de Software');
SELECT cadastrar_aluno(7430002, 'Estruturas de Dados e Programação I');

SELECT a.rga, a.academico, d.nome_disciplina, t.ano
FROM aluno As a
	JOIN historico As h ON a.rga = h.cod_aluno
	JOIN turma As t ON h.cod_turma = t.cod_turma
	JOIN disciplina As d ON t.disc = d.cod_disc
WHERE a.academico = 'Joao da Silva';

--Questão 5
--a)
DROP FUNCTION calcula_resultado(integer);

CREATE OR REPLACE FUNCTION calcula_resultado(cod_tur integer)
RETURNS void As $$ 
DECLARE 
	limite_faltas integer;
	situacao varchar;
	reg RECORD;
	reg_aluno RECORD;
BEGIN 
	
	FOR reg IN SELECT cod_turma, cod_aluno  FROM historico LOOP
		IF(cod_tur = reg.cod_turma) THEN
			SELECT d.ch, h.media_aproveitamento, h.total_faltas, h.cod_turma INTO reg_aluno
			FROM disciplina As d
				JOIN turma As t ON d.cod_disc = t.disc
				JOIN historico As h ON t.cod_turma = h.cod_turma
				JOIN aluno As a ON a.rga = h.cod_aluno
			WHERE a.rga = reg.cod_aluno;

			limite_faltas := (reg_aluno.ch * 25) / 100;

			IF(reg_aluno.media_aproveitamento is null or reg_aluno.total_faltas is null) THEN 
				situacao := 'MA';
			ELSE 
				IF(reg_aluno.media_aproveitamento >= 6 and reg_aluno.total_faltas < limite_faltas) THEN
					situacao := 'AP';
				ELSE 
					situacao := 'RP';
				END IF;
			END IF;

			UPDATE historico
			SET resultado = situacao
			WHERE cod_aluno = reg.cod_aluno and cod_turma = reg_aluno.cod_turma;
		END IF;
	END LOOP;
END;
$$ language 'plpgsql';

--b)
CREATE OR REPLACE PROCEDURE calcula_semestres() 
AS $$
DECLARE
	reg RECORD;
BEGIN 
	FOR reg IN SELECT cod_turma FROM turma LOOP
		PERFORM calcula_resultado(reg.cod_turma);
	END LOOP;
END;
$$ language 'plpgsql';

CALL calcula_semestres();

SELECT * FROM historico;
SELECT * FROM turma;