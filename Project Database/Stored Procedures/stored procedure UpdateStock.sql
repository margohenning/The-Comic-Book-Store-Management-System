USE comic;

DROP PROCEDURE IF EXISTS `comic`.`UpdateStock` $$

DELIMITER $$

CREATE PROCEDURE `comic`.`UpdateStock` (
	IN _stockID INT,
	IN _bookID INT, 
    IN _storeID INT, 
    IN _quantity INT, 
    OUT _stockUpdated BOOL
    )
BEGIN
	DECLARE stockID_ INT;
	DECLARE bookID_ INT;
    DECLARE storeID_ INT;
    DECLARE quantity_ INT;
        
    SET stockID_ = _stockID;    
	SET bookID_ = _bookID;
    SET storeID_ = _storeID;
    SET quantity_ = _quantity;
    SET _stockUpdated = false;
    
	UPDATE stock 
    SET stock.id_book = bookID_,
		stock.id_store = storeID_,
       stock.quantity = quantity_
    WHERE stock.id_stock = stockID_;    
            
    IF(SELECT count(*) FROM stock WHERE stock.id_book = bookID_ && stock.id_store = storeID_ && stock.quantity = quantity_ && stock.id_stock = stockID_ =1) 
		THEN
		SET _stockUpdated = true;
	END IF;
    
    SELECT _stockUpdated;
END $$
    
  DELIMITER ;
	