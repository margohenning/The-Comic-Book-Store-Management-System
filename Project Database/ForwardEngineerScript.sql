-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema comic
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema comic
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `comic` DEFAULT CHARACTER SET utf8 ;
USE `comic` ;

-- -----------------------------------------------------
-- Table `comic`.`author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comic`.`author` (
  `id_author` INT(11) NOT NULL AUTO_INCREMENT,
  `authorName` VARCHAR(50) NOT NULL,
  `authorSurname` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_author`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `comic`.`publisher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comic`.`publisher` (
  `id_publisher` INT(11) NOT NULL AUTO_INCREMENT,
  `publisherName` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_publisher`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `comic`.`book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comic`.`book` (
  `id_book` INT(11) NOT NULL AUTO_INCREMENT,
  `id_author` INT(11) NOT NULL,
  `id_publisher` INT(11) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `isbn` VARCHAR(50) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `status` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_book`),
  INDEX `id_publisher` (`id_publisher` ASC),
  INDEX `id_author` (`id_author` ASC),
  CONSTRAINT `book_ibfk_1`
    FOREIGN KEY (`id_publisher`)
    REFERENCES `comic`.`publisher` (`id_publisher`),
  CONSTRAINT `book_ibfk_2`
    FOREIGN KEY (`id_author`)
    REFERENCES `comic`.`author` (`id_author`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `comic`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comic`.`customer` (
  `id_customer` INT(11) NOT NULL AUTO_INCREMENT,
  `customerName` VARCHAR(50) NOT NULL,
  `customerSurname` VARCHAR(50) NOT NULL,
  `customerEmail` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_customer`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `comic`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comic`.`employee` (
  `id_employee` INT(11) NOT NULL AUTO_INCREMENT,
  `employeeName` VARCHAR(50) NOT NULL,
  `employeeSurname` VARCHAR(50) NOT NULL,
  `employeeEmail` VARCHAR(50) NOT NULL,
  `employeeUsername` VARCHAR(50) NOT NULL,
  `employeePassword` VARCHAR(50) NOT NULL,
  `AdminPrivileges` TINYINT(4) NOT NULL,
  `activated` TINYINT(4) NOT NULL,
  PRIMARY KEY (`id_employee`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `comic`.`sale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comic`.`sale` (
  `id_sale` INT(11) NOT NULL AUTO_INCREMENT,
  `id_customer` INT(11) NOT NULL,
  `id_employee` INT(11) NOT NULL,
  `date` DATETIME NOT NULL,
  `totalPrice` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id_sale`),
  INDEX `id_customer` (`id_customer` ASC),
  INDEX `id_employee` (`id_employee` ASC),
  CONSTRAINT `sale_ibfk_1`
    FOREIGN KEY (`id_customer`)
    REFERENCES `comic`.`customer` (`id_customer`),
  CONSTRAINT `sale_ibfk_2`
    FOREIGN KEY (`id_employee`)
    REFERENCES `comic`.`employee` (`id_employee`))
ENGINE = InnoDB
AUTO_INCREMENT = 37
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `comic`.`salebasket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comic`.`salebasket` (
  `id_saleBasket` INT(11) NOT NULL AUTO_INCREMENT,
  `id_sale` INT(11) NOT NULL,
  `id_book` INT(11) NOT NULL,
  `quantity` INT(11) NOT NULL,
  PRIMARY KEY (`id_saleBasket`),
  INDEX `id_sale` (`id_sale` ASC),
  INDEX `id_book` (`id_book` ASC),
  CONSTRAINT `salebasket_ibfk_1`
    FOREIGN KEY (`id_sale`)
    REFERENCES `comic`.`sale` (`id_sale`),
  CONSTRAINT `salebasket_ibfk_2`
    FOREIGN KEY (`id_book`)
    REFERENCES `comic`.`book` (`id_book`))
ENGINE = InnoDB
AUTO_INCREMENT = 29
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `comic`.`store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comic`.`store` (
  `id_store` INT(11) NOT NULL AUTO_INCREMENT,
  `storeName` VARCHAR(50) NOT NULL,
  `storeContactEmail` VARCHAR(50) NOT NULL,
  `storeContactNumber` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_store`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `comic`.`stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comic`.`stock` (
  `id_stock` INT(11) NOT NULL AUTO_INCREMENT,
  `id_book` INT(11) NOT NULL,
  `id_store` INT(11) NOT NULL,
  `quantity` INT(11) NOT NULL,
  PRIMARY KEY (`id_stock`),
  INDEX `id_book` (`id_book` ASC),
  INDEX `id_store` (`id_store` ASC),
  CONSTRAINT `stock_ibfk_1`
    FOREIGN KEY (`id_book`)
    REFERENCES `comic`.`book` (`id_book`),
  CONSTRAINT `stock_ibfk_2`
    FOREIGN KEY (`id_store`)
    REFERENCES `comic`.`store` (`id_store`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `comic`.`timestampdeletesale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comic`.`timestampdeletesale` (
  `TransactionName` VARCHAR(50) NOT NULL,
  `timestampID` INT(11) NOT NULL AUTO_INCREMENT,
  `timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `customerID` INT(11) NOT NULL,
  `employeeID` INT(11) NOT NULL,
  PRIMARY KEY (`timestampID`))
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8;

USE `comic` ;

-- -----------------------------------------------------
-- Placeholder table for view `comic`.`vw_available`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comic`.`vw_available` (`BookID` INT, `BookName` INT, `BookISBN` INT, `BookPrice` INT, `Status` INT, `AuthorID` INT, `AuthorName` INT, `AuthorSurname` INT, `PublisherID` INT, `PublisherName` INT, `Quantity` INT);

-- -----------------------------------------------------
-- Placeholder table for view `comic`.`vw_bookinfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comic`.`vw_bookinfo` (`BookID` INT, `BookName` INT, `BookISBN` INT, `BookPrice` INT, `Status` INT, `AuthorID` INT, `AuthorName` INT, `AuthorSurname` INT, `PublisherID` INT, `PublisherName` INT, `Quantity` INT);

-- -----------------------------------------------------
-- Placeholder table for view `comic`.`vw_sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comic`.`vw_sales` (`SaleID` INT, `SaleDate` INT, `AmountOfBooks` INT, `TotalPrice` INT, `CustomerName` INT, `CustomerSurname` INT, `CustomerEmail` INT, `EmployeeName` INT, `EmployeeSurname` INT);

-- -----------------------------------------------------
-- Placeholder table for view `comic`.`vw_sold`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comic`.`vw_sold` (`BookID` INT, `BookName` INT, `BookISBN` INT, `BookPrice` INT, `Status` INT, `AuthorID` INT, `AuthorName` INT, `AuthorSurname` INT, `PublisherID` INT, `PublisherName` INT, `Quantity` INT);

-- -----------------------------------------------------
-- procedure DeleteAuthor
-- -----------------------------------------------------

DELIMITER $$
USE `comic`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteAuthor`(IN _authorID INT, OUT _authorDeleted BOOL)
BEGIN
	DECLARE authorID INT;
    SET authorID = _authorID;
    SET _authorDeleted = false;
    
	DELETE FROM author
    WHERE author.id_author = authorID;
    
    IF(SELECT count(*) FROM author WHERE author.id_author = authorID != 1) 
		THEN
		SET _authorDeleted = true;
	END IF;
    
    SELECT _authorDeleted;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure DeleteBook
-- -----------------------------------------------------

DELIMITER $$
USE `comic`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteBook`(IN _bookID INT, OUT _bookDeleted BOOL)
BEGIN
	DECLARE bookID INT;
    SET bookID = _bookID;
    SET _bookDeleted = false;
    
	DELETE FROM book
    WHERE book.id_book = bookID;
    
    IF(SELECT count(*) FROM book WHERE book.id_book = bookID != 1) 
		THEN
		SET _bookDeleted = true;
	END IF;
    
    SELECT _bookDeleted;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure DeleteCustomer
-- -----------------------------------------------------

DELIMITER $$
USE `comic`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteCustomer`(IN _customerID INT, OUT _customerDeleted BOOL)
BEGIN
	DECLARE customerID INT;
    SET customerID = _customerID;
    SET _customerDeleted = false;
    
	DELETE FROM customer
    WHERE customer.id_customer = customerID;
    
    IF(SELECT count(*) FROM customer WHERE customer.id_customer = customerID != 1) 
		THEN
		SET _customerDeleted = true;
	END IF;
    
    SELECT _customerDeleted;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure DeleteEmployee
-- -----------------------------------------------------

DELIMITER $$
USE `comic`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteEmployee`(IN _employeeID INT, OUT _employeeDeleted BOOL)
BEGIN
	DECLARE employeeID INT;
    SET employeeID = _employeeID;
    SET _employeeDeleted = false;
    
	DELETE FROM employee
    WHERE employee.id_employee = employeeID;
    
    IF(SELECT count(*) FROM employee WHERE employee.id_employee = employeeID != 1) 
		THEN
		SET _employeeDeleted = true;
	END IF;
    
    SELECT _employeeDeleted;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure DeletePublisher
-- -----------------------------------------------------

DELIMITER $$
USE `comic`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeletePublisher`(IN _publisherID INT, OUT _publisherDeleted BOOL)
BEGIN
	DECLARE publisherID INT;
    SET publisherID = _publisherID;
    SET _publisherDeleted = false;
    
	DELETE FROM publisher
    WHERE publisher.id_publisher = publisherID;
    
    IF(SELECT count(*) FROM publisher WHERE publisher.id_publisher = publisherID != 1) 
		THEN
		SET _publisherDeleted = true;
	END IF;
    
    SELECT _publisherDeleted;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure DeleteSale
-- -----------------------------------------------------

DELIMITER $$
USE `comic`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteSale`(IN _saleID INT, OUT _saleDeleted BOOL)
BEGIN
	DECLARE saleID INT;
    SET saleID = _saleID;
    SET _saleDeleted = false;
    
	DELETE FROM sale
    WHERE sale.id_sale = saleID;
    
    IF(SELECT count(*) FROM sale WHERE sale.id_sale = saleID = 0) 
		THEN
		SET _saleDeleted = true;
	END IF;
    
    SELECT _saleDeleted;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure DeleteSaleBasket
-- -----------------------------------------------------

DELIMITER $$
USE `comic`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteSaleBasket`(IN _salebasketID INT, OUT _salebasketDeleted BOOL)
BEGIN
	DECLARE salebasketID INT;
    SET salebasketID = _salebasketID;
    SET _salebasketDeleted = false;
    
	DELETE FROM salebasket
    WHERE salebasket.id_salebasket = salebasketID;
    
    IF((SELECT count(*) FROM salebasket WHERE salebasket.id_salebasket = salebasketID) = 0) 
		THEN
		SET _salebasketDeleted = true;
	END IF;
    
    SELECT _salebasketDeleted;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure DeleteStock
-- -----------------------------------------------------

DELIMITER $$
USE `comic`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteStock`(IN _stockID INT, OUT _stockDeleted BOOL)
BEGIN
	DECLARE stockID INT;
    SET stockID = _stockID;
    SET _stockDeleted = false;
    
	DELETE FROM stock
    WHERE stock.id_stock = stockID;
    
    IF(SELECT count(*) FROM stock WHERE stock.id_stock = stockID != 1) 
		THEN
		SET _stockDeleted = true;
	END IF;
    
    SELECT _stockDeleted;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure DeleteStore
-- -----------------------------------------------------

DELIMITER $$
USE `comic`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteStore`(IN _storeID INT, OUT _storeDeleted BOOL)
BEGIN
	DECLARE storeID INT;
    SET storeID = _storeID;
    SET _storeDeleted = false;
    
	DELETE FROM store
    WHERE store.id_store = storeID;
    
    IF(SELECT count(*) FROM store WHERE store.id_store = storeID != 1) 
		THEN
		SET _storeDeleted = true;
	END IF;
    
    SELECT _storeDeleted;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure InsertAuthor
-- -----------------------------------------------------

DELIMITER $$
USE `comic`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertAuthor`(
	IN _authorName VARCHAR(50), 
    IN _authorSurname VARCHAR(50), 
    OUT _authorID INT
    )
BEGIN
	DECLARE authorName_ VARCHAR(50);
    DECLARE authorSurname_ VARCHAR(50);
            
    SET authorName_ = _authorName;
    SET authorSurname_ = _authorSurname;
    SET _authorID = 0;
    
	INSERT INTO author (authorName, authorSurname)
    VALUES(authorName_, authorSurname_);
        
    IF(SELECT count(*) FROM author WHERE author.authorName = authorName_ && author.authorSurname = authorSurname_  =1) 
		THEN
		SET _authorID = (SELECT id_author FROM author WHERE author.authorName = authorName_ && author.authorSurname = authorSurname_ );
	END IF;
    
    SELECT _authorID;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure InsertBook
-- -----------------------------------------------------

DELIMITER $$
USE `comic`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertBook`(
	IN _authorID INT,
	IN _publisherID INT, 
    IN _name VARCHAR(50), 
    IN _isbn VARCHAR(50), 
    IN _status VARCHAR(50),
    IN _price DECIMAL(10,2),
    OUT _bookID INT
    )
BEGIN
	DECLARE authorID_ INT;
    DECLARE publisherID_ INT;
    DECLARE name_ VARCHAR(50);
    DECLARE isbn_ VARCHAR(50);
    DECLARE status_ VARCHAR(50);
    DECLARE price_ DECIMAL(10,2);    
    
            
    SET authorID_ = _authorID;
    SET publisherID_ = _publisherID;
    SET name_ = _name;
	SET isbn_ = _isbn;
    SET status_ = _status;
    SET price_ = _price;
    SET _bookID = 0;
    
	INSERT INTO book (id_author, id_publisher, name, isbn, price, status )
    VALUES(authorID_, publisherID_, name_, isbn_, price_,status_  );
        
    IF(SELECT count(*) FROM book WHERE book.id_author = authorID_ && book.id_publisher = publisherID_ && book.name = name_ && book.isbn=isbn_ && book.price = price_ && book.status = status_  =1) 
		THEN
		SET _bookID = (SELECT id_book FROM book WHERE book.id_author = authorID_ && book.id_publisher = publisherID_ && book.name = name_ && book.isbn=isbn_ && book.price = price_ && book.status = status_);
	END IF;
    
    SELECT _bookID;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure InsertCustomer
-- -----------------------------------------------------

DELIMITER $$
USE `comic`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertCustomer`(
	IN _customerName VARCHAR(50), 
    IN _customerSurname VARCHAR(50), 
    IN _customerEmail VARCHAR(50), 
    OUT _customerID INT
    )
BEGIN
	DECLARE customerName_ VARCHAR(50);
    DECLARE customerSurname_ VARCHAR(50);
    DECLARE customerEmail_ VARCHAR(50);
        
    SET customerName_ = _customerName;
    SET customerSurname_ = _customerSurname;
    SET customerEmail_ = _customerEmail;
    SET _customerID = 0;
    
	INSERT INTO customer (customerName, customerSurname, customerEmail)
    VALUES(customerName_, customerSurname_, customerEmail_);
        
    IF(SELECT count(*) FROM customer WHERE customer.customerName = customerName_ && customer.customerSurname = customerSurname_ && customer.customerEmail = customerEmail_ =1) 
		THEN
		SET _customerID = (SELECT id_customer FROM customer WHERE customer.customerName = customerName_ && customer.customerSurname = customerSurname_ && customer.customerEmail = customerEmail_);
	END IF;
    
    SELECT _customerID;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure InsertEmployee
-- -----------------------------------------------------

DELIMITER $$
USE `comic`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertEmployee`(
	IN _employeeName VARCHAR(50), 
    IN _employeeSurname VARCHAR(50), 
    IN _employeeEmail VARCHAR(50),
    IN _employeeUsername varchar(50),
    IN _employeePassword varchar(50), 
	IN _AdminPrivileges tinyint(4), 
	IN _activated tinyint(4),
    OUT _employeeID INT
    )
BEGIN
	DECLARE employeeName_ VARCHAR(50);
    DECLARE employeeSurname_ VARCHAR(50);
    DECLARE employeeEmail_ VARCHAR(50);
    DECLARE employeeUsername_ varchar(50);
    DECLARE employeePassword_ varchar(50); 
	DECLARE AdminPrivileges_ tinyint(4);
	DECLARE activated_ tinyint(4);
        
    SET employeeName_ = _employeeName;
    SET employeeSurname_ = _employeeSurname;
    SET employeeEmail_ = _employeeEmail;
    SET employeeUsername_ = _employeeUsername ;
    SET employeePassword_ = _employeePassword; 
	SET AdminPrivileges_ = _AdminPrivileges;
	SET activated_ = _activated;
    SET _employeeID = 0;
    
	INSERT INTO employee (employeeName, employeeSurname, employeeEmail,employeeUsername, employeePassword, AdminPrivileges, activated )
    VALUES(employeeName_, employeeSurname_, employeeEmail_ ,employeeUsername_, employeePassword_, AdminPrivileges_, activated_ );
        
    IF(SELECT count(*) FROM employee WHERE employee.employeeName = employeeName_ && employee.employeeSurname = employeeSurname_ && employee.employeeEmail = employeeEmail_ && employee.employeeUsername = employeeUsername_ && employee.employeePassword=employeePassword_ && employee.AdminPrivileges= AdminPrivileges_ && employee.activated = activated_ =1) 
		THEN
		SET _employeeID = (SELECT id_employee FROM employee WHERE employee.employeeName = employeeName_ && employee.employeeSurname = employeeSurname_ && employee.employeeEmail = employeeEmail_ && employee.employeeUsername = employeeUsername_ && employee.employeePassword=employeePassword_ && employee.AdminPrivileges= AdminPrivileges_ && employee.activated = activated_);
	END IF;
    
    SELECT _employeeID;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure InsertPublisher
-- -----------------------------------------------------

DELIMITER $$
USE `comic`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertPublisher`(
	IN _publisherName VARCHAR(50), 
    OUT _publisherID INT
    )
BEGIN
	DECLARE publisherName_ VARCHAR(50);
            
    SET publisherName_ = _publisherName;
    SET _publisherID = 0;
    
	INSERT INTO publisher (publisherName)
    VALUES(publisherName_);
        
    IF(SELECT count(*) FROM publisher WHERE publisher.publisherName = publisherName_  =1) 
		THEN
		SET _publisherID = (SELECT id_publisher FROM publisher WHERE publisher.publisherName = publisherName_);
	END IF;
    
    SELECT _publisherID;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure InsertSale
-- -----------------------------------------------------

DELIMITER $$
USE `comic`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertSale`(
	IN _customerID INT, 
    IN _employeeID INT, 
    IN _date DATETIME,
    IN _totalPrice DECIMAL(10,2),
    OUT _saleID INT
    )
BEGIN
	DECLARE customerID_ INT;
    DECLARE employeeID_ INT;
    DECLARE date_ DATETIME;
	DECLARE totalPrice_ DECIMAL(10,2);
    
    SET customerID_ = _customerID;
    SET employeeID_ = _employeeID;
    SET date_ = _date;
    SET totalPrice_ = _totalPrice;
    SET _saleID = 0;
    
	INSERT INTO sale (id_customer, id_employee, date, totalPrice)
    VALUES(customerID_, employeeID_, date_, totalPrice_);
        
    IF(SELECT count(*) FROM sale WHERE sale.id_customer = customerID_ && sale.id_employee = employeeID_ && sale.date = date_ && sale.totalPrice = totalPrice_ =1) 
		THEN
		SET _saleID = (SELECT id_sale FROM sale WHERE sale.id_customer = customerID_ && sale.id_employee = employeeID_ && sale.date = date_ && sale.totalPrice = totalPrice_);
	END IF;
    
    SELECT _saleID;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure InsertSaleBasket
-- -----------------------------------------------------

DELIMITER $$
USE `comic`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertSaleBasket`(
	IN _bookID INT, 
    IN _saleID INT, 
    IN _quantity INT,
    OUT _saleBasketID INT
    )
BEGIN
	DECLARE bookID_ INT;
    DECLARE saleID_ INT;
    DECLARE quantity_ INT;
            
    SET bookID_ = _bookID;
    SET saleID_ = _saleID;
    SET quantity_ = _quantity;
    SET _saleBasketID = 0;
    
	INSERT INTO salebasket (id_sale, id_book,  quantity)
    VALUES(saleID_, bookID_,  quantity_);
        
    IF(SELECT count(*) FROM salebasket WHERE salebasket.id_book = bookID_ && salebasket.id_sale = saleID_ && salebasket.quantity = quantity_ =1) 
		THEN
		SET _saleBasketID = (SELECT id_salebasket FROM salebasket WHERE salebasket.id_book = bookID_ && salebasket.id_sale = saleID_ && salebasket.quantity = quantity_);
	END IF;
    
    SELECT _saleBasketID;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure InsertStock
-- -----------------------------------------------------

DELIMITER $$
USE `comic`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertStock`(
	IN _bookID INT, 
    IN _storeID INT, 
    IN _quantity INT,
    OUT _stockID INT
    )
BEGIN
	DECLARE bookID_ INT;
    DECLARE storeID_ INT;
    DECLARE quantity_ INT;
            
    SET bookID_ = _bookID;
    SET storeID_ = _storeID;
    SET quantity_ = _quantity;
    SET _stockID = 0;
    
	INSERT INTO stock (id_book, id_store, quantity)
    VALUES(bookID_, storeID_, quantity_);
        
    IF(SELECT count(*) FROM stock WHERE stock.id_book = bookID_ && stock.id_store = storeID_ && stock.quantity = quantity_ =1) 
		THEN
		SET _stockID = (SELECT id_stock FROM stock WHERE stock.id_book = bookID_ && stock.id_store = storeID_ && stock.quantity = quantity_);
	END IF;
    
    SELECT _stockID;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure InsertStore
-- -----------------------------------------------------

DELIMITER $$
USE `comic`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertStore`(
	IN _storeName VARCHAR(50), 
    IN _storeContactEmail VARCHAR(50), 
    IN _storeContactNumber VARCHAR(50), 
    OUT _storeID INT
    )
BEGIN
	DECLARE storeName_ VARCHAR(50);
    DECLARE storeContactEmail_ VARCHAR(50);
    DECLARE storeContactNumber_ VARCHAR(50);
            
    SET storeName_ = _storeName;
    SET storeContactEmail_ = _storeContactEmail;
    SET storeContactNumber_ = _storeContactNumber;
    SET _storeID = 0;
    
	INSERT INTO store (storeName, storeContactEmail, storeContactNumber)
    VALUES(storeName_, storeContactEmail_, storeContactNumber_);
        
    IF(SELECT count(*) FROM store WHERE store.storeName = storeName_ && store.storeContactEmail = storeContactEmail_ && store.storeContactNumber = storeContactNumber_ =1) 
		THEN
		SET _storeID = (SELECT id_store FROM store WHERE store.storeName = storeName_ && store.storeContactEmail = storeContactEmail_ && store.storeContactNumber = storeContactNumber_);
	END IF;
    
    SELECT _storeID;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure UpdateAuthor
-- -----------------------------------------------------

DELIMITER $$
USE `comic`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateAuthor`(
	IN _authorID INT,
	IN _authorName VARCHAR(50), 
    IN _authorSurname VARCHAR(50), 
    OUT _authorUpdated BOOL
    )
BEGIN
	DECLARE authorID_ INT;
	DECLARE authorName_ VARCHAR(50);
    DECLARE authorSurname_ VARCHAR(50);
    
        
    SET authorID_ = _authorID;    
    SET authorName_ = _authorName;
    SET authorSurname_ = _authorSurname;
    SET _authorUpdated = false;
    
	UPDATE author 
    SET author.authorName = authorName_,
		author.authorSurname = authorSurname_
	WHERE author.id_author = authorID_;    
            
    IF(SELECT count(*) FROM author WHERE author.authorName = authorName_ && author.authorSurname = authorSurname_  && author.id_author = authorID_ =1) 
		THEN
		SET _authorUpdated = true;
	END IF;
    
    SELECT _authorUpdated;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure UpdateBook
-- -----------------------------------------------------

DELIMITER $$
USE `comic`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateBook`(
	IN _bookID INT,
	IN _authorID INT,
	IN _publisherID INT, 
    IN _name VARCHAR(50), 
    IN _isbn VARCHAR(50), 
    IN _status VARCHAR(50),
    IN _price DECIMAL(10,2),
    OUT _bookUpdated BOOL
    )
BEGIN
	DECLARE bookID_ INT;
	DECLARE authorID_ INT;
    DECLARE publisherID_ INT;
    DECLARE name_ VARCHAR(50);
    DECLARE isbn_ VARCHAR(50);
    DECLARE status_ VARCHAR(50);
    DECLARE price_ DECIMAL(10,2);    
        
	SET authorID_ = _authorID;
    SET publisherID_ = _publisherID;
    SET name_ = _name;
	SET isbn_ = _isbn;
    SET status_ = _status;
    SET price_ = _price;
    SET bookID_ = _bookID;
    SET _bookUpdated = false;
    
	UPDATE book 
    SET book.id_author = authorID_,
		book.id_publisher = publisherID_,
		book.name = name_,
		book.isbn = isbn_,
		book.status = status_,
		book.price = price_
    WHERE book.id_book = bookID_;    
            
    IF(SELECT count(*) FROM book WHERE book.id_author = authorID_ && book.id_publisher = publisherID_ && book.name = name_ && book.isbn=isbn_ && book.price = price_ && book.status = status && book.id_book = bookID_ =1) 
		THEN
		SET _bookUpdated = true;
	END IF;
    
    SELECT _bookUpdated;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure UpdateCustomer
-- -----------------------------------------------------

DELIMITER $$
USE `comic`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateCustomer`(
	IN _customerID INT,
	IN _customerName VARCHAR(50), 
    IN _customerSurname VARCHAR(50), 
    IN _customerEmail VARCHAR(50), 
    OUT _customerUpdated BOOL
    )
BEGIN
	DECLARE customerID_ INT;
	DECLARE customerName_ VARCHAR(50);
    DECLARE customerSurname_ VARCHAR(50);
    DECLARE customerEmail_ VARCHAR(50);
        
    SET customerID_ = _customerID;    
    SET customerName_ = _customerName;
    SET customerSurname_ = _customerSurname;
    SET customerEmail_ = _customerEmail;
    SET _customerUpdated = false;
    
	UPDATE customer
    SET customer.customerName = customerName_,
		customer.customerSurname = customerSurname_,
        customer.customerEmail = customerEmail_
    WHERE customer.id_customer = customerID_;    
            
    IF(SELECT count(*) FROM customer WHERE customer.customerName = customerName_ && customer.customerSurname = customerSurname_ && customer.customerEmail = customerEmail && customer.id_customer = customerID_ =1) 
		THEN
		SET _customerUpdated = true;
	END IF;
    
    SELECT _customerUpdated;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure UpdateEmployee
-- -----------------------------------------------------

DELIMITER $$
USE `comic`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateEmployee`(
	IN _employeeID INT,
	IN _employeeName VARCHAR(50), 
    IN _employeeSurname VARCHAR(50), 
    IN _employeeEmail VARCHAR(50),
    IN _employeeUsername varchar(50),
    IN _employeePassword varchar(50), 
	IN _AdminPrivileges tinyint(4), 
	IN _activated tinyint(4),
    OUT _employeeUpdated BOOL
    )
BEGIN
	DECLARE employeeID_ INT;
	DECLARE employeeName_ VARCHAR(50);
    DECLARE employeeSurname_ VARCHAR(50);
    DECLARE employeeEmail_ VARCHAR(50);
    DECLARE employeeUsername_ varchar(50);
    DECLARE employeePassword_ varchar(50); 
	DECLARE AdminPrivileges_ tinyint(4);
	DECLARE activated_ tinyint(4);
        
    SET employeeID_ = _employeeID;    
    SET employeeName_ = _employeeName;
    SET employeeSurname_ = _employeeSurname;
    SET employeeEmail_ = _employeeEmail;
     SET employeeUsername_ = _employeeUsername ;
    SET employeePassword_ = _employeePassword; 
	SET AdminPrivileges_ = _AdminPrivileges;
	SET activated_ = _activated;
    SET _employeeUpdated = false;
    
	UPDATE employee
    SET employee.employeeName = employeeName_,
		employee.employeeSurname = employeeSurname_,
        employee.employeeEmail = employeeEmail_,
        employee.employeeUsername = employeeUsername_,
        employee.employeePassword=employeePassword_, 
        employee.AdminPrivileges= AdminPrivileges_,
        employee.activated = activated_
    WHERE employee.id_employee = employeeID_;    
            
    IF(SELECT count(*) FROM employee WHERE employee.employeeName = employeeName_ && employee.employeeSurname = employeeSurname_ && employee.employeeEmail = employeeEmail && employee.employeeUsername = employeeUsername_ && employee.employeePassword=employeePassword_ && employee.AdminPrivileges= AdminPrivileges_ && employee.activated = activated_ && employee.id_employee = employeeID_ =1) 
		THEN
		SET _employeeUpdated = true;
	END IF;
    
    SELECT _employeeUpdated;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure UpdatePublisher
-- -----------------------------------------------------

DELIMITER $$
USE `comic`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdatePublisher`(
	IN _publisherID INT,
	IN _publisherName VARCHAR(50), 
    OUT _publisherUpdated BOOL
    )
BEGIN
	DECLARE publisherID_ INT;
	DECLARE publisherName_ VARCHAR(50);
    
        
    SET publisherID_ = _publisherID;    
    SET publisherName_ = _publisherName;
   SET _publisherUpdated = false;
    
	UPDATE publisher 
    SET publisher.publisherName = publisherName_
	WHERE publisher.id_publisher = publisherID_;    
            
    IF(SELECT count(*) FROM publisher WHERE publisher.publisherName = publisherName_  && publisher.id_publisher = publisherID_ =1) 
		THEN
		SET _publisherUpdated = true;
	END IF;
    
    SELECT _publisherUpdated;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure UpdateSale
-- -----------------------------------------------------

DELIMITER $$
USE `comic`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateSale`(
	IN _saleID INT,
	IN _customerID INT, 
    IN _employeeID INT, 
    IN _date DATETIME,
    IN _totalPrice DECIMAL(10,2),
    OUT _saleUpdated BOOL
    )
BEGIN
	DECLARE saleID_ INT;
	DECLARE customerID_ INT;
    DECLARE employeeID_ INT;
    DECLARE date_ DATETIME;
    DECLARE totalPrice_ DECIMAL(10,2);
        
    SET saleID_ = _saleID;    
	SET customerID_ = _customerID;
    SET employeeID_ = _employeeID;
    SET date_ = _date;
    SET totalPrice_ = _totalPrice;
    SET _saleUpdated = false;
    
	UPDATE sale 
    SET sale.id_customer = customerID_,
		sale.id_employee = employeeID_,
        sale.date = date_
    WHERE sale.id_sale = saleID_;    
            
    IF(SELECT count(*) FROM sale WHERE sale.id_customer = customerID_ && sale.id_employee = employeeID_ && sale.date = date_ && sale.id_sale = saleID_ && sale.totalPrice = totlaPrice_ =1) 
		THEN
		SET _saleUpdated = true;
	END IF;
    
    SELECT _saleUpdated;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure UpdateSaleBasket
-- -----------------------------------------------------

DELIMITER $$
USE `comic`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateSaleBasket`(
	IN saleBasketID_ INT,
    IN _bookID INT, 
    IN _saleID INT, 
    IN _quantity INT,
    OUT _saleBasketUpdated BOOL
    )
BEGIN
	DECLARE saleBasketID_ INT;
	DECLARE bookID_ INT;
    DECLARE saleID_ INT;
    DECLARE quantity_ INT;
        
    SET saleBasketID_ = _saleBasketID;    
	SET bookID_ = _bookID;
    SET saleID_ = _storeID;
    SET quantity_ = _quantity;
    SET _saleBasketUpdated = false;
    
	UPDATE salebasket 
    SET salebasket.id_book = bookID_,
		salebasket.id_sale = saleID_,
		salebasket.quantity = quantity_
    WHERE salebasket.id_saleBasket = saleBasketID_;    
            
    IF(SELECT count(*) FROM salebasket WHERE salebasket.id_book = bookID_ && salebasket.id_sale = saleID_ && salebasket.quantity = quantity_ && salebasket.id_saleBasket = saleBasketID_ =1) 
		THEN
		SET _saleBasketUpdated = true;
	END IF;
    
    SELECT _saleBasketUpdated;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure UpdateStock
-- -----------------------------------------------------

DELIMITER $$
USE `comic`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateStock`(
	IN _stockID INT,
	IN _bookID INT, 
    IN _storeID INT, 
    IN _quantity INT, 
    OUT _stockUpdated BOOL
    )
BEGIN
	DECLARE stockID_ INT;
	DECLARE bookID_ INT;
    DECLARE storeID_ INT;
    DECLARE quantity_ INT;
        
    SET stockID_ = _stockID;    
	SET bookID_ = _bookID;
    SET storeID_ = _storeID;
    SET quantity_ = _quantity;
    SET _stockUpdated = false;
    
	UPDATE stock 
    SET stock.id_book = bookID_,
		stock.id_store = storeID_,
       stock.quantity = quantity_
    WHERE stock.id_stock = stockID_;    
            
    IF(SELECT count(*) FROM stock WHERE stock.id_book = bookID_ && stock.id_store = storeID_ && stock.quantity = quantity_ && stock.id_stock = stockID_ =1) 
		THEN
		SET _stockUpdated = true;
	END IF;
    
    SELECT _stockUpdated;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure UpdateStore
-- -----------------------------------------------------

DELIMITER $$
USE `comic`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateStore`(
	IN _storeID INT,
	IN _storeName VARCHAR(50), 
    IN _storeContactEmail VARCHAR(50), 
    IN _storeContactNumber VARCHAR(50), 
    OUT _storeUpdated BOOL
    )
BEGIN
	DECLARE storeID_ INT;
	DECLARE storeName_ VARCHAR(50);
    DECLARE storeContactEmail_ VARCHAR(50);
    DECLARE storeContactNumber_ VARCHAR(50);
        
    SET storeID_ = _storeID;    
    SET storeName_ = _storeName;
    SET storeContactEmail_ = _storeContactEmail;
    SET storeContactNumber_ = _storeContactNumber;
    SET _storeUpdated = false;
    
	UPDATE store 
    SET store.storeName = storeName_,
		store.storeContactEmail = storeContactEmail_,
        store.storeContactNumber = storeContactNumber_
    WHERE store.id_store = storeID_;    
            
    IF(SELECT count(*) FROM store WHERE store.storeName = storeName_ && store.storeContactEmail = storeContactEmail_ && store.storeContactNumber = storeContactNumber_ && store.id_store = storeID_ =1) 
		THEN
		SET _storeUpdated = true;
	END IF;
    
    SELECT _storeUpdated;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- View `comic`.`vw_available`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comic`.`vw_available`;
USE `comic`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `comic`.`vw_available` AS select `comic`.`book`.`id_book` AS `BookID`,`comic`.`book`.`name` AS `BookName`,`comic`.`book`.`isbn` AS `BookISBN`,`comic`.`book`.`price` AS `BookPrice`,`comic`.`book`.`status` AS `Status`,`comic`.`author`.`id_author` AS `AuthorID`,`comic`.`author`.`authorName` AS `AuthorName`,`comic`.`author`.`authorSurname` AS `AuthorSurname`,`comic`.`publisher`.`id_publisher` AS `PublisherID`,`comic`.`publisher`.`publisherName` AS `PublisherName`,`comic`.`stock`.`quantity` AS `Quantity` from (((`comic`.`book` join `comic`.`author` on((`comic`.`book`.`id_author` = `comic`.`author`.`id_author`))) join `comic`.`publisher` on((`comic`.`book`.`id_publisher` = `comic`.`publisher`.`id_publisher`))) join `comic`.`stock` on((`comic`.`book`.`id_book` = `comic`.`stock`.`id_book`))) where (`comic`.`book`.`status` = 'Available') order by `comic`.`book`.`name`;

-- -----------------------------------------------------
-- View `comic`.`vw_bookinfo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comic`.`vw_bookinfo`;
USE `comic`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `comic`.`vw_bookinfo` AS select `comic`.`book`.`id_book` AS `BookID`,`comic`.`book`.`name` AS `BookName`,`comic`.`book`.`isbn` AS `BookISBN`,`comic`.`book`.`price` AS `BookPrice`,`comic`.`book`.`status` AS `Status`,`comic`.`author`.`id_author` AS `AuthorID`,`comic`.`author`.`authorName` AS `AuthorName`,`comic`.`author`.`authorSurname` AS `AuthorSurname`,`comic`.`publisher`.`id_publisher` AS `PublisherID`,`comic`.`publisher`.`publisherName` AS `PublisherName`,`comic`.`stock`.`quantity` AS `Quantity` from (((`comic`.`book` join `comic`.`author` on((`comic`.`book`.`id_author` = `comic`.`author`.`id_author`))) join `comic`.`publisher` on((`comic`.`book`.`id_publisher` = `comic`.`publisher`.`id_publisher`))) join `comic`.`stock` on((`comic`.`book`.`id_book` = `comic`.`stock`.`id_book`))) order by `comic`.`book`.`name`;

-- -----------------------------------------------------
-- View `comic`.`vw_sales`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comic`.`vw_sales`;
USE `comic`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `comic`.`vw_sales` AS select `comic`.`sale`.`id_sale` AS `SaleID`,`comic`.`sale`.`date` AS `SaleDate`,`comic`.`salebasket`.`quantity` AS `AmountOfBooks`,`comic`.`sale`.`totalPrice` AS `TotalPrice`,`comic`.`customer`.`customerName` AS `CustomerName`,`comic`.`customer`.`customerSurname` AS `CustomerSurname`,`comic`.`customer`.`customerEmail` AS `CustomerEmail`,`comic`.`employee`.`employeeName` AS `EmployeeName`,`comic`.`employee`.`employeeSurname` AS `EmployeeSurname` from (((`comic`.`sale` join `comic`.`customer` on((`comic`.`sale`.`id_customer` = `comic`.`customer`.`id_customer`))) join `comic`.`employee` on((`comic`.`sale`.`id_employee` = `comic`.`employee`.`id_employee`))) join `comic`.`salebasket` on((`comic`.`sale`.`id_sale` = `comic`.`salebasket`.`id_sale`))) order by `comic`.`sale`.`date`,`comic`.`customer`.`customerName`,`comic`.`employee`.`employeeName`;

-- -----------------------------------------------------
-- View `comic`.`vw_sold`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comic`.`vw_sold`;
USE `comic`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `comic`.`vw_sold` AS select `comic`.`book`.`id_book` AS `BookID`,`comic`.`book`.`name` AS `BookName`,`comic`.`book`.`isbn` AS `BookISBN`,`comic`.`book`.`price` AS `BookPrice`,`comic`.`book`.`status` AS `Status`,`comic`.`author`.`id_author` AS `AuthorID`,`comic`.`author`.`authorName` AS `AuthorName`,`comic`.`author`.`authorSurname` AS `AuthorSurname`,`comic`.`publisher`.`id_publisher` AS `PublisherID`,`comic`.`publisher`.`publisherName` AS `PublisherName`,`comic`.`stock`.`quantity` AS `Quantity` from (((`comic`.`book` join `comic`.`author` on((`comic`.`book`.`id_author` = `comic`.`author`.`id_author`))) join `comic`.`publisher` on((`comic`.`book`.`id_publisher` = `comic`.`publisher`.`id_publisher`))) join `comic`.`stock` on((`comic`.`book`.`id_book` = `comic`.`stock`.`id_book`))) where (`comic`.`book`.`status` = 'Sold') order by `comic`.`book`.`name`;
USE `comic`;

DELIMITER $$
USE `comic`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `comic`.`book_BEFORE_INSERT`
BEFORE INSERT ON `comic`.`book`
FOR EACH ROW
BEGIN
IF (NEW.status ="") THEN
SET NEW.status = "Available";
END IF;
END$$

USE `comic`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `comic`.`sale_BEFORE_DELETE`
BEFORE DELETE ON `comic`.`sale`
FOR EACH ROW
BEGIN
INSERT INTO timestampdeletesale (TransactionName, timestamp, customerID, employeeID)
    VALUES('DeleteSale',SYSDATE(), OLD.id_customer, OLD.id_employee);
END$$

USE `comic`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `comic`.`stock_AFTER_UPDATE`
AFTER UPDATE ON `comic`.`stock`
FOR EACH ROW
BEGIN
IF (NEW.quantity =0) THEN
UPDATE book 
    SET book.status = "Sold"
	WHERE book.id_book = NEW.id_book;  
END IF;
IF (NEW.quantity <> 0) THEN
UPDATE book 
    SET book.status = "Available"
	WHERE book.id_book = NEW.id_book;  
END IF;
END$$

USE `comic`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `comic`.`stock_BEFORE_UPDATE`
BEFORE UPDATE ON `comic`.`stock`
FOR EACH ROW
BEGIN
IF (NEW.quantity =0) THEN
UPDATE book 
    SET book.status = "Sold"
	WHERE book.id_book = NEW.id_book;  
END IF;
IF (NEW.quantity <> 0) THEN
UPDATE book 
    SET book.status = "Available"
	WHERE book.id_book = NEW.id_book;  
END IF;
END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
