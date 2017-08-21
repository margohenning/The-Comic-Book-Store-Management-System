USE comic;

DROP PROCEDURE IF EXISTS `comic`.`InsertBook` $$

DELIMITER $$

CREATE PROCEDURE `comic`.`InsertBook` (
	IIN _authorID INT,
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
END $$
    
  DELIMITER ;
	