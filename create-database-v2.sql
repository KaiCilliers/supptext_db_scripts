-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema supptext
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema supptext
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `supptext` DEFAULT CHARACTER SET utf8 ;
USE `supptext` ;

-- -----------------------------------------------------
-- Table `supptext`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supptext`.`users` (
  `user_id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `supptext`.`messages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supptext`.`messages` (
  `message_id` INT NOT NULL,
  `content` TEXT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`message_id`),
  INDEX `fk_messages_users_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_messages_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `supptext`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `supptext`.`rooms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supptext`.`rooms` (
  `room_id` INT NOT NULL,
  PRIMARY KEY (`room_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `supptext`.`rooms_has_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supptext`.`rooms_has_users` (
  `room_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `message_id` INT NOT NULL,
  PRIMARY KEY (`room_id`, `user_id`, `message_id`),
  INDEX `fk_rooms_has_users_users1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_rooms_has_users_rooms1_idx` (`room_id` ASC) VISIBLE,
  INDEX `fk_rooms_has_users_messages1_idx` (`message_id` ASC) VISIBLE,
  CONSTRAINT `fk_rooms_has_users_rooms1`
    FOREIGN KEY (`room_id`)
    REFERENCES `supptext`.`rooms` (`room_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rooms_has_users_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `supptext`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rooms_has_users_messages1`
    FOREIGN KEY (`message_id`)
    REFERENCES `supptext`.`messages` (`message_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
