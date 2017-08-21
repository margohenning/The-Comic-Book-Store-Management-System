USE comic;

DROP PROCEDURE IF EXISTS `comic`.`UpdateEmployee` $$

DELIMITER $$

CREATE PROCEDURE `comic`.`UpdateEmployee` (
	IN _employeeID INT,
	IN _employeeName VARCHAR(50), 
    IN _employeeSurname VARCHAR(50), 
    IN _employeeEmail VARCHAR(50),
    IN _employeeUsername varchar(50),
    IN _employeePassword varchar(50), 
	IN _AdminPrivileges tinyint(4), 
	IN _activated tinyint(4),
    OUT _employeeUpdated BOOL
    )
BEGIN
	DECLARE employeeID_ INT;
	DECLARE employeeName_ VARCHAR(50);
    DECLARE employeeSurname_ VARCHAR(50);
    DECLARE employeeEmail_ VARCHAR(50);
    DECLARE employeeUsername_ varchar(50);
    DECLARE employeePassword_ varchar(50); 
	DECLARE AdminPrivileges_ tinyint(4);
	DECLARE activated_ tinyint(4);
        
    SET employeeID_ = _employeeID;    
    SET employeeName_ = _employeeName;
    SET employeeSurname_ = _employeeSurname;
    SET employeeEmail_ = _employeeEmail;
     SET employeeUsername_ = _employeeUsername ;
    SET employeePassword_ = _employeePassword; 
	SET AdminPrivileges_ = _AdminPrivileges;
	SET activated_ = _activated;
    SET _employeeUpdated = false;
    
	UPDATE employee
    SET employee.employeeName = employeeName_,
		employee.employeeSurname = employeeSurname_,
        employee.employeeEmail = employeeEmail_,
        employee.employeeUsername = employeeUsername_,
        employee.employeePassword=employeePassword_, 
        employee.AdminPrivileges= AdminPrivileges_,
        employee.activated = activated_
    WHERE employee.id_employee = employeeID_;    
            
    IF(SELECT count(*) FROM employee WHERE employee.employeeName = employeeName_ && employee.employeeSurname = employeeSurname_ && employee.employeeEmail = employeeEmail && employee.employeeUsername = employeeUsername_ && employee.employeePassword=employeePassword_ && employee.AdminPrivileges= AdminPrivileges_ && employee.activated = activated_ && employee.id_employee = employeeID_ =1) 
		THEN
		SET _employeeUpdated = true;
	END IF;
    
    SELECT _employeeUpdated;
END $$
    
  DELIMITER ;
	