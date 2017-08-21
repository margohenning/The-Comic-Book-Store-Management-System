USE comic;

DROP PROCEDURE IF EXISTS `comic`.`UpdateSaleBasket` $$

DELIMITER $$

CREATE PROCEDURE `comic`.`UpdateSaleBasket` (
	IN saleBasketID_ INT,
    IN _bookID INT, 
    IN _saleID INT, 
    IN _quantity INT,
    OUT _saleBasketUpdated BOOL
    )
BEGIN
	DECLARE saleBasketID_ INT;
	DECLARE bookID_ INT;
    DECLARE saleID_ INT;
    DECLARE quantity_ INT;
        
    SET saleBasketID_ = _saleBasketID;    
	SET bookID_ = _bookID;
    SET saleID_ = _storeID;
    SET quantity_ = _quantity;
    SET _saleBasketUpdated = false;
    
	UPDATE salebasket 
    SET salebasket.id_book = bookID_,
		salebasket.id_sale = saleID_,
		salebasket.quantity = quantity_
    WHERE salebasket.id_saleBasket = saleBasketID_;    
            
    IF(SELECT count(*) FROM salebasket WHERE salebasket.id_book = bookID_ && salebasket.id_sale = saleID_ && salebasket.quantity = quantity_ && salebasket.id_saleBasket = saleBasketID_ =1) 
		THEN
		SET _saleBasketUpdated = true;
	END IF;
    
    SELECT _saleBasketUpdated;
END $$
    
  DELIMITER ;
	