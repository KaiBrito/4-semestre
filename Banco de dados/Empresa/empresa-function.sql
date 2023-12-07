-- questão 03
CREATE OR REPLACE FUNCTION fn_calc_horas (id_func integer)
RETURNS float As $$
DECLARE
	soma float;
BEGIN
	SELECT SUM(horas) INTO soma
	FROM trabalha_em
	WHERE fnum = id_func;
	
	RETURN soma;
END;
$$ LANGUAGE 'plpgsql';

-- trigger
-- criando tabela emp_log para salvar os dados da trigger
CREATE TABLE emp_log (
	operacao char(1),
	dt date,
	usuario integer,
	numfunc integer PRIMARY KEY,
	salario numeric
);
SELECT * FROM pg_user;
SELECT * FROM emp_log;
-- exemplo 03
CREATE OR REPLACE FUNCTION fn_audit_emp() 
RETURNS TRIGGER As $$
BEGIN
	IF (TG_OP = 'DELETE') THEN 
		INSERT INTO emp_log VALUES ('D', now(), 1, OLD.numfunc, OLD.salario);
		RETURN OLD;
	ELSE IF (TG_OP = 'UPDATE') THEN 
		INSERT INTO emp_log VALUES ('U', now(), 2, NEW.numfunc, NEW.salario);
		RETURN NEW;
	ELSE IF (TG_OP = 'INSERT') THEN 
		INSERT INTO emp_log VALUES ('I', now(), 3, NEW.numfunc, NEW.salario);
		RETURN NEW;
	END IF;
	
	RETURN null;
	
END;
$$ LANGUAGE 'plpgsql';