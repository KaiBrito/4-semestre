-- Função 1: Calcular o total de vendas para um determinado cliente
CREATE OR REPLACE FUNCTION calcularTotalVendasCliente(cpf_cliente VARCHAR)
RETURNS NUMERIC(10, 2) AS $$
DECLARE
    total_vendas NUMERIC(10, 2);
BEGIN
    SELECT COALESCE(SUM(valor), 0) INTO total_vendas
    FROM Pagamento
    WHERE idPedido IN (SELECT idPedido FROM Pedido WHERE cpf = cpf_cliente);

    RETURN total_vendas;
END;
$$ LANGUAGE PLPGSQL;

SELECT calcularTotalVendasCliente('12345678901') AS totalVendasCliente;

-- Função 2: Listar os pratos mais vendidos
CREATE OR REPLACE FUNCTION pratosMaisVendidos()
RETURNS TABLE (nome_prato VARCHAR(255)) AS $$
BEGIN
    FOR nome_prato IN
        SELECT Prato.nome
        FROM PedidoPrato
        JOIN Prato ON PedidoPrato.idPrato = Prato.idPrato
        GROUP BY Prato.nome
        ORDER BY COUNT(*) DESC
        LIMIT 5
    LOOP
        RETURN NEXT;
    END LOOP;

    RETURN;
END;
$$ 
LANGUAGE 'plpgsql';

SELECT * FROM pratosMaisVendidos();

-- Função 3: Calcular a média salarial dos funcionários
CREATE OR REPLACE FUNCTION calcularMediaSalarialFuncionarios()
RETURNS NUMERIC(10, 2) AS $$
DECLARE
    media_salarial NUMERIC(10, 2);
BEGIN
    SELECT COALESCE(AVG(salario), 0) INTO media_salarial
    FROM Funcionario;
    RETURN media_salarial;
END;
$$ LANGUAGE PLPGSQL;

SELECT calcularMediaSalarialFuncionarios() AS mediaSalarialFuncionarios; 


-- Procedure 1: Atualizar o salário de um funcionário
CREATE OR REPLACE PROCEDURE atualizarSalarioFuncionario(IN id_funcionario INT, IN novo_salario NUMERIC(10, 2)) AS $$
BEGIN
    UPDATE Funcionario
    SET salario = novo_salario
    WHERE idFuncionario = id_funcionario;
END;
$$ LANGUAGE PLPGSQL;

CALL atualizarSalarioFuncionario(1, 2500.00);

-- Procedure 2: Remover um cliente
CREATE OR REPLACE PROCEDURE removerCliente(cpf_cliente VARCHAR(11)) AS $$
DECLARE
    id_pedido_cliente INT;
    id_pagamento_cliente INT;
BEGIN
    SELECT idPedido INTO id_pedido_cliente FROM Pedido WHERE cpf = cpf_cliente;

    SELECT idPagamento INTO id_pagamento_cliente FROM Pagamento WHERE idPedido = id_pedido_cliente;

    IF EXISTS (SELECT 1 FROM Cartao WHERE idPagamento = id_pagamento_cliente) THEN
        DELETE FROM cartao WHERE idpagamento = id_pagamento_cliente;
    END IF;

    IF EXISTS (SELECT 1 FROM Pix WHERE idPagamento = id_pagamento_cliente) THEN
        DELETE FROM pix WHERE idpagamento = id_pagamento_cliente;
    END IF;

    IF EXISTS (SELECT 1 FROM Dinheiro WHERE idPagamento = id_pagamento_cliente) THEN
        DELETE FROM dinheiro WHERE idpagamento = id_pagamento_cliente;
    END IF;

    DELETE FROM PedidoPrato WHERE idPedido = id_pedido_cliente;

    DELETE FROM Pagamento WHERE idPedido = id_pedido_cliente;

    DELETE FROM pedido where cpf = cpf_cliente;

    DELETE FROM Cliente WHERE cpf = cpf_cliente;
END;
$$ 
LANGUAGE 'plpgsql';

CALL removerCliente('12345678901');

-- Procedure 3: Adicionar um novo prato
CREATE OR REPLACE PROCEDURE adicionarPrato(nome_prato VARCHAR(255), descricao_prato TEXT, categoria_prato VARCHAR(255), preco_prato DECIMAL(10, 2))
AS $$
BEGIN
    INSERT INTO Prato (nome, descricao, categoria, preco)
    VALUES (nome_prato, descricao_prato, categoria_prato, preco_prato);
END;
$$ 
LANGUAGE 'plpgsql';

CALL adicionarPrato('Macarrão à Bolonhesa', 'Macarrão com molho à bolonhesa', 'Massa', 14.99);


-- Trigger 1: Registrar log ao inserir um pagamento
CREATE OR REPLACE FUNCTION registrarLogPagamento()
RETURNS TRIGGER AS $$
BEGIN
	INSERT INTO LogPagamento (valor, idPedido, data)
	VALUES (NEW.valor, NEW.idPedido, CURRENT_DATE);
    RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER pagamento_after_insert
AFTER INSERT ON Pagamento
FOR EACH ROW
EXECUTE FUNCTION registrarLogPagamento();


-- Trigger 2: Atualizar data de pedido ao inserir um prato em um pedido
CREATE OR REPLACE FUNCTION atualizarDataPedido()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE Pedido
    SET dataPedido = CURRENT_DATE
    WHERE idPedido = NEW.idPedido;
    RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER Pedido_after_insert
AFTER INSERT ON Pedido
FOR EACH ROW
EXECUTE FUNCTION atualizarDataPedido();

-- Trigger 3: Atualizar hora de funcionamento ao inserir um novo restaurante
CREATE OR REPLACE FUNCTION atualizarHoraFuncionamentoRestaurante()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE Restaurante
    SET HoraFuncionamento = 'Seg-Sex: 10:30-21:30, Sáb-Dom: 12:00-22:00'
    WHERE idRestaurante = NEW.idRestaurante;
    RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER restaurante_after_insert
AFTER INSERT ON Restaurante
FOR EACH ROW
EXECUTE FUNCTION atualizarHoraFuncionamentoRestaurante();