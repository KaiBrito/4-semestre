SELECT COUNT(*)
FROM funcionario
WHERE depto = 4;

SELECT * FROM departamento;

-- questão 02 
SELECT depto, count(*) As qtd_func
FROM funcionario
GROUP  BY depto
ORDER BY depto;

-- questão 03
SELECT * 
FROM trabalha_em
ORDER BY fnum;

SELECT fnum, COUNT(*) As qtd_projeto, SUM(horas) As total_horas
FROM trabalha_em
GROUP BY fnum
ORDER BY fnum;

SELECT fn_calc_horas(123456789);


-- Trigger
-- questão 01
