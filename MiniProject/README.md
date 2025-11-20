# 🍕 The Great Pizza Analytics Challenge  
**SQL Mini-Project | Indian Data Club – 21-Day SQL Challenge**

This repository contains my mini-project for the **Great Pizza Analytics Challenge**, completed as part of the *Indian Data Club SQL 21-Day Challenge*.  
The project uses a real pizza sales dataset to practice SQL concepts including joins, filtering, aggregation, grouping, NULL handling, and analytical querying.

## 📦 Dataset Overview

The dataset includes four relational tables:

- **pizza_types** – Pizza type, category, and ingredients  
- **pizzas** – Pizza sizes and prices  
- **orders** – Order dates and times  
- **order_details** – Quantity of each pizza sold per order  

## 🎯 SQL Concepts Practiced

- Filtering: `WHERE`, `IN`, `BETWEEN`, `LIKE`, `AND/OR/NOT`  
- Aggregations: `SUM`, `AVG`, `COUNT`, `MIN`, `MAX`  
- Grouping: `GROUP BY`, `HAVING`  
- Joins: `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `SELF JOIN`  
- Data cleaning: `DISTINCT`, `COALESCE`, handling NULLs  

## 📝 Questions Solved

### Phase 1 — Foundation & Inspection
1. List all unique pizza categories  
2. Display pizza type info with cleaned ingredients  
3. Identify pizzas missing a price  

### Phase 2 — Filtering & Exploration
1. Orders placed on `2015-01-01`  
2. Pizzas sorted by price (descending)  
3. Pizzas sold in sizes 'L' or 'XL'  
4. Pizzas priced between `$15` and `$17`  
5. Pizzas with `"Chicken"` in the name  
6. Orders on `2015-02-15` or after 8 PM  

### Phase 3 — Sales Performance
1. Total quantity of pizzas sold  
2. Average pizza price  
3. Total revenue per order  
4. Quantity sold per pizza category  
5. Categories with more than 5,000 pizzas sold  
6. Pizzas never ordered  
7. Price differences between sizes of the same pizza (SELF JOIN) 
