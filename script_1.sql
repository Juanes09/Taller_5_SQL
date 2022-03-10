
-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema Store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `Store`.`Product`
-- -----------------------------------------------------



-- -----------------------------------------------------
-- Table `Store`.`Provider`
-- -----------------------------------------------------




-- -----------------------------------------------------
-- Table `Store`.`Sale`
-- -----------------------------------------------------

-- MySQL Workbench Forward Engineering


-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `store` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE store ;

-- -----------------------------------------------------
-- Table `store`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS store.Customer (
  id_customer INT NOT NULL AUTO_INCREMENT,
  type_document VARCHAR(45) NOT NULL,
  number_document VARCHAR(45) NOT NULL,
  create_at DATE NOT NULL,
  update_at DATE NULL DEFAULT NULL,
  PRIMARY KEY (id_customer))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table store.Provider
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS store.Provider (
  idProvider INT NOT NULL AUTO_INCREMENT,
  prov_name VARCHAR(45) NOT NULL,
  prov_num_document VARCHAR(15) NOT NULL,
  prov_type_document VARCHAR(4) NOT NULL,
  prov_product VARCHAR(45) NULL DEFAULT NULL,
  prov_creat_at DATE NOT NULL,
  prov_update DATE NULL DEFAULT NULL,
  delete_sup DATE NULL DEFAULT NULL,
  PRIMARY KEY (idProvider),
  UNIQUE INDEX idSupplier_UNIQUE (idProvider ASC) VISIBLE,
  UNIQUE INDEX prov_num_document_UNIQUE (prov_num_document ASC) VISIBLE)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table store.Product
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS store.Product (
  id_Product INT NOT NULL AUTO_INCREMENT,
  name_product VARCHAR(45) NOT NULL,
  category_product VARCHAR(45) NOT NULL,
  price_product DOUBLE NOT NULL,
  creat_at_product DATE NOT NULL,
  update_product DATE NULL DEFAULT NULL,
  delete_id_product DATE NULL DEFAULT NULL,
  Provider_idProvider INT NOT NULL,
  PRIMARY KEY (id_Product),
  INDEX fk_Product_Provider1_idx (Provider_idProvider ASC) VISIBLE,
  CONSTRAINT fk_Product_Provider1
    FOREIGN KEY (Provider_idProvider)
    REFERENCES store.Provider (idProvider)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `store`.`Saller`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS store.Saller (
  id_Saller INT NOT NULL AUTO_INCREMENT,
  name_sell VARCHAR(45) NULL NOT NULL,
  type_document VARCHAR(45) NOT NULL,
  number_document VARCHAR(45) NOT NULL,
  create_at DATE NOT NULL,
  update_at DATE NULL DEFAULT NULL,
  delete_at DATE NULL DEFAULT NULL,
  PRIMARY KEY (id_Saller))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `store`.`Sale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS store.Sale (
  id_Sale INT NOT NULL AUTO_INCREMENT,
  sale_name_product VARCHAR(45) NOT NULL,
  customer_sale INT NULL DEFAULT NULL,
  create_sale DATE NOT NULL,
  date_anulated DATE NULL DEFAULT NULL,
  Saller_id_Saller INT NOT NULL,
  Customer_id_customer INT NOT NULL,
  Product_id_Product INT NOT NULL,
  PRIMARY KEY (id_Sale),
  INDEX fk_Sale_Saller1_idx (Saller_id_Saller ASC) VISIBLE,
  INDEX fk_Sale_Customer1_idx (Customer_id_customer ASC) VISIBLE,
  INDEX fk_Sale_Product1_idx (Product_id_Product ASC) VISIBLE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Insert data product
-- -----------------------------------------------------
INSERT INTO Product(name_product, category_product, price_product, creat_at_product, Provider_idProvider)
VALUES
  ('Colbon','Pegante',2500,'2020-09-5',1),
  ('lapiz Negro','Lapiz',1200,'2006-01-27',2),
  ('Liquid Paper','Corrector',1800,'2019-06-1',3),
  ('Cuaderno x100 Hojas','Utiles',6500,'2001-08-2',4),
  ('Cuaderno x50 Hojas','Utiles',3400,'2001-02-5',3),
  ('Marcador Negro','Utiles',1800,'2003-11-8',2),
  ('Block Carta x500','Papeleria',8900,'2003-06-17',1),
  ('Temperas x1','Pinturas',1200,'2015-04-12',2),
  ('Colores Doble Punta','Utiles',13000,'2004-02-17',2),
  ('Plastilina','Manualidades',6000,'2002-10-28',1),
  ('Tijeras','Utiles',1800,'2006-04-10',4),
  ('Borrador','Utiles',1000,'2010-07-16',3),
  ('Zacapuntas','Utiles',500,'2018-01-31',2),
  ('Bizturi','Manualidades',2500,'2003-10-10',1);

-- -----------------------------------------------------
-- Insert data provider
-- -----------------------------------------------------
INSERT INTO Provider(prov_name, prov_type_document, prov_num_document,prov_creat_at)
 VALUES
 ('Papyser','Nit' , '1-785347625','2006-04-10'),
 ('Abmgrupo', 'Nit' , '1-096235347','2003-10-10'),
 ('Panafargo', 'Nit' , '1-28347625', '2008-11-10'),
 ('Alvares_Soluciones', 'Nit' , '1-032335347', '2005-07-12');

-- -----------------------------------------------------
-- Insert data Sale
-- -----------------------------------------------------

INSERT INTO Sale(sale_name_product, create_sale, Customer_id_customer, Saller_id_Saller, Product_id_Product)
 VALUES
('Liquid Paper','2019-06-1',1,1,15),
('Cuaderno x50 Hojas','2001-02-5',3,1,17),
('Cuaderno x100 Hojas','2001-08-2',6,1,16),
('Marcador Negro','2003-11-8',1,1,12),
('Block Carta x500','2003-06-17',13,1,28),
('Temperas x1','2015-04-12',3,1,26),
('Colores Doble Punta','2004-02-17',6,1,22),
('Plastilina','2002-10-2',7,1,23),
('lapiz Negro','2009-01-17',8,1,17),
('Liquid Paper','2019-06-15',6,1,18);

-- -----------------------------------------------------
-- Insert data Customer
-- -----------------------------------------------------

INSERT INTO Customer(type_document, number_document, create_at)
 VALUES
 ('TI' , '1052347351','2020-10-08'),
 ('CC' , '62353445'  ,'2008-10-08'),
 ('CC' , '62353445'  ,'2008-10-08'),
 ('TI' , '1052347351','2020-10-08'),
 ('CC' , '76237483'  ,'2020-12-10'),
 ('CC' , '56238463'  ,'2020-12-10'),
 ('CE' , 'FR2345325' ,'2020-12-10'),
 ('CC' , '92359347'  ,'2020-10-14'),
 ('TI' , '1052347351','2020-09-12'),
 ('CE' , 'PE75123947','2020-12-14'),
 ('CE' , 'PE75123947','2020-11-13'),
 ('CE' , 'FR2345325' ,'2020-12-12'),
 ('CE' , 'PE75123947','2021-11-01'),
 ('CC' , '765231248' ,'2021-01-01');

-- -----------------------------------------------------
-- Insert data Saller
-- -----------------------------------------------------

INSERT INTO Saller(name_sell, type_document, number_document, create_at)
VALUES
('Juan','CC','71262098','2020-10-08');


-- ------------------------------------------------------
-- logical and physical deletions from the sales table --
-- ------------------------------------------------------

UPDATE Sale SET date_anulated = '2003-10-10' WHERE id_sale = 6;
UPDATE Sale SET date_anulated = '2004-02-17' WHERE id_sale = 2;


DELETE FROM Sale WHERE id_Sale = 4 ;
DELETE FROM Sale WHERE id_Sale = 10;


-- -----------------------------------------------------
-- change data by name and provider
-- -----------------------------------------------------

UPDATE Product SET name_Product = 'Libro Nacho Lee', category_product = 'Lecturas', update_product = '2019-06-1' WHERE id_product = 3;
UPDATE Product SET name_Product = 'Cuaderno 5 materias',category_product = 'Utiles', price_product = 15000,  update_product = '2001-02-5' WHERE id_product= 5;
UPDATE Product SET name_Product = 'Plastilina', category_product = 'Manualidades', update_product = '2020-10-2' WHERE id_product= 8;


