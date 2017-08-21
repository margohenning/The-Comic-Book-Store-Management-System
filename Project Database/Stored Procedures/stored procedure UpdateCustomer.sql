USE comic;

DROP PROCEDURE IF EXISTS `comic`.`UpdateCustomer` $$

DELIMITER $$

CREATE PROCEDURE `comic`.`UpdateCustomer` (
	IN _customerID INT,
	IN _customerName VARCHAR(50), 
    IN _customerSurname VARCHAR(50), 
    IN _customerEmail VARCHAR(50), 
    OUT _customerUpdated BOOL
    )
BEGIN
	DECLARE customerID_ INT;
	DECLARE customerName_ VARCHAR(50);
    DECLARE customerSurname_ VARCHAR(50);
    DECLARE customerEmail_ VARCHAR(50);
        
    SET customerID_ = _customerID;    
    SET customerName_ = _customerName;
    SET customerSurname_ = _customerSurname;
    SET customerEmail_ = _customerEmail;
    SET _customerUpdated = false;
    
	UPDATE customer
    SET customer.customerName = customerName_,
		customer.customerSurname = customerSurname_,
        customer.customerEmail = customerEmail_
    WHERE customer.id_customer = customerID_;    
            
    IF(SELECT count(*) FROM customer WHERE customer.customerName = customerName_ && customer.customerSurname = customerSurname_ && customer.customerEmail = customerEmail && customer.id_customer = customerID_ =1) 
		THEN
		SET _customerUpdated = true;
	END IF;
    
    SELECT _customerUpdated;
END $$
    
  DELIMITER ;
	