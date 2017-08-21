USE comic;

DROP PROCEDURE IF EXISTS `comic`.`UpdateAuthor` $$

DELIMITER $$

CREATE PROCEDURE `comic`.`UpdateAuthor` (
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
END $$
    
  DELIMITER ;
	