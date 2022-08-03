/*
 Navicat Premium Data Transfer

 Source Server         : Localhost
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : localhost:8889
 Source Schema         : db_tokonabila

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 13/06/2022 20:25:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for penjualan
-- ----------------------------
DROP TABLE IF EXISTS `penjualan`;
CREATE TABLE `penjualan` (
  `penjualan_id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_pembeli` varchar(255) DEFAULT NULL,
  `telepon` varchar(45) DEFAULT NULL,
  `alamat_pengiriman` text,
  `tanggal_order` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `product_id` int(11) NOT NULL,
  `email_pembeli` varchar(100) DEFAULT NULL,
  `total_harga` int(11) DEFAULT NULL,
  `jumlah_barang` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`penjualan_id`),
  KEY `fk_penjualan_tb_product1_idx` (`product_id`),
  CONSTRAINT `fk_penjualan_tb_product1` FOREIGN KEY (`product_id`) REFERENCES `tb_product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of penjualan
-- ----------------------------
BEGIN;
INSERT INTO `penjualan` VALUES (1, 'Angga', '0812736518', 'Jl. Juanda', '2022-06-08 20:59:31', 2, 'angga@gmail.com', 1000, 2, 1);
INSERT INTO `penjualan` VALUES (2, 'Alex', '87835468', ' jhsha ', '2022-06-08 20:39:19', 1, 'alex@gmail.com', 10000, 2, 1);
INSERT INTO `penjualan` VALUES (3, 'arju', '65w281', 'sjhagd', '2022-06-08 21:02:56', 2, 'admin@gmail.com', 10098, 2, 1);
INSERT INTO `penjualan` VALUES (4, 'jksd', '345678912', 'jhskdcj', '2022-06-13 20:12:00', 2, 'admin123@gmail.com', 198272, 2, 1);
INSERT INTO `penjualan` VALUES (5, 'efghjas', '342167', '  jbasvxvhas  ', '2022-06-08 20:57:36', 2, 'auditor@gmail.com', 98986, 3, 1);
INSERT INTO `penjualan` VALUES (6, 'Baco', '0372665', 'njhs', '2022-06-08 18:33:20', 2, 'baco@gmail.com', 307772, 3, 0);
INSERT INTO `penjualan` VALUES (7, 'dsfs', '08373268235', 'fsd', '2022-06-13 20:22:21', 1, 'mahasiswa@gmail.com', 160000, 2, 0);
COMMIT;

-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `admin_tlp` varchar(45) DEFAULT NULL,
  `admin_email` varchar(45) DEFAULT NULL,
  `admin_address` text,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
BEGIN;
INSERT INTO `tb_admin` VALUES (1, 'Kadarman', 'admin', '21232f297a57a5a743894a0e4a801fc3', '+62087525723', 'admin@gmail.com', 'Jl. Bungtomo');
COMMIT;

-- ----------------------------
-- Table structure for tb_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_category`;
CREATE TABLE `tb_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_category
-- ----------------------------
BEGIN;
INSERT INTO `tb_category` VALUES (1, 'Semen');
COMMIT;

-- ----------------------------
-- Table structure for tb_product
-- ----------------------------
DROP TABLE IF EXISTS `tb_product`;
CREATE TABLE `tb_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) DEFAULT NULL,
  `product_price` int(11) DEFAULT NULL,
  `product_description` text,
  `product_image` varchar(255) DEFAULT NULL,
  `product_status` tinyint(1) DEFAULT NULL,
  `data_created` timestamp NULL DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `stok` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `fk_tb_product_tb_category_idx` (`category_id`),
  CONSTRAINT `fk_tb_product_tb_category` FOREIGN KEY (`category_id`) REFERENCES `tb_category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_product
-- ----------------------------
BEGIN;
INSERT INTO `tb_product` VALUES (1, 'Semen Tonasa', 80000, 'semen', 'produk1654345494.PNG', 1, '2022-06-04 20:24:15', 1, NULL);
INSERT INTO `tb_product` VALUES (2, 'Semen baru ', 80000, '', 'produk1654611044.PNG', 1, NULL, 1, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
