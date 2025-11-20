-- 1. Total quantity of pizzas sold (`SUM`).
SELECT
	SUM(quantity) as total_pizza_sold
FROM order_details;

-- 2. Average pizza price (`AVG`).
SELECT
	ROUND(AVG(COALESCE(price,0)),2) as avg_pizza_price
FROM pizzas;
-- 3. Total order value per order (`JOIN`, `SUM`, `GROUP BY`).
SELECT
	od.order_id,
	SUM(od.quantity * p.price) as total_price
FROM order_details as od
LEFT JOIN pizzas as p
	ON  od.pizza_id = p.pizza_id
GROUP BY od.order_id;

-- 4. Total quantity sold per pizza category (`JOIN`, `GROUP BY`).
SELECT 
    pt.category,
    SUM(od.quantity) AS total_quantity_per_category
FROM order_details od
JOIN pizzas p
    ON od.pizza_id = p.pizza_id
JOIN pizza_types pt
    ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category;

-- 5. Categories with more than 5,000 pizzas sold (`HAVING`).
SELECT 
    pt.category,
    SUM(od.quantity) AS total_quantity_per_category
FROM order_details od
JOIN pizzas p
    ON od.pizza_id = p.pizza_id
JOIN pizza_types pt
    ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category
	HAVING SUM(od.quantity) > 5000;
    
-- 6. Pizzas never ordered (`LEFT/RIGHT JOIN`).
SELECT
	p.pizza_id,
    p.pizza_type_id,
    p.size,
    p.price
FROM pizzas as p
LEFT JOIN order_details as od
	ON p.pizza_id = od.pizza_id
WHERE order_id IS NULL;

-- 7. Price differences between different sizes of the same pizza (`SELF JOIN`).
SELECT
	p1.pizza_type_id,
	p1.size as size_1,
	p1.price as price_1,
	p2.size AS size_2,
    p2.price AS price_2,
    (p2.price - p1.price) AS price_difference
FROM pizzas as p1
JOIN pizzas as p2
ON p1.pizza_type_id = p2.pizza_type_id
	AND p1.size != p2.size
ORDER BY p1.pizza_type_id, size_1, size_2;
