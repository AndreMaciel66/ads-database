CREATE TABLE dbo.cliente
(
    id_cliente int NOT NULL,
    nome varchar(100) DEFAULT NULL,
    dtnasc date DEFAULT NULL,
    cpf varchar(14) DEFAULT NULL,
    cnh varchar(11) DEFAULT NULL,
    endereco varchar(250) DEFAULT NULL,
    PRIMARY KEY (id_cliente)
) 