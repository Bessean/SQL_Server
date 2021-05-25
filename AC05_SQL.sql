-- CRIAÇÃO DO DATABASE E TABELAS E SEUS RELACIONAMENTOS

create database PETSHOP_DOGUINHO


use PETSHOP_DOGUINHO


CREATE TABLE T_CLIENTES
(
	ID_CLIENTE int IDENTITY(1,1) NOT NULL,
	NOME_DO_CLIENTE VARCHAR(100) NOT NULL,
	N_DOCUMENTO INT NOT NULL,
	DATA_DE_CADASTRO DATE NOT NULL,
	DATA_DE_ANIVERSARIO DATE NOT NULL


CONSTRAINT PK_T_CLIENTES PRIMARY KEY (ID_CLIENTE)

)

CREATE TABLE T_PETS
(
	ID_PET int IDENTITY(1,1) NOT NULL,
	NOME_DO_PET VARCHAR(100) NOT NULL,
	N_DOCUMENTO INT NOT NULL,
	DATA_DE_CADASTRO DATE NOT NULL,
	DATA_DE_ANIVERSARIO DATE NOT NULL,
	ID_CLIENTE int not null

	CONSTRAINT PK_T_PETS PRIMARY KEY (ID_PET)
	CONSTRAINT fk_T_PETS FOREIGN KEY (ID_CLIENTE)
	REFERENCES T_CLIENTES (ID_CLIENTE)
)



CREATE TABLE T_PRODUTOS
(
	id_produto		INT				IDENTITY	NOT NULL,
	NOME			VARCHAR(100)						,	
	PRECO_P			MONEY						NOT NULL,
	VALIDADE		DATE						NOT NULL,
	ID_FORNECEDOR	int							not null
	CONSTRAINT PK_T_PRODUTOS PRIMARY KEY (id_produto)
	CONSTRAINT fk_T_PRODUTOS_ID_FORNECEDOR FOREIGN KEY (ID_FORNECEDOR)
    REFERENCES T_FORNECEDORES (ID_FORNECEDOR)
)


CREATE TABLE T_SERVICOS
(
	ID_SERVICO	INT IDENTITY	NOT NULL,
	NOME		VARCHAR(100)			,	
	DESCRICAO	VARCHAR(200)			,
	PRECO_S		MONEY			NOT NULL

	CONSTRAINT PK_T_SERVICOS PRIMARY KEY (ID_SERVICO)

)


CREATE TABLE T_FORNECEDORES
(
	ID_FORNECEDOR			int				IDENTITY		NOT	NULL,
	NOME				  VARCHAR(100)						NOT	NULL

CONSTRAINT PK_T_FORNECEDORES PRIMARY KEY (ID_FORNECEDOR)

)



CREATE TABLE T_FUNCIONARIOS
(
ID_FUNC				int				IDENTITY		NOT	NULL,
NOME_DO_FUNC		VARCHAR (100)	NOT	NULL,
IDADE				INT				NOT	NULL,
DATA_NASCIMENTO		DATE		NOT	NULL

CONSTRAINT PK_T_FUNCIONARIOS PRIMARY KEY (ID_FUNC)
)



create table atendimentos

(
    ID_ATENDIMENTO		int identity (1,1) not null,
	id_servico			int					not null,
	id_cliente			int,
	nome_cliente		varchar (100)		not null,
	nome_pet			varchar (100)		not null,
    id_funcionario		int					not null
	
	CONSTRAINT PK_atendimentos PRIMARY KEY (ID_ATENDIMENTO)
	CONSTRAINT fk_atendimentos_id_servico FOREIGN KEY (id_servico)
    REFERENCES T_SERVICOS (ID_SERVICO),
	CONSTRAINT fk_atendimentos_id_funcionario FOREIGN KEY (id_funcionario)
    REFERENCES T_FUNCIONARIOS (ID_FUNC),
	CONSTRAINT fk_atendimentos_id_cliente FOREIGN KEY (id_cliente)
    REFERENCES T_CLIENTES (ID_CLIENTE)
	
)


  
create table vendas
(

  ID_VENDA			int				 identity (1,1) not null,
  NOME_DO_FUNC		varchar (100)	 not null,
  id_funcionario	int,
  id_prod			int,
  PRECO_P			MONEY			 NOT NULL,
  desconto			dec(3,2)		 not null,
  id_cliente		int				 not null

  CONSTRAINT PK_vendas PRIMARY KEY (ID_VENDA)
  CONSTRAINT fk_vendas_id_funcionario FOREIGN KEY (id_funcionario)
  REFERENCES T_FUNCIONARIOS (ID_FUNC),
  CONSTRAINT fk_vendas_id_prod FOREIGN KEY (id_prod)
  REFERENCES T_PRODUTOS (id_produto),
  CONSTRAINT fk_vendas_id_cliente FOREIGN KEY (id_cliente)
  REFERENCES T_CLIENTES (ID_CLIENTE)
  
)






