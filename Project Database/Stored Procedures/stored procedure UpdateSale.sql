USE comic;

DROP PROCEDURE IF EXISTS `comic`.`UpdateSale` $$

DELIMITER $$

CREATE PROCEDURE `comic`.`UpdateSale` (
	IN _saleID INT,
	IN _customerID INT, 
    IN _employeeID INT, 
    IN _date DATETIME,
    IN _totalPrice DECIMAL(10,2),
    OUT _saleUpdated BOOL
    )
BEGIN
	DECLARE saleID_ INT;
	DECLARE customerID_ INT;
    DECLARE employeeID_ INT;
    DECLARE date_ DATETIME;
    DECLARE totalPrice_ DECIMAL(10,2);
        
    SET saleID_ = _saleID;    
	SET customerID_ = _customerID;
    SET employeeID_ = _employeeID;
    SET date_ = _date;
    SET totalPrice_ = _totalPrice;
    SET _saleUpdated = false;
    
	UPDATE sale 
    SET sale.id_customer = customerID_,
		sale.id_employee = employeeID_,
        sale.date = date_
    WHERE sale.id_sale = saleID_;    
            
    IF(SELECT count(*) FROM sale WHERE sale.id_customer = customerID_ && sale.id_employee = employeeID_ && sale.date = date_ && sale.id_sale = saleID_ && sale.totalPrice = totlaPrice_ =1) 
		THEN
		SET _saleUpdated = true;
	END IF;
    
    SELECT _saleUpdated;
END $$
    
  DELIMITER ;
	