-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema sql_supptext_test
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sql_supptext_test
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sql_supptext_test` DEFAULT CHARACTER SET utf8 ;
USE `sql_supptext_test` ;

-- -----------------------------------------------------
-- Table `sql_supptext_test`.`rooms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_supptext_test`.`rooms` (
  `room_id` INT NOT NULL AUTO_INCREMENT,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `private` TINYINT NOT NULL,
  `last_message` DATETIME NULL,
  PRIMARY KEY (`room_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sql_supptext_test`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_supptext_test`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(50) NOT NULL,
  `status` VARCHAR(255) NOT NULL DEFAULT 'Supp! Want to chat?',
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sql_supptext_test`.`messages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_supptext_test`.`messages` (
  `message_id` INT NOT NULL AUTO_INCREMENT,
  `room_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `content` TEXT NOT NULL,
  `sent` TINYINT NOT NULL DEFAULT '0',
  `received` TINYINT NOT NULL DEFAULT '0',
  `parent_id` INT NULL,
  PRIMARY KEY (`message_id`),
  INDEX `ix_fk_messages_users` (`user_id` ASC) VISIBLE,
  INDEX `ix_fk_messages_rooms` (`room_id` ASC) VISIBLE,
  INDEX `ix_fk_messages_messages` (`parent_id` ASC) VISIBLE,
  CONSTRAINT `fk_messages_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `sql_supptext_test`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_messages_rooms`
    FOREIGN KEY (`room_id`)
    REFERENCES `sql_supptext_test`.`rooms` (`room_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_messages_messages`
    FOREIGN KEY (`parent_id`)
    REFERENCES `sql_supptext_test`.`messages` (`message_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sql_supptext_test`.`participants`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_supptext_test`.`participants` (
  `room_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `admin` TINYINT NOT NULL DEFAULT 0,
  `creator` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`room_id`, `user_id`),
  INDEX `ix_fk_participants_rooms` (`room_id` ASC) VISIBLE,
  CONSTRAINT `fk_participants_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `sql_supptext_test`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_participants_rooms`
    FOREIGN KEY (`room_id`)
    REFERENCES `sql_supptext_test`.`rooms` (`room_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
