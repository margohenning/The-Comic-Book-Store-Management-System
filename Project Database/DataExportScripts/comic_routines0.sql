-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: comic
-- ------------------------------------------------------
-- Server version	5.7.11-enterprise-commercial-advanced-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `vw_available`
--

DROP TABLE IF EXISTS `vw_available`;
/*!50001 DROP VIEW IF EXISTS `vw_available`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_available` AS SELECT 
 1 AS `BookID`,
 1 AS `BookName`,
 1 AS `BookISBN`,
 1 AS `BookPrice`,
 1 AS `Status`,
 1 AS `AuthorID`,
 1 AS `AuthorName`,
 1 AS `AuthorSurname`,
 1 AS `PublisherID`,
 1 AS `PublisherName`,
 1 AS `Quantity`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_sold`
--

DROP TABLE IF EXISTS `vw_sold`;
/*!50001 DROP VIEW IF EXISTS `vw_sold`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_sold` AS SELECT 
 1 AS `BookID`,
 1 AS `BookName`,
 1 AS `BookISBN`,
 1 AS `BookPrice`,
 1 AS `Status`,
 1 AS `AuthorID`,
 1 AS `AuthorName`,
 1 AS `AuthorSurname`,
 1 AS `PublisherID`,
 1 AS `PublisherName`,
 1 AS `Quantity`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_bookinfo`
--

DROP TABLE IF EXISTS `vw_bookinfo`;
/*!50001 DROP VIEW IF EXISTS `vw_bookinfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_bookinfo` AS SELECT 
 1 AS `BookID`,
 1 AS `BookName`,
 1 AS `BookISBN`,
 1 AS `BookPrice`,
 1 AS `Status`,
 1 AS `AuthorID`,
 1 AS `AuthorName`,
 1 AS `AuthorSurname`,
 1 AS `PublisherID`,
 1 AS `PublisherName`,
 1 AS `Quantity`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_sales`
--

DROP TABLE IF EXISTS `vw_sales`;
/*!50001 DROP VIEW IF EXISTS `vw_sales`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_sales` AS SELECT 
 1 AS `SaleID`,
 1 AS `SaleDate`,
 1 AS `AmountOfBooks`,
 1 AS `TotalPrice`,
 1 AS `CustomerName`,
 1 AS `CustomerSurname`,
 1 AS `CustomerEmail`,
 1 AS `EmployeeName`,
 1 AS `EmployeeSurname`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_available`
--

/*!50001 DROP VIEW IF EXISTS `vw_available`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_available` AS select `book`.`id_book` AS `BookID`,`book`.`name` AS `BookName`,`book`.`isbn` AS `BookISBN`,`book`.`price` AS `BookPrice`,`book`.`status` AS `Status`,`author`.`id_author` AS `AuthorID`,`author`.`authorName` AS `AuthorName`,`author`.`authorSurname` AS `AuthorSurname`,`publisher`.`id_publisher` AS `PublisherID`,`publisher`.`publisherName` AS `PublisherName`,`stock`.`quantity` AS `Quantity` from (((`book` join `author` on((`book`.`id_author` = `author`.`id_author`))) join `publisher` on((`book`.`id_publisher` = `publisher`.`id_publisher`))) join `stock` on((`book`.`id_book` = `stock`.`id_book`))) where (`book`.`status` = 'Available') order by `book`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_sold`
--

/*!50001 DROP VIEW IF EXISTS `vw_sold`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_sold` AS select `book`.`id_book` AS `BookID`,`book`.`name` AS `BookName`,`book`.`isbn` AS `BookISBN`,`book`.`price` AS `BookPrice`,`book`.`status` AS `Status`,`author`.`id_author` AS `AuthorID`,`author`.`authorName` AS `AuthorName`,`author`.`authorSurname` AS `AuthorSurname`,`publisher`.`id_publisher` AS `PublisherID`,`publisher`.`publisherName` AS `PublisherName`,`stock`.`quantity` AS `Quantity` from (((`book` join `author` on((`book`.`id_author` = `author`.`id_author`))) join `publisher` on((`book`.`id_publisher` = `publisher`.`id_publisher`))) join `stock` on((`book`.`id_book` = `stock`.`id_book`))) where (`book`.`status` = 'Sold') order by `book`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_bookinfo`
--

/*!50001 DROP VIEW IF EXISTS `vw_bookinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_bookinfo` AS select `book`.`id_book` AS `BookID`,`book`.`name` AS `BookName`,`book`.`isbn` AS `BookISBN`,`book`.`price` AS `BookPrice`,`book`.`status` AS `Status`,`author`.`id_author` AS `AuthorID`,`author`.`authorName` AS `AuthorName`,`author`.`authorSurname` AS `AuthorSurname`,`publisher`.`id_publisher` AS `PublisherID`,`publisher`.`publisherName` AS `PublisherName`,`stock`.`quantity` AS `Quantity` from (((`book` join `author` on((`book`.`id_author` = `author`.`id_author`))) join `publisher` on((`book`.`id_publisher` = `publisher`.`id_publisher`))) join `stock` on((`book`.`id_book` = `stock`.`id_book`))) order by `book`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_sales`
--

/*!50001 DROP VIEW IF EXISTS `vw_sales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_sales` AS select `sale`.`id_sale` AS `SaleID`,`sale`.`date` AS `SaleDate`,`salebasket`.`quantity` AS `AmountOfBooks`,`sale`.`totalPrice` AS `TotalPrice`,`customer`.`customerName` AS `CustomerName`,`customer`.`customerSurname` AS `CustomerSurname`,`customer`.`customerEmail` AS `CustomerEmail`,`employee`.`employeeName` AS `EmployeeName`,`employee`.`employeeSurname` AS `EmployeeSurname` from (((`sale` join `customer` on((`sale`.`id_customer` = `customer`.`id_customer`))) join `employee` on((`sale`.`id_employee` = `employee`.`id_employee`))) join `salebasket` on((`sale`.`id_sale` = `salebasket`.`id_sale`))) order by `sale`.`date`,`customer`.`customerName`,`employee`.`employeeName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping routines for database 'comic'
--
/*!50003 DROP PROCEDURE IF EXISTS `DeleteAuthor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteBook` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeletePublisher` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteSale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteSaleBasket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteStore` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertAuthor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertBook` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertPublisher` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertSale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertSaleBasket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertStore` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateAuthor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateBook` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdatePublisher` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateSale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateSaleBasket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateStore` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-22  1:54:14
