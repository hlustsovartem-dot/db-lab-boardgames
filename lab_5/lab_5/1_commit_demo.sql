USE `boardgames_shop`;

-- 1. Дивимося на ціну "ДО"
SELECT `id`, `title`, `price` FROM `products` WHERE `id` = 3;

-- 2. Починаємо транзакцію
START TRANSACTION;

-- 3. Оновлюємо ціну товару
UPDATE `products` 
SET `price` = 590.00 
WHERE `id` = 3;

-- 4. Завершуємо транзакцію та зберігаємо зміни
COMMIT;

-- 5. Дивимося на ціну "ПІСЛЯ"
SELECT `id`, `title`, `price` FROM `products` WHERE `id` = 3;
