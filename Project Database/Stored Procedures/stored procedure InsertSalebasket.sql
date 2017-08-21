USE comic;

DROP PROCEDURE IF EXISTS `comic`.`InsertSaleBasket` $$

DELIMITER $$

CREATE PROCEDURE `comic`.`InsertSaleBasket` (
	IN _bookID INT, 
    IN _saleID INT, 
    IN _quantity INT,
    OUT _saleBasketID INT
    )
BEGIN
	DECLARE bookID_ INT;
    DECLARE saleID_ INT;
    DECLARE quantity_ INT;
            
    SET bookID_ = _bookID;
    SET saleID_ = _saleID;
    SET quantity_ = _quantity;
    SET _saleBasketID = 0;
    
	INSERT INTO salebasket (id_sale, id_book,  quantity)
    VALUES(saleID_, bookID_,  quantity_);
        
    IF(SELECT count(*) FROM salebasket WHERE salebasket.id_book = bookID_ && salebasket.id_sale = saleID_ && salebasket.quantity = quantity_ =1) 
		THEN
		SET _saleBasketID = (SELECT id_salebasket FROM salebasket WHERE salebasket.id_book = bookID_ && salebasket.id_sale = saleID_ && salebasket.quantity = quantity_);
	END IF;
    
    SELECT _saleBasketID;
END $$
    
  DELIMITER ;
	