-- POPULANDO AS TABELAS


INSERT INTO T_CLIENTES (NOME_DO_CLIENTE, N_DOCUMENTO, DATA_DE_CADASTRO, DATA_DE_ANIVERSARIO)
VALUES	('JOÃO', 123, '2021-01-25', '1990-05-15'),
		('MARIA', 456, '2021-02-24', '1960-04-07'),
		('PEDRO', 789, '2021-03-29', '1957-07-09'),
		('JULIA', 321, '2021-04-22', '1989-11-10'),
		('AMANDA', 654, '2021-02-14', '1973-09-02'),
		('BRENO',  987, '2021-05-01', '1977-01-21'),                
		('PAULO', 159, '2021-03-09', '1978-12-28'),
		('CARLOS', 753, '2021-01-04', '1985-06-04'),
		('CAROL', 258, '2021-04-03', '1969-08-17'),
		('BEATRIZ', 147, '2021-03-07', '1997-09-13')



INSERT INTO T_PETS (NOME_DO_PET, N_DOCUMENTO, DATA_DE_CADASTRO, DATA_DE_ANIVERSARIO,ID_CLIENTE)
VALUES	('THOR', 123, '2021-01-25', '2005-10-22',1),
		('LUKE', 456, '2021-02-24', '2007-04-07',2),
		('NICK', 789, '2021-03-29', '2015-07-09',3),
		('APOLO', 321, '2021-04-22', '2019-09-03',4),
		('BORIS', 654, '2021-02-14', '2014-05-18',5),
		('TOBBY',  987, '2021-05-01', '2012-11-30',6),
		('PINGO', 159, '2021-03-09', '2020-01-29',7),
		('JIMMY', 753, '2021-01-04', '2009-12-14',8),
		('CHARLIE', 258, '2021-04-03', '2016-02-11',9),
		('BILLY', 147, '2021-03-07', '2011-06-17',10)

	
INSERT T_PRODUTOS
( NOME , PRECO_P, VALIDADE,ID_FORNECEDOR)
VALUES
('Ração Top linha Premium 3kg', 58, '2025-02-12',1 ),
('Brinquedos Dog', 15, '2025-09-12',2 ),
('Anti Pulga', 45, '2023-01-12',3 ),
('Antibiótico Top Cura', 87, '2028-08-12',4 ),
('Vermífugo', 39, '2024-01-17',5 ),
('Banho a seco para caes e gatos', 35, '2022-06-10',6 ),
('Sachê Gato', 3, '2022-02-24',7 ),
('Sachê Dog', 4, '2022-02-24',8 ),
('Vitaminas', 15, '2021-02-10',9 ),
('Petisco', 12, '2022-05-16',10 )



INSERT T_SERVICOS
(NOME , DESCRICAO, PRECO_S)
VALUES
( 'Banho e Tosa' , 'Para seu pet ficar lindo e cheiroso', 90 ),
( 'Day Care' , 'Muito mais aconchegante que uma creche comum', 110 ),
( 'Dogwalker' , 'Porque passear é uma delícia', 30 ),
( 'PetSitter' , 'Cuidar com carinho e amor', 30 ),
( 'Hospedagem' , 'Seu Pet como um membro da família', 150 ),
( 'Veterinario Domicilio' , 'Cuidados com o seu Pet em casa', 120 ),
( 'Teleconsulta' , 'Cuidados com o seu Pet em uma ligação', 60 ),
( 'Adestrador' , 'Viva bem com seu cão ou gato', 75 ),
( 'Babá Pet' , 'Acompanhante domiciliar para seu pet não ficar sozinho', 100 ),
( 'Banho' , 'Para seu pet ficar cheiroso', 45 )


