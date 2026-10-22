USE `boardgames_shop`;

-- DML: Додавання нового користувача (User)
INSERT INTO `users` (`full_name`, `email`, `password_hash`) 
VALUES ('Віктор Павленко', 'viktor.pavlenko@gmail.com', 'hash_xyz_9');

-- DML: Додавання нового товару (Product)
INSERT INTO `products` (`title`, `description`, `price`, `stock_quantity`, `category_id`) 
VALUES ('Серп (Scythe)', 'Стратегічна гра про альтернативну історію 1920-х років.', 2850.00, 10, 1);

-- DML: Оновлення ціни товару (Update)
UPDATE `products` 
SET `price` = 1350.00 
WHERE `title` = 'Catan (Колонізатори)';

-- DML: Видалення позиції з замовлення (Delete)
DELETE FROM `order_items` 
WHERE `id` = 6;
