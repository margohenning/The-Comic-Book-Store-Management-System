USE comic;
CREATE TABLE `employee` (
  `id_employee` int(11) NOT NULL AUTO_INCREMENT,
  `employeeName` varchar(50) NOT NULL,
  `employeeSurname` varchar(50) NOT NULL,
  `employeeEmail` varchar(50) NOT NULL,
  `employeeUsername` varchar(50) NOT NULL,
  `employeePassword` varchar(50) NOT NULL,
  `AdminPrivileges` tinyint(4) NOT NULL,
  `activated` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_employee`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
