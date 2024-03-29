-- MySQL Script generated by MySQL Workbench
-- Wed Oct 16 20:12:59 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`production manager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`production manager` (
  `id` INT(20) NOT NULL,
  `prod_lname` VARCHAR(20) NULL,
  `prod_fname` VARCHAR(20) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`payment` (
  `id` INT(10) NOT NULL,
  `price_num` DECIMAL(10,2) NULL,
  `payment_date` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_agent_id` () VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`agent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`agent` (
  `id` INT(20) NOT NULL,
  `agent_fname` VARCHAR(20) NULL,
  `agent_lname` VARCHAR(20) NULL,
  `purchase order_id` INT(20) NOT NULL,
  `production manager_id` INT(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_agent_purchase order1_idx` (`purchase order_id` ASC) VISIBLE,
  INDEX `fk_agent_production manager1_idx` (`production manager_id` ASC) VISIBLE,
  CONSTRAINT `fk_agent_purchase order1`
    FOREIGN KEY (`purchase order_id`)
    REFERENCES `mydb`.`purchase order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_agent_production manager1`
    FOREIGN KEY (`production manager_id`)
    REFERENCES `mydb`.`production manager` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`client` (
  `id` INT(20) NOT NULL,
  `client_fname` VARCHAR(20) NULL,
  `client_lname` VARCHAR(20) NULL,
  `client_address` VARCHAR(20) NULL,
  `client_number` INT(20) NULL,
  `payment_id` INT(10) NOT NULL,
  `agent_id` INT(20) NOT NULL,
  `purchase order_id` INT(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_client_payment1_idx` (`payment_id` ASC) VISIBLE,
  INDEX `fk_client_agent1_idx` (`agent_id` ASC) VISIBLE,
  INDEX `fk_client_purchase order1_idx` (`purchase order_id` ASC) VISIBLE,
  CONSTRAINT `fk_client_payment1`
    FOREIGN KEY (`payment_id`)
    REFERENCES `mydb`.`payment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_agent1`
    FOREIGN KEY (`agent_id`)
    REFERENCES `mydb`.`agent` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_purchase order1`
    FOREIGN KEY (`purchase order_id`)
    REFERENCES `mydb`.`purchase order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`product` (
  `id` INT(20) NOT NULL,
  `product_desc` VARCHAR(50) NULL,
  `product_name` VARCHAR(50) NULL,
  `product_type` VARCHAR(50) NULL,
  `production manager_id` INT(20) NOT NULL,
  `shipper_id` INT(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_production manager1_idx` (`production manager_id` ASC) VISIBLE,
  INDEX `fk_product_shipper1_idx` (`shipper_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_production manager1`
    FOREIGN KEY (`production manager_id`)
    REFERENCES `mydb`.`production manager` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_shipper1`
    FOREIGN KEY (`shipper_id`)
    REFERENCES `mydb`.`shipper` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`shipper`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`shipper` (
  `id` INT(20) NOT NULL,
  `shipper_lname` VARCHAR(20) NULL,
  `shipper_fname` VARCHAR(20) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_id` () VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`shipment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`shipment` (
  `id` INT(20) NOT NULL,
  `shipment_type_id` INT(20) NOT NULL,
  `delivery_date` DATE NULL,
  `shipper_id` INT(20) NOT NULL,
  `client_id` INT(20) NOT NULL,
  PRIMARY KEY (`id`, `shipment_type_id`),
  INDEX `fk_client_id` () VISIBLE,
  INDEX `fk_product_id` () VISIBLE,
  INDEX `fk_shipper_id` () VISIBLE,
  INDEX `fk_shipment_shipper1_idx` (`shipper_id` ASC) VISIBLE,
  INDEX `fk_shipment_client1_idx` (`client_id` ASC) VISIBLE,
  CONSTRAINT `fk_shipment_shipper1`
    FOREIGN KEY (`shipper_id`)
    REFERENCES `mydb`.`shipper` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_shipment_client1`
    FOREIGN KEY (`client_id`)
    REFERENCES `mydb`.`client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`shipper`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`shipper` (
  `id` INT(20) NOT NULL,
  `shipper_lname` VARCHAR(20) NULL,
  `shipper_fname` VARCHAR(20) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_id` () VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`product` (
  `id` INT(20) NOT NULL,
  `product_desc` VARCHAR(50) NULL,
  `product_name` VARCHAR(50) NULL,
  `product_type` VARCHAR(50) NULL,
  `production manager_id` INT(20) NOT NULL,
  `shipper_id` INT(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_production manager1_idx` (`production manager_id` ASC) VISIBLE,
  INDEX `fk_product_shipper1_idx` (`shipper_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_production manager1`
    FOREIGN KEY (`production manager_id`)
    REFERENCES `mydb`.`production manager` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_shipper1`
    FOREIGN KEY (`shipper_id`)
    REFERENCES `mydb`.`shipper` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`shipment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`shipment` (
  `id` INT(20) NOT NULL,
  `shipment_type_id` INT(20) NOT NULL,
  `delivery_date` DATE NULL,
  `shipper_id` INT(20) NOT NULL,
  `client_id` INT(20) NOT NULL,
  PRIMARY KEY (`id`, `shipment_type_id`),
  INDEX `fk_client_id` () VISIBLE,
  INDEX `fk_product_id` () VISIBLE,
  INDEX `fk_shipper_id` () VISIBLE,
  INDEX `fk_shipment_shipper1_idx` (`shipper_id` ASC) VISIBLE,
  INDEX `fk_shipment_client1_idx` (`client_id` ASC) VISIBLE,
  CONSTRAINT `fk_shipment_shipper1`
    FOREIGN KEY (`shipper_id`)
    REFERENCES `mydb`.`shipper` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_shipment_client1`
    FOREIGN KEY (`client_id`)
    REFERENCES `mydb`.`client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`client` (
  `id` INT(20) NOT NULL,
  `client_fname` VARCHAR(20) NULL,
  `client_lname` VARCHAR(20) NULL,
  `client_address` VARCHAR(20) NULL,
  `client_number` INT(20) NULL,
  `payment_id` INT(10) NOT NULL,
  `agent_id` INT(20) NOT NULL,
  `purchase order_id` INT(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_client_payment1_idx` (`payment_id` ASC) VISIBLE,
  INDEX `fk_client_agent1_idx` (`agent_id` ASC) VISIBLE,
  INDEX `fk_client_purchase order1_idx` (`purchase order_id` ASC) VISIBLE,
  CONSTRAINT `fk_client_payment1`
    FOREIGN KEY (`payment_id`)
    REFERENCES `mydb`.`payment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_agent1`
    FOREIGN KEY (`agent_id`)
    REFERENCES `mydb`.`agent` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_purchase order1`
    FOREIGN KEY (`purchase order_id`)
    REFERENCES `mydb`.`purchase order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`client` (
  `id` INT(20) NOT NULL,
  `client_fname` VARCHAR(20) NULL,
  `client_lname` VARCHAR(20) NULL,
  `client_address` VARCHAR(20) NULL,
  `client_number` INT(20) NULL,
  `payment_id` INT(10) NOT NULL,
  `agent_id` INT(20) NOT NULL,
  `purchase order_id` INT(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_client_payment1_idx` (`payment_id` ASC) VISIBLE,
  INDEX `fk_client_agent1_idx` (`agent_id` ASC) VISIBLE,
  INDEX `fk_client_purchase order1_idx` (`purchase order_id` ASC) VISIBLE,
  CONSTRAINT `fk_client_payment1`
    FOREIGN KEY (`payment_id`)
    REFERENCES `mydb`.`payment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_agent1`
    FOREIGN KEY (`agent_id`)
    REFERENCES `mydb`.`agent` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_purchase order1`
    FOREIGN KEY (`purchase order_id`)
    REFERENCES `mydb`.`purchase order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`client` (
  `id` INT(20) NOT NULL,
  `client_fname` VARCHAR(20) NULL,
  `client_lname` VARCHAR(20) NULL,
  `client_address` VARCHAR(20) NULL,
  `client_number` INT(20) NULL,
  `payment_id` INT(10) NOT NULL,
  `agent_id` INT(20) NOT NULL,
  `purchase order_id` INT(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_client_payment1_idx` (`payment_id` ASC) VISIBLE,
  INDEX `fk_client_agent1_idx` (`agent_id` ASC) VISIBLE,
  INDEX `fk_client_purchase order1_idx` (`purchase order_id` ASC) VISIBLE,
  CONSTRAINT `fk_client_payment1`
    FOREIGN KEY (`payment_id`)
    REFERENCES `mydb`.`payment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_agent1`
    FOREIGN KEY (`agent_id`)
    REFERENCES `mydb`.`agent` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_purchase order1`
    FOREIGN KEY (`purchase order_id`)
    REFERENCES `mydb`.`purchase order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`agent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`agent` (
  `id` INT(20) NOT NULL,
  `agent_fname` VARCHAR(20) NULL,
  `agent_lname` VARCHAR(20) NULL,
  `purchase order_id` INT(20) NOT NULL,
  `production manager_id` INT(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_agent_purchase order1_idx` (`purchase order_id` ASC) VISIBLE,
  INDEX `fk_agent_production manager1_idx` (`production manager_id` ASC) VISIBLE,
  CONSTRAINT `fk_agent_purchase order1`
    FOREIGN KEY (`purchase order_id`)
    REFERENCES `mydb`.`purchase order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_agent_production manager1`
    FOREIGN KEY (`production manager_id`)
    REFERENCES `mydb`.`production manager` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`production manager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`production manager` (
  `id` INT(20) NOT NULL,
  `prod_lname` VARCHAR(20) NULL,
  `prod_fname` VARCHAR(20) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`agent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`agent` (
  `id` INT(20) NOT NULL,
  `agent_fname` VARCHAR(20) NULL,
  `agent_lname` VARCHAR(20) NULL,
  `purchase order_id` INT(20) NOT NULL,
  `production manager_id` INT(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_agent_purchase order1_idx` (`purchase order_id` ASC) VISIBLE,
  INDEX `fk_agent_production manager1_idx` (`production manager_id` ASC) VISIBLE,
  CONSTRAINT `fk_agent_purchase order1`
    FOREIGN KEY (`purchase order_id`)
    REFERENCES `mydb`.`purchase order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_agent_production manager1`
    FOREIGN KEY (`production manager_id`)
    REFERENCES `mydb`.`production manager` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`purchase order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`purchase order` (
  `id` INT(20) NOT NULL,
  `print_method` VARCHAR(50) NULL,
  `print_material` VARCHAR(150) NULL,
  `print_color` VARCHAR(50) NULL,
  `print_size` VARCHAR(50) NULL,
  `print_quantity` VARCHAR(50) NULL,
  `print_design` VARCHAR(150) NULL,
  `price decimal` DECIMAL(10,2) NULL,
  `prod_date` DATE NULL,
  `delivery_type` VARCHAR(50) NULL,
  `purchase ordercol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`agent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`agent` (
  `id` INT(20) NOT NULL,
  `agent_fname` VARCHAR(20) NULL,
  `agent_lname` VARCHAR(20) NULL,
  `purchase order_id` INT(20) NOT NULL,
  `production manager_id` INT(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_agent_purchase order1_idx` (`purchase order_id` ASC) VISIBLE,
  INDEX `fk_agent_production manager1_idx` (`production manager_id` ASC) VISIBLE,
  CONSTRAINT `fk_agent_purchase order1`
    FOREIGN KEY (`purchase order_id`)
    REFERENCES `mydb`.`purchase order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_agent_production manager1`
    FOREIGN KEY (`production manager_id`)
    REFERENCES `mydb`.`production manager` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`payment` (
  `id` INT(10) NOT NULL,
  `price_num` DECIMAL(10,2) NULL,
  `payment_date` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_agent_id` () VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`payment` (
  `id` INT(10) NOT NULL,
  `price_num` DECIMAL(10,2) NULL,
  `payment_date` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_agent_id` () VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`purchase order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`purchase order` (
  `id` INT(20) NOT NULL,
  `print_method` VARCHAR(50) NULL,
  `print_material` VARCHAR(150) NULL,
  `print_color` VARCHAR(50) NULL,
  `print_size` VARCHAR(50) NULL,
  `print_quantity` VARCHAR(50) NULL,
  `print_design` VARCHAR(150) NULL,
  `price decimal` DECIMAL(10,2) NULL,
  `prod_date` DATE NULL,
  `delivery_type` VARCHAR(50) NULL,
  `purchase ordercol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`production manager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`production manager` (
  `id` INT(20) NOT NULL,
  `prod_lname` VARCHAR(20) NULL,
  `prod_fname` VARCHAR(20) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`agent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`agent` (
  `id` INT(20) NOT NULL,
  `agent_fname` VARCHAR(20) NULL,
  `agent_lname` VARCHAR(20) NULL,
  `purchase order_id` INT(20) NOT NULL,
  `production manager_id` INT(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_agent_purchase order1_idx` (`purchase order_id` ASC) VISIBLE,
  INDEX `fk_agent_production manager1_idx` (`production manager_id` ASC) VISIBLE,
  CONSTRAINT `fk_agent_purchase order1`
    FOREIGN KEY (`purchase order_id`)
    REFERENCES `mydb`.`purchase order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_agent_production manager1`
    FOREIGN KEY (`production manager_id`)
    REFERENCES `mydb`.`production manager` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`client` (
  `id` INT(20) NOT NULL,
  `client_fname` VARCHAR(20) NULL,
  `client_lname` VARCHAR(20) NULL,
  `client_address` VARCHAR(20) NULL,
  `client_number` INT(20) NULL,
  `payment_id` INT(10) NOT NULL,
  `agent_id` INT(20) NOT NULL,
  `purchase order_id` INT(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_client_payment1_idx` (`payment_id` ASC) VISIBLE,
  INDEX `fk_client_agent1_idx` (`agent_id` ASC) VISIBLE,
  INDEX `fk_client_purchase order1_idx` (`purchase order_id` ASC) VISIBLE,
  CONSTRAINT `fk_client_payment1`
    FOREIGN KEY (`payment_id`)
    REFERENCES `mydb`.`payment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_agent1`
    FOREIGN KEY (`agent_id`)
    REFERENCES `mydb`.`agent` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_purchase order1`
    FOREIGN KEY (`purchase order_id`)
    REFERENCES `mydb`.`purchase order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`shipper`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`shipper` (
  `id` INT(20) NOT NULL,
  `shipper_lname` VARCHAR(20) NULL,
  `shipper_fname` VARCHAR(20) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_id` () VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`product` (
  `id` INT(20) NOT NULL,
  `product_desc` VARCHAR(50) NULL,
  `product_name` VARCHAR(50) NULL,
  `product_type` VARCHAR(50) NULL,
  `production manager_id` INT(20) NOT NULL,
  `shipper_id` INT(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_production manager1_idx` (`production manager_id` ASC) VISIBLE,
  INDEX `fk_product_shipper1_idx` (`shipper_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_production manager1`
    FOREIGN KEY (`production manager_id`)
    REFERENCES `mydb`.`production manager` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_shipper1`
    FOREIGN KEY (`shipper_id`)
    REFERENCES `mydb`.`shipper` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`shipment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`shipment` (
  `id` INT(20) NOT NULL,
  `shipment_type_id` INT(20) NOT NULL,
  `delivery_date` DATE NULL,
  `shipper_id` INT(20) NOT NULL,
  `client_id` INT(20) NOT NULL,
  PRIMARY KEY (`id`, `shipment_type_id`),
  INDEX `fk_client_id` () VISIBLE,
  INDEX `fk_product_id` () VISIBLE,
  INDEX `fk_shipper_id` () VISIBLE,
  INDEX `fk_shipment_shipper1_idx` (`shipper_id` ASC) VISIBLE,
  INDEX `fk_shipment_client1_idx` (`client_id` ASC) VISIBLE,
  CONSTRAINT `fk_shipment_shipper1`
    FOREIGN KEY (`shipper_id`)
    REFERENCES `mydb`.`shipper` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_shipment_client1`
    FOREIGN KEY (`client_id`)
    REFERENCES `mydb`.`client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`payment` (
  `id` INT(10) NOT NULL,
  `price_num` DECIMAL(10,2) NULL,
  `payment_date` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_agent_id` () VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`purchase order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`purchase order` (
  `id` INT(20) NOT NULL,
  `print_method` VARCHAR(50) NULL,
  `print_material` VARCHAR(150) NULL,
  `print_color` VARCHAR(50) NULL,
  `print_size` VARCHAR(50) NULL,
  `print_quantity` VARCHAR(50) NULL,
  `print_design` VARCHAR(150) NULL,
  `price decimal` DECIMAL(10,2) NULL,
  `prod_date` DATE NULL,
  `delivery_type` VARCHAR(50) NULL,
  `purchase ordercol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`production manager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`production manager` (
  `id` INT(20) NOT NULL,
  `prod_lname` VARCHAR(20) NULL,
  `prod_fname` VARCHAR(20) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`agent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`agent` (
  `id` INT(20) NOT NULL,
  `agent_fname` VARCHAR(20) NULL,
  `agent_lname` VARCHAR(20) NULL,
  `purchase order_id` INT(20) NOT NULL,
  `production manager_id` INT(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_agent_purchase order1_idx` (`purchase order_id` ASC) VISIBLE,
  INDEX `fk_agent_production manager1_idx` (`production manager_id` ASC) VISIBLE,
  CONSTRAINT `fk_agent_purchase order1`
    FOREIGN KEY (`purchase order_id`)
    REFERENCES `mydb`.`purchase order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_agent_production manager1`
    FOREIGN KEY (`production manager_id`)
    REFERENCES `mydb`.`production manager` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`client` (
  `id` INT(20) NOT NULL,
  `client_fname` VARCHAR(20) NULL,
  `client_lname` VARCHAR(20) NULL,
  `client_address` VARCHAR(20) NULL,
  `client_number` INT(20) NULL,
  `payment_id` INT(10) NOT NULL,
  `agent_id` INT(20) NOT NULL,
  `purchase order_id` INT(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_client_payment1_idx` (`payment_id` ASC) VISIBLE,
  INDEX `fk_client_agent1_idx` (`agent_id` ASC) VISIBLE,
  INDEX `fk_client_purchase order1_idx` (`purchase order_id` ASC) VISIBLE,
  CONSTRAINT `fk_client_payment1`
    FOREIGN KEY (`payment_id`)
    REFERENCES `mydb`.`payment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_agent1`
    FOREIGN KEY (`agent_id`)
    REFERENCES `mydb`.`agent` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_purchase order1`
    FOREIGN KEY (`purchase order_id`)
    REFERENCES `mydb`.`purchase order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`shipper`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`shipper` (
  `id` INT(20) NOT NULL,
  `shipper_lname` VARCHAR(20) NULL,
  `shipper_fname` VARCHAR(20) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_id` () VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`product` (
  `id` INT(20) NOT NULL,
  `product_desc` VARCHAR(50) NULL,
  `product_name` VARCHAR(50) NULL,
  `product_type` VARCHAR(50) NULL,
  `production manager_id` INT(20) NOT NULL,
  `shipper_id` INT(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_production manager1_idx` (`production manager_id` ASC) VISIBLE,
  INDEX `fk_product_shipper1_idx` (`shipper_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_production manager1`
    FOREIGN KEY (`production manager_id`)
    REFERENCES `mydb`.`production manager` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_shipper1`
    FOREIGN KEY (`shipper_id`)
    REFERENCES `mydb`.`shipper` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`shipment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`shipment` (
  `id` INT(20) NOT NULL,
  `shipment_type_id` INT(20) NOT NULL,
  `delivery_date` DATE NULL,
  `shipper_id` INT(20) NOT NULL,
  `client_id` INT(20) NOT NULL,
  PRIMARY KEY (`id`, `shipment_type_id`),
  INDEX `fk_client_id` () VISIBLE,
  INDEX `fk_product_id` () VISIBLE,
  INDEX `fk_shipper_id` () VISIBLE,
  INDEX `fk_shipment_shipper1_idx` (`shipper_id` ASC) VISIBLE,
  INDEX `fk_shipment_client1_idx` (`client_id` ASC) VISIBLE,
  CONSTRAINT `fk_shipment_shipper1`
    FOREIGN KEY (`shipper_id`)
    REFERENCES `mydb`.`shipper` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_shipment_client1`
    FOREIGN KEY (`client_id`)
    REFERENCES `mydb`.`client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
