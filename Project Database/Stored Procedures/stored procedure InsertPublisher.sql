USE comic;

DROP PROCEDURE IF EXISTS `comic`.`InsertPublisher` $$

DELIMITER $$

CREATE PROCEDURE `comic`.`InsertPublisher` (
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
END $$
    
  DELIMITER ;
	