/*
Combing data from multiple tables in a single SQL query using commands like JOINs to add new columns from related tables and UNIONs to add new rows.

JOIN: adds related columns from one table to another, based on common columns
UNION: stacks the rows from multiple tables with the same column structure.

For JOIN, the tables must have at least one column with matching values. 
Basic JOIN options include:
			- INNER JOIN: return records that exists in both tables and excludes unmatched records from either table.
            - LEFT JOIN: Returns all records from the left table and any matching records from the right table.
            - RIGHT JOIN: Returns all records from the left table and any matching records from the left table
            - FULL OUTER JOIN: Return all the records (matching and non-matching) from both left and right tables.

            

*/ 

-- Connect to database
use maven_advanced_sql;

-- Basic Joins
SELECT hs.year, hs.country, hs.happiness_score, cs.continent
FROM happiness_scores hs
	JOIN country_stats cs
    ON hs.country = cs.country;

-- Join Types
SELECT hs.year, hs.country, hs.happiness_score, cs.continent
FROM happiness_scores hs
	INNER JOIN country_stats cs
    ON hs.country = cs.country;


-- (left join)

SELECT hs.year, hs.country, hs.happiness_score, cs.continent
FROM happiness_scores hs
	LEFT JOIN country_stats cs
    ON hs.country = cs.country;
    
-- (right join)

SELECT hs.year, hs.country, hs.happiness_score, cs.continent
FROM happiness_scores hs
	RIGHT JOIN country_stats cs
    ON hs.country = cs.country;


-- Excercise (finding products that exists in one table but not in other table in products and orders table)

SELECT prod.product_id, prod.product_name, orders.product_id
FROM products prod
 LEFT JOIN orders 
 ON prod.product_id = orders.product_id
WHERE orders.product_id IS NULL;

 
-- Joining on multiple columns

SELECT hs.year, hs.country, hs.happiness_score, ir.inflation_rate
FROM happiness_scores hs
INNER JOIN inflation_rates ir
ON hs.year = ir.year AND hs.country = ir.country_name
ORDER BY ir.inflation_rate DESC;



-- joining multiple tables

SELECT hs.year, hs.country, hs.happiness_score, cs.continent, ir.inflation_rate
FROM happiness_scores hs
LEFT JOIN country_stats cs
ON hs.country = cs.country
LEFT JOIN inflation_rates ir
ON hs.country = ir.country_name AND hs.year = ir.year;



-- Self joins (Joining a table with itself)
-- Finding products that has the same price with a difference between -0.25 to 0.25. 
SELECT prod.product_name, prod.unit_price, product.product_name, product.unit_price, (prod.unit_price - product.unit_price) as price_diff
FROM products prod
INNER JOIN products product
on prod.product_id <> product.product_id
where prod.unit_price - product.unit_price between -0.25 and 0.25;

-- Cross Join ( Returns all combinations of rows within two or more tables)
SELECT prod.product_name, prod.unit_price, product.product_name, product.unit_price, (prod.unit_price - product.unit_price) as price_diff
FROM products prod
CROSS JOIN products product
where prod.unit_price - product.unit_price between -0.25 and 0.25
AND prod.product_id <> product.product_id;

-- Union and Union all

