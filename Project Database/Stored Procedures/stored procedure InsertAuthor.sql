USE comic;

DROP PROCEDURE IF EXISTS `comic`.`InsertAuthor` $$

DELIMITER $$

CREATE PROCEDURE `comic`.`InsertAuthor` (
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
END $$
    
  DELIMITER ;
	