USE comic;

DROP PROCEDURE IF EXISTS `comic`.`UpdatePublisher` $$

DELIMITER $$

CREATE PROCEDURE `comic`.`UpdatePublisher` (
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
END $$
    
  DELIMITER ;
	