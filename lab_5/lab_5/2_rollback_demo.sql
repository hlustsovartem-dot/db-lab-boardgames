USE `boardgames_shop`;

-- 1. Дивимося на ціну "ДО"
SELECT `id`, `title`, `price` FROM `products` WHERE `id` = 4;

-- 2. Починаємо транзакцію
START TRANSACTION;

-- 3. Змінюємо ціну всередині транзакції
UPDATE `products` 
SET `price` = 9999.00 
WHERE `id` = 4;

-- 4. Перевіряємо ціну "ПІД ЧАС" транзакції
SELECT `id`, `title`, `price` FROM `products` WHERE `id` = 4;

-- 5. Скасовуємо всі зміни
ROLLBACK;

-- 6. Дивимося на ціну "ПІСЛЯ" відкату
SELECT `id`, `title`, `price` FROM `products` WHERE `id` = 4;
