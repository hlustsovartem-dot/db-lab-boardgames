USE `boardgames_shop`;

-- DQL: Фільтрація (WHERE + AND)
SELECT *
FROM `products` 
WHERE `category_id` = 1 AND `price` < 2000.00;

-- DQL: Фільтрація (WHERE + IN)
SELECT *
FROM `orders` 
WHERE `status` IN ('виконано', 'відправлено');

-- DQL: Фільтрація (WHERE + LIKE)
SELECT *
FROM `users` 
WHERE `email` LIKE '%@gmail.com';

-- DQL: Сортування (ORDER BY)
SELECT *
FROM `products` 
ORDER BY `price` DESC;
