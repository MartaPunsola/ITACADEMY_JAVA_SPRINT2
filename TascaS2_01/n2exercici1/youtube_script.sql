-- MySQL Script generated by MySQL Workbench
-- Fri Sep 27 13:57:34 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- Schema youtube
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `youtube` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `youtube` ;
-- -----------------------------------------------------
-- Table `youtube`.`channel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `youtube`.`channel` ;

CREATE TABLE IF NOT EXISTS `youtube`.`channel` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(200) NULL DEFAULT NULL,
  `creation_date` DATETIME NOT NULL,
  `created_by_user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_creates_idx` (`created_by_user_id` ASC) VISIBLE,
  CONSTRAINT `user_creates`
    FOREIGN KEY (`created_by_user_id`)
    REFERENCES `youtube`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `youtube`.`channel_subscription`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `youtube`.`channel_subscription` ;

CREATE TABLE IF NOT EXISTS `youtube`.`channel_subscription` (
  `user_subscribes_id` INT NOT NULL,
  `channel_subscribed_id` INT NOT NULL,
  PRIMARY KEY (`user_subscribes_id`, `channel_subscribed_id`),
  UNIQUE INDEX `subscription_id` (`user_subscribes_id` ASC, `channel_subscribed_id` ASC) INVISIBLE,
  INDEX `channel_idx` (`channel_subscribed_id` ASC) VISIBLE,
  CONSTRAINT `channel`
    FOREIGN KEY (`channel_subscribed_id`)
    REFERENCES `youtube`.`channel` (`id`),
  CONSTRAINT `user_subscribes`
    FOREIGN KEY (`user_subscribes_id`)
    REFERENCES `youtube`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `youtube`.`comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `youtube`.`comment` ;

CREATE TABLE IF NOT EXISTS `youtube`.`comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(500) NULL DEFAULT NULL,
  `date_time_comment` DATETIME NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_comments_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `user_comments`
    FOREIGN KEY (`user_id`)
    REFERENCES `youtube`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `youtube`.`playlist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `youtube`.`playlist` ;

CREATE TABLE IF NOT EXISTS `youtube`.`playlist` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `creation_date` DATETIME NOT NULL,
  `status` ENUM('public', 'private') NOT NULL,
  `created_by_user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_creates_playlist_idx` (`created_by_user_id` ASC) VISIBLE,
  CONSTRAINT `user_creates_playlist`
    FOREIGN KEY (`created_by_user_id`)
    REFERENCES `youtube`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `youtube`.`rating_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `youtube`.`rating_comment` ;

CREATE TABLE IF NOT EXISTS `youtube`.`rating_comment` (
  `user_id` INT NOT NULL,
  `comment_rated_id` INT NOT NULL,
  `date_time_rating_comment` DATETIME NOT NULL,
  `like` INT NULL DEFAULT NULL,
  `dislike` INT NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`, `comment_rated_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE,
  UNIQUE INDEX `comment_rated_id_UNIQUE` (`comment_rated_id` ASC) VISIBLE,
  CONSTRAINT `comment_rated`
    FOREIGN KEY (`comment_rated_id`)
    REFERENCES `youtube`.`comment` (`id`),
  CONSTRAINT `user_rates_comment`
    FOREIGN KEY (`user_id`)
    REFERENCES `youtube`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `youtube`.`rating_video`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `youtube`.`rating_video` ;

CREATE TABLE IF NOT EXISTS `youtube`.`rating_video` (
  `user_id` INT NOT NULL,
  `video_rated_id` INT NOT NULL,
  `date_time_rating` DATETIME NOT NULL,
  `like` INT NULL DEFAULT NULL,
  `dislike` INT NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`, `video_rated_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE,
  UNIQUE INDEX `video_rated_id_UNIQUE` (`video_rated_id` ASC) VISIBLE,
  CONSTRAINT `user_rates`
    FOREIGN KEY (`user_id`)
    REFERENCES `youtube`.`user` (`id`),
  CONSTRAINT `video_rates`
    FOREIGN KEY (`video_rated_id`)
    REFERENCES `youtube`.`video` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `youtube`.`tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `youtube`.`tag` ;

CREATE TABLE IF NOT EXISTS `youtube`.`tag` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `video_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `video_idx` (`video_id` ASC) VISIBLE,
  CONSTRAINT `video`
    FOREIGN KEY (`video_id`)
    REFERENCES `youtube`.`video` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `youtube`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `youtube`.`user` ;

CREATE TABLE IF NOT EXISTS `youtube`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `date_of_birth` VARCHAR(45) NULL DEFAULT NULL,
  `gender` VARCHAR(45) NULL DEFAULT NULL,
  `country` VARCHAR(45) NULL DEFAULT NULL,
  `postal_code` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `youtube`.`video`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `youtube`.`video` ;

CREATE TABLE IF NOT EXISTS `youtube`.`video` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `description` VARCHAR(200) NULL DEFAULT NULL,
  `size` BLOB NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `length` VARCHAR(45) NOT NULL,
  `thumbnail` BLOB NULL DEFAULT NULL,
  `num_views` INT NULL DEFAULT NULL,
  `num_likes` INT NULL DEFAULT NULL,
  `num_dislikes` INT NULL DEFAULT NULL,
  `status` ENUM('public', 'hidden', 'private') NOT NULL,
  `date_time_publication` DATETIME NOT NULL,
  `uploaded_by_user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_idx` (`uploaded_by_user_id` ASC) VISIBLE,
  CONSTRAINT `user`
    FOREIGN KEY (`uploaded_by_user_id`)
    REFERENCES `youtube`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `youtube`.`video_added`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `youtube`.`video_added` ;

CREATE TABLE IF NOT EXISTS `youtube`.`video_added` (
  `id_video_added` INT NOT NULL AUTO_INCREMENT,
  `user_adds_id` INT NOT NULL,
  `video_id` INT NOT NULL,
  `playlist_id` INT NOT NULL,
  PRIMARY KEY (`id_video_added`),
  INDEX `playlist_idx` (`playlist_id` ASC) VISIBLE,
  INDEX `user_adds_idx` (`user_adds_id` ASC) VISIBLE,
  INDEX `video_is_added_idx` (`video_id` ASC) VISIBLE,
  CONSTRAINT `playlist`
    FOREIGN KEY (`playlist_id`)
    REFERENCES `youtube`.`playlist` (`id`),
  CONSTRAINT `user_adds`
    FOREIGN KEY (`user_adds_id`)
    REFERENCES `youtube`.`user` (`id`),
  CONSTRAINT `video_is_added`
    FOREIGN KEY (`video_id`)
    REFERENCES `youtube`.`video` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
