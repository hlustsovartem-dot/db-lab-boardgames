# Аналіз та оптимізація SQL-запиту за допомогою EXPLAIN

## Тестовий запит
```sql
SELECT * FROM `products` WHERE `price` = 1399.00;
```

## 1. План виконання ДО створення індексу
```text
id	select_type	table	type	possible_keys	key	key_len	ref	rows	Extra
1	SIMPLE	products	ALL					8	Using where
```
* **Тип сканування (`type`):** `ALL` (Full Table Scan — повне послідовне сканування всіх рядків таблиці).
* **Використаний індекс (`key`):** `NULL`.
* **Кількість сканованих рядків (`rows`):** `8`.

## 2. Оптимізація (створення індексу)
```sql
CREATE INDEX `idx_products_price` ON `products` (`price`);
```

## 3. План виконання ПІСЛЯ створення індексу
```text
id	select_type	table	type	possible_keys	key	key_len	ref	rows	Extra
1	SIMPLE	products	ref	idx_products_price	idx_products_price	5	const	1	
```
* **Тип сканування (`type`):** `ref` (пошук за неключовим індексованим значенням).
* **Використаний індекс (`key`):** `idx_products_price`.
* **Кількість сканованих рядків (`rows`):** `1`.

## Висновок
Створення індексу `idx_products_price` на колонці `price` дозволило оптимізатору запитів уникнути повного перебору таблиці (`ALL`) та перейти до прямого індексного пошуку (`ref`), скоротивши кількість перевірених рядків із 8 до 1.
