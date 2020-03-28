# DataBase #1

## Configure Postgres + PGAdmin usando docker

Vamos aprender neste documento como criar dois containers interligados pela mesma network e criar um banco, 3 tabelas relacionadas e 5 registros em cada.

### Entendendo o docker compose

Vamos utilizar um arquivo que está localizado em ./docker-compose/PostgreSQL/docker-compose.yml, onde vamos declarar qual imagem e setar algumas variáveis para configurar tanto nosso banco `postgre` e também o `pgadmin`para nos ajudar a interagir com este banco.

```Docker
version: "3"

services:
  postgres-2:
    image: postgres:alpine
    environment:
      POSTGRES_PASSWORD: "postgres"
    ports:
      - "5555:5555"
    volumes:
      - /Users/a116822/npc/ads-database/docker-compose/PostgreSQL/Data:/var/lib/postgresql/data
    networks:
      - postgres-compose-network

  pgadmin-2:
    image: dpage/pgadmin4
    environment:
      PGADMIN_DEFAULT_EMAIL: "andretmaciel@gmail.com"
      PGADMIN_DEFAULT_PASSWORD: "postgres"
    ports:
      - "16543:80"
    depends_on:
      - postgres-2
    networks:
      - postgres-compose-network

networks:
  postgres-compose-network:
    driver: bridge

```

![Gif](https://github.com/AndreMaciel66/ads-database/blob/gh-pages/imgs/postgres-docker.gif?raw=true "Image Title")

## Create Tables

Para criar as tabelas utilizei os seguintes comandos abaixo:

### Tabela Clientes

Na tabela de clientes temos vários campos que são referentes aos clientes, para cadastro posterior em alguma aplicação web, por exemplo.

```sql
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
```

### Tabela Carros

A tabela carro também segue a mesma lógica da tabela de clientes, utilizando somente uma chave primária e por enquanto nenhuma `foreign key`.

```SQL
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
```

### Tabela Aluguel

Esta tabela faz referencias para as chaves secundárias vindo da tabela `carros`e `clientes`.

```sql
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
```

## Inserindo registros

Segundo a tarefa passada pelo professor, devemos inserir 5 registros em cada tabela.

### Insert Into Carros

Como vcs podem ver no código abaixo, eu utilizei uma extensão do VSCODE chamada `Prettier` para formatar o código de uma maneira mais legível - inclusive estou utilizando em todo o meu repositório.

```sql
INSERT INTO 
dbo.carros
    (id_carro, placa, marca, modelo, ano, kmatual, valorkm)
VALUES
    (1, 'hjs-7929', 'Onix', 'std', 2019, 1000, 50.92);

INSERT INTO 
dbo.carros
    (id_carro, placa, marca, modelo, ano, kmatual, valorkm)
VALUES
    (2, 'pwd-1234', 'BMW', 'Advanced', 2020, 15000, 80);

INSERT INTO 
dbo.carros
    (id_carro, placa, marca, modelo, ano, kmatual, valorkm)
VALUES
    (3, 'peg-5520', 'Pegeaut', '207', 1999, 100000, 15);

INSERT INTO 
dbo.carros
    (id_carro, placa, marca, modelo, ano, kmatual, valorkm)
VALUES
    (4, 'fer-1111', 'Ferrari', 'Vermelha', 2014, 15000, 75);

INSERT INTO 
dbo.carros
    (id_carro, placa, marca, modelo, ano, kmatual, valorkm)
VALUES
    (5, 'cit-9999', 'Citroen', 'c3', 2006, 45000, 40);
```