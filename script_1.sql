
-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema Store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS Store ;
USE Store ;

-- -----------------------------------------------------
-- Table `Store`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Store.Product (
  id_Product INT NOT NULL AUTO_INCREMENT,
  name_product VARCHAR(45) NOT NULL,
  category_product VARCHAR(45) NOT NULL,
  price_product DOUBLE NOT NULL,
  creat_at_product DATE NOT NULL,
  update_product DATE NULL,
  delete_id_product DATE NULL,
  PRIMARY KEY (id_Product))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Store.Provider
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Store.Provider (
  idProvider INT NOT NULL AUTO_INCREMENT,
  prov_name VARCHAR(45) NOT NULL,
  prov_num_document VARCHAR(15) NOT NULL,
  prov_type_document VARCHAR(4) NOT NULL,
  prov_product VARCHAR(45),
  prov_creat_at DATE NOT NULL,
  prov_update DATE NULL,
  delete_sup DATE NULL,
  PRIMARY KEY (idProvider),
  UNIQUE INDEX idSupplier_UNIQUE (idProvider ASC) VISIBLE,
  UNIQUE INDEX prov_num_document_UNIQUE (prov_num_document ASC) VISIBLE)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table Store.Sale
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS Store.Sale (
  id_Sale INT NOT NULL AUTO_INCREMENT,
  sale_name_product VARCHAR(45) NOT NULL,
  customer_sale INT NULL,
  create_sale DATE NOT NULL,
  date_anulated DATE NULL,
  Customer_id_Customer1 INT,
  PRIMARY KEY (id_Sale, Customer_id_Customer1),
  INDEX fk_Sale_Customer1_idx (Customer_id_Customer1 ASC) VISIBLE,
  CONSTRAINT fk_Sale_Customer1
    FOREIGN KEY (Customer_id_Customer1)
    REFERENCES Store.Customer (id_Customer)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `Store`.`Saller`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Store.Saller (
  id_Saller INT NOT NULL,
  name_sell VARCHAR(45) NOT NULL,
  type_document_sell VARCHAR(45) NOT NULL,
  number_document_sell VARCHAR(45) NOT NULL,
  creat_at_sell DATE NOT NULL,
  update_sell DATE NOT NULL,
  delete_sell DATE NOT NULL,
  Sale_id_Sale INT NOT NULL,
  PRIMARY KEY (id_Saller, Sale_id_Sale),
  INDEX fk_Saller_Sale1_idx (Sale_id_Sale ASC) VISIBLE,
  CONSTRAINT fk_Saller_Sale1
    FOREIGN KEY (Sale_id_Sale)
    REFERENCES Store.Sale (id_Sale)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Store`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Store.Customer (
  id_customer INT NOT NULL AUTO_INCREMENT,
  type_document VARCHAR(45) NOT NULL,
  number_document VARCHAR(45) NOT NULL,
  create_at DATE NOT NULL,
  update DATE NOT NULL,
  PRIMARY KEY (id_customer))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Store`.`Product_has_Sale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Store.Product_has_Sale (
  Product_id_Product INT NOT NULL,
  Product_Sale_idSale INT NOT NULL,
  Sale_id_Sale INT NOT NULL,
  PRIMARY KEY (Product_id_Product, Product_Sale_idSale, Sale_id_Sale),
  INDEX fk_Product_has_Sale_Sale1_idx (Sale_id_Sale ASC) VISIBLE,
  INDEX fk_Product_has_Sale_Product1_idx (Product_id_Product ASC, Product_Sale_idSale ASC) VISIBLE,
  CONSTRAINT fk_Product_has_Sale_Product1
    FOREIGN KEY (Product_id_Product)
    REFERENCES Store.Product (id_Product)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Product_has_Sale_Sale1
    FOREIGN KEY (Sale_id_Sale)
    REFERENCES Store.Sale (id_Sale)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Store`.`Product_has_Provider`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Store.Product_has_Provider (
  Product_id_Product INT NOT NULL,
  Provider_idProvider INT NOT NULL,
  PRIMARY KEY (Product_id_Product, Provider_idProvider),
  INDEX fk_Product_has_Provider_Provider1_idx (Provider_idProvider ASC) VISIBLE,
  INDEX fk_Product_has_Provider_Product1_idx (Product_id_Product ASC) VISIBLE,
  CONSTRAINT fk_Product_has_Provider_Product1
    FOREIGN KEY (Product_id_Product)
    REFERENCES Store.Product (id_Product)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Product_has_Provider_Provider1
    FOREIGN KEY (Provider_idProvider)
    REFERENCES Store.Provider (idProvider)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Store`.`Customer_has_Sale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Store.Customer_has_Sale (
  Customer_id_customer INT NOT NULL,
  Sale_id_Sale INT NOT NULL,
  PRIMARY KEY (Customer_id_customer, Sale_id_Sale),
  INDEX fk_Customer_has_Sale_Sale1_idx (Sale_id_Sale ASC) VISIBLE,
  INDEX fk_Customer_has_Sale_Customer1_idx (Customer_id_customer ASC) VISIBLE,
  CONSTRAINT fk_Customer_has_Sale_Customer1
    FOREIGN KEY (Customer_id_customer)
    REFERENCES Store.Customer (id_customer)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Customer_has_Sale_Sale1
    FOREIGN KEY (Sale_id_Sale)
    REFERENCES Store.Sale (id_Sale)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


INSERT INTO Product(name_product,category_product,price_product, creat_at_product)
VALUES
  ("Colbon","Pegante",2500,"2020-09-5"),
  ("lapiz Negro","Lapiz",1200,"2006-01-27"),
  ("Liquid Paper","Corrector",1800,"2019-06-1"),
  ("Cuaderno x100 Hojas","Utiles",6500,"2001-08-2"),
  ("Cuaderno x50 Hojas","Utiles",3400,"2001-02-5"),
  ("Marcador Negro","Utiles",1800,"2003-11-8"),
  ("Block Carta x500","Papeleria",8900,"2003-06-17"),
  ("Temperas x1","Pinturas",1200,"2015-04-12"),
  ("Colores Doble Punta","Utiles",13000,"2004-02-17"),
  ("Platilina","Manualidades",6000,"2002-10-28"),
  ("Tijeras","Utiles",1800,"2006-04-10"),
  ("Borrador","Utiles",1000,"2010-07-16"),
  ("Zacapuntas","Utiles",500,"2018-01-31"),
  ("Bizturi","Manualidades",2500,"2003-10-10");
  
  
INSERT INTO Provider(prov_name, prov_type_document,prov_num_document, prov_creat_at)
 VALUES
 ("Papyser","Nit" , "1-785347625","2006-04-10"),
 ("Abmgrupo", "Nit" , "1-096235347","2003-10-10"),
 ("Panafargo", "Nit" , "1-28347625", "2008-11-10"),
 ("Alvares_Soluciones", "Nit" , "1-032335347", "2005-07-12");

 
 INSERT INTO Customer(type_document,number_document, create_at)
 VALUES
 ("TI" , "1052347351","2020-10-08"),
 ("CC" , "62353445"  ,"2008-10-08"),
 ("CC" , "62353445"  ,"2008-10-08"),
 ("TI" , "1052347351","2020-10-08"),
 ("CC" , "76237483"  ,"2020-12-10"),
 ("CC" , "56238463"  ,"2020-12-10"),
 ("CE" , "FR2345325" ,"2020-12-10"),
 ("CC" , "92359347"  ,"2020-10-14"),
 ("TI" , "1052347351","2020-09-12"),
 ("CE" , "PE75123947","2020-12-14"),
 ("CE" , "PE75123947","2020-11-13"),
 ("CE" , "FR2345325" ,"2020-12-12"),
 ("CE" , "PE75123947","2021-11-01"),
 ("CC" , "765231248" ,"2021-01-01");
 
 INSERT INTO Sale(Customer_id_Customer1,sale_name_product,create_sale)
 VALUES
(1,"Liquid Paper","2019-06-1"),
(2,"Cuaderno x50 Hojas","2001-02-5"),
(3,"Cuaderno x100 Hojas","2001-08-2"),
(4,"Marcador Negro","2003-11-8"),
(5,"Block Carta x500","2003-06-17"),
(6,"Temperas x1","2015-04-12"),
(7,"Colores Doble Punta","2004-02-17"),
(8,"Platilina","2002-10-2"),
(9,"lapiz Negro","2009-01-17"),
(10,"Liquid Paper","2019-06-15");

