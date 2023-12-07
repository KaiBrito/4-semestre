-- Apresente o nome e salário mensal de cada funcionário da fábrica de roupas
SELECT F.nome, SUM(M.fixo + M.gratificacao) As Salario_mensal
FROM Funcionario As F
	JOIN Meio As M ON F.matricula = M.matricula
GROUP BY nome
UNION
SELECT nome, SUM(C.salario + C.aliquota_fixa)
FROM Funcionario As F
	JOIN Costureira As C ON F.matricula = C.matricula
GROUP BY nome;

--Apresente o código e o fabricante da máquina e tipo de costura das máquinas que nunca foram para a manutenção. --
SELECT M.id_maquina, M.fabricante, TC.descricao
FROM TipoCostura As TC
	JOIN Maquina_tem_TipoCostura As MT on TC.id_tipoCostura = MT.id_tipoCostura
	JOIN Maquina as M on MT.id_maquina = M.id_maquina
EXCEPT
SELECT M.id_maquina, M.fabricante, TC.descricao
FROM TipoCostura as TC
	JOIN Maquina_tem_TipoCostura As MT on TC.id_tipoCostura = MT.id_tipoCostura
	JOIN Maquina as M on MT.id_maquina = M.id_maquina
	JOIN Manutencao as Ma on Ma.id_maquina = M.id_maquina;

--Apresente quantas peças foram produzidas por cada costureira no mês agosto de 2020.
SELECT F.nome, COUNT(CPM.id_peca) As pecas_produzidas
FROM Costureira As C
	JOIN Funcionario As F ON C.matricula = F.matricula
	JOIN Costureira_peca_maquina As CPM ON C.matricula = CPM.mat_costureira
	JOIN Manutencao As M ON C.matricula = M.mat_costureira
WHERE EXTRACT(MONTH FROM dt_ini) = 8
GROUP BY C.matricula, F.nome;

--Apresente o código e o fabricante da máquina que produziu mais peças.
SELECT M.id_maquina, M.fabricante
FROM Maquina As M
	JOIN Costureira_peca_maquina As CPM ON M.id_maquina = CPM.id_maquina
GROUP BY M.id_maquina, M.fabricante
ORDER BY COUNT(CPM.id_maquina) DESC
LIMIT 1;

--Apresente o nome das costureiras estão disponíveis e habilitadas a trabalhar com tipo de costura “zig-zag”
SELECT F.nome
FROM Costureira As C
	JOIN Funcionario As F ON C.matricula = F.matricula
	JOIN Costureira_estaHabilitada_TipoCostura As CHT ON C.matricula = CHT.mat_costureira
	JOIN TipoCostura As TC ON CHT.id_tipoCostura = TC.id_tipoCostura
WHERE TC.descricao = 'zig-zag';

--Apresente a relação das máquinas que estiveram mais de 10 vezes em conserto, 
--contendo: código da máquina e para cada conserto, matrícula e nome da supervisora 
--responsável, data início e término do conserto.
SELECT M.id_maquina, F.matricula, F.nome, M.dt_inicio, M.dt_fim
FROM Manutencao As M
	JOIN Costureira As C ON M.mat_costureira = C.matricula
	JOIN Funcionario As F ON C.matricula = F.matricula
GROUP BY M.id_maquina, F.matricula, F.nome, M.dt_inicio, M.dt_fim
HAVING COUNT(M.id_maquina) > 10;

--Apresente quantas peças foram produzidas por máquina em um determinado de 01/01/2020 a 15/07/2020.
SELECT COUNT(*) As Qtd_Peças
FROM Costureira_peca_maquina
WHERE dt_ini >= '2020-01-11' AND dt_fim <= '2020-07-15';

-- Apresentar as costureiras sem produção no período (matrícula da costureira, nome, valor mínimo).
SELECT F.matricula, F.nome, C.vlr_minimo
FROM Costureira_peca_maquina As CPM
	JOIN Costureira As C ON CPM.mat_costureira = C.matricula
	JOIN Funcionario As F ON C.matricula = F.matricula
WHERE dt_ini < '2020-01-11' OR dt_fim > '2020-07-15';