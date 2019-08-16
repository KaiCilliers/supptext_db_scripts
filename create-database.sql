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
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(50) NOT NULL,
  `status` VARCHAR(50) NOT NULL DEFAULT 'Offline',
  `created_at` DATETIME NOT NULL DEFAULT NOW(),
  `last_online` DATETIME NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE)
ENGINE = InnoDB;
INSERT INTO users (first_name, last_name, phone)
VALUES	('Tosha', 'Kitchens', '+27-555-047-919'),
		('Matt', 'Corzine', '+27-555-244-550'),
        ('Trinity', 'Raye', '+27-812-555-244'),
        ('Erika', 'Gallant', '+27-555-715-968'),
        ('Lenard', 'Franzoni', '+27-814-555-064'),
        ('Michal', 'Nappi', '+27-813-555-716'),
        ('Shizuko', 'Speck', '+27-605-552-820'),
        ('Reba', 'Robarge', '+27-714-555-727'),
        ('Marlyn', 'Augsper', '+27-555-180-530'),
        ('David', 'Sarro', '+27-555-506-896');

-- -----------------------------------------------------
-- Table `supptext`.`conversations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supptext`.`conversations` (
  `conversation_id` INT NOT NULL AUTO_INCREMENT,
  `user_one_id` INT NOT NULL,
  `user_two_id` INT NOT NULL,
  `participants` VARCHAR(255) NOT NULL,
  `last_message` DATETIME NULL,
  PRIMARY KEY (`conversation_id`),
  INDEX `fk_conversations_users_one_ix` (`user_one_id` ASC) VISIBLE,
  INDEX `fk_conversations_users_two_ix` (`user_two_id` ASC) INVISIBLE,
  CONSTRAINT `fk_conversations_users_one`
    FOREIGN KEY (`user_one_id`)
    REFERENCES `supptext`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_conversations_users_two`
    FOREIGN KEY (`user_two_id`)
    REFERENCES `supptext`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;
INSERT INTO conversations (user_one_id, user_two_id, participants)
VALUES	(1, 3, '+27-555-047-919::+27-812-555-244'),
		(8, 4, '+27-714-555-727::+27-555-715-968'),
        (3, 7, '+27-812-555-244::+27-605-552-820');

-- -----------------------------------------------------
-- Table `supptext`.`messages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supptext`.`messages` (
  `message_id` INT NOT NULL AUTO_INCREMENT,
  `conversation_id` INT NOT NULL,
  `sender_id` INT NOT NULL,
  `content` TEXT NOT NULL,
  `date` DATETIME NOT NULL DEFAULT NOW(),
  `read` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`message_id`),
  INDEX `fk_messages_conversations_ix` (`conversation_id` ASC) INVISIBLE,
  INDEX `fk_messages_users_ix` (`sender_id` ASC) VISIBLE,
  CONSTRAINT `fk_messages_conversations`
    FOREIGN KEY (`conversation_id`)
    REFERENCES `supptext`.`conversations` (`conversation_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_messages_users`
    FOREIGN KEY (`sender_id`)
    REFERENCES `supptext`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;
INSERT INTO messages (conversation_id, sender_id, content)
VALUES	(1, 1, "Hey man!"),
		(1, 3, "Oi! How's it?"),
        (3, 3, "Shiz?"),
        (3, 3, "You there?"),
        (3, 3, "SHIZ!!!"),
        (1, 1, "Good, I have a favour to ask :)"),
        (2, 8, "I can't believe he did this to me!"),
        (1, 3, "What's it man?"),
        (1, 1, "I need someone to pick up my mom from the dentist"),
        (1, 3, "-__________-"),
        (3, 7, "What is it?"),
        (2, 4, "What are you talking about?"),
        (2, 8, "Don't you know!?"),
        (2, 4, "No..."),
        (2, 8, "I'll tell you then"),
        (1, 1, "Please <3"),
        (3, 3, "Hi! I am glad you are ok :)"),
        (1, 3, "I can move a few things around I guess"),
        (2, 4, "Thank you"),
        (3, 7, "Thank you for thinking of me"),
        (3, 3, "See you tomorrow!"),
        (1, 1, "Thanks!");

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
