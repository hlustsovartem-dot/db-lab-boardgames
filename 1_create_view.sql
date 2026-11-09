USE `boardgames_shop`;

CREATE OR REPLACE VIEW `v_Detailed_Orders` AS
SELECT 
    o.`id` AS order_id,
    o.`created_at` AS order_date,
    o.`status` AS order_status,
    u.`full_name` AS customer_name,
    u.`email` AS customer_email,
    p.`title` AS product_name,
    oi.`quantity`,
    oi.`price_at_purchase`,
    (oi.`quantity` * oi.`price_at_purchase`) AS item_total_price
FROM `orders` o
JOIN `users` u ON o.`user_id` = u.`id`
JOIN `order_items` oi ON o.`id` = oi.`order_id`
JOIN `products` p ON oi.`product_id` = p.`id`;
