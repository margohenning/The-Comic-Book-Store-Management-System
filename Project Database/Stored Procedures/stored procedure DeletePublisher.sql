USE comic;

DROP PROCEDURE IF EXISTS `comic`.`DeletePublisher` $$

DELIMITER $$

CREATE PROCEDURE `comic`.`DeletePublisher` (IN _publisherID INT, OUT _publisherDeleted BOOL)
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
END $$
    
  DELIMITER ;
	
