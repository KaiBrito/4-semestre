-- SELECT de todas as tabelas 
SELECT * FROM funcionario;
SELECT * FROM meio;
SELECT * FROM costureira;
SELECT * FROM habilitacao;
SELECT * FROM tipo_costura;
SELECT * FROM maquina_tipo_costura;
SELECT * FROM producao;
SELECT * FROM peca;
SELECT * FROM maquina;
SELECT * FROM manutencao;
SELECT * FROM fornecedores_maquina;

--Qestão Considere o Banco de Dados Fábrica de Costura  baseado no esquema em anexo,faça uma procedure para calcular o salário das costureiras. 
--salário delas é calculado pela soma do salário mínimo a gratificação por produtividade.Essa gratificação é a quantidade de peças produzidas multiplicadas pela percentual (alíquota * preço de venda) de cada peça que a costureira produziu no mês.  
--importante ressaltar que o valor adicional de gratificação não é no máximo o dobro do salário mínimo da costureira.

-- Peças por costureira
SELECT f.nome, c.matricula, pe.id_peca, c.aliquota_fixa, count(*) As qtd_peca --pe.preco_venda, pe.preco_venda * c.aliquota_fixa As gratificacao
FROM funcionario As f
	JOIN costureira As c ON c.matricula = f.matricula
	JOIN producao As p ON p.matricula = c.matricula
	JOIN peca As pe ON pe.id_peca = p.id_peca
GROUP BY f.nome, c.matricula, pe.id_peca, pe.preco_venda, c.aliquota_fixa;



-- Cálculo da gratificação
SELECT f.nome, c.matricula,((pe.preco_venda * c.aliquota_fixa) * COUNT(pe.id_peca)) As salario
FROM funcionario As f
	JOIN costureira As c ON c.matricula = f.matricula
	JOIN producao As p ON p.matricula = c.matricula
	JOIN peca As pe ON pe.id_peca = p.id_peca
GROUP BY f.nome, c.matricula, pe.preco_venda;



SELECT f.nome, c.matricula, COUNT(pe.id_peca) As qtd_peca
FROM funcionario As f
	JOIN costureira As c ON c.matricula = f.matricula
	JOIN producao As p ON p.matricula = c.matricula
	JOIN peca As pe ON pe.id_peca = p.id_peca
GROUP BY f.nome, c.matricula
ORDER BY COUNT(pe.id_peca);


-- Procedimento
CREATE OR REPLACE PROCEDURE calc_salario_costureira(mes integer)
As $$ 
DECLARE
	tmp RECORD;
	reg RECORD;
	qtd_peca integer;
	salario decimal;
	salario_temp decimal;
BEGIN 
	FOR reg IN SELECT * FROM costureira LOOP
		salario_temp := 0;
		salario := 0;
		
		SELECT p.id_peca, (pe.preco_venda * reg.aliquota_fixa * COUNT(*)) + valor_minimo As INTO tmp --salario_temp
		FROM costureira As c
			JOIN producao As p ON p.matricula = c.matricula
			JOIN peca As pe ON pe.id_peca = p.id_peca
		WHERE c.matricula = reg.matricula
		GROUP BY p.id_peca, c.aliquota_fixa, pe.preco_venda, c.valor_minimo;
		
		RAISE NOTICE 'Costureira % salario temporario = %', reg.matricula, tmp.sal;
	END LOOP;
END;
$$ LANGUAGE 'plpgsql';

call calc_salario_costureira(5);
