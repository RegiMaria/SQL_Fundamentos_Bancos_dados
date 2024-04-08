CREATE DATABASE loja;
USE loja;
-- Renomear a tabela cadastro para login
RENAME TABLE cadastro TO login;
-- Renomear idcadastro para idlogin 
ALTER TABLE login
CHANGE COLUMN idcadastro idlogin INT AUTO_INCREMENT;
  
  
CREATE TABLE cliente (
idcliente int NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(45)  NOT NULL,
cpf VARCHAR(11) NOT NULL,
email VARCHAR(45) NOT NULL,
telefone VARCHAR(45) NOT NULL,
data_cadastro DATE NOT NULL,
ultimo_login DATETIME  NOT NULL
);
CREATE TABLE endereco (
idendereco  int  NOT NULL AUTO_INCREMENT PRIMARY KEY,
cep VARCHAR(9) NOT NULL,
rua VARCHAR(45) NOT NULL,
bairro VARCHAR(45) NOT NULL,
cidade VARCHAR(45) NOT NULL,
UF VARCHAR(2)
);
-- exclui essa tabela
CREATE TABLE cliente_endereco (
    idcliente INT NOT NULL,
    idendereco INT NOT NULL,
    FOREIGN KEY (idcliente) REFERENCES cliente(idcliente),
    FOREIGN KEY (idendereco) REFERENCES endereco(idendereco),
    PRIMARY KEY (idcliente, idendereco)
);

/* A declaração PRIMARY KEY (idcliente, idendereco) na tabela cliente_endereco 
define uma chave primária composta, onde a combinação dos campos idcliente e idendereco
 é única. Isso significa que cada par de valores de idcliente e idendereco na tabela 
 cliente_endereco deve ser único.Essa abordagem garante que um cliente 
 não possa ter o mesmo endereço associado a ele mais de uma vez na tabela cliente_endereco,
 evitando duplicatas e mantendo a integridade dos dados. 
 Além disso, facilita a recuperação eficiente de informações 
 sobre os endereços de um cliente específico, já que a chave primária é usada como 
 índice para pesquisa rápida.*/;
 
CREATE TABLE login(
idlogin int  NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(45)  NOT NULL,
senha VARCHAR(45)  NOT NULL,
senha_esquecida VARCHAR(45) NOT NULL,
registrar VARCHAR(45)  NOT NULL,
id_cliente INT  NOT NULL,
id_endereco INT  NOT NULL,
 FOREIGN KEY (id_cliente) REFERENCES cliente(idcliente),
 FOREIGN KEY (id_endereco) REFERENCES endereco(idendereco));
 
CREATE TABLE produto (
idproduto int  NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(45)  NOT NULL,
descricao  VARCHAR(45)  NOT NULL,
preco_unitario decimal (8,2)  NOT NULL,
estoque VARCHAR(45)  NOT NULL,
id_marca int NOT NULL,
id_cor int  NOT NULL,
id_tamanho int NOT NULL,
id_imagem int NOT NULL,
id_categoria int NOT NULL,
id_subcategoria int  NOT NULL,
FOREIGN KEY (id_marca) REFERENCES marca (idmarca),
FOREIGN KEY (id_cor ) REFERENCES cor (idcor),
FOREIGN KEY (id_tamanho) REFERENCES tamanho (idtamanho),
FOREIGN KEY (id_imagem) REFERENCES imagem (idimagem),
FOREIGN KEY (id_categoria) REFERENCES categoria (idcategoria),
FOREIGN KEY (id_subcategoria) REFERENCES subcategoria (idsubcategoria)
);  
 CREATE TABLE marca(
idmarca int  NOT NULL AUTO_INCREMENT PRIMARY KEY ,
nome VARCHAR(45)  NOT NULL,
descricao VARCHAR(100)  NOT NULL
 );
 
 CREATE TABLE cor (
idcor  int  NOT NULL AUTO_INCREMENT PRIMARY KEY ,
nome VARCHAR(45)  NOT NULL,
descricao VARCHAR(100)  NOT NULL 
);
 
 CREATE TABLE tamanho (
idtamanho int  NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(45)  NOT NULL,
descricao VARCHAR(45)  NOT NULL
);

 CREATE TABLE imagem (
idimagem int  NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(45)  NOT NULL ,
descricao VARCHAR(100)  NOT NULL 

);

