USE `boardgames_shop`;

-- Створення індексу для прискорення пошуку користувачів за ПІБ
CREATE INDEX `idx_users_full_name` ON `users` (`full_name`);
