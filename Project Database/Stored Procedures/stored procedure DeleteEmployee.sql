USE comic;

DROP PROCEDURE IF EXISTS `comic`.`DeleteEmployee` $$

DELIMITER $$

CREATE PROCEDURE `comic`.`DeleteEmployee` (IN _employeeID INT, OUT _employeeDeleted BOOL)
BEGIN
	DECLARE employeeID INT;
    SET employeeID = _employeeID;
    SET _employeeDeleted = false;
    
	DELETE FROM employee
    WHERE employee.id_employee = employeeID;
    
    IF(SELECT count(*) FROM employee WHERE employee.id_employee = employeeID != 1) 
		THEN
		SET _employeeDeleted = true;
	END IF;
    
    SELECT _employeeDeleted;
END $$
    
  DELIMITER ;
	
