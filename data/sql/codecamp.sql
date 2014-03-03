DROP TABLE IF EXISTS `codecamp`.`user`;

CREATE TABLE IF NOT EXISTS `codecamp`.`user`(  
  `user_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(255) NOT NULL,
  `user_password` VARCHAR(255),
  `user_email` VARCHAR(255),
  `user_info` TEXT,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_name` (`user_name`)
);