CREATE TABLE categoria (
idcategoria int  NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(45)  NOT NULL,
descricao VARCHAR(100)  NOT NULL
);

CREATE TABLE subcategoria (
idsubcategoria int  NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(45)  NOT NULL,
descricao VARCHAR(200)  NOT NULL
);

CREATE TABLE pedido (
idpedido int NOT NULL AUTO_INCREMENT PRIMARY KEY, 
data_pedido datetime,
status_pedido VARCHAR (45),
total_pedido DECIMAL (8,2),
tipo_envio VARCHAR (100),
forma_pagamento VARCHAR (100),
valor_frete DECIMAL (8,2),
id_cliente int NOT NULL,
id_endereco int,
FOREIGN KEY (id_cliente) REFERENCES cliente (idcliente),
FOREIGN KEY (id_endereco) REFERENCES endereco (id_endereco)
);

CREATE TABLE pedido_item(
idpedido_item int NOT NULL AUTO_INCREMENT PRIMARY KEY,
preco_unitario decimal (8,2),
quantidade int NOT NULL,
id_pedido int NOT NULL, 
id_produto int NOT NULL,
FOREIGN KEY (id_pedido) REFERENCES pedido (idpedido),
FOREIGN KEY (id_produto) REFERENCES produto (idproduto)
);

CREATE TABLE tipo_pagamento (
idtipo_pagamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
data_pedido datetime NOT NULL,
status_pedido VARCHAR (45) NOT NULL, 
total_pedido DECIMAL (8,2) NOT NULL,
forma_pagamento VARCHAR (100) NOT NULL,
valor_frete DECIMAL (8,2), 
id_endereco_entrega int NOT NULL,
id_cliente int NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES cliente (idcliente),
FOREIGN KEY (id_endereco_entrega) REFERENCES endereco (idendereco)
);

CREATE TABLE carrinho (
idcarrinho INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
data_criacao DATETIME NOT NULL,
status_carrinho VARCHAR (100) NOT NULL,
id_cliente INT NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES cliente (idcliente)
);

CREATE TABLE carrinho_item (
idcarinho_item int NOT NULL AUTO_INCREMENT PRIMARY KEY,
data_criacao DATETIME NOT NULL,
quantidade INT NOT NULL,
preco_unitario DECIMAL (8,2) NOT NULL,
subtotal DECIMAL (8,2) NOT NULL,
id_produto int NOT NULL,
id_carrinho int NOT NULL,
FOREIGN KEY (id_carrinho) REFERENCES carrinho (idcarrinho),
FOREIGN KEY (id_produto) REFERENCES produto (idproduto)
);
CREATE TABLE administrador (
idadministrador INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR (45) NOT NULL,
email VARCHAR (45) NOT NULL,
senha VARCHAR (45) NOT NULL,
cargo VARCHAR (45) NOT NULL,
data_cadastro DATETIME NOT NULL,
ultimo_acesso DATETIME NOT NULL
);

CREATE TABLE autenticacao (
    idautenticacao INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(45) NOT NULL,
    senha VARCHAR(45) NOT NULL,
    id_administrador INT NOT NULL,
    FOREIGN KEY (id_administrador) REFERENCES administrador(idadministrador)
);

CREATE TABLE permissoes (
idpermissoes INT AUTO_INCREMENT PRIMARY KEY,
gerenciamento_produto VARCHAR(45) NOT NULL ,
gerenciamento_pedido VARCHAR(45) NOT NULL,
gereciamento_estoque  decimal (14,5),
id_administrador int NOT NULL,
FOREIGN KEY (id_administrador) REFERENCES administrador (idadministrador)
);

