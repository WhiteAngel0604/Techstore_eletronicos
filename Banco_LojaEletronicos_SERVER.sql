-- BANCO DE DADOS LOJA DE ELETRONICO
-- VERSÃO SQL SERVER!!!!

-- Desenvolvido por Larissa Dias, Alicia Fontes, Geovanna Novais e Felippi Angelo


-- CONFIGURAÇÕES BASICAS DO SQL SERVER!!

SET ANSI_NULLS ON; -- Aqui é para não dar erro com variaveis NULL
SET QUOTED_IDENTIFIER ON; -- Aqui é para identificar aspas
GO -- Inicia o bloco de comandos

-- CRIANDO O BANCO!!

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'Banco_LojaEletronico_SERVER') -- Aqui ele consulta o sistema para conferir se o banco ja existe antes de criar
BEGIN
    CREATE DATABASE Banco_LojaEletronico_SERVER; -- Cria o banco
END;
GO 

USE Banco_LojaEletronico_SERVER; -- Avisa ao sistema que os comandos a partir daqui pertencem ao banco loja
GO

BEGIN TRANSACTION; -- Indica que o sistema só deve salvar se tudo for executado sem erros
-- INICIO DO CODIGO!!

-- Detalhes importantes: 
-- NOT NULL serve para avisar ao sistema que tal informação não pode ser vazia, PRECISA DE VALOR.
-- IDENTITY(1,1) é o auto-incremento do SQL Server.

CREATE TABLE Cliente -- Criando a tabela Cliente
(
	idCli int IDENTITY(1,1) NOT NULL PRIMARY KEY, -- Determinamos como Chave primaria. Adicionamos auto-incremento
	nome varchar(255) NOT NULL,
	email varchar(255) NOT NULL UNIQUE,
	CPF varchar(11) NOT NULL, -- Adicionar mascara no java
	senha_hash varchar(60) NOT NULL -- a senha a gente precisa ajustar no java
);

CREATE TABLE telefone_Cliente -- Criando tabela telefone_Cliente, essa tabela existe pois o telefone é multivalorado e pode ter mais de um valor
(
  cod_telefone int IDENTITY(1,1) NOT NULL PRIMARY KEY, -- Chave primaria. Adicionamos auto-incremento
  numero varchar(14) NOT NULL,

  fk_cliente int NOT NULL, 
  FOREIGN KEY (fk_cliente) REFERENCES Cliente(idCli) -- Aqui dizemos que a variavel fk_cliente é uma chave estrangeira que referencia a tabela Cliente e a variavel idCli
);

CREATE TABLE endereco_cliente -- Criando tabela endereco_cliente, ela existe pois o endereço é um atributo composto, logo ele é feito por mais de uma informação
(
	id_endereco int IDENTITY(1,1) NOT NULL PRIMARY KEY, -- Chave primaria. Adicionamos auto-incremento
	cep varchar(8) NOT NULL, 
	bairro varchar(255) NOT NULL, 
	logradouro varchar(255), -- sem NOT NULL pois não é uma informação obrigatoria
	cidade varchar(255) NOT NULL, 
	estado varchar(255) NOT NULL, 
	numero varchar(10) NOT NULL, 
	complemento varchar(255), -- sem NOT NULL pois não é uma informação obrigatoria

	fk_cliente int NOT NULL,
	FOREIGN KEY (fk_cliente) REFERENCES Cliente(idCli) -- Aqui dizemos que a variavel fk_cliente é uma chave estrangeira que referencia a tabela Cliente e a variavel idCli
);


CREATE TABLE Funcionario -- Criando a tabela Funcionario
(
	idFun int IDENTITY(1,1) NOT NULL PRIMARY KEY, -- Chave primaria. Adicionamos auto-incremento
	nome varchar(255) NOT NULL,
	email varchar(255) NOT NULL UNIQUE,
	CPF varchar(11) NOT NULL, -- Adicionar mascara no java
	CTPS varchar(12) NOT NULL, -- Adicionar mascara no java
	setor varchar(255) NOT NULL,
	funcao varchar(255) NOT NULL,
	senha_hash varchar(60) NOT NULL -- ajustar no java 
);

CREATE TABLE telefone_Funcionario -- Criando a tabela telefone_Funcionario
(
  cod_telefone int IDENTITY(1,1) NOT NULL PRIMARY KEY, -- Chave primaria. Adicionamos auto-incremento
  numero varchar(14) NOT NULL,

  fk_funcionario int NOT NULL,
  FOREIGN KEY (fk_funcionario) REFERENCES Funcionario(idFun) -- Aqui dizemos que a variavel fk_funcionario é uma chave estrangeira que referencia a tabela Funcionario e a variavel idFun
);

CREATE TABLE endereco_funcionario -- Criando a tabela endereco_funcionario
(
	id_endereco int IDENTITY(1,1) NOT NULL PRIMARY KEY, -- Chave primaria. Adicionamos auto-incremento 
	cep varchar(8) NOT NULL, 
	bairro varchar(255) NOT NULL, 
	logradouro varchar(255), -- sem NOT NULL pois não é uma informação obrigatoria
	cidade varchar(255) NOT NULL, 
	estado varchar(255) NOT NULL, 
	numero varchar(10) NOT NULL,
	complemento varchar(255), -- sem NOT NULL pois não é uma informação obrigatoria

	fk_funcionario int NOT NULL,
	FOREIGN KEY (fk_funcionario) REFERENCES Funcionario(idFun) -- Aqui dizemos que a variavel fk_funcionario é uma chave estrangeira que referencia a tabela Funcionario e a variavel idFun
);


