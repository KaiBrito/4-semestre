-- Seleção 1: Listar todos os restaurantes 
SELECT * 
FROM Restaurante;

-- Seleção 2: Listar todos os pedidos e os pratos associados 
SELECT Pedido.idPedido, Pedido.dataPedido, Cliente.nome AS nomeCliente, Prato.nome AS nomePrato 
FROM Pedido 
	JOIN Cliente ON Pedido.cpf = Cliente.cpf 
	JOIN PedidoPrato ON Pedido.idPedido = PedidoPrato.idPedido 
	JOIN Prato ON PedidoPrato.idPrato = Prato.idPrato;

-- Seleção 3: Listar os pagamentos com método de pagamento 
SELECT Pagamento.idPagamento, Pagamento.valor, Cartao.numeroCartao, Pix.chave, Dinheiro.troco
FROM Pagamento 
	LEFT JOIN Cartao ON Pagamento.idPagamento = Cartao.idPagamento 
	LEFT JOIN Pix ON Pagamento.idPagamento = Pix.idPagamento 
	LEFT JOIN Dinheiro ON Pagamento.idPagamento = Dinheiro.idPagamento;

-- Seleção 4: Total de vendas por categoria de prato 
SELECT Prato.categoria, SUM(Pagamento.valor) AS totalVendas
FROM PedidoPrato 
	JOIN Prato ON PedidoPrato.idPrato = Prato.idPrato 
	JOIN Pagamento ON PedidoPrato.idPedido = Pagamento.idPedido 
GROUP BY Prato.categoria;

-- Seleção 5: Listar clientes e funcionários associados 
SELECT Cliente.nome AS nomeCliente, Funcionario.nome AS nomeFuncionario 
FROM Cliente 
	JOIN Funcionario ON Cliente.idFuncionario = Funcionario.idFuncionario;

-- Seleção 6: Valor total recebido em cada forma de pagamento 
SELECT 'Cartão' AS formaPagamento, SUM(Pagamento.valor) AS totalPagamento 
FROM Cartao 
	JOIN Pagamento ON Cartao.idPagamento = Pagamento.idPagamento 
UNION 
SELECT 'Pix' AS formaPagamento, SUM(Pagamento.valor) AS totalPagamento FROM Pix 
	JOIN Pagamento ON Pix.idPagamento = Pagamento.idPagamento 
UNION 
SELECT 'Dinheiro' AS formaPagamento, SUM(Pagamento.valor) AS totalPagamento FROM Dinheiro 
	JOIN Pagamento ON Dinheiro.idPagamento = Pagamento.idPagamento;

-- Seleção 7: Listar os pratos e suas categorias 
SELECT nome, categoria 
FROM Prato;

-- Seleção 8: Listar todos os pedidos do mês atual (novembro) 
SELECT *
FROM Pedido
WHERE EXTRACT(MONTH FROM datapedido) = EXTRACT(MONTH FROM NOW());

-- Seleção 9: Valor Médio dos Pratos por Categoria 
SELECT categoria, AVG(Prato.preco) AS valorMedio 
FROM Prato
GROUP BY categoria;

-- Seleção 10: Valor Total Recebido por Mês:
SELECT EXTRACT(MONTH FROM dataPedido) AS mes, SUM(valor) AS totalRecebido
FROM Pagamento
	JOIN Pedido ON Pagamento.idPedido = Pedido.idPedido
GROUP BY mes;

-- Seleção 11: Listar o total de clientes que foram a cada estabelecimento
SELECT r.nome, r.endereco, count(r.endereco) As totalCliente
FROM Restaurante As r
	JOIN Funcionario As f ON r.idRestaurante = f.idRestaurante
	JOIN Cliente As c ON f.idFuncionario = c.idFuncionario
GROUP BY r.nome, r.endereco;