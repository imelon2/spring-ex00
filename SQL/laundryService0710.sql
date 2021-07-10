-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema laundryService
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema laundryService
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `laundryService` DEFAULT CHARACTER SET utf8 ;
USE `laundryService` ;

-- -----------------------------------------------------
-- Table `laundryService`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laundryService`.`user` (
  `uno` INT NOT NULL AUTO_INCREMENT,
  `userid` VARCHAR(45) NOT NULL COMMENT '유저아이디',
  `userpw` INT NOT NULL COMMENT '유저패쓰워드',
  `username` VARCHAR(45) NOT NULL,
  `useraddress` VARCHAR(45) NOT NULL,
  `userbirth` DATE NOT NULL,
  `userphonenum` INT NOT NULL,
  `useremail` VARCHAR(45) NOT NULL,
  `usersex` INT NOT NULL,
  `userauth` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`uno`),
  UNIQUE INDEX `userid_UNIQUE` (`userid` ASC) VISIBLE,
  UNIQUE INDEX `userphonenum_UNIQUE` (`userphonenum` ASC) VISIBLE,
  UNIQUE INDEX `useremail_UNIQUE` (`useremail` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laundryService`.`b2buser`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laundryService`.`b2buser` (
  `id` INT NOT NULL,
  `storeid` INT NOT NULL,
  `b2bid` VARCHAR(45) NOT NULL,
  `b2bpw` VARCHAR(45) NOT NULL,
  `b2bad` VARCHAR(45) NOT NULL,
  `b2bbirth` DATE NOT NULL,
  `b2bphonenum` INT NOT NULL,
  `b2bemail` VARCHAR(45) NOT NULL,
  `b2bauth` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `b2bid_UNIQUE` (`b2bid` ASC) VISIBLE,
  UNIQUE INDEX `b2bphonenum_UNIQUE` (`b2bphonenum` ASC) VISIBLE,
  UNIQUE INDEX `b2bemail_UNIQUE` (`b2bemail` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laundryService`.`store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laundryService`.`store` (
  `sno` INT NOT NULL AUTO_INCREMENT,
  `storename` VARCHAR(45) NOT NULL,
  `storead` VARCHAR(45) NOT NULL,
  `storetel` INT NOT NULL,
  `storeBusinessnum` INT NOT NULL,
  PRIMARY KEY (`sno`),
  UNIQUE INDEX `storeBusinessnum_UNIQUE` (`storeBusinessnum` ASC) VISIBLE,
  CONSTRAINT `store`
    FOREIGN KEY (`sno`)
    REFERENCES `laundryService`.`b2buser` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laundryService`.`subsuser`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laundryService`.`subsuser` (
  `subid` INT NOT NULL,
  `substartday` INT NOT NULL DEFAULT now(),
  `orderinfo` INT NOT NULL,
  PRIMARY KEY (`subid`),
  INDEX `subsuser_idx` (`orderinfo` ASC) VISIBLE,
  CONSTRAINT `user`
    FOREIGN KEY (`subid`)
    REFERENCES `laundryService`.`user` (`uno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `subsuser`
    FOREIGN KEY (`orderinfo`)
    REFERENCES `laundryService`.`store` (`sno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
