-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema sql_supptext
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sql_supptext
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sql_supptext` DEFAULT CHARACTER SET utf8 ;
USE `sql_supptext` ;

-- -----------------------------------------------------
-- Table `sql_supptext`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_supptext`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(50) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT NOW(),
  `updated_at` DATETIME NOT NULL DEFAULT NOW(),
  `status` VARCHAR(50) NULL,
  `last_online` DATETIME NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sql_supptext`.`chats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_supptext`.`chats` (
  `chat_id` INT NOT NULL AUTO_INCREMENT,
  `user_one_id` INT NOT NULL,
  `user_two_id` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT NOW(),
  `participants` VARCHAR(255) NOT NULL,
  `last_message` DATETIME NULL,
  PRIMARY KEY (`chat_id`),
  INDEX `ix_fk_chats_users_one` (`user_one_id` ASC) VISIBLE,
  INDEX `ix_fk_chats_users_two` (`user_two_id` ASC) VISIBLE,
  CONSTRAINT `fk_chats_users_one`
    FOREIGN KEY (`user_one_id`)
    REFERENCES `sql_supptext`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_chats_users_two`
    FOREIGN KEY (`user_two_id`)
    REFERENCES `sql_supptext`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sql_supptext`.`messages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_supptext`.`messages` (
  `message_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `chat_id` INT NOT NULL,
  `content` TEXT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT NOW(),
  `sent` TINYINT NOT NULL DEFAULT 0,
  `received` TINYINT NOT NULL DEFAULT 0,
  `received_date` DATETIME NULL,
  `read_date` DATETIME NULL,
  PRIMARY KEY (`message_id`),
  INDEX `ix_fk_messages_users` (`user_id` ASC) VISIBLE,
  INDEX `ix_fk_messages_chats` (`chat_id` ASC) VISIBLE,
  CONSTRAINT `fk_messages_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `sql_supptext`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_messages_chats`
    FOREIGN KEY (`chat_id`)
    REFERENCES `sql_supptext`.`chats` (`chat_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
