USE comic;
CREATE TABLE `stock` (
  `id_stock` int(11) NOT NULL AUTO_INCREMENT,
  `id_book` int(11) NOT NULL,
  `id_store` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id_stock`),
  KEY `id_book` (`id_book`),
  KEY `id_store` (`id_store`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `book` (`id_book`),
  CONSTRAINT `stock_ibfk_2` FOREIGN KEY (`id_store`) REFERENCES `store` (`id_store`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
