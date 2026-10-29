USE `boardgames_shop`;


SELECT 
    u.`id` AS user_id,
    u.`full_name`,
    COUNT(DISTINCT o.`id`) AS total_orders,
    SUM(oi.`quantity` * oi.`price_at_purchase`) AS total_spent
FROM `users` u
JOIN `orders` o ON u.`id` = o.`user_id`
JOIN `order_items` oi ON o.`id` = oi.`order_id`
GROUP BY u.`id`, u.`full_name`
HAVING total_spent > 1000.00;


SELECT 
    o.`id` AS order_id,
    u.`full_name` AS customer_name,
    p.`title` AS product_name,
    c.`title` AS category_name,
    oi.`quantity`,
    oi.`price_at_purchase`
FROM `orders` o
INNER JOIN `users` u ON o.`user_id` = u.`id`
LEFT JOIN `order_items` oi ON o.`id` = oi.`order_id`
LEFT JOIN `products` p ON oi.`product_id` = p.`id`
LEFT JOIN `categories` c ON p.`category_id` = c.`id`;


SELECT `id`, `title`, `price` 
FROM `products` 
WHERE `price` > (SELECT AVG(`price`) FROM `products`);


SELECT `id`, `title`, `price`, `stock_quantity`, 'Дорогий товар' AS remark 
FROM `products` WHERE `price` > 1500.00
UNION
SELECT `id`, `title`, `price`, `stock_quantity`, 'Залишилось мало' AS remark 
FROM `products` WHERE `stock_quantity` < 10;
