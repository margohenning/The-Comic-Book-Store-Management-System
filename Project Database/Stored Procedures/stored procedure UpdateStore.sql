USE comic;

DROP PROCEDURE IF EXISTS `comic`.`UpdateStore` $$

DELIMITER $$

CREATE PROCEDURE `comic`.`UpdateStore` (
	IIN _storeID INT,
	IN _storeName VARCHAR(50), 
    IN _storeContactEmail VARCHAR(50), 
    IN _storeContactNumber VARCHAR(50), 
    OUT _storeUpdated BOOL
    )
BEGIN
	DECLARE storeID_ INT;
	DECLARE storeName_ VARCHAR(50);
    DECLARE storeContactEmail_ VARCHAR(50);
    DECLARE storeContactNumber_ VARCHAR(50);
        
    SET storeID_ = _storeID;    
    SET storeName_ = _storeName;
    SET storeContactEmail_ = _storeContactEmail;
    SET storeContactNumber_ = _storeContactNumber;
    SET _storeUpdated = false;
    
	UPDATE store 
    SET store.storeName = storeName_,
		store.storeContactEmail = storeContactEmail_,
        store.storeContactNumber = storeContactNumber_
    WHERE store.id_store = storeID_;    
            
    IF(SELECT count(*) FROM store WHERE store.storeName = storeName_ && store.storeContactEmail = storeContactEmail_ && store.storeContactNumber = storeContactNumber_ && store.id_store = storeID_ =1) 
		THEN
		SET _storeUpdated = true;
	END IF;
    
    SELECT _storeUpdated;
END $$
    
  DELIMITER ;
	