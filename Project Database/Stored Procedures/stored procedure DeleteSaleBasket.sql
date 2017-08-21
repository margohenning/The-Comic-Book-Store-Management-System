USE comic;

DROP PROCEDURE IF EXISTS `comic`.`DeleteSaleBasket` $$

DELIMITER $$

CREATE PROCEDURE `comic`.`DeleteSaleBasket` (IN _salebasketID INT, OUT _salebasketDeleted BOOL)
BEGIN
	DECLARE salebasketID INT;
    SET salebasketID = _salebasketID;
    SET _salebasketDeleted = false;
    
	DELETE FROM salebasket
    WHERE salebasket.id_salebasket = salebasketID;
    
    IF(SELECT count(*) FROM salebasket WHERE salebasket.id_salebasket = salebasketID != 1) 
		THEN
		SET _salebasketDeleted = true;
	END IF;
    
    SELECT _salebasketDeleted;
END $$
    
  DELIMITER ;
	
