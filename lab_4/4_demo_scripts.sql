USE `boardgames_shop`;

SELECT * FROM `v_Detailed_Orders`;

CALL sp_AddNewProduct('Монополія Україна', 'Спеціальне видання', 1200.00, 15, 1);
SELECT * FROM `products` WHERE `title` = 'Монополія Україна';

UPDATE `products` SET `price` = 1399.00 WHERE `id` = 1;
SELECT `id`, `title`, `price`, `updated_at` FROM `products` WHERE `id` = 1;
