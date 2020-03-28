CREATE TABLE dbo.carros
(
    id_carro int NOT NULL,
    placa char(8) DEFAULT NULL,
    marca VARCHAR(100) DEFAULT NULL,
    modelo varchar(100) DEFAULT NULL,
    ano int DEFAULT NULL,
    kmatual int DEFAULT NULL,
    valorkm bigint DEFAULT NULL,
    PRIMARY KEY (id_carro)
)