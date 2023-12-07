INSERT INTO Restaurante (nome, endereco, telefone, HoraFuncionamento)
VALUES
    ('Restaurante BK', '123 Rua Principal, Cidade Três Lagoas', '(123) 456-7890', 'Seg-Sex: 11:00-22:00, Sáb-Dom: 12:00-23:00'),
    ('Restaurante BK', '456 Avenida Secundária, Cidade Andradina', '(456) 789-1230', 'Seg-Sex: 10:30-21:30, Sáb-Dom: 12:00-22:00');
	
	
INSERT INTO Funcionario (nome, cargo, salario, IdRestaurante)
VALUES
    ('João Silva', 'Garçom', 2000.00, 1),
    ('Maria Pereira', 'Cozinheira', 2200.00, 1),
    ('Pedro Oliveira', 'Gerente', 3000.00, 1),
    ('Ana Santos', 'Garçom', 2000.00, 2),
    ('Luiz Fernandes', 'Cozinheiro', 2200.00, 2),
    ('Sofia Almeida', 'Garçom', 2000.00, 1),
    ('Lucas Costa', 'Cozinheiro', 2200.00, 2),
    ('Mariana Rodrigues', 'Garçom', 2000.00, 2),
    ('Gustavo Lima', 'Cozinheiro', 2200.00, 1),
    ('Clara Fernandes', 'Garçom', 2000.00, 1);


INSERT INTO Cliente (cpf, email, nome, telefone, idFuncionario)
VALUES
    ('12345678901', 'cliente1@email.com', 'Maria Silva', '(123) 456-7890', 1),
    ('23456789012', 'cliente2@email.com', 'João Santos', '(234) 567-8901', 2),
    ('34567890123', 'cliente3@email.com', 'Pedro Oliveira', '(345) 678-9012', 3),
    ('45678901234', 'cliente4@email.com', 'Ana Pereira', '(456) 789-0123', 4),
    ('56789012345', 'cliente5@email.com', 'Luiza Rodrigues', '(567) 890-1234', 5),
    ('67890123456', 'cliente6@email.com', 'Miguel Costa', '(678) 901-2345', 6),
    ('78901234567', 'cliente7@email.com', 'Isabella Martins', '(789) 012-3456', 7),
    ('89012345678', 'cliente8@email.com', 'Lucas Fernandes', '(890) 123-4567', 8),
    ('90123456789', 'cliente9@email.com', 'Sophia Gonçalves', '(901) 234-5678', 9),
    ('01234567890', 'cliente10@email.com', 'Guilherme Ribeiro', '(012) 345-6789', 10);


INSERT INTO Pedido (dataPedido, cpf)
VALUES
    ('2023-11-02', '12345678901'),
    ('2023-11-02', '23456789012'),
    ('2023-11-02', '34567890123'),
    ('2023-11-05', '45678901234'),
    ('2023-11-06', '56789012345'),
    ('2023-11-07', '67890123456'),
    ('2023-11-07', '78901234567'),
    ('2023-11-07', '89012345678'),
    ('2023-11-17', '90123456789'),
    ('2023-11-11', '01234567890'),
    ('2023-11-12', '12345678901'),
    ('2023-11-12', '23456789012'),
    ('2023-11-14', '34567890123'),
    ('2023-11-15', '45678901234'),
    ('2023-11-15', '56789012345'),
    ('2023-11-17', '67890123456'),
    ('2023-11-18', '78901234567'),
    ('2023-11-19', '89012345678'),
    ('2023-11-19', '90123456789'),
    ('2023-11-21', '01234567890');


INSERT INTO Prato (nome, descricao, categoria, preco)
VALUES
    ('Pizza Margherita', 'Pizza com molho de tomate, queijo e manjericão fresco.', 'Pizza', 15.99),
    ('Salmão Grelhado', 'Salmão grelhado com legumes e arroz.', 'Peixe', 21.50),
    ('Frango ao Curry', 'Frango cozido com molho de curry e arroz basmati.', 'Frango', 18.99),
    ('Spaghetti Carbonara', 'Massa com ovos, queijo parmesão e bacon.', 'Massa', 12.99),
    ('Salada Caesar', 'Salada com alface, croutons, queijo parmesão e molho Caesar.', 'Salada', 10.50),
    ('Bife à Parmegiana', 'Bife empanado com queijo e molho de tomate, acompanhado de espaguete.', 'Carne', 19.50),
    ('Sushi Misto', 'Sushi variado com salmão, atum, camarão e legumes.', 'Sushi', 22.99),
    ('Taco de Carne', 'Taco com carne grelhada, guacamole e molho picante.', 'Mexicano', 9.99),
    ('Molho de Alcachofra', 'Alcachofras, espinafre e queijo servidos com pão torrado.', 'Aperitivo', 14.99),
    ('Tiramisu', 'Sobremesa de mascarpone, café e cacau.', 'Sobremesa', 7.99),
    ('Hambúrguer Clássico', 'Hambúrguer de carne com queijo, alface e tomate.', 'Hambúrguer', 11.99),
    ('Creme de Abóbora', 'Sopa de abóbora com creme e temperos.', 'Sopa', 8.99),
    ('Sorvete de Chocolate', 'Sorvete de chocolate com calda de morango.', 'Sobremesa', 6.50),
    ('Caipirinha de Morango', 'Coquetel de cachaça, morango e limão.', 'Bebida', 8.50),
    ('Salada de Frutas', 'Frutas frescas cortadas em pedaços.', 'Salada', 5.99),
    ('Sanduíche de Frango Grelhado', 'Sanduíche com frango grelhado e vegetais.', 'Sanduíche', 10.99),
    ('Sopa de Lentilha', 'Sopa de lentilha com legumes e temperos.', 'Sopa', 8.99),
    ('Sorvete de Baunilha', 'Sorvete de baunilha com cobertura de caramelo.', 'Sobremesa', 6.50),
    ('Caipirinha de Limão', 'Coquetel de cachaça, limão e açúcar.', 'Bebida', 8.50),
    ('Torta de Maçã', 'Torta de maçã com uma pitada de canela.', 'Sobremesa', 7.99);


INSERT INTO PedidoPrato (idPedido, idPrato)
VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (2, 4),
    (3, 5),
    (3, 6),
    (4, 7),
    (4, 8),
    (5, 9),
    (5, 10);
	

INSERT INTO Pagamento (valor, idPedido)
VALUES
    (25.00, 1),
    (32.50, 2),
    (19.99, 3),
    (28.75, 4),
    (15.50, 5);
	

INSERT INTO Cartao (idPagamento, numeroCartao)
VALUES
    (1, '1234567890123456'),
    (2, '2345678901234567');
	

INSERT INTO Pix (idPagamento, chave)
VALUES
    (3, '4567890ABCDEF123'),
    (4, 'XYZ7890LMNOPQRS');
	

INSERT INTO Dinheiro (idPagamento, troco)
VALUES
    (5, 2.50);