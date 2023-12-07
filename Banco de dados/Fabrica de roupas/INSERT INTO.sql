INSERT INTO Funcionario (matricula, nome) VALUES
    (1, 'João'),
    (2, 'Maria'),
    (3, 'Pedro'),
    (4, 'Bruna'),
	(5, 'José'),
    (6, 'Kaio'),
    (7, 'Pepeu'),
    (8, 'Carol');

INSERT INTO Meio VALUES
    (1, 'ADM', 2500.00, 200.00),
    (2, 'TI', 3000.00, 150.00),
    (3, 'FINANCEIRO', 2800.00, 180.00),
    (4, 'RH', 2700.00, 170.00);

INSERT INTO Costureira VALUES
    (5, 8.50, 2000.00, 1500.00, 6),
    (6, 7.06, 2200.00, 1600.00, 7),
    (7, 3.04, 1800.00, 1400.00, 8),
    (8, 10.03, 1900.00, 1300.00, 5);

INSERT INTO Maquina VALUES
    (1, 'Empresa A', 'Em Uso'),
    (2, 'Empresa B', 'Manutenção'),
    (3, 'Empresa C', 'Disponível'),
    (4, 'Empresa D', 'Em Uso');

INSERT INTO Fornecedores VALUES
    ('Fornecedor X', 1),
    ('Fornecedor Y', 2),
    ('Fornecedor Z', 3),
    ('Fornecedor W', 4);

INSERT INTO Manutencao VALUES
    (1, '2023-07-01', '2023-07-03', 1, 5),
    (2, '2023-07-05', '2023-07-07', 2, 6),
    (3, '2023-07-10', '2023-07-12', 3, 7),
    (4, '2023-07-15', '2023-07-17', 4, 8);

INSERT INTO TipoCostura VALUES
    (1, 'zig-zag'),
    (2, 'fechada'),
    (3, 'aberta'),
    (4, 'francesa');

INSERT INTO Peca VALUES
    (1, 'Camisa', 30.00, 'Camisa de algodão'),
    (2, 'Calça', 50.00, 'Calça jeans'),
    (3, 'Vestido', 70.00, 'Vestido estampado'),
    (4, 'Blusa', 25.00, 'Blusa de malha');

INSERT INTO Maquina_tem_TipoCostura VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4);

INSERT INTO Costureira_estaHabilitada_TipoCostura VALUES
    (5, 1),
    (6, 2),
    (7, 3),
    (8, 4);

INSERT INTO Costureira_peca_maquina VALUES
    (5, 1, 1, '2020-02-15', '2020-06-30', '08:00:00', '16:00:00'),
    (6, 2, 2, '2023-06-15', '2023-06-30', '08:30:00', '16:30:00'),
    (7, 3, 3, '2020-03-14', '2020-06-01', '09:00:00', '17:00:00'),
    (8, 4, 4, '2023-06-15', '2023-06-30', '09:30:00', '17:30:00');
