-- Criação da tabela Restaurante
CREATE TABLE Restaurante (
    idRestaurante SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    HoraFuncionamento VARCHAR(100)
);

-- Criação da tabela Funcionario
CREATE TABLE Funcionario (
    idFuncionario SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(100),
    salario NUMERIC(10, 2),
    IdRestaurante INT,
    FOREIGN KEY (IdRestaurante) REFERENCES Restaurante(idRestaurante)
);

-- Criação da tabela Cliente
CREATE TABLE Cliente (
    cpf VARCHAR(11) PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    nome VARCHAR(255) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    idFuncionario INT,
    FOREIGN KEY (idFuncionario) REFERENCES Funcionario(idFuncionario)
);

-- Criação da tabela Pedido
CREATE TABLE Pedido (
    idPedido SERIAL PRIMARY KEY,
    dataPedido DATE,
    cpf VARCHAR(11),
    FOREIGN KEY (cpf) REFERENCES Cliente(cpf)
);

-- Criação da tabela Prato
CREATE TABLE Prato (
    idPrato SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    categoria VARCHAR(50),
    preco NUMERIC(10, 2)
);

-- Criação da tabela PedidoPrato (tabela de relacionamento muitos-para-muitos)
CREATE TABLE PedidoPrato (
    idPedido INT,
    idPrato INT,
    PRIMARY KEY (idPedido, idPrato),
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido),
    FOREIGN KEY (idPrato) REFERENCES Prato(idPrato)
);

-- Criação da tabela Pagamento
CREATE TABLE Pagamento (
    idPagamento SERIAL PRIMARY KEY,
    valor NUMERIC(10, 2),
    idPedido INT,
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido)
);

-- Criação da tabela Cartao (tabela de pagamento com cartão)
CREATE TABLE Cartao (
    idPagamento INT,
    numeroCartao VARCHAR(16),
    PRIMARY KEY (idPagamento),
    FOREIGN KEY (idPagamento) REFERENCES Pagamento(idPagamento)
);

-- Criação da tabela Pix (tabela de pagamento com Pix)
CREATE TABLE Pix (
    idPagamento INT,
    chave VARCHAR(50),
    PRIMARY KEY (idPagamento),
    FOREIGN KEY (idPagamento) REFERENCES Pagamento(idPagamento)
);

-- Criação da tabela Dinheiro (tabela de pagamento em dinheiro)
CREATE TABLE Dinheiro (
    idPagamento INT,
    troco NUMERIC(10, 2),
    PRIMARY KEY (idPagamento),
    FOREIGN KEY (idPagamento) REFERENCES Pagamento(idPagamento)
);

-- Criação da tabela LogPagamento 
CREATE TABLE LogPagamento ( 
	idLog SERIAL PRIMARY KEY, 
	valor NUMERIC(10, 2) NOT NULL, 
	idPedido INT NOT NULL, 
	data DATE NOT NULL, 
	formaPagamento VARCHAR(50) NOT NULL 
);