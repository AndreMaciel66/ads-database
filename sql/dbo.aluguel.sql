CREATE TABLE dbo.aluguel
(
    id_aluguel int NOT NULL,
    id_cliente int NOT NULL,
    id_carro int NOT NULL,
    dtaluguelinicial date default null,
    dtaluguelfinal date DEFAULT NULL,
    kminicial int DEFAULT NULL,
    kmfinal int DEFAULT NULL,
    valortotal bigint DEFAULT NULL,
    PRIMARY KEY (id_aluguel),
    CONSTRAINT aluguel_ibfk_1 FOREIGN KEY
    (id_cliente) REFERENCES dbo.cliente
    (id_cliente),
    CONSTRAINT aluguel_ibfk_2 FOREIGN KEY
    (id_carro) REFERENCES dbo.carros
    (id_carro)
)