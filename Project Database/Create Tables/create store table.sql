USE comic;
CREATE TABLE `store` (
  `id_store` int(11) NOT NULL AUTO_INCREMENT,
  `storeName` varchar(50) NOT NULL,
  `storeContactEmail` varchar(50) NOT NULL,
  `storeContactNumber` varchar(50) NOT NULL,
  PRIMARY KEY (`id_store`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
