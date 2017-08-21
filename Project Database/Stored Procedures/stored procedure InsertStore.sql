USE comic;

DROP PROCEDURE IF EXISTS `comic`.`InsertStore` $$

DELIMITER $$

CREATE PROCEDURE `comic`.`InsertStore` (
	IN _storeName VARCHAR(50), 
    IN _storeContactEmail VARCHAR(50), 
    IN _storeContactNumber VARCHAR(50), 
    OUT _storeID INT
    )
BEGIN
	DECLARE storeName_ VARCHAR(50);
    DECLARE storeContactEmail_ VARCHAR(50);
    DECLARE storeContactNumber_ VARCHAR(50);
            
    SET storeName_ = _storeName;
    SET storeContactEmail_ = _storeContactEmail;
    SET storeContactNumber_ = _storeContactNumber;
    SET _storeID = 0;
    
	INSERT INTO store (storeName, storeContactEmail, storeContactNumber)
    VALUES(storeName_, storeContactEmail_, storeContactNumber_);
        
    IF(SELECT count(*) FROM store WHERE store.storeName = storeName_ && store.storeContactEmail = storeContactEmail_ && store.storeContactNumber = storeContactNumber_ =1) 
		THEN
		SET _storeID = (SELECT id_store FROM store WHERE store.storeName = storeName_ && store.storeContactEmail = storeContactEmail_ && store.storeContactNumber = storeContactNumber_);
	END IF;
    
    SELECT _storeID;
END $$
    
  DELIMITER ;
	