USE comic;

DROP PROCEDURE IF EXISTS `comic`.`DeleteStore` $$

DELIMITER $$

CREATE PROCEDURE `comic`.`DeleteStore` (IN _storeID INT, OUT _storeDeleted BOOL)
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
END $$
    
  DELIMITER ;
	
