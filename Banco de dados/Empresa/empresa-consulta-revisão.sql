-- Liste o nome dos dependentes que tem nome igual ao de algum funcionário.
SELECT d.nomedependente, f.pnome
FROM dependente As d
	JOIN funcionario As f ON d.nomedependente = f.pnome;
	
UPDATE funcionario
SET pnome = 'Alice'
WHERE pnome LIKE 'Alicia'

-- Liste os nomes dos projetos dos departamentos 4 e 5.
SELECT d.nomedepto
FROM projeto As p
	JOIN departamento As d ON p.dnum = d.numdepto
WHERE p.dnum = 4 OR p.dnum = 5;

-- Liste os nomes dos funcionários que não tem dependentes.
SELECT f.pnome
FROM funcionario As f
EXCEPT 
SELECT f.pnome
FROM funcionario As f
	JOIN dependente As d ON f.numfunc = d.fnum;

-- Apresente o nome de todos os funcionários que não são supervisores.
SELECT numfunc, pnome
FROM funcionario
EXCEPT
SELECT DISTINCT s.numfunc, s.pnome
FROM funcionario As f
	JOIN funcionario As s ON f.supervisor = s.numfunc;

-- Apresente o nome dos funcionários que são supervisores e gerentes de departamentos.
SELECT f.pnome -- Talvez esteja errado
FROM funcionario AS f
	JOIN departamento As d ON f.numfunc = d.gerente
UNION
SELECT DISTINCT s.pnome
FROM funcionario As f
	JOIN funcionario As s ON f.supervisor = s.numfunc;
	
INSERT INTO funcionario(PNOME, MINICIAL, UNOME, NUMFUNC, DATANASC, ENDERECO, SEXO, SALARIO) 
values 
		('Atshusi', 'H', 'Takashi', 12589647, '1989/02/01', '73 Fonen, Hiton, Mh', 'M', 15000);
		
UPDATE FUNCIONARIO SET supervisor = 12589647 
WHERE NUMFUNC= 888665555;

-- Apresente quantos funcionários são do sexo feminino (F).
SELECT count(*) As qtd_feminino
FROM funcionario
WHERE sexo = 'F';

-- Apresente quantos funcionários são do sexo feminino (F) e quantos são do masculino(M).
SELECT sexo, count(*) As "Total por sexo"
FROM funcionario
GROUP BY sexo;

-- Apresente o nome dos funcionários que ganham o salário de menor valor pago pela empresa.
SELECT pnome, salario
FROM funcionario
WHERE salario IN (SELECT MIN(salario)
				 FROM funcionario);

-- Qual a idade média dos funcionários que trabalham na empresa.
SELECT AVG(EXTRACT(YEAR FROM age(NOW(), datanasc))) AS idade_media
FROM funcionario;

-- Qual a idade média dos funcionários que trabalham no projeto com o nome ‘ProdutoY’.
SELECT AVG(EXTRACT(YEAR FROM age(NOW(), datanasc))) AS idade_media
FROM funcionario As f
	JOIN trabalha_em As te ON f.numfunc = te.fnum
	JOIN projeto As p ON te.pnum = p.projnum
WHERE p.projnome LIKE 'ProdutoY';

-- Apresente a lista de todos os projetos que envolvem um funcionário com o último nome ‘Wong’ 
SELECT p.projnome
FROM funcionario As f
	JOIN trabalha_em As te ON f.numfunc = te.fnum
	JOIN projeto As p ON te.pnum = p.projnum
WHERE f.unome LIKE 'Wong';

-- como funcionário ou como chefe do departamento que controla o projeto.
