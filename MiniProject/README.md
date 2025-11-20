🍕 The Great Pizza Analytics Challenge

SQL Mini-Project | IDC 21-Day SQL Challenge

Welcome to the Great Pizza Analytics Challenge!
As part of the Indian Data Club SQL 21-Day Challenge, this mini-project focuses on exploring real pizza sales data using SQL fundamentals, joins, aggregations, filtering, and data cleaning.

You are the data analyst for IDC Pizza, working with four relational tables:

pizza_types – pizza names, categories, ingredients

pizzas – pizza size & price

orders – order dates & times

order_details – quantities sold within each order

The goal is to transform raw transactional data into actionable insights through SQL queries.

📦 Dataset Overview

The dataset includes:

Pizza types (category, name, ingredients)

Pizza sizes & pricing

Daily order logs

Transaction-level order details (pizza_id + quantity)

This structure allows analysis of:

Sales trends

Category-wise performance

Price variation

Order-level revenue

Unordered pizzas

Time-based demand patterns

🎯 Topics Practiced

This challenge reinforces core SQL concepts covered until Day 15:

Database creation & schema design

Filtering using WHERE, IN, BETWEEN, LIKE, logical operators

Aggregations: SUM, AVG, COUNT, MIN, MAX

Grouping & filtering groups: GROUP BY, HAVING

Joins: INNER, LEFT, RIGHT, SELF JOIN

Data cleaning & inspection using DISTINCT, COALESCE, and NULL handling

📝 Questions Solved
Phase 1 — Foundation & Inspection

Install IDC_Pizza.dump

List all unique pizza categories

Display pizza type info with COALESCE for missing ingredients

Identify pizzas missing a price

Phase 2 — Filtering & Exploration

Orders placed on 2015-01-01

List pizzas with price descending

Pizzas sold in sizes 'L' or 'XL'

Pizzas priced between $15 and $17

Pizzas with "Chicken" in the name

Orders on 2015-02-15 or after 8 PM

Phase 3 — Sales Performance

Total quantity of pizzas sold

Average pizza price

Order-level total revenue

Quantity sold per category

Categories with more than 5,000 pizzas sold

Pizzas never ordered

Price differences across sizes using SELF JOIN
