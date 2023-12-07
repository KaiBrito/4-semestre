-- Select de todas as tabelas
SELECT * FROM departamento;
SELECT * FROM dependente;
SELECT * FROM depto_local;
SELECT * FROM funcionario;
SELECT * FROM notificacao_log;
SELECT * FROM projeto;
SELECT * FROM trabalha_em;

-- 1- Altere a tabela de departamento para incluir um campo 'qtd_func' e faça uma store procedure para calcular
-- quantos funcionarios um departamento para calcular este valor a ser preenchido

-- Criando a nova coluna 'qtd_func'
ALTER TABLE departamento
ADD qtd_func integer;

CREATE OR REPLACE PROCEDURE conta_funcs() 
As $$
DECLARE 
	reg RECORD;
	depto_func RECORD;
BEGIN
	FOR reg IN SELECT * FROM departamento LOOP
		SELECT f.depto, COUNT(*) As qtd INTO depto_func
		FROM funcionario As f
		WHERE f.depto = reg.numdepto
		GROUP BY f.depto;
		
		RAISE NOTICE 'departamento: % - qtd: %', depto_func.depto, depto_func.qtd; 
		
		UPDATE departamento
		SET qtd_func = depto_func.qtd
		WHERE depto_func.depto = reg.numdepto;
		
	END LOOP;
END;
$$ LANGUAGE 'plpgsql';

call conta_funcs();

-- 2 - questão dos aniversariantes
CREATE OR REPLACE FUNCTION fn_aniversariante()
RETURNS SETOF RECORD As $$
DECLARE 
	reg RECORD;
BEGIN 
	FOR reg IN SELECT pnome, datanasc FROM funcionario LOOP
		IF(EXTRACT('MONTH' FROM reg.datanasc) = EXTRACT('MONTH' FROM now())) THEN 
			RAISE NOTICE '% - %', reg.pnome, reg.datanasc;
			RETURN NEXT reg;
		END IF;
	END LOOP;
END;
$$ LANGUAGE 'plpgsql';

SELECT nome_func, EXTRACT('day' FROM data_nasc)
FROM fn_aniversariante() As (nome_func varchar, data_nasc date);

-- 4. Faça uma store procedure para calcular o salario de um determinado período dos 
-- funcionários : salario = (qdt_horas por semana * valor hora * qtd de semanas).
CREATE OR REPLACE PROCEDURE calc_salario(valor_hora real, qtd_semanas integer)
As $$
DECLARE 
	reg RECORD;
	salario real;
BEGIN
	FOR reg IN SELECT * FROM funcionario LOOP
		SELECT SUM(te.horas) * valor_hora * qtd_semanas INTO salario
		FROM trabalha_em As te
		WHERE reg.numfunc = te.fnum;
		
		RAISE NOTICE 'Nome: % Salario: %, SalarioTotal: %', reg.pnome, salario, reg.salario;
	END LOOP;
END;
$$ LANGUAGE 'plpgsql';

call calc_salario(2.50, 4);

-- 5. Faça uma função para calcular quantos funcionários subordinados tem um 
-- supervisor. O nome do empregado supervisor é passado por parâmetro.
CREATE OR REPLACE FUNCTION calc_func_subordinados(cod_supervisor integer)
RETURNS INTEGER As $$
DECLARE
	qtd_subordinado integer;
BEGIN
	SELECT COUNT(*) INTO qtd_subordinado
	FROM funcionario As f
	WHERE f.supervisor = cod_supervisor;
	
	RAISE NOTICE 'Spervisor: % subordinados: %', cod_supervisor, qtd_subordinado;
	RETURN qtd_subordinado;
END;
$$ LANGUAGE 'plpgsql';

SELECT calc_func_subordinados(333445555) As qtd_subordinados;

-- questão do cpf
CREATE OR REPLACE FUNCTION valida_cpf(CPF varchar)
RETURNS BOOL As $$
DECLARE 
	soma integer := 0;
	i integer := 0;
BEGIN 
	-- É INTERESSANTE DECLARAR UM BLOCO DE CÓDIGO APENAS PARA FAZER A VERIFICAÇÃO SE TODOS OS DIGITOS SÃO IGUAIS
END;
$$ LANGUAGE 'plpgsql';