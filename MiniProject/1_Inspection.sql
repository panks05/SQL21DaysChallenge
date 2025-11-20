Use pizza_sales;
-- 1.List all unique pizza categories (DISTINCT).
SELECT DISTINCT
category
FROM pizza_types;

-- 2. Display pizza_type_id, name, and ingredients, replacing NULL ingredients with "Missing Data". Show first 5 rows.
SELECT
pizza_type_id,
name as pizza_name,
COALESCE(ingredients,"Missing Data") as ingredients
FROM pizza_types
LIMIT 5;

-- 3.Check for pizzas missing a price (IS NULL).
SELECT
*
FROM pizzas
WHERE price IS NULL;

-- Deleting empty record
DELETE
FROM pizzas 
WHERE pizza_id IS NULL;
