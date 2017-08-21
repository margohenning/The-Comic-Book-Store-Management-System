USE comic;

DROP PROCEDURE IF EXISTS `comic`.`InsertCustomer` $$

DELIMITER $$

CREATE PROCEDURE `comic`.`InsertCustomer` (
	IN _customerName VARCHAR(50), 
    IN _customerSurname VARCHAR(50), 
    IN _customerEmail VARCHAR(50), 
    OUT _customerID INT
    )
BEGIN
	DECLARE customerName_ VARCHAR(50);
    DECLARE customerSurname_ VARCHAR(50);
    DECLARE customerEmail_ VARCHAR(50);
        
    SET customerName_ = _customerName;
    SET customerSurname_ = _customerSurname;
    SET customerEmail_ = _customerEmail;
    SET _customerID = 0;
    
	INSERT INTO customer (customerName, customerSurname, customerEmail)
    VALUES(customerName_, customerSurname_, customerEmail_);
        
    IF(SELECT count(*) FROM customer WHERE customer.customerName = customerName_ && customer.customerSurname = customerSurname_ && customer.customerEmail = customerEmail_ =1) 
		THEN
		SET _customerID = (SELECT id_customer FROM customer WHERE customer.customerName = customerName_ && customer.customerSurname = customerSurname_ && customer.customerEmail = customerEmail_);
	END IF;
    
    SELECT _customerID;
END $$
    
  DELIMITER ;
	