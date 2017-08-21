USE comic;

DROP PROCEDURE IF EXISTS `comic`.`InsertEmployee` $$

DELIMITER $$

CREATE PROCEDURE `comic`.`InsertEmployee` (
	IN _employeeName VARCHAR(50), 
    IN _employeeSurname VARCHAR(50), 
    IN _employeeEmail VARCHAR(50),
    IN _employeeUsername varchar(50),
    IN _employeePassword varchar(50), 
	IN _AdminPrivileges tinyint(4), 
	IN _activated tinyint(4),
    OUT _employeeID INT
    )
BEGIN
	DECLARE employeeName_ VARCHAR(50);
    DECLARE employeeSurname_ VARCHAR(50);
    DECLARE employeeEmail_ VARCHAR(50);
    DECLARE employeeUsername_ varchar(50);
    DECLARE employeePassword_ varchar(50); 
	DECLARE AdminPrivileges_ tinyint(4);
	DECLARE activated_ tinyint(4);
        
    SET employeeName_ = _employeeName;
    SET employeeSurname_ = _employeeSurname;
    SET employeeEmail_ = _employeeEmail;
    SET employeeUsername_ = _employeeUsername ;
    SET employeePassword_ = _employeePassword; 
	SET AdminPrivileges_ = _AdminPrivileges;
	SET activated_ = _activated;
    SET _employeeID = 0;
    
	INSERT INTO employee (employeeName, employeeSurname, employeeEmail,employeeUsername, employeePassword, AdminPrivileges, activated )
    VALUES(employeeName_, employeeSurname_, employeeEmail_ ,employeeUsername_, employeePassword_, AdminPrivileges_, activated_ );
        
    IF(SELECT count(*) FROM employee WHERE employee.employeeName = employeeName_ && employee.employeeSurname = employeeSurname_ && employee.employeeEmail = employeeEmail_ && employee.employeeUsername = employeeUsername_ && employee.employeePassword=employeePassword_ && employee.AdminPrivileges= AdminPrivileges_ && employee.activated = activated_ =1) 
		THEN
		SET _employeeID = (SELECT id_employee FROM employee WHERE employee.employeeName = employeeName_ && employee.employeeSurname = employeeSurname_ && employee.employeeEmail = employeeEmail_ && employee.employeeUsername = employeeUsername_ && employee.employeePassword=employeePassword_ && employee.AdminPrivileges= AdminPrivileges_ && employee.activated = activated_);
	END IF;
    
    SELECT _employeeID;
END $$
    
  DELIMITER ;
	