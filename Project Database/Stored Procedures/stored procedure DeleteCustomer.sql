USE comic;

DROP PROCEDURE IF EXISTS `comic`.`DeleteCustomer` $$

DELIMITER $$

CREATE PROCEDURE `comic`.`DeleteCustomer` (IN _customerID INT, OUT _customerDeleted BOOL)
BEGIN
	DECLARE customerID INT;
    SET customerID = _customerID;
    SET _customerDeleted = false;
    
	DELETE FROM customer
    WHERE customer.id_customer = customerID;
    
    IF(SELECT count(*) FROM customer WHERE customer.id_customer = customerID != 1) 
		THEN
		SET _customerDeleted = true;
	END IF;
    
    SELECT _customerDeleted;
END $$
    
  DELIMITER ;
	
