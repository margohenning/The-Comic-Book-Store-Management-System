USE comic;

DROP PROCEDURE IF EXISTS `comic`.`UpdateBook` $$

DELIMITER $$

CREATE PROCEDURE `comic`.`UpdateBook` (
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
END $$
    
  DELIMITER ;
	