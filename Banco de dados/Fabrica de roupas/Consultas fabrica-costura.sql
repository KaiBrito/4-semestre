-- Desafio do cpf 
CREATE OR REPLACE FUNCTION valida_cpf(CPF varchar)
RETURNS BOOL As $$
DECLARE 
	soma integer := 0;
	i integer := 0;
	dig1 integer;
	dig2 integer;
BEGIN
	-- Verificar se todos os digitos são iguais
	FOR i IN 1..9 LOOP	
		IF(substring(CPF, i, 1) = substring(CPF, 1, 1)) THEN 
			soma := soma + 1;
		END IF;
	END LOOP;
	IF(soma = 9) THEN
		RETURN FALSE;
	END IF;
	
	-- Produto de todos os números 
	soma := 0;
	FOR i IN 1..9 LOOP	
		soma := soma + substring(CPF, i, 1)::integer * (11 - i);
	END LOOP;				 
    
	-- Descobrindo a dezena do digito verificador 
	IF(soma % 11 < 2) THEN 
		dig1 := 0;
	ELSE
		dig1 := 11 - (soma % 11);
	END IF;
	
	-- Produto de todos os números 
	soma := 0;
	FOR i IN 1..9 LOOP	
		soma := soma + substring(CPF, i, 1)::integer * (12 - i);
	END LOOP;
	
	-- Descobrindo a unidade do digito verificador 
	IF(soma % 11 < 2) THEN 
		dig2 := 0;
	ELSE
		dig2 := 11 - (soma % 11);
	END IF;
	
	-- Validando o cpf
	IF(dig1::varchar = substring(CPF, 10, 1) and dig2::varchar = substring(CPF, 11, 1)) THEN
		RETURN TRUE;
	END IF;
	
	RETURN FALSE;
END;
$$ LANGUAGE 'plpgsql';

SELECT valida_cpf('99999999999');
SELECT valida_cpf('12345678909');
SELECT valida_cpf('10325578909');
