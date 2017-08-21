USE comic;
CREATE TABLE `salebasket` (
  `id_saleBasket` int(11) NOT NULL AUTO_INCREMENT,
  `id_sale` int(11) NOT NULL,
  `id_book` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id_saleBasket`),
  KEY `id_sale` (`id_sale`),
  KEY `id_book` (`id_book`),
  CONSTRAINT `salebasket_ibfk_1` FOREIGN KEY (`id_sale`) REFERENCES `sale` (`id_sale`),
  CONSTRAINT `salebasket_ibfk_2` FOREIGN KEY (`id_book`) REFERENCES `book` (`id_book`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
