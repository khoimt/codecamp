/*
SQLyog Community v11.31 (64 bit)
MySQL - 5.5.24-0ubuntu0.12.04.1 : Database - storefront
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`storefront` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `storefront`;

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `categoryId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `parentId` int(10) unsigned NOT NULL,
  `ident` varchar(200) NOT NULL,
  PRIMARY KEY (`categoryId`),
  UNIQUE KEY `ident` (`ident`),
  KEY `parent` (`parentId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`categoryId`,`name`,`parentId`,`ident`) values (1,'Cashmere',6,'cashmere'),(2,'Silk',6,'silk'),(3,'Woolen',6,'woolen'),(4,'Caps',7,'caps'),(5,'Beenie',7,'beenie'),(6,'Scarves',0,'scarves'),(7,'Hats',0,'hats'),(8,'red-eye',5,'red-eye');

/*Table structure for table `page` */

DROP TABLE IF EXISTS `page`;

CREATE TABLE `page` (
  `pageId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `body` text NOT NULL,
  PRIMARY KEY (`pageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `page` */

/*Table structure for table `problem` */

DROP TABLE IF EXISTS `problem`;

CREATE TABLE `problem` (
  `prob_id` int(11) NOT NULL AUTO_INCREMENT,
  `prob_name` varchar(255) DEFAULT NULL,
  `prob_title` varchar(255) DEFAULT NULL,
  `prob_content` text,
  `prob_starttime` int(11) DEFAULT NULL,
  `prob_endtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`prob_id`),
  UNIQUE KEY `problem_name` (`prob_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `problem` */

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `productId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `categoryId` int(10) unsigned NOT NULL,
  `ident` varchar(56) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `shortDescription` varchar(200) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `discountPercent` int(3) NOT NULL,
  `taxable` enum('Yes','No') NOT NULL,
  PRIMARY KEY (`productId`),
  UNIQUE KEY `ident` (`ident`),
  KEY `category` (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`productId`,`categoryId`,`ident`,`name`,`description`,`shortDescription`,`price`,`discountPercent`,`taxable`) values (1,7,'product-1','product 1','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ut arcu. Vivamus vel massa id orci faucibus euismod. Morbi condimentum magna. Proin ac augue quis ante placerat venenatis. Ut nulla diam, lacinia vitae, ornare et, laoreet a, tellus. Morbi dolor orci, adipiscing non, rhoncus id, pretium non, orci. Nullam non mi sit amet tellus placerat feugiat. Aenean adipiscing auctor risus. Morbi vitae tellus. Etiam sed erat. Integer eget lectus eu lorem varius porta. Donec at ipsum et neque euismod ultrices. Aenean elementum elit eget justo. Etiam quis nisl. In hac habitasse platea dictumst. 	Lorem ipsum dolor sit amet, consectetur adipiscing elit. ','Morbi justo diam, dictum ac, ultricies nec.','10.99',0,'Yes'),(2,7,'product-2','product 2','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ut arcu. Vivamus vel massa id orci faucibus euismod. Morbi condimentum magna. Proin ac augue quis ante placerat venenatis. Ut nulla diam, lacinia vitae, ornare et, laoreet a, tellus. Morbi dolor orci, adipiscing non, rhoncus id, pretium non, orci. Nullam non mi sit amet tellus placerat feugiat. Aenean adipiscing auctor risus. Morbi vitae tellus. Etiam sed erat. Integer eget lectus eu lorem varius porta. Donec at ipsum et neque euismod ultrices. Aenean elementum elit eget justo. Etiam quis nisl. In hac habitasse platea dictumst. ','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi justo diam, dictum ac, ultricies nec.','11.99',0,'Yes'),(3,6,'product-3','product 3','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ut arcu. Vivamus vel massa id orci faucibus euismod. Morbi condimentum magna. Proin ac augue quis ante placerat venenatis. Ut nulla diam, lacinia vitae, ornare et, laoreet a, tellus. Morbi dolor orci, adipiscing non, rhoncus id, pretium non, orci. Nullam non mi sit amet tellus placerat feugiat. Aenean adipiscing auctor risus. Morbi vitae tellus. Etiam sed erat. Integer eget lectus eu lorem varius porta. Donec at ipsum et neque euismod ultrices. Aenean elementum elit eget justo. Etiam quis nisl. In hac habitasse platea dictumst. ','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi justo diam, dictum ac, ultricies nec.','11.99',0,'Yes'),(4,5,'product-4','product 4','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ut arcu. Vivamus vel massa id orci faucibus euismod. Morbi condimentum magna. Proin ac augue quis ante placerat venenatis. Ut nulla diam, lacinia vitae, ornare et, laoreet a, tellus. Morbi dolor orci, adipiscing non, rhoncus id, pretium non, orci. Nullam non mi sit amet tellus placerat feugiat. Aenean adipiscing auctor risus. Morbi vitae tellus. Etiam sed erat. Integer eget lectus eu lorem varius porta. Donec at ipsum et neque euismod ultrices. Aenean elementum elit eget justo. Etiam quis nisl. In hac habitasse platea dictumst. ','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi justo diam, dictum ac, ultricies nec.','11.99',0,'Yes'),(5,4,'product-5','product 5','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ut arcu. Vivamus vel massa id orci faucibus euismod. Morbi condimentum magna. Proin ac augue quis ante placerat venenatis. Ut nulla diam, lacinia vitae, ornare et, laoreet a, tellus. Morbi dolor orci, adipiscing non, rhoncus id, pretium non, orci. Nullam non mi sit amet tellus placerat feugiat. Aenean adipiscing auctor risus. Morbi vitae tellus. Etiam sed erat. Integer eget lectus eu lorem varius porta. Donec at ipsum et neque euismod ultrices. Aenean elementum elit eget justo. Etiam quis nisl. In hac habitasse platea dictumst. ','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi justo diam, dictum ac, ultricies nec.','11.99',0,'Yes'),(6,3,'product-6','product 6','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ut arcu. Vivamus vel massa id orci faucibus euismod. Morbi condimentum magna. Proin ac augue quis ante placerat venenatis. Ut nulla diam, lacinia vitae, ornare et, laoreet a, tellus. Morbi dolor orci, adipiscing non, rhoncus id, pretium non, orci. Nullam non mi sit amet tellus placerat feugiat. Aenean adipiscing auctor risus. Morbi vitae tellus. Etiam sed erat. Integer eget lectus eu lorem varius porta. Donec at ipsum et neque euismod ultrices. Aenean elementum elit eget justo. Etiam quis nisl. In hac habitasse platea dictumst. ','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi justo diam, dictum ac, ultricies nec.','11.99',0,'Yes'),(7,2,'product-7','product 7','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ut arcu. Vivamus vel massa id orci faucibus euismod. Morbi condimentum magna. Proin ac augue quis ante placerat venenatis. Ut nulla diam, lacinia vitae, ornare et, laoreet a, tellus. Morbi dolor orci, adipiscing non, rhoncus id, pretium non, orci. Nullam non mi sit amet tellus placerat feugiat. Aenean adipiscing auctor risus. Morbi vitae tellus. Etiam sed erat. Integer eget lectus eu lorem varius porta. Donec at ipsum et neque euismod ultrices. Aenean elementum elit eget justo. Etiam quis nisl. In hac habitasse platea dictumst. ','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi justo diam, dictum ac, ultricies nec.','11.99',50,'Yes'),(8,1,'product-8','product 8','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ut arcu. Vivamus vel massa id orci faucibus euismod. Morbi condimentum magna. Proin ac augue quis ante placerat venenatis. Ut nulla diam, lacinia vitae, ornare et, laoreet a, tellus. Morbi dolor orci, adipiscing non, rhoncus id, pretium non, orci. Nullam non mi sit amet tellus placerat feugiat. Aenean adipiscing auctor risus. Morbi vitae tellus. Etiam sed erat. Integer eget lectus eu lorem varius porta. Donec at ipsum et neque euismod ultrices. Aenean elementum elit eget justo. Etiam quis nisl. In hac habitasse platea dictumst. ','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi justo diam, dictum ac, ultricies nec.','11.99',0,'Yes'),(9,1,'product-9','product 9','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ut arcu. Vivamus vel massa id orci faucibus euismod. Morbi condimentum magna. Proin ac augue quis ante placerat venenatis. Ut nulla diam, lacinia vitae, ornare et, laoreet a, tellus. Morbi dolor orci, adipiscing non, rhoncus id, pretium non, orci. Nullam non mi sit amet tellus placerat feugiat. Aenean adipiscing auctor risus. Morbi vitae tellus. Etiam sed erat. Integer eget lectus eu lorem varius porta. Donec at ipsum et neque euismod ultrices. Aenean elementum elit eget justo. Etiam quis nisl. In hac habitasse platea dictumst. ','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi justo diam, dictum ac, ultricies nec.','11.99',0,'Yes'),(10,2,'product-10','product 10','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ut arcu. Vivamus vel massa id orci faucibus euismod. Morbi condimentum magna. Proin ac augue quis ante placerat venenatis. Ut nulla diam, lacinia vitae, ornare et, laoreet a, tellus. Morbi dolor orci, adipiscing non, rhoncus id, pretium non, orci. Nullam non mi sit amet tellus placerat feugiat. Aenean adipiscing auctor risus. Morbi vitae tellus. Etiam sed erat. Integer eget lectus eu lorem varius porta. Donec at ipsum et neque euismod ultrices. Aenean elementum elit eget justo. Etiam quis nisl. In hac habitasse platea dictumst. ','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi justo diam, dictum ac, ultricies nec.','11.99',0,'Yes'),(11,3,'product-11','product 11','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ut arcu. Vivamus vel massa id orci faucibus euismod. Morbi condimentum magna. Proin ac augue quis ante placerat venenatis. Ut nulla diam, lacinia vitae, ornare et, laoreet a, tellus. Morbi dolor orci, adipiscing non, rhoncus id, pretium non, orci. Nullam non mi sit amet tellus placerat feugiat. Aenean adipiscing auctor risus. Morbi vitae tellus. Etiam sed erat. Integer eget lectus eu lorem varius porta. Donec at ipsum et neque euismod ultrices. Aenean elementum elit eget justo. Etiam quis nisl. In hac habitasse platea dictumst. ','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi justo diam, dictum ac, ultricies nec.','11.99',0,'Yes'),(12,4,'product-12','product 12','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ut arcu. Vivamus vel massa id orci faucibus euismod. Morbi condimentum magna. Proin ac augue quis ante placerat venenatis. Ut nulla diam, lacinia vitae, ornare et, laoreet a, tellus. Morbi dolor orci, adipiscing non, rhoncus id, pretium non, orci. Nullam non mi sit amet tellus placerat feugiat. Aenean adipiscing auctor risus. Morbi vitae tellus. Etiam sed erat. Integer eget lectus eu lorem varius porta. Donec at ipsum et neque euismod ultrices. Aenean elementum elit eget justo. Etiam quis nisl. In hac habitasse platea dictumst. ','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi justo diam, dictum ac, ultricies nec.','11.99',0,'Yes'),(13,5,'product-13','product 13','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ut arcu. Vivamus vel massa id orci faucibus euismod. Morbi condimentum magna. Proin ac augue quis ante placerat venenatis. Ut nulla diam, lacinia vitae, ornare et, laoreet a, tellus. Morbi dolor orci, adipiscing non, rhoncus id, pretium non, orci. Nullam non mi sit amet tellus placerat feugiat. Aenean adipiscing auctor risus. Morbi vitae tellus. Etiam sed erat. Integer eget lectus eu lorem varius porta. Donec at ipsum et neque euismod ultrices. Aenean elementum elit eget justo. Etiam quis nisl. In hac habitasse platea dictumst. ','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi justo diam, dictum ac, ultricies nec.','11.99',0,'Yes'),(14,6,'product-14','product 14','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ut arcu. Vivamus vel massa id orci faucibus euismod. Morbi condimentum magna. Proin ac augue quis ante placerat venenatis. Ut nulla diam, lacinia vitae, ornare et, laoreet a, tellus. Morbi dolor orci, adipiscing non, rhoncus id, pretium non, orci. Nullam non mi sit amet tellus placerat feugiat. Aenean adipiscing auctor risus. Morbi vitae tellus. Etiam sed erat. Integer eget lectus eu lorem varius porta. Donec at ipsum et neque euismod ultrices. Aenean elementum elit eget justo. Etiam quis nisl. In hac habitasse platea dictumst. ','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi justo diam, dictum ac, ultricies nec.','11.99',0,'Yes'),(15,7,'product-15','product 15','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ut arcu. Vivamus vel massa id orci faucibus euismod. Morbi condimentum magna. Proin ac augue quis ante placerat venenatis. Ut nulla diam, lacinia vitae, ornare et, laoreet a, tellus. Morbi dolor orci, adipiscing non, rhoncus id, pretium non, orci. Nullam non mi sit amet tellus placerat feugiat. Aenean adipiscing auctor risus. Morbi vitae tellus. Etiam sed erat. Integer eget lectus eu lorem varius porta. Donec at ipsum et neque euismod ultrices. Aenean elementum elit eget justo. Etiam quis nisl. In hac habitasse platea dictumst. ','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi justo diam, dictum ac, ultricies nec.','11.99',0,'Yes'),(16,6,'product-16','product 16','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ut arcu. Vivamus vel massa id orci faucibus euismod. Morbi condimentum magna. Proin ac augue quis ante placerat venenatis. Ut nulla diam, lacinia vitae, ornare et, laoreet a, tellus. Morbi dolor orci, adipiscing non, rhoncus id, pretium non, orci. Nullam non mi sit amet tellus placerat feugiat. Aenean adipiscing auctor risus. Morbi vitae tellus. Etiam sed erat. Integer eget lectus eu lorem varius porta. Donec at ipsum et neque euismod ultrices. Aenean elementum elit eget justo. Etiam quis nisl. In hac habitasse platea dictumst. ','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi justo diam, dictum ac, ultricies nec.','11.99',0,'Yes'),(17,5,'product-17','product 17','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ut arcu. Vivamus vel massa id orci faucibus euismod. Morbi condimentum magna. Proin ac augue quis ante placerat venenatis. Ut nulla diam, lacinia vitae, ornare et, laoreet a, tellus. Morbi dolor orci, adipiscing non, rhoncus id, pretium non, orci. Nullam non mi sit amet tellus placerat feugiat. Aenean adipiscing auctor risus. Morbi vitae tellus. Etiam sed erat. Integer eget lectus eu lorem varius porta. Donec at ipsum et neque euismod ultrices. Aenean elementum elit eget justo. Etiam quis nisl. In hac habitasse platea dictumst. ','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi justo diam, dictum ac, ultricies nec.','11.99',0,'Yes'),(18,4,'product-18','product 18','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ut arcu. Vivamus vel massa id orci faucibus euismod. Morbi condimentum magna. Proin ac augue quis ante placerat venenatis. Ut nulla diam, lacinia vitae, ornare et, laoreet a, tellus. Morbi dolor orci, adipiscing non, rhoncus id, pretium non, orci. Nullam non mi sit amet tellus placerat feugiat. Aenean adipiscing auctor risus. Morbi vitae tellus. Etiam sed erat. Integer eget lectus eu lorem varius porta. Donec at ipsum et neque euismod ultrices. Aenean elementum elit eget justo. Etiam quis nisl. In hac habitasse platea dictumst. ','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi justo diam, dictum ac, ultricies nec.','11.99',0,'Yes'),(19,8,'product-19','product 19','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ut arcu. Vivamus vel massa id orci faucibus euismod. Morbi condimentum magna. Proin ac augue quis ante placerat venenatis. Ut nulla diam, lacinia vitae, ornare et, laoreet a, tellus. Morbi dolor orci, adipiscing non, rhoncus id, pretium non, orci. Nullam non mi sit amet tellus placerat feugiat. Aenean adipiscing auctor risus. Morbi vitae tellus. Etiam sed erat. Integer eget lectus eu lorem varius porta. Donec at ipsum et neque euismod ultrices. Aenean elementum elit eget justo. Etiam quis nisl. In hac habitasse platea dictumst. ','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi justo diam, dictum ac, ultricies nec.','11.99',0,'Yes');

/*Table structure for table `productImage` */

DROP TABLE IF EXISTS `productImage`;

CREATE TABLE `productImage` (
  `imageId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productId` int(10) unsigned NOT NULL,
  `thumbnail` varchar(200) NOT NULL,
  `full` varchar(200) NOT NULL,
  `isDefault` enum('Yes','No') NOT NULL DEFAULT 'No',
  PRIMARY KEY (`imageId`),
  KEY `productId` (`productId`),
  CONSTRAINT `fk_product` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `productImage` */

insert  into `productImage`(`imageId`,`productId`,`thumbnail`,`full`,`isDefault`) values (1,5,'sm_raver.png','raver.jpg','Yes'),(2,19,'sm_raver.png','raver.jpg','Yes'),(3,18,'sm_wooly_beenie.png','wooly_beenie.jpg','Yes'),(4,17,'sm_raver.png','raver.jpg','Yes'),(5,16,'sm_sc.png','sc.png','Yes'),(6,15,'sm_raver.png','raver.jpg','Yes'),(7,14,'sm_sc.png','sc.png','Yes'),(8,13,'sm_wooly_beenie.png','wooly_beenie.jpg','Yes'),(9,12,'sm_wooly_beenie.png','wooly_beenie.jpg','Yes'),(10,11,'sm_sc.png','sc.png','Yes'),(11,10,'sm_sc.png','sc.png','Yes'),(12,9,'sm_sc.png','sc.png','Yes'),(13,8,'sm_sc.png','sc.png','Yes'),(14,7,'sm_sc.png','sc.png','Yes'),(15,6,'sm_sc.png','sc.png','Yes'),(16,5,'sm_raver.png','raver.jpg','No'),(17,4,'sm_wooly_beenie.png','wooly_beenie.jpg','Yes'),(18,3,'sm_sc.png','sc.png','Yes'),(19,2,'sm_raver.png','raver.jpg','Yes');

/*Table structure for table `submit` */

DROP TABLE IF EXISTS `submit`;

CREATE TABLE `submit` (
  `submit_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `prob_id` int(11) DEFAULT NULL,
  `submit_time` int(11) DEFAULT NULL,
  `delete` tinyint(4) DEFAULT '0',
  `delete_time` int(11) DEFAULT NULL,
  `score` varchar(11) DEFAULT '0',
  `status` enum('pending','no_submit','done','deleted') DEFAULT 'no_submit',
  PRIMARY KEY (`submit_id`),
  KEY `submit_id` (`submit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `submit` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(10) NOT NULL,
  `firstname` varchar(128) NOT NULL,
  `lastname` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `passwd` char(40) NOT NULL,
  `salt` char(32) NOT NULL,
  `role` varchar(100) NOT NULL DEFAULT 'customer',
  PRIMARY KEY (`userId`),
  KEY `email_pass` (`email`,`passwd`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`userId`,`title`,`firstname`,`lastname`,`email`,`passwd`,`salt`,`role`) values (1,'Mr','Keith','Pope','me@me.com','28f92fdb9ac4133ce2267079c0ce324c5c09d463','da660cb994e214937a83afe5d215e401','Admin'),(2,'Mr','user1','user1','user1@gmail.com','user1','','User'),(3,'Mr','user1','user2','user2@gmail.com','user2','','User');

/* Function  structure for function  `concatWords` */

/*!50003 DROP FUNCTION IF EXISTS `concatWords` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` FUNCTION `concatWords`(w1 VARCHAR(20), w2 VARCHAR(20)) RETURNS varchar(40) CHARSET utf8
BEGIN
	DECLARE sz_Return VARCHAR(40);
	SET sz_Return = CONCAT(w1,w2);
	RETURN sz_Return;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
