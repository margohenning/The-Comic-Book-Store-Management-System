USE comic;
CREATE TABLE `book` (
  `id_book` int(11) NOT NULL AUTO_INCREMENT,
  `id_author` int(11) NOT NULL,
  `id_publisher` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `isbn` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id_book`),
  KEY `id_publisher` (`id_publisher`),
  KEY `id_author` (`id_author`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`id_publisher`) REFERENCES `publisher` (`id_publisher`),
  CONSTRAINT `book_ibfk_2` FOREIGN KEY (`id_author`) REFERENCES `author` (`id_author`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
