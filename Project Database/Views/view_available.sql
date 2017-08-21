USE comic;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `vw_available` AS
    SELECT 
        `book`.`id_book` AS `BookID`,
        `book`.`name` AS `BookName`,
        `book`.`isbn` AS `BookISBN`,
        `book`.`price` AS `BookPrice`,
        `book`.`status` AS `Status`,
        `author`.`id_author` AS `AuthorID`,
        `author`.`authorName` AS `AuthorName`,
        `author`.`authorSurname` AS `AuthorSurname`,
        `publisher`.`id_publisher` AS `PublisherID`,
        `publisher`.`publisherName` AS `PublisherName`,
        `stock`.`quantity` AS `Quantity`
    FROM
        (((`book`
        JOIN `author` ON ((`book`.`id_author` = `author`.`id_author`)))
        JOIN `publisher` ON ((`book`.`id_publisher` = `publisher`.`id_publisher`)))
        JOIN `stock` ON ((`book`.`id_book` = `stock`.`id_book`)))
    WHERE
        (`book`.`status` = 'Available')
    ORDER BY `book`.`name`