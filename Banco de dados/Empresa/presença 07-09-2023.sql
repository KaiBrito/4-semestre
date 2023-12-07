CREATE TABLE notificacao_log(
	numfunc integer PRIMARY KEY,
	pnome varchar(255) NOT NULL,
	hora real,
	dataCadastro date
)

CREATE OR REPLACE FUNCTION verifica_horas_semanais() 
RETURNS TRIGGER As $$
DECLARE
	horas real;
	reg RECORD;
BEGIN 
	SELECT SUM(te.horas) INTO horas
	FROM trabalha_em As te
		JOIN funcionario As f ON te.fnum = f.numfunc
	WHERE te.fnum = new.fnum; 
	
	IF(horas > 40) THEN	
		SELECT * INTO reg
		FROM funcionario As f 
		WHERE f.numfunc = new.fnum; 
		
		INSERT INTO notificacao_log VALUES(new.fnum, reg.pnome, horas-40, now());
		RAISE NOTICE '%, %, %, %', new.fnum, reg.pnome, horas-40, now();
	END IF;	
	RETURN NULL;
END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER tr_log_horas
AFTER UPDATE or INSERT ON trabalha_em
FOR EACH ROW 
EXECUTE PROCEDURE verifica_horas_semanais();	

--inserts
INSERT INTO trabalha_em (FNUM, PNUM, HORAS)
VALUES 	(123456789, 3, 8);

INSERT INTO trabalha_em (FNUM, PNUM, HORAS)
VALUES (888665555, 3, 15);

INSERT INTO trabalha_em (FNUM, PNUM, HORAS)
VALUES (987654321, 3, 2);

INSERT INTO trabalha_em (FNUM, PNUM, HORAS)
VALUES (987654321, 2, 1);

INSERT INTO trabalha_em (FNUM, PNUM, HORAS)
VALUES (987654321, 1, 5);

--testes
-- função para saber as horas totais
select te.fnum, f.pnome, SUM(horas) 
from trabalha_em As te
	join funcionario As f ON te.fnum = f.numfunc
group by te.fnum, f.pnome;

--
SELECT * FROM notificacao_log;

