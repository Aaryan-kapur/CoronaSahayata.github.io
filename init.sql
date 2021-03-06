-- MySQL Script generated by MySQL Workbench
-- Friday 27 March 2020 11:00:54 AM IST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema csdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema csdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `csdb` DEFAULT CHARACTER SET utf8 ;
USE `csdb` ;

-- -----------------------------------------------------
-- Table `csdb`.`groups_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `csdb`.`groups_table` (
  `group_id` VARCHAR(30) NOT NULL,
  `group_name` VARCHAR(100) NULL,
  PRIMARY KEY (`group_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `csdb`.`login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `csdb`.`login` (
  `user_id` VARCHAR(16) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `group_group_id` VARCHAR(30) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`, `group_group_id`),
  CONSTRAINT `fk_user_group`
    FOREIGN KEY (`group_group_id`)
    REFERENCES `csdb`.`groups_table` (`group_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `csdb`.`user_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `csdb`.`user_info` (
  `login_user_id` VARCHAR(16) NOT NULL,
  `first_name` VARCHAR(250) NOT NULL,
  `last_name` VARCHAR(250) NULL,
  `email_id` VARCHAR(255) NULL,
  `mobile` VARCHAR(13) NULL,
  `phone` VARCHAR(20) NULL,
  `address` VARCHAR(255) NULL,
  `landmark` VARCHAR(255) NULL,
  `city` VARCHAR(255) NULL,
  `district` VARCHAR(255) NULL,
  `state` VARCHAR(255) NULL,
  `country` VARCHAR(255) NULL,
  `pin` VARCHAR(6) NULL,
  PRIMARY KEY (`login_user_id`),
  CONSTRAINT `fk_user_info_login1`
    FOREIGN KEY (`login_user_id`)
    REFERENCES `csdb`.`login` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `csdb`.`country_master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `csdb`.`country_master` (
  `country_id` INT NOT NULL AUTO_INCREMENT,
  `country_name` VARCHAR(255) NULL,
  PRIMARY KEY (`country_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `csdb`.`state_master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `csdb`.`state_master` (
  `state_id` INT NOT NULL AUTO_INCREMENT,
  `state_name` VARCHAR(255) NULL,
  `country_country_id` INT NOT NULL,
  PRIMARY KEY (`state_id`, `country_country_id`),
  CONSTRAINT `fk_state_country1`
    FOREIGN KEY (`country_country_id`)
    REFERENCES `csdb`.`country_master` (`country_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_state_country1_idx` ON `csdb`.`state_master` (`country_country_id` ASC);


-- -----------------------------------------------------
-- Table `csdb`.`district_master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `csdb`.`district_master` (
  `district_id` INT NOT NULL AUTO_INCREMENT,
  `district_name` VARCHAR(255) NULL,
  `state_state_id` INT NOT NULL,
  PRIMARY KEY (`district_id`, `state_state_id`),
  CONSTRAINT `fk_district_state1`
    FOREIGN KEY (`state_state_id`)
    REFERENCES `csdb`.`state_master` (`state_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_district_state1_idx` ON `csdb`.`district_master` (`state_state_id` ASC);


-- -----------------------------------------------------
-- Table `csdb`.`city_master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `csdb`.`city_master` (
  `city_id` INT NOT NULL AUTO_INCREMENT,
  `city_name` VARCHAR(255) NULL,
  `district_district_id` INT NOT NULL,
  PRIMARY KEY (`city_id`, `district_district_id`),
  CONSTRAINT `fk_city_district1`
    FOREIGN KEY (`district_district_id`)
    REFERENCES `csdb`.`district_master` (`district_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_city_district1_idx` ON `csdb`.`city_master` (`district_district_id` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
