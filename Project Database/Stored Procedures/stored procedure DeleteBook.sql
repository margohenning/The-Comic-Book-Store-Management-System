USE comic;

DROP PROCEDURE IF EXISTS `comic`.`DeleteBook` $$

DELIMITER $$

CREATE PROCEDURE `comic`.`DeleteBook` (IN _bookID INT, OUT _bookDeleted BOOL)
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
END $$
    
  DELIMITER ;
	
