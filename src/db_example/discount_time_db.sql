CREATE SCHEMA `discount_time` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE `discount_time`.`brand` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  `discount` INT NOT NULL,
  PRIMARY KEY (`idbrand`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE);
  
  CREATE TABLE `discount_time`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  `discount` INT NOT NULL,
  PRIMARY KEY (`idcategory`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE);

CREATE TABLE `discount_time`.`type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  `discount` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `typecol_UNIQUE` (`typecol` ASC) VISIBLE);

CREATE TABLE `discount_time`.`collection` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  `discount` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE);

CREATE TABLE `discount_time`.`item` (
  `article` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  `brand_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  `type_id` INT NOT NULL,
  `collection_id` INT NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `discount` INT NOT NULL,
  PRIMARY KEY (`article`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  INDEX `fk_brand_idx` (`brand_id` ASC) VISIBLE,
  INDEX `fk_category_idx` (`category_id` ASC) VISIBLE,
  INDEX `fk_type_idx` (`type_id` ASC) VISIBLE,
  INDEX `fk_collection_idx` (`collection_id` ASC) VISIBLE,
  CONSTRAINT `fk_brand`
    FOREIGN KEY (`brand_id`)
    REFERENCES `discount_time`.`brand` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `discount_time`.`category` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_type`
    FOREIGN KEY (`type_id`)
    REFERENCES `discount_time`.`type` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_collection`
    FOREIGN KEY (`collection_id`)
    REFERENCES `discount_time`.`collection` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- insert values into "brand" table
INSERT INTO `discount_time`.`brand` (`name`, `discount`) VALUES ('Nike', '0');
INSERT INTO `discount_time`.`brand` (`name`, `discount`) VALUES ('H&M', '0');
INSERT INTO `discount_time`.`brand` (`name`, `discount`) VALUES ('Zara', '0');
INSERT INTO `discount_time`.`brand` (`name`, `discount`) VALUES ('Adidas', '0');
INSERT INTO `discount_time`.`brand` (`name`, `discount`) VALUES ('Louis Vuitton', '0');
INSERT INTO `discount_time`.`brand` (`name`, `discount`) VALUES ('Cartier', '0');
INSERT INTO `discount_time`.`brand` (`name`, `discount`) VALUES ('Hermes', '0');
INSERT INTO `discount_time`.`brand` (`name`, `discount`) VALUES ('Gucci', '0');
INSERT INTO `discount_time`.`brand` (`name`, `discount`) VALUES ('Uniqlo', '0');
INSERT INTO `discount_time`.`brand` (`name`, `discount`) VALUES ('Rolex', '0');
INSERT INTO `discount_time`.`brand` (`name`, `discount`) VALUES ('Coach', '0');
INSERT INTO `discount_time`.`brand` (`name`, `discount`) VALUES ('Victoria\'s Secret', '0');
INSERT INTO `discount_time`.`brand` (`name`, `discount`) VALUES ('Chow Tai Fook', '0');
INSERT INTO `discount_time`.`brand` (`name`, `discount`) VALUES ('Tiffany & Co.', '0');
INSERT INTO `discount_time`.`brand` (`name`, `discount`) VALUES ('Burberry', '0');
INSERT INTO `discount_time`.`brand` (`name`, `discount`) VALUES ('Christian Dior', '0');
INSERT INTO `discount_time`.`brand` (`name`, `discount`) VALUES ('Polo Ralph Lauren', '0');
INSERT INTO `discount_time`.`brand` (`name`, `discount`) VALUES ('Prada', '0');
INSERT INTO `discount_time`.`brand` (`name`, `discount`) VALUES ('Under Armour', '0');
INSERT INTO `discount_time`.`brand` (`name`, `discount`) VALUES ('Armani', '0');
INSERT INTO `discount_time`.`brand` (`name`, `discount`) VALUES ('Puma', '0');
INSERT INTO `discount_time`.`brand` (`name`, `discount`) VALUES ('Ray-Ban', '0');
INSERT INTO `discount_time`.`brand` (`name`, `discount`) VALUES ('Omega', '0');
INSERT INTO `discount_time`.`brand` (`name`, `discount`) VALUES ('The North Face', '0');
INSERT INTO `discount_time`.`brand` (`name`, `discount`) VALUES ('Pandora', '0');
INSERT INTO `discount_time`.`brand` (`name`, `discount`) VALUES ('Diesel', '0');

-- insert values into "category" table
INSERT INTO `discount_time`.`category` (`name`, `discount`) VALUES ('men\'s clothes', '0');
INSERT INTO `discount_time`.`category` (`name`, `discount`) VALUES ('women\'s clothes', '0');
INSERT INTO `discount_time`.`category` (`name`, `discount`) VALUES ('unisex clothes', '0');
INSERT INTO `discount_time`.`category` (`name`, `discount`) VALUES ('men\'s watches', '0');
INSERT INTO `discount_time`.`category` (`name`, `discount`) VALUES ('women\'s watches', '0');
INSERT INTO `discount_time`.`category` (`name`, `discount`) VALUES ('unisex watches', '0');
INSERT INTO `discount_time`.`category` (`name`, `discount`) VALUES ('men\'s shoes', '0');
INSERT INTO `discount_time`.`category` (`name`, `discount`) VALUES ('women\'s shoes', '0');
INSERT INTO `discount_time`.`category` (`name`, `discount`) VALUES ('unisex shoes', '0');
INSERT INTO `discount_time`.`category` (`name`, `discount`) VALUES ('men\'s accessories', '0');
INSERT INTO `discount_time`.`category` (`name`, `discount`) VALUES ('women\'s accessories', '0');
INSERT INTO `discount_time`.`category` (`name`, `discount`) VALUES ('unisex accessories', '0');
INSERT INTO `discount_time`.`category` (`name`, `discount`) VALUES ('men\'s bags', '0');
INSERT INTO `discount_time`.`category` (`name`, `discount`) VALUES ('women\'s bags', '0');
INSERT INTO `discount_time`.`category` (`name`, `discount`) VALUES ('unisex bags', '0');

-- insert values into "type" table
INSERT INTO `discount_time`.`type` (`name`, `discount`) VALUES ('shirt', '0');
INSERT INTO `discount_time`.`type` (`name`, `discount`) VALUES ('t-shirt', '0');
INSERT INTO `discount_time`.`type` (`name`, `discount`) VALUES ('dress', '0');
INSERT INTO `discount_time`.`type` (`name`, `discount`) VALUES ('polo-shirt', '0');
INSERT INTO `discount_time`.`type` (`name`, `discount`) VALUES ('hoodie', '0');
INSERT INTO `discount_time`.`type` (`name`, `discount`) VALUES ('flip-flops', '0');
INSERT INTO `discount_time`.`type` (`name`, `discount`) VALUES ('shorts', '0');
INSERT INTO `discount_time`.`type` (`name`, `discount`) VALUES ('skirt', '0');
INSERT INTO `discount_time`.`type` (`name`, `discount`) VALUES ('jeans', '0');
INSERT INTO `discount_time`.`type` (`name`, `discount`) VALUES ('shoes', '0');
INSERT INTO `discount_time`.`type` (`name`, `discount`) VALUES ('coat', '0');
INSERT INTO `discount_time`.`type` (`name`, `discount`) VALUES ('high heels', '0');
INSERT INTO `discount_time`.`type` (`name`, `discount`) VALUES ('suit', '0');
INSERT INTO `discount_time`.`type` (`name`, `discount`) VALUES ('cap', '0');
INSERT INTO `discount_time`.`type` (`name`, `discount`) VALUES ('socks', '0');
INSERT INTO `discount_time`.`type` (`name`, `discount`) VALUES ('bra', '0');
INSERT INTO `discount_time`.`type` (`name`, `discount`) VALUES ('scarf', '0');
INSERT INTO `discount_time`.`type` (`name`, `discount`) VALUES ('swimsuit', '0');
INSERT INTO `discount_time`.`type` (`name`, `discount`) VALUES ('hat', '0');
INSERT INTO `discount_time`.`type` (`name`, `discount`) VALUES ('gloves', '0');
INSERT INTO `discount_time`.`type` (`name`, `discount`) VALUES ('sunglasses', '0');
INSERT INTO `discount_time`.`type` (`name`, `discount`) VALUES ('lether jacket', '0');
INSERT INTO `discount_time`.`type` (`name`, `discount`) VALUES ('jacket', '0');
INSERT INTO `discount_time`.`type` (`name`, `discount`) VALUES ('sweater', '0');
INSERT INTO `discount_time`.`type` (`name`, `discount`) VALUES ('tie', '0');
INSERT INTO `discount_time`.`type` (`name`, `discount`) VALUES ('keds', '0');
INSERT INTO `discount_time`.`type` (`name`, `discount`) VALUES ('sneakers', '0');
INSERT INTO `discount_time`.`type` (`name`, `discount`) VALUES ('loafers', '0');
INSERT INTO `discount_time`.`type` (`name`, `discount`) VALUES ('cardigan', '0');
INSERT INTO `discount_time`.`type` (`name`, `discount`) VALUES ('trousers', '0');
INSERT INTO `discount_time`.`type` (`name`, `discount`) VALUES ('classical watches', '0');
INSERT INTO `discount_time`.`type` (`name`, `discount`) VALUES ('sport watches', '0');
INSERT INTO `discount_time`.`type` (`name`, `discount`) VALUES ('slippers', '0');

-- insert values into "collection" table
INSERT INTO `discount_time`.`collection` (`name`, `discount`) VALUES ('old collection', '5');
INSERT INTO `discount_time`.`collection` (`name`, `discount`) VALUES ('winter2018', ' 0');
INSERT INTO `discount_time`.`collection` (`name`, `discount`) VALUES ('spring 2018', '0');
INSERT INTO `discount_time`.`collection` (`name`, `discount`) VALUES ('summer 2018', '0');
INSERT INTO `discount_time`.`collection` (`name`, `discount`) VALUES ('autumn 2018', '0');
INSERT INTO `discount_time`.`collection` (`name`, `discount`) VALUES ('winter2019', '0');
INSERT INTO `discount_time`.`collection` (`name`, `discount`) VALUES ('spring 2019', '0');
INSERT INTO `discount_time`.`collection` (`name`, `discount`) VALUES ('summer 2019', '0');
INSERT INTO `discount_time`.`collection` (`name`, `discount`) VALUES ('autumn 2019', '0');
INSERT INTO `discount_time`.`collection` (`name`, `discount`) VALUES ('winter2020', '0');
INSERT INTO `discount_time`.`collection` (`name`, `discount`) VALUES ('spring 2020', '0');
INSERT INTO `discount_time`.`collection` (`name`, `discount`) VALUES ('summer 2020', '0');
INSERT INTO `discount_time`.`collection` (`name`, `discount`) VALUES ('autumn 2020', '0');
INSERT INTO `discount_time`.`collection` (`name`, `discount`) VALUES ('winter2021', '0');
INSERT INTO `discount_time`.`collection` (`name`, `discount`) VALUES ('spring 2021', '0');
INSERT INTO `discount_time`.`collection` (`name`, `discount`) VALUES ('summer 2021', '0');
INSERT INTO `discount_time`.`collection` (`name`, `discount`) VALUES ('autumn 2021', '0');

-- insert values into "item" table
INSERT INTO `discount_time`.`item` (`article`, `name`, `brand_id`, `category_id`, `type_id`, `collection_id`, `price`, `discount`) VALUES ('10000001', 'Nike Just do it', '1', '1', '2', '4', '84.99', '0');
INSERT INTO `discount_time`.`item` (`name`, `brand_id`, `category_id`, `type_id`, `collection_id`, `price`, `discount`) VALUES ('Thunder', '21', '7', '27', '9', '120', '0');
INSERT INTO `discount_time`.`item` (`name`, `brand_id`, `category_id`, `type_id`, `collection_id`, `price`, `discount`) VALUES ('Chopped Digital Transparent Watch', '26', '6', '32', '14', '501', '0');
INSERT INTO `discount_time`.`item` (`name`, `brand_id`, `category_id`, `type_id`, `collection_id`, `price`, `discount`) VALUES ('Griffed chronograph gold-tone stainless steel watch', '26', '4', '31', '14', '999', '0');
INSERT INTO `discount_time`.`item` (`name`, `brand_id`, `category_id`, `type_id`, `collection_id`, `price`, `discount`) VALUES ('Oyster Perpetual Datejust 41', '10', '4', '31', '12', '17000', '0');
INSERT INTO `discount_time`.`item` (`name`, `brand_id`, `category_id`, `type_id`, `collection_id`, `price`, `discount`) VALUES ('Oyster Perpetual Submariner Date', '10', '5', '31', '12', '21599', '0');



