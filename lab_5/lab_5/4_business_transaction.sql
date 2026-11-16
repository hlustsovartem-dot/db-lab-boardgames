USE `boardgames_shop`;

START TRANSACTION;

-- КРОК 1: Створюємо замовлення для користувача id = 2
INSERT INTO `orders` (`user_id`, `status`) 
VALUES (2, 'новий');

-- Зберігаємо ID нового замовлення у змінну
SET @new_order_id = LAST_INSERT_ID();

-- КРОК 2: Додаємо 2 шт. товару id = 1 у позиції замовлення
INSERT INTO `order_items` (`order_id`, `product_id`, `quantity`, `price_at_purchase`)
VALUES (@new_order_id, 1, 2, 1399.00);

-- КРОК 3: Списуємо 2 одиниці товару id = 1 зі складу
UPDATE `products`
SET `stock_quantity` = `stock_quantity` - 2
WHERE `id` = 1;

COMMIT;

-- Перевірка результатів:
SELECT * FROM `orders` WHERE `id` = @new_order_id;
SELECT * FROM `order_items` WHERE `order_id` = @new_order_id;
SELECT `id`, `title`, `stock_quantity` FROM `products` WHERE `id` = 1;
