/*
MySQL Data Transfer
Source Host: localhost
Source Database: imagesearch
Target Host: localhost
Target Database: imagesearch

*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `image` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