INSERT INTO T_FORNECEDORES (NOME)
VALUES	('ATACAPET'),
		('UNIVERSO PET'),
		('PETIX'),
		('BRASPETS'),
		('DOSPETS'),
		('RBC DISTRIBUIDORA'),
		('PET BRASIL'),
		('NB DISTRIBUIDORA'),
		('MY PET'),
		('JUMPET DISTRIBUIDORA')

		
INSERT INTO T_FUNCIONARIOS (NOME_DO_FUNC,idade,DATA_NASCIMENTO)
VALUES	('MARIANA',31, '1990-03-12'),
		('PEDRO', 36,'1985-10-27'),
		('HENRIQUE',24, '1997-07-28'),
		('ALICE', 32,'1989-05-13'),
		('ROBERTO', 48,'1973-06-18'),
		('CLAUDIO', 20, '2001-03-21'),
		('GABRIEL', 24,'1997-08-14'),
		('CARLOS ALBERTO', 38,'1983-06-23'),
		('LUISA', 21,'2000-05-25')

		
		
INSERT INTO vendas(NOME_DO_FUNC,id_funcionario,id_prod,PRECO_P,desconto,id_cliente)
VALUES	('Mariana',1,10,12.00,0.075,1),
		('Pedro',2,1,58.00,0.06,2),
		('Henrique',3,8,4.00,0.02,10),
		('Alice',4,8,4.00,0.02,4),
		('Roberto',5,3,45.00,0.09,5),
		('Mariana',1,4,87.00,0.08,2),
		('Gabriel',7,2,15.00,0.03,6),
		('Carlos Alberto',8,6,35.00,0.02,9),
		('Luisa',9,9,15.00,0.04,8)		
		
		
INSERT INTO atendimentos(id_servico,id_cliente,nome_cliente,nome_pet,id_funcionario)
VALUES	(10,5,'Amanda','Boris',9),
		(3,4,'Julia','Apolo',7),
		(9,7,'Paulo','Pingo',9),
		(6,10,'Beatriz','Billy',4),
		(3,9,'Carol','Charlie',7),
		(10,4,'Julia','Apolo',1),
		(4,1,'João','Thor',3),
		(5,6,'Breno','Tobby',4),
		(9,7,'Paulo','Pingo',5)				




select * from T_FUNCIONARIOS
select * from T_PRODUTOS
select * from T_PETS
select * from T_FORNECEDORES
select * from vendas
select * from atendimentos
select * from T_SERVICOS





-- Parte 02


-- 1

select	NOME_DO_CLIENTE,nome_do_pet
from	T_CLIENTES as cli full join T_PETS as pet 
on		cli.ID_CLIENTE = pet.ID_CLIENTE


-- 2

select		nome,COUNT(ate.id_servico) as QTD, sum (preco_s) as Lucro
from		atendimentos as ate inner join T_SERVICOS as serv
on			ate.id_servico = serv.ID_SERVICO
group by	serv.NOME


--3

select		f.NOME_DO_FUNC,count (v.NOME_DO_FUNC) as QTD_VENDAS
from		vendas as v inner join T_FUNCIONARIOS as f 
on			v.id_funcionario = f.ID_FUNC
group by	f.NOME_DO_FUNC


select		f.NOME_DO_FUNC,sum (v.PRECO_P) as Valor_Venda
from		vendas as v inner join T_FUNCIONARIOS as f 
on			v.id_funcionario = f.ID_FUNC
group by	f.NOME_DO_FUNC


--4


select top 3	 p.NOME, count (v.id_prod) as QTD_PROD 
from			 T_PRODUTOS as p inner join vendas as v
on				 p.id_produto = v.id_prod	
group by		 p.NOME	
order by		 QTD_PROD desc




select top 3	 s.NOME, count (a.id_servico) as QTD_Servicos
from			 atendimentos as a inner join T_SERVICOS as s
on				 a.id_servico = s.ID_SERVICO	
group by		 s.NOME	
order by		 QTD_Servicos desc
		
		
	