USE comic;

DROP PROCEDURE IF EXISTS `comic`.`InsertStock` $$

DELIMITER $$

CREATE PROCEDURE `comic`.`InsertStock` (
	IN _bookID INT, 
    IN _storeID INT, 
    IN _quantity INT,
    OUT _stockID INT
    )
BEGIN
	DECLARE bookID_ INT;
    DECLARE storeID_ INT;
    DECLARE quantity_ INT;
            
    SET bookID_ = _bookID;
    SET storeID_ = _storeID;
    SET quantity_ = _quantity;
    SET _stockID = 0;
    
	INSERT INTO stock (id_book, id_store, quantity)
    VALUES(bookID_, storeID_, quantity_);
        
    IF(SELECT count(*) FROM stock WHERE stock.id_book = bookID_ && stock.id_store = storeID_ && stock.quantity = quantity_ =1) 
		THEN
		SET _stockID = (SELECT id_stock FROM stock WHERE stock.id_book = bookID_ && stock.id_store = storeID_ && stock.quantity = quantity_);
	END IF;
    
    SELECT _stockID;
END $$
    
  DELIMITER ;
	