USE comic;

DROP PROCEDURE IF EXISTS `comic`.`DeleteAuthor` $$

DELIMITER $$

CREATE PROCEDURE `comic`.`DeleteAuthor` (IN _authorID INT, OUT _authorDeleted BOOL)
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
END $$
    
  DELIMITER ;
	