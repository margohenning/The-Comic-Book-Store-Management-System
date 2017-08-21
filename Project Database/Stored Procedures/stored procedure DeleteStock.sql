USE comic;

DROP PROCEDURE IF EXISTS `comic`.`DeleteStock` $$

DELIMITER $$

CREATE PROCEDURE `comic`.`DeleteStock` (IN _stockID INT, OUT _stockDeleted BOOL)
BEGIN
	DECLARE stockID INT;
    SET stockID = _stockID;
    SET _stockDeleted = false;
    
	DELETE FROM stock
    WHERE stock.id_stock = stockID;
    
    IF(SELECT count(*) FROM stock WHERE stock.id_stock = stockID != 1) 
		THEN
		SET _stockDeleted = true;
	END IF;
    
    SELECT _stockDeleted;
END $$
    
  DELIMITER ;
	
