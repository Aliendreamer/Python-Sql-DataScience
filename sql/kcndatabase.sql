-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema kcm_data
-- -----------------------------------------------------
-- my personal training database to use with powerBI for  first steps in data science
-- also color sheme :
-- blue- basic tables for the manufacter plant
-- green- materials  export/import
-- red - chemical analyses
-- yellow - personal development info 
-- brown - monthly and yearly tables with basic info,as total ammount shipments analyses made,and metric tones total transported/received

-- -----------------------------------------------------
-- Schema kcm_data
--
-- my personal training database to use with powerBI for  first steps in data science
-- also color sheme :
-- blue- basic tables for the manufacter plant
-- green- materials  export/import
-- red - chemical analyses
-- yellow - personal development info 
-- brown - monthly and yearly tables with basic info,as total ammount shipments analyses made,and metric tones total transported/received
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `kcm_data` DEFAULT CHARACTER SET utf8 ;
USE `kcm_data` ;

-- -----------------------------------------------------
-- Table `kcm_data`.`structures`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kcm_data`.`structures` (
  `id` INT NOT NULL,
  `name` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kcm_data`.`departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kcm_data`.`departments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `structure_id` INT NULL,
  `workforce` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `fk_structure_idx` (`structure_id` ASC),
  CONSTRAINT `fk_structure_departments`
    FOREIGN KEY (`structure_id`)
    REFERENCES `kcm_data`.`structures` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kcm_data`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kcm_data`.`employees` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(100) NOT NULL,
  `second_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NULL,
  `salary` DECIMAL NOT NULL,
  `department_id` INT NOT NULL,
  `hire_date` DATE NOT NULL,
  `birth_date` DATE NULL,
  `education` VARCHAR(50) NULL,
  `level` INT NOT NULL,
  `shift` CHAR(1) NULL COMMENT 'A - D are for 8 hours shifts F is for 12 hour shifts',
  PRIMARY KEY (`id`),
  INDEX `fk_department_id_idx` (`department_id` ASC),
  CONSTRAINT `fk_department_id_emp`
    FOREIGN KEY (`department_id`)
    REFERENCES `kcm_data`.`departments` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kcm_data`.`country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kcm_data`.`country` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL,
  `currency` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kcm_data`.`adresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kcm_data`.`adresses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `adress` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kcm_data`.`town`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kcm_data`.`town` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `country_id` INT NOT NULL,
  `adress_id` INT NOT NULL,
  `emloyee_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_country_idx` (`country_id` ASC),
  INDEX `fk_employee_id_idx` (`emloyee_id` ASC),
  INDEX `fk_adress_idx` (`adress_id` ASC),
  CONSTRAINT `fk_employee_id_town`
    FOREIGN KEY (`emloyee_id`)
    REFERENCES `kcm_data`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_adress_town`
    FOREIGN KEY (`adress_id`)
    REFERENCES `kcm_data`.`adresses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_country_id_town`
    FOREIGN KEY (`country_id`)
    REFERENCES `kcm_data`.`country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kcm_data`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kcm_data`.`courses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `coursescol` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kcm_data`.`personal_development`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kcm_data`.`personal_development` (
  `employee_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  PRIMARY KEY (`employee_id`, `course_id`),
  INDEX `fk_course_id_idx` (`course_id` ASC),
  INDEX `fk_employee_id_idx` (`employee_id` ASC),
  CONSTRAINT `fk_course_pd`
    FOREIGN KEY (`course_id`)
    REFERENCES `kcm_data`.`courses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_pd`
    FOREIGN KEY (`employee_id`)
    REFERENCES `kcm_data`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kcm_data`.`production`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kcm_data`.`production` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `shift` CHAR(1) NOT NULL,
  `type` VARCHAR(50) NOT NULL,
  `department_id` INT NOT NULL,
  `production_date` DATETIME(6) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `lot` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_department_idx` (`department_id` ASC),
  CONSTRAINT `fk_department_production`
    FOREIGN KEY (`department_id`)
    REFERENCES `kcm_data`.`departments` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kcm_data`.`positions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kcm_data`.`positions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `department` INT NOT NULL,
  `employee` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_department_idx` (`department` ASC),
  INDEX `fk_employee_idx` (`employee` ASC),
  CONSTRAINT `fk_department_positions`
    FOREIGN KEY (`department`)
    REFERENCES `kcm_data`.`departments` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employees_positions`
    FOREIGN KEY (`employee`)
    REFERENCES `kcm_data`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kcm_data`.`shipments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kcm_data`.`shipments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `destination_id` INT NOT NULL,
  `origin_id` INT NOT NULL,
  `lot` INT NOT NULL,
  `recipient` VARCHAR(50) NOT NULL,
  `transport` VARCHAR(10) NOT NULL COMMENT 'two tyoes transport: train or truck',
  `production_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_destination_idx` (`destination_id` ASC),
  INDEX `fk_origin_idx` (`origin_id` ASC),
  INDEX `fk_production_idx` (`production_id` ASC),
  CONSTRAINT `fk_destination_shipments`
    FOREIGN KEY (`destination_id`)
    REFERENCES `kcm_data`.`adresses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_origin_shipments`
    FOREIGN KEY (`origin_id`)
    REFERENCES `kcm_data`.`adresses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_production_shipments`
    FOREIGN KEY (`production_id`)
    REFERENCES `kcm_data`.`production` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kcm_data`.`analyses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kcm_data`.`analyses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `production_id` INT NULL,
  `date_analyzed` DATE NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `arbitrage` VARCHAR(45) NULL COMMENT 'null allowed. Syntax Won  or Lost if no arbitrage for the sample Null',
  `lot` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_production_idx` (`production_id` ASC),
  CONSTRAINT `fk_production_analyses`
    FOREIGN KEY (`production_id`)
    REFERENCES `kcm_data`.`production` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kcm_data`.`elements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kcm_data`.`elements` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `element` VARCHAR(45) NOT NULL,
  `analyse_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `element_UNIQUE` (`element` ASC),
  INDEX `fk_analyse_idx` (`analyse_id` ASC),
  CONSTRAINT `fk_analyse_elements`
    FOREIGN KEY (`analyse_id`)
    REFERENCES `kcm_data`.`analyses` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kcm_data`.`month`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kcm_data`.`month` (
  `id` INT NOT NULL,
  `month_code` VARCHAR(45) NOT NULL,
  `shipments` INT NOT NULL,
  `analyses` INT NOT NULL,
  `metric tones` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kcm_data`.`year`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kcm_data`.`year` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `year` DATE NOT NULL,
  `shipments` INT NOT NULL,
  `analyses` INT NOT NULL,
  `metric tones` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
