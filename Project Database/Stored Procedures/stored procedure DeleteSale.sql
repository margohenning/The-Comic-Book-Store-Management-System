USE comic;

DROP PROCEDURE IF EXISTS `comic`.`DeleteSale` $$

DELIMITER $$

CREATE PROCEDURE `comic`.`DeleteSale` (IN _saleID INT, OUT _saleDeleted BOOL)
BEGIN
	DECLARE saleID INT;
    SET saleID = _saleID;
    SET _saleDeleted = false;
    
	DELETE FROM sale
    WHERE sale.id_sale = saleID;
    
    IF(SELECT count(*) FROM sale WHERE sale.id_sale = saleID != 1) 
		THEN
		SET _saleDeleted = true;
	END IF;
    
    SELECT _saleDeleted;
END $$
    
  DELIMITER ;
	