CREATE TABLE Fornecedor -- Criando a tabela Fornecedor
(
	CNPJFornecedor varchar(14) NOT NULL PRIMARY KEY, -- Chave primaria que o usuario deve fornecer.
	email varchar(255) NOT NULL UNIQUE,
	nome varchar(255) NOT NULL,
	dt_lote date NOT NULL, -- data de compra do lote
	senha_hash varchar(60) NOT NULL -- ajustar no java
);

CREATE TABLE endereco_fornecedor -- Criando a tabela endereco_fornecedor
(
	id_endereco int IDENTITY(1,1) NOT NULL PRIMARY KEY, -- Chave primaria. Adicionamos auto-incremento 
	cep varchar(8) NOT NULL,
	bairro varchar(255) NOT NULL, 
	logradouro varchar(255), -- sem NOT NULL pois não é uma informação obrigatoria
	cidade varchar(255) NOT NULL, 
	estado varchar(255) NOT NULL, 
	numero varchar(10) NOT NULL,
	complemento varchar(255), -- sem NOT NULL pois não é uma informação obrigatoria

	fk_fornecedor varchar(14) NOT NULL, 
	FOREIGN KEY (fk_fornecedor) REFERENCES Fornecedor(CNPJFornecedor) -- Aqui dizemos que a variavel fk_fornecedor é uma chave estrangeira que referencia a tabela Fornecedor e a variavel CNPJFornecedor
);

CREATE TABLE Categoria -- Criando a tabela Categoria
(
	idCat int IDENTITY(1,1) NOT NULL PRIMARY KEY, -- Chave primaria. Adicionamos auto-incremento
	tipo varchar(255) NOT NULL
);

CREATE TABLE Produtos -- Criando a tabela Produtos
(
	idPro int IDENTITY(1,1) NOT NULL PRIMARY KEY, -- Chave primaria. Adicionamos auto-incremento
	nome varchar(255) NOT NULL,
	preco decimal(10,2) NOT NULL, -- Decimal pois preços tem centavos né
	estoque int NOT NULL,
	marca varchar(255) NOT NULL,

	fk_fornecedor varchar(14) NOT NULL, 
	FOREIGN KEY (fk_fornecedor) REFERENCES Fornecedor(CNPJFornecedor),  -- Aqui dizemos que a variavel fk_fornecedor é uma chave estrangeira que referencia a tabela Fornecedor e a variavel CNPJFornecedor

	fk_categoria int NOT NULL,
    FOREIGN KEY (fk_categoria) REFERENCES Categoria(idCat) -- aqui dizemos que a variavel fk_categoria é uma chave estrangeira que referencia a tabela Categoria e a variavel idCat

);

CREATE TABLE Venda 
(
	idVenda int IDENTITY(1,1) NOT NULL PRIMARY KEY, -- Chave primaria. Adicionamos auto-incremento
	valor decimal(10,2) NOT NULL, -- decimal pois preços tem centavos
	dt_venda datetime NOT NULL, -- datetime porque né, dia/mes/ano 00.00.00

	fk_cliente int NOT NULL, 
	fk_funcionario int NOT NULL,
	FOREIGN KEY (fk_cliente) REFERENCES Cliente(idCli), -- Aqui dizemos que a variavel fk_cliente é uma chave estrangeira que se refere a tabela Cliente e a variavel idCli
	FOREIGN KEY (fk_funcionario) REFERENCES Funcionario(idFun) -- Aqui dizemos que a variavel fk_funcionario é uma chave estrangeira que se refere a tabela Funcionario e a variavel idFun
);


CREATE TABLE itemVenda 
(
	idItem int IDENTITY(1,1) NOT NULL PRIMARY KEY, -- Chave primaria. Adicionamos auto-incremento
	dt_item datetime NOT NULL, -- datetime porque né, dia/mes/ano 00.00.00
	status_venda varchar(200) NOT NULL,
	quantidade int NOT NULL, -- MUDAR DER
	valor_unid decimal(10,2) NOT NULL,

	fk_venda int NOT NULL, 
	fk_produtos int NOT NULL,
	FOREIGN KEY (fk_venda) REFERENCES Venda(idVenda),  --  Aqui dizemos que a variavel fk_venda é uma chave estrangeira que se refere a tabela Venda e a variavel idVenda
	FOREIGN KEY (fk_produtos) REFERENCES Produtos(idPro) -- aqui dizemos que a variavel fk_produtos é uma chave estrangeira que se refere a tabela Produtos e a variavel idPro
);

INSERT INTO Cliente (nome, email, CPF, senha_hash) -- aqui a gente ta adicionando valores as tabelas
VALUES ('Lalal Lala', 'aaaaaaaa@gmail.com', '66622988112', 1234);

INSERT INTO telefone_Cliente (numero, fk_cliente) -- mesma coisa
VALUES ('11 912345678', 1);

SELECT * FROM Cliente; -- aqui a gente ta meio que mostrando esses valores, para funcionar é so fazer como se fosse copiar essa linha, clicar no direito do mouse e clicar em executar
SELECT * FROM telefone_Cliente;


COMMIT; -- Confirma a transação e grava de fato todas as tabelas na memória do SQL Server
