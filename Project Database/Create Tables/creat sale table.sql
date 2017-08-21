USE comic;
CREATE TABLE `sale` (
  `id_sale` int(11) NOT NULL AUTO_INCREMENT,
  `id_customer` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `totalPrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_sale`),
  KEY `id_customer` (`id_customer`),
  KEY `id_employee` (`id_employee`),
  CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`),
  CONSTRAINT `sale_ibfk_2` FOREIGN KEY (`id_employee`) REFERENCES `employee` (`id_employee`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
