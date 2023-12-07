--CREATE DATABASE fabrica_de_roupas;
--USE fabrica_de_roupas;

CREATE TABLE Funcionario (
	matricula INT NOT NULL,
	nome VARCHAR(45) NOT NULL,
	endereco VARCHAR(100) DEFAULT 'não informado',
	PRIMARY KEY (matricula)
);

CREATE TABLE Meio (
	matricula INT NOT NULL,
	setor VARCHAR(15) CHECK (setor IN ('ADM', 'TI', 'FINANCEIRO', 'RH', 'INFRA')),
	fixo FLOAT(2),
	gratificacao FLOAT(2) CHECK (gratificacao >= 0 AND gratificacao <= 5000),
	PRIMARY KEY (matricula),
	FOREIGN KEY (matricula) REFERENCES funcionario(matricula)
);

CREATE TABLE Costureira (
	matricula INT NOT NULL,
	aliquota_fixa FLOAT(2),
	salario FLOAT(2),
	vlr_minimo FLOAT(2),
	sup_costureira INT,
	PRIMARY KEY (matricula),
	FOREIGN KEY (sup_costureira) REFERENCES Costureira(matricula)	
);

CREATE TABLE Maquina (
	id_maquina INT NOT NULL,
	fabricante VARCHAR(45),
	situacao VARCHAR(50),
	PRIMARY KEY (id_maquina)
);

CREATE TABLE Fornecedores (
	fornecedor VARCHAR(50) NOT NULL,
	id_maquina INT NOT NULL,
	PRIMARY KEY (fornecedor, id_maquina),
	FOREIGN KEY (id_maquina) REFERENCES Maquina(id_maquina)	
);

CREATE TABLE Manutencao (
    id_manutencao INT NOT NULL,
    dt_inicio DATE,
    dt_fim DATE,
    id_maquina INT,
    mat_costureira INT,
	PRIMARY KEY (id_manutencao),
    FOREIGN KEY (id_maquina) REFERENCES Maquina(id_maquina),
    FOREIGN KEY (mat_costureira) REFERENCES Costureira(matricula)	
);

CREATE TABLE TipoCostura (
    id_tipoCostura INT NOT NULL,
    descricao VARCHAR(100),
	PRIMARY KEY (id_tipoCostura)
);

CREATE TABLE Peca (
    id_peca INT NOT NULL,
    modelo VARCHAR(45),
    preco_venda FLOAT(2),
    desc_modelo VARCHAR(100),
	PRIMARY KEY (id_peca)
);

CREATE TABLE Maquina_tem_TipoCostura (
    id_maquina INT NOT NULL,
    id_tipoCostura INT NOT NULL,
    PRIMARY KEY (id_maquina, id_tipoCostura),
    FOREIGN KEY (id_maquina) REFERENCES Maquina(id_maquina),
    FOREIGN KEY (id_tipoCostura) REFERENCES TipoCostura(id_tipoCostura)
);

CREATE TABLE Costureira_estaHabilitada_TipoCostura (
    mat_costureira INT NOT NULL,
    id_tipoCostura INT NOT NULL,
    PRIMARY KEY (mat_costureira, id_tipoCostura),
    FOREIGN KEY (mat_costureira) REFERENCES Costureira(matricula),
    FOREIGN KEY (id_tipoCostura) REFERENCES TipoCostura(id_tipoCostura)
);

CREATE TABLE Costureira_peca_maquina (
    mat_costureira INT NOT NULL,
    id_peca INT NOT NULL,
    id_maquina INT NOT NULL,
    dt_ini DATE,
    dt_fim DATE,
    hr_ini TIME,
    hr_fim TIME,
    PRIMARY KEY (mat_costureira, id_peca, id_maquina),
    FOREIGN KEY (mat_costureira) REFERENCES Costureira(matricula),
    FOREIGN KEY (id_peca) REFERENCES Peca(id_peca),
    FOREIGN KEY (id_maquina) REFERENCES Maquina(id_maquina)
);

