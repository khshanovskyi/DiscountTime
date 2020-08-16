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
    
    CREATE TABLE `discount_time`.`size` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `uk` DOUBLE NOT NULL,
  `eur` DOUBLE NOT NULL,
  `international` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
  
  CREATE TABLE `discount_time`.`item_size` (
  `item_article` INT NOT NULL,
  `size_id` INT NOT NULL,
  `quantity` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`item_article`, `size_id`),
  INDEX `fk_size_id_idx` (`size_id` ASC) VISIBLE,
  CONSTRAINT `fk_item_article`
    FOREIGN KEY (`item_article`)
    REFERENCES `discount_time`.`item` (`article`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_size_id`
    FOREIGN KEY (`size_id`)
    REFERENCES `discount_time`.`size` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

    
--     USE `discount_time`;
-- CREATE  OR REPLACE VIEW `item_info_view` AS
-- select item.article, item.`name`, brand.`name` 'brand', brand.discount 'discount_on_brand', 
-- category.`name` 'category', category.discount 'discount_on_category',
--  `type`.`name` 'type', `type`.discount 'discount_on_type',
--  collection.`name` 'collection', collection.discount 'discount_on_collection',
--  item.price, item.discount 'item_discount' from item
--  inner join brand on item.brand_id = brand.id
--  inner join category on item.category_id = category.id
--  inner join `type` on item.type_id = `type`.id
--  inner join collection on item.collection_id = collection.id;
 
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `discount_time`.`item_info_view` AS
    SELECT 
        `discount_time`.`item`.`article` AS `article`,
        `discount_time`.`item`.`name` AS `name`,
        `discount_time`.`brand`.`name` AS `brand`,
        `discount_time`.`brand`.`discount` AS `discount_on_brand`,
        `discount_time`.`category`.`name` AS `category`,
        `discount_time`.`category`.`discount` AS `discount_on_category`,
        `discount_time`.`type`.`name` AS `type`,
        `discount_time`.`type`.`discount` AS `discount_on_type`,
        `discount_time`.`collection`.`name` AS `collection`,
        `discount_time`.`collection`.`discount` AS `discount_on_collection`,
        `discount_time`.`item`.`price` AS `price`,
        `discount_time`.`item`.`discount` AS `item_discount`
    FROM
        ((((`discount_time`.`item`
        JOIN `discount_time`.`brand` ON ((`discount_time`.`item`.`brand_id` = `discount_time`.`brand`.`id`)))
        JOIN `discount_time`.`category` ON ((`discount_time`.`item`.`category_id` = `discount_time`.`category`.`id`)))
        JOIN `discount_time`.`type` ON ((`discount_time`.`item`.`type_id` = `discount_time`.`type`.`id`)))
        JOIN `discount_time`.`collection` ON ((`discount_time`.`item`.`collection_id` = `discount_time`.`collection`.`id`)));
        
        CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `discount_time`.`full_item_info_view` AS
    SELECT 
        `discount_time`.`item`.`article` AS `article`,
        `discount_time`.`item`.`name` AS `name`,
        `discount_time`.`brand`.`name` AS `brand`,
        `discount_time`.`brand`.`discount` AS `discount_on_brand`,
        `discount_time`.`category`.`name` AS `category`,
        `discount_time`.`category`.`discount` AS `discount_on_category`,
        `discount_time`.`type`.`name` AS `type`,
        `discount_time`.`type`.`discount` AS `discount_on_type`,
        `discount_time`.`collection`.`name` AS `collection`,
        `discount_time`.`collection`.`discount` AS `discount_on_collection`,
        `discount_time`.`item`.`price` AS `price`,
        `discount_time`.`item`.`discount` AS `item_discount`,
        `discount_time`.`size`.`uk` AS `size_uk`,
        `discount_time`.`size`.`eur` AS `size_eur`,
        `discount_time`.`item_size`.`quantity` AS `quantity`
    FROM
        ((((((`discount_time`.`item_size`
        JOIN `discount_time`.`item` ON ((`discount_time`.`item_size`.`item_article` = `discount_time`.`item`.`article`)))
        JOIN `discount_time`.`brand` ON ((`discount_time`.`item`.`brand_id` = `discount_time`.`brand`.`id`)))
        JOIN `discount_time`.`category` ON ((`discount_time`.`item`.`category_id` = `discount_time`.`category`.`id`)))
        JOIN `discount_time`.`type` ON ((`discount_time`.`item`.`type_id` = `discount_time`.`type`.`id`)))
        JOIN `discount_time`.`collection` ON ((`discount_time`.`item`.`collection_id` = `discount_time`.`collection`.`id`)))
        JOIN `discount_time`.`size` ON ((`discount_time`.`item_size`.`size_id` = `discount_time`.`size`.`id`)));


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

-- insert values into "size" table
INSERT INTO `discount_time`.`size` (`uk`, `eur`, `international`) VALUES ('14', '40', 'XS');
INSERT INTO `discount_time`.`size` (`uk`, `eur`, `international`) VALUES ('14.5', '42', 'XS');
INSERT INTO `discount_time`.`size` (`uk`, `eur`, `international`) VALUES ('15', '44', 'S');
INSERT INTO `discount_time`.`size` (`uk`, `eur`, `international`) VALUES ('15.5', '46', 'S');
INSERT INTO `discount_time`.`size` (`uk`, `eur`, `international`) VALUES ('16', '48', 'M');
INSERT INTO `discount_time`.`size` (`uk`, `eur`, `international`) VALUES ('16.5', '50', 'M');
INSERT INTO `discount_time`.`size` (`uk`, `eur`, `international`) VALUES ('17', '52', 'L');
INSERT INTO `discount_time`.`size` (`uk`, `eur`, `international`) VALUES ('17.5', '54', 'L');
INSERT INTO `discount_time`.`size` (`uk`, `eur`, `international`) VALUES ('18', '56', 'XL');
INSERT INTO `discount_time`.`size` (`uk`, `eur`, `international`) VALUES ('18', '56', 'XL');
INSERT INTO `discount_time`.`size` (`id`, `uk`, `eur`, `international`) VALUES ('101', '3.5', '36', '-');
INSERT INTO `discount_time`.`size` (`uk`, `eur`, `international`) VALUES ('4', '37', '-');
INSERT INTO `discount_time`.`size` (`uk`, `eur`, `international`) VALUES ('4.5', '37.5', '-');
INSERT INTO `discount_time`.`size` (`uk`, `eur`, `international`) VALUES ('5', '38', '-');
INSERT INTO `discount_time`.`size` (`uk`, `eur`, `international`) VALUES ('5.5', '39', '-');
INSERT INTO `discount_time`.`size` (`uk`, `eur`, `international`) VALUES ('6', '39.5', '-');
INSERT INTO `discount_time`.`size` (`uk`, `eur`, `international`) VALUES ('6.5', '40', '-');
INSERT INTO `discount_time`.`size` (`uk`, `eur`, `international`) VALUES ('7', '41', '-');
INSERT INTO `discount_time`.`size` (`uk`, `eur`, `international`) VALUES ('7.5', '41.5', '-');
INSERT INTO `discount_time`.`size` (`uk`, `eur`, `international`) VALUES ('8', '42', '-');
INSERT INTO `discount_time`.`size` (`uk`, `eur`, `international`) VALUES ('8.5', '42.5', '-');
INSERT INTO `discount_time`.`size` (`uk`, `eur`, `international`) VALUES ('9', '43', '-');
INSERT INTO `discount_time`.`size` (`uk`, `eur`, `international`) VALUES ('9.5', '44', '-');
INSERT INTO `discount_time`.`size` (`uk`, `eur`, `international`) VALUES ('10', '44.5', '-');
INSERT INTO `discount_time`.`size` (`uk`, `eur`, `international`) VALUES ('10.5', '45', '-');
INSERT INTO `discount_time`.`size` (`uk`, `eur`, `international`) VALUES ('11', '46', '-');
INSERT INTO `discount_time`.`size` (`uk`, `eur`, `international`) VALUES ('11.5', '46.5', '-');
INSERT INTO `discount_time`.`size` (`uk`, `eur`, `international`) VALUES ('12', '47', '-');
INSERT INTO `discount_time`.`size` (`id`, `uk`, `eur`, `international`) VALUES ('200', '0', '0', 'unsize');


-- insert values into "item" table
INSERT INTO `discount_time`.`item` (`article`, `name`, `brand_id`, `category_id`, `type_id`, `collection_id`, `price`, `discount`) VALUES ('10000001', 'Nike Just do it', '1', '1', '2', '4', '84.99', '0');
INSERT INTO `discount_time`.`item` (`name`, `brand_id`, `category_id`, `type_id`, `collection_id`, `price`, `discount`) VALUES ('Thunder', '21', '7', '27', '9', '120', '0');
INSERT INTO `discount_time`.`item` (`name`, `brand_id`, `category_id`, `type_id`, `collection_id`, `price`, `discount`) VALUES ('Chopped Digital Transparent Watch', '26', '6', '32', '14', '501', '0');
INSERT INTO `discount_time`.`item` (`name`, `brand_id`, `category_id`, `type_id`, `collection_id`, `price`, `discount`) VALUES ('Griffed chronograph gold-tone stainless steel watch', '26', '4', '31', '14', '999', '0');
INSERT INTO `discount_time`.`item` (`name`, `brand_id`, `category_id`, `type_id`, `collection_id`, `price`, `discount`) VALUES ('Oyster Perpetual Datejust 41', '10', '4', '31', '12', '17000', '0');
INSERT INTO `discount_time`.`item` (`name`, `brand_id`, `category_id`, `type_id`, `collection_id`, `price`, `discount`) VALUES ('Oyster Perpetual Submariner Date', '10', '5', '31', '12', '21599', '0');


-- insert values into "item_size" table
INSERT INTO `discount_time`.`item_size` (`item_article`, `size_id`, `quantity`) VALUES ('10000001', '1', '40');
INSERT INTO `discount_time`.`item_size` (`item_article`, `size_id`, `quantity`) VALUES ('10000001', '2', '11');
INSERT INTO `discount_time`.`item_size` (`item_article`, `size_id`, `quantity`) VALUES ('10000001', '3', '4');
INSERT INTO `discount_time`.`item_size` (`item_article`, `size_id`, `quantity`) VALUES ('10000001', '4', '5');
INSERT INTO `discount_time`.`item_size` (`item_article`, `size_id`, `quantity`) VALUES ('10000001', '5', '48');
INSERT INTO `discount_time`.`item_size` (`item_article`, `size_id`, `quantity`) VALUES ('10000001', '6', '45');
INSERT INTO `discount_time`.`item_size` (`item_article`, `size_id`, `quantity`) VALUES ('10000001', '7', '3');
INSERT INTO `discount_time`.`item_size` (`item_article`, `size_id`, `quantity`) VALUES ('10000001', '8', '65');
INSERT INTO `discount_time`.`item_size` (`item_article`, `size_id`, `quantity`) VALUES ('10000001', '9', '45');
INSERT INTO `discount_time`.`item_size` (`item_article`, `size_id`, `quantity`) VALUES ('10000001', '10', '7');
INSERT INTO `discount_time`.`item_size` (`item_article`, `size_id`, `quantity`) VALUES ('10000003', '200', '31');
INSERT INTO `discount_time`.`item_size` (`item_article`, `size_id`, `quantity`) VALUES ('10000004', '200', '5');
INSERT INTO `discount_time`.`item_size` (`item_article`, `size_id`, `quantity`) VALUES ('10000005', '200', '11');
INSERT INTO `discount_time`.`item_size` (`item_article`, `size_id`, `quantity`) VALUES ('10000006', '200', '3');
INSERT INTO `discount_time`.`item_size` (`item_article`, `size_id`, `quantity`) VALUES ('10000007', '108', '4');
INSERT INTO `discount_time`.`item_size` (`item_article`, `size_id`, `quantity`) VALUES ('10000007', '109', '0');
INSERT INTO `discount_time`.`item_size` (`item_article`, `size_id`, `quantity`) VALUES ('10000007', '110', '55');
INSERT INTO `discount_time`.`item_size` (`item_article`, `size_id`, `quantity`) VALUES ('10000007', '111', '77');
INSERT INTO `discount_time`.`item_size` (`item_article`, `size_id`, `quantity`) VALUES ('10000007', '112', '88');
INSERT INTO `discount_time`.`item_size` (`item_article`, `size_id`, `quantity`) VALUES ('10000007', '113', '2');
INSERT INTO `discount_time`.`item_size` (`item_article`, `size_id`, `quantity`) VALUES ('10000007', '114', '15');
INSERT INTO `discount_time`.`item_size` (`item_article`, `size_id`, `quantity`) VALUES ('10000007', '115', '3');




