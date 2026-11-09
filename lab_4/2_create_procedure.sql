USE `boardgames_shop`;

DELIMITER //

CREATE PROCEDURE `sp_AddNewProduct`(
    IN p_title VARCHAR(255),
    IN p_description TEXT,
    IN p_price DECIMAL(10,2),
    IN p_stock_quantity INT,
    IN p_category_id INT
)
BEGIN
    IF p_price < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Помилка: Ціна товару не може бути від’ємною!';
    ELSEIF p_stock_quantity < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Помилка: Кількість товару не може бути від’ємною!';
    ELSE
        INSERT INTO `products` (`title`, `description`, `price`, `stock_quantity`, `category_id`)
        VALUES (p_title, p_description, p_price, p_stock_quantity, p_category_id);
    END IF;
END //

DELIMITER ;
