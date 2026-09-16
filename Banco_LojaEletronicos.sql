-- BANCO DE DADOS LOJA DE ELETRONICO
-- VERSÃO MYSQL!!

-- Desenvolvido por Larissa Dias, Alicia Fontes, Geovanna Novais e Felippi Angelo


-- CONFIGURAÇÕES BASICAS DO MYSQL!!
-- O MySQL não utiliza comandos como SET ANSI_NULLS ou GO. 
-- Em vez disso, criamos o banco diretamente se ele não existir e definimos o idioma padrão (UTF-8).

CREATE DATABASE IF NOT EXISTS `loja` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci; -- Confere se o banco existe -> Cria o banco -> Define o idioma
USE `loja`; -- Avisa ao sistema que os comandos a partir daqui pertencem ao banco loja


START TRANSACTION; -- indica que o sistema so deve executar se tudo estiver certinho, a mesma função do beggin transiction

-- INICIO DO CODIGO!!

-- Detalhes importantes: NOT NULL serve para avisar ao sistema que tal informação não pode ser vazia PRECISA DE VALOR.
	-- Aqui usamos `
	-- "ENGINE=InnoDB" é o mecanismo de armazenamento: Faz as chaves estrangeiras funcionarem, Permite que caso o sistema falhe ele tente não corromper o banco e recupera informações caso o sistema desligue
	-- "DEFAULT CHARSET=utf8mb4" define basicamente os caracteres que o sistema deve aceitar, define o idioma e caracteres especiais, usa até 4 bytes para guardar cada letra e aceita basicamente qualquer coisa, inclusive emoji

CREATE TABLE `Cliente` -- Criando a tabela Cliente
(
	`idCli` int NOT NULL AUTO_INCREMENT PRIMARY KEY, -- Determinamos como Chave primaria. Adicionamos auto-incremento 
	`nome` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`CPF` varchar(11) NOT NULL -- Adicionar mascara no java
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `telefone_Cliente` -- Criando tabela telefone_Cliente, essa tabela existe pois o telefone é multivalorado e pode ter mais de um valor
(
  `cod_telefone` int NOT NULL AUTO_INCREMENT PRIMARY KEY, -- Chave primaria. Adicionamos auto-incremento
  `numero` varchar(14) NOT NULL,

  `fk_cliente` int NOT NULL, 
  FOREIGN KEY (`fk_cliente`) REFERENCES `Cliente`(`idCli`) -- Aqui dizemos que a variavel fk_cliente é uma chave estrangeira que referencia a tabela Cliente e a variavel idCli
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `endereco_cliente` -- Criando tabela endereco_cliente, ela existe pois o endereço é um atributo composto, logo ele é feito por mais de uma informação
(
	`id_endereco` int NOT NULL AUTO_INCREMENT PRIMARY KEY, -- Chave primaria
	`cep` varchar(8) NOT NULL, 
	`bairro` varchar(255) NOT NULL, 
	`logradouro` varchar(255), -- sem NOT NULL pois não é uma informação obrigatoria
	`cidade` varchar(255) NOT NULL, 
	`estado` varchar(255) NOT NULL, 
	`numero` varchar(10) NOT NULL,
	`complemento` varchar(255), -- sem NOT NULL pois não é uma informação obrigatoria

	`fk_cliente` int NOT NULL,
	FOREIGN KEY (`fk_cliente`) REFERENCES `Cliente`(`idCli`) -- Aqui dizemos que a variavel fk_cliente é uma chave estrangeira que referencia a tabela Cliente e a variavel idCli
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `Funcionario` -- Criando a tabela Funcionario
(
	`idFun` int NOT NULL AUTO_INCREMENT PRIMARY KEY,-- Chave primaria
	`nome` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`CPF` varchar(11) NOT NULL, -- Adicionar mascara no java
	`CTPS` varchar(12) NOT NULL, -- Adicionar mascara no java, eu acho
	`setor` varchar(255) NOT NULL,
	`funcao` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `telefone_Funcionario` -- Criando a tabela telefone_Funcionario
(
  `cod_telefone` int NOT NULL AUTO_INCREMENT PRIMARY KEY, -- Chave primaria. Adicionamos auto-incremento
  `numero` varchar(14) NOT NULL,

  `fk_funcionario` int NOT NULL,
  FOREIGN KEY (`fk_funcionario`) REFERENCES `Funcionario`(`idFun`) -- Aqui dizemos que a variavel fk_funcionario é uma chave estrangeira que referencia a tabela Funcionario e a variavel idFun
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `endereco_funcionario` -- Criando a tabela endereco_funcionario
(
	`id_endereco` int NOT NULL AUTO_INCREMENT PRIMARY KEY, -- Chave primaria. Adicionamos auto-incremento 
	`cep` varchar(8) NOT NULL, -- Mantido varchar para proteger os zeros iniciais no Java
	`bairro` varchar(255) NOT NULL, 
	`logradouro` varchar(255), -- sem NOT NULL pois não é uma informação obrigatoria
	`cidade` varchar(255) NOT NULL, 
	`estado` varchar(255) NOT NULL, 
	`numero` varchar(10) NOT NULL, -- Ajustado para varchar(10) igual ao do cliente para aceitar letras/números
	`complemento` varchar(255), -- sem NOT NULL pois não é uma informação obrigatoria

	`fk_funcionario` int NOT NULL,
	FOREIGN KEY (`fk_funcionario`) REFERENCES `Funcionario`(`idFun`) -- Aqui dizemos que a variavel fk_funcionario é uma chave estrangeira que referencia a tabela Funcionario e a variavel idFun
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `Fornecedor` -- Criando a tabela Fornecedor
(
	`CNPJFornecedor` varchar(14) NOT NULL PRIMARY KEY, -- Chave primaria que o usuario deve fornecer. Modificado para varchar(14) para não perder zeros à esquerda na integração com o Java!
	`nome` varchar(255) NOT NULL,
	`dt_lote` date NOT NULL -- So para especificar, aqui se refere a data de fabricação do lote

	-- no programa vamos precisar fazer uma conexão entre o funcionario e o fornecedor, ja que não colocamos forma de contato aqui 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `endereco_fornecedor` -- Criando a tabela endereco_fornecedor
(
	`cep` varchar(8) NOT NULL PRIMARY KEY, -- Modificado para varchar(8) para seguir o padrão perfeito do CEP e aceitar zeros iniciais
	`bairro` varchar(255) NOT NULL, 
	`logradouro` varchar(255), -- sem NOT NULL pois não é uma informação obrigatoria
	`cidade` varchar(255) NOT NULL, 
	`estado` varchar(255) NOT NULL, 
	`numero` varchar(10) NOT NULL, -- Ajustado para varchar(10) para aceitar letras/números como "S/N"
	`complemento` varchar(255), -- sem NOT NULL pois não é uma informação obrigatoria

	`fk_fornecedor` varchar(14) NOT NULL, -- Modificado para varchar(14) para bater exatamente com o tipo da chave primária de Fornecedor
	FOREIGN KEY (`fk_fornecedor`) REFERENCES `Fornecedor`(`CNPJFornecedor`) -- Aqui dizemos que a variavel fk_fornecedor é uma chave estrangeira que referencia a tabela Fornecedor e a variavel CNPJFornecedor
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `Produtos` -- Criando a tabela Produtos
(
	`idPro` int NOT NULL AUTO_INCREMENT PRIMARY KEY, -- Chave primaria. Adicionamos auto-incremento
	`nome` varchar(255) NOT NULL,
	`preco` decimal(10,2) NOT NULL, -- Decimal pois preços tem centavos 
	`estoque` int NOT NULL,
	`marca` varchar(255) NOT NULL,

	`fk_fornecedor` varchar(14) NOT NULL, -- Modificado para varchar(14) para bater exatamente com o tipo de Fornecedor
	FOREIGN KEY (`fk_fornecedor`) REFERENCES `Fornecedor`(`CNPJFornecedor`)  -- Aqui dizemos que a variavel fk_fornecedor é uma chave estrangeira que referencia a tabela Fornecedor e a variavel CNPJFornecedor
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `Categoria` -- Criando a tabela Categoria
(
	`idCat` int NOT NULL AUTO_INCREMENT PRIMARY KEY, -- Chave primaria. Adicionamos auto-incremento
	`tipo` varchar(255) NOT NULL,

	`fk_produtos` int NOT NULL, 
	FOREIGN KEY (`fk_produtos`) REFERENCES `Produtos`(`idPro`) -- Aqui dizemos que a variavel fk_produtos é uma chave estrangeira que se refere a tabela Produtos e a variavel idPro
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `Venda` 
(
	`idVenda` int NOT NULL AUTO_INCREMENT PRIMARY KEY, -- Chave primaria. Adicionamos auto-incremento
	`valor` decimal(10,2) NOT NULL, -- decimal pois preços tem centavos
	`dt_venda` datetime NOT NULL, -- datetime pois é um campo especifico que pede o modelo 0000-00-00 00:00:00

	`fk_cliente` int NOT NULL, 
	`fk_funcionario` int NOT NULL,
	FOREIGN KEY (`fk_cliente`) REFERENCES `Cliente`(`idCli`), -- Aqui dizemos que a variavel fk_cliente é uma chave estrangeira que se refere a tabela Cliente e a variavel idCli
	FOREIGN KEY (`fk_funcionario`) REFERENCES `Funcionario`(`idFun`) -- Aqui dizemos que a variavel fk_funcionario é uma chave estrangeira que se refere a tabela Funcionario e a variavel idFun
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `itemVenda` 
(
	`idItem` int NOT NULL AUTO_INCREMENT PRIMARY KEY, -- Chave primaria. Adicionamos auto-incremento
	`dt_item` datetime NOT NULL, -- datetime pois é um campo especifico que pede o modelo 0000-00-00 00:00:00
	`status_venda` varchar(200) NOT NULL,

	`fk_venda` int NOT NULL, 
	`fk_produtos` int NOT NULL,
	FOREIGN KEY (`fk_venda`) REFERENCES `Venda`(`idVenda`),  --  Aqui dizemos que a variavel fk_venda é uma chave estrangeira que se refere a tabela Venda e a variavel idVenda
	FOREIGN KEY (`fk_produtos`) REFERENCES `Produtos`(`idPro`) -- aqui dizemos que a variavel fk_produtos é uma chave estrangeira que se refere a tabela Produtos e a variavel idPro
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

COMMIT; -- salva tudo definitivamente no banco de dados MySQL
