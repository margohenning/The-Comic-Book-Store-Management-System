USE comic;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `vw_sales` AS
    SELECT 
        `sale`.`id_sale` AS `SaleID`,
        `sale`.`date` AS `SaleDate`,
        `salebasket`.`quantity` AS `AmountOfBooks`,
        `sale`.`totalPrice` AS `TotalPrice`,
        `customer`.`customerName` AS `CustomerName`,
        `customer`.`customerSurname` AS `CustomerSurname`,
        `customer`.`customerEmail` AS `CustomerEmail`,
        `employee`.`employeeName` AS `EmployeeName`,
        `employee`.`employeeSurname` AS `EmployeeSurname`
    FROM
        (((`sale`
        JOIN `customer` ON ((`sale`.`id_customer` = `customer`.`id_customer`)))
        JOIN `employee` ON ((`sale`.`id_employee` = `employee`.`id_employee`)))
        JOIN `salebasket` ON ((`sale`.`id_sale` = `salebasket`.`id_sale`)))
    ORDER BY `sale`.`date` , `customer`.`customerName` , `employee`.`employeeName`