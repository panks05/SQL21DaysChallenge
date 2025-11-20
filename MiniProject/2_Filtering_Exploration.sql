-- 1. Orders placed on `'2015-01-01'` (`SELECT` + `WHERE`).
SELECT
	order_id,
    date,
    time
FROM orders
WHERE date = '2015-01-01';

-- 2. List pizzas with `price` descending.
SELECT
	pizza_id,
	pizza_type_id,
	size,
	price
FROM pizzas
ORDER BY price DESC;

-- 3. Pizzas sold in sizes `'L'` or `'XL'`.
SELECT
	pizza_id,
	pizza_type_id,
	size,
	price
FROM pizzas
WHERE size = 'L' OR 'XL';
-- 4. Pizzas priced between $15.00 and $17.00.
SELECT
	pizza_id,
	pizza_type_id,
    size,
    price
FROM pizzas
WHERE price BETWEEN 15.00 AND 17.00;

-- 5. Pizzas with `"Chicken"` in the name.
SELECT
	pizza_type_id,
    name as pizza_name,
    category,
    ingredients
FROM pizza_types
WHERE name LIKE '%Chicken%';

-- 6. Orders on `'2015-02-15'` or placed after 8 PM.
SELECT
	order_id,
    date,
    time
FROM orders
WHERE date = '2015-02-15' OR time > '20:00:00';
