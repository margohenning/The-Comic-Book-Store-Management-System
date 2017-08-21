USE comic;

DROP PROCEDURE IF EXISTS `comic`.`InsertSale` $$

DELIMITER $$

CREATE PROCEDURE `comic`.`InsertSale` (
	IN _customerID INT, 
    IN _employeeID INT, 
    IN _date DATETIME,
    IN _totalPrice DECIMAL(10,2),
    OUT _saleID INT
    )
BEGIN
	DECLARE customerID_ INT;
    DECLARE employeeID_ INT;
    DECLARE date_ DATETIME;
	DECLARE totalPrice_ DECIMAL(10,2);
    
    SET customerID_ = _customerID;
    SET employeeID_ = _employeeID;
    SET date_ = _date;
    SET totalPrice_ = _totalPrice;
    SET _saleID = 0;
    
	INSERT INTO sale (id_customer, id_employee, date, totalPrice)
    VALUES(customerID_, employeeID_, date_, totalPrice_);
        
    IF(SELECT count(*) FROM sale WHERE sale.id_customer = customerID_ && sale.id_employee = employeeID_ && sale.date = date_ && sale.totalPrice = totalPrice_ =1) 
		THEN
		SET _saleID = (SELECT id_sale FROM sale WHERE sale.id_customer = customerID_ && sale.id_employee = employeeID_ && sale.date = date_ && sale.totalPrice = totalPrice_);
	END IF;
    
    SELECT _saleID;
END $$
    
  DELIMITER ;
	