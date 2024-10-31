DROP SCHEMA if exists demiurgo;
CREATE SCHEMA demiurgo;
use demiurgo;

CREATE TABLE demiurgo_service(
	service_id BIGINT AUTO_INCREMENT,
	service_name VARCHAR(50) NOT NULL,
	service_description LONGTEXT,
  
	CONSTRAINT pk_demiurgo_service PRIMARY KEY (service_id)

);
INSERT INTO demiurgo_service VALUES (null, "Ferreiro", "Faz armas");
INSERT INTO demiurgo_service VALUES (null, "Fabricante de fogos de artifício", "Faz fogos de artifício");
INSERT INTO demiurgo_service VALUES (null, "Demolidor", "Explode coisas");
INSERT INTO demiurgo_service VALUES (null, "Alquimista", "Faz poções");
INSERT INTO demiurgo_service VALUES (null, "Mago", "Faz magias");
  
CREATE TABLE demiurgo_provider(
	provider_id BIGINT AUTO_INCREMENT,
	provider_name VARCHAR(50) NOT NULL,
	provider_cpf VARCHAR(11) UNIQUE NOT NULL,
    
	CONSTRAINT pk_demiurgo_provider PRIMARY KEY (provider_id)

);
INSERT INTO demiurgo_provider VALUES (null, "Kazuha", "68543175097");
INSERT INTO demiurgo_provider VALUES (null, "Yoimiya", "70782764002");
INSERT INTO demiurgo_provider VALUES (null, "Klee", "62497178038");
INSERT INTO demiurgo_provider VALUES (null, "Albedo", "95903853030");
INSERT INTO demiurgo_provider VALUES (null, "Lisa", "89566175035");

CREATE TABLE demiurgo_provider_service(
	provider_id BIGINT,
	service_id BIGINT,
    
	CONSTRAINT pk_demiurgo_provider_service PRIMARY KEY (provider_id, service_id),
	CONSTRAINT fk_demiurgo_provider_service FOREIGN KEY (service_id) REFERENCES demiurgo_service (service_id),
	CONSTRAINT fk_demiurgo_provider_provider FOREIGN KEY (provider_id) REFERENCES demiurgo_provider (provider_id)
	
);
INSERT INTO demiurgo_provider_service VALUES (1, 1);
INSERT INTO demiurgo_provider_service VALUES (2, 2);
INSERT INTO demiurgo_provider_service VALUES (3, 2);
INSERT INTO demiurgo_provider_service VALUES (3, 3);
INSERT INTO demiurgo_provider_service VALUES (4, 4);
INSERT INTO demiurgo_provider_service VALUES (5, 4);
INSERT INTO demiurgo_provider_service VALUES (5, 5);

CREATE TABLE demiurgo_user(
	user_id BIGINT AUTO_INCREMENT,
	user_name VARCHAR(50) NOT NULL,
    user_birthdate DATE NOT NULL,
    user_address VARCHAR(90) NOT NULL,
	user_cpf VARCHAR(11) UNIQUE NOT NULL,
    user_password VARCHAR(30) NOT NULL,
    
	CONSTRAINT pk_demiurgo_user PRIMARY KEY (user_id)

);
INSERT INTO demiurgo_user VALUES (null, "Jean", "2000-09-14", "Mondstadt","30816605050", "Barbara");
INSERT INTO demiurgo_user VALUES (null, "Zhongli", "0001-04-04", "Liyue" ,"86259252005", "FaltaMoney");
INSERT INTO demiurgo_user VALUES (null, "Robin", "2015-09-13", "Estação Espacial" ,"25303310060", "NowImDJ");

CREATE TABLE demiurgo_order(
	order_id BIGINT AUTO_INCREMENT,
	order_value DECIMAL(10,2),
    order_date DATE NOT NULL,
    order_conclusion_forecast DATE NOT NULL,
    order_conclusion DATE,
	user_id BIGINT,
	provider_id BIGINT,
	service_id BIGINT,
	order_description LONGTEXT,
    
	CONSTRAINT pk_demiurgo_order PRIMARY KEY (order_id),
	CONSTRAINT fk_demiurgo_order_service FOREIGN KEY (service_id) REFERENCES demiurgo_service (service_id),
	CONSTRAINT fk_demiurgo_order_provider FOREIGN KEY (provider_id) REFERENCES demiurgo_provider (provider_id),
	CONSTRAINT fk_demiurgo_order_user FOREIGN KEY (user_id) REFERENCES demiurgo_user (user_id)
    
);
INSERT INTO demiurgo_order VALUES (null, 200.00, CURRENT_DATE(), "2024-11-27", NULL, 1, 1, 1, "Necessita-se de várias espadas novas para os Cavaleiros de Favonius.");
INSERT INTO demiurgo_order VALUES (null, 1000.00, CURRENT_DATE(), "2025-01-01", NULL, 1, 4, 4, "Necessitamos de poções de cura para as lutas eminentes contra o abismo.");
INSERT INTO demiurgo_order VALUES (null, 5000.00, CURRENT_DATE(), "2024-11-11", NULL, 2, 3, 3, "Queremos explodir uma montanha.");
INSERT INTO demiurgo_order VALUES (null, 2000.00, CURRENT_DATE(), "2024-12-29", NULL, 2, 3, 2, "Queremos fogos de artifício para o próximo festival de Liyue.");