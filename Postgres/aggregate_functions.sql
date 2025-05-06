CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    product_category VARCHAR(50),
    region VARCHAR(50),
    sale_date DATE,
    revenue DECIMAL(10, 2),
    quantity INTEGER
);

INSERT INTO sales (product_category, region, sale_date, revenue, quantity) VALUES
('Electronics', 'North', '2023-01-05', 1200.50, 3),
('Clothing', 'South', '2023-01-05', 450.00, 5),
('Electronics', 'North', '2023-01-06', 899.99, 2),
('Books', 'West', '2023-02-10', 150.00, 10),
('Clothing', 'South', '2023-02-15', 675.25, 8),
('Books', 'East', '2023-03-20', 95.50, 4),
('Electronics', 'West', '2023-03-25', 2100.75, 4),
('Clothing', 'North', '2023-04-01', 300.00, 3),
('Books', 'South', '2023-04-05', 45.00, 1),
('Electronics', 'East', '2023-05-10', 1500.00, 5),
('Clothing', 'West', '2023-05-15', 890.00, 7),
('Books', 'North', '2023-06-20', 200.00, 5),
('Electronics', 'South', '2023-06-25', 999.99, 2),
('Clothing', 'East', '2023-07-01', 425.00, 4),
('Books', 'West', '2023-07-05', 75.00, 3);


select *
from sales;


-- 1. SUM: Calculate the total revenue from all sales.
SELECT SUM(revenue) AS total_revenue FROM sales;

-- 2. AVG: Calculate the average revenue per sale.
SELECT  ROUND(AVG(quantity),2) AS average_quantity
FROM sales
WHERE product_category = 'Electronics';

-- 3. GROUP BY:
-- Calculate the total revenue for each product category.
SELECT ROUND(SUM(revenue),2) AS total_revenue, product_category
FROM sales
GROUP BY product_category;

-- 4. GROUP BY with HAVING:
-- Calculate the total revenue for each region, but only include categories with total revenue greater than $1000.
SELECT region , SUM(revenue) AS total_revenue
FROM sales
GROUP BY region
HAVING SUM(revenue) > 1000;

-- 5. COUNT: Count the number of product categories sold in each region.
SELECT region, COUNT(*) AS total_sales
FROM sales
GROUP BY region;

--6. COUNT with DISTINCT: Count the number of unique product categories sold in each region.
SELECT region, COUNT(DISTINCT product_category) AS unique_product_categories
FROM sales
GROUP BY region;

--7. count with WHERE: Count the number of sales in the 'North' region.
SELECT COUNT(*) AS total_sales 
FROM sales
WHERE region = 'North';

--8. MAX: Find the maximum revenue from all sales.
SELECT MAX(revenue) AS max_revenue FROM sales;

--9. MIN: Find the minimum revenue from all sales.
SELECT MIN(revenue) AS min_revenue FROM sales;

--10. MIN/MAX with GROUP BY and Dates;
SELECT MIN(sale_date) AS earliest_sale_date, MAX(sale_date) AS latest_sale_date
FROM sales
GROUP BY product_category;

--11. MIN/MAX with WHERE and Dates:
SELECT MIN(sale_date) AS earliest_sale_date, MAX(sale_date) AS latest_sale_date
FROM sales
WHERE product_category = 'Electronics';

--12. MULTI- COLUMN GROUP BY:
-- Calculate the total revenue for each product category in each region.

SELECT product_category , region,
    SUM(revenue) AS total_revenue,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY product_category, region;


--13 FILTERING AGGREGATE FUNCTIONS:
--calculate categories withe average revenue > 200$ (excluding books)
Select product_category, AVG(revenue) AS average_revenue
FROM sales
WHERE product_category != 'Books'
GROUP BY product_category
HAVING AVG(revenue) > 200;


--14 DATE BASED AGGREGATION:
--MONTHLY SALES REVENUE:
select EXTRACT(MONTH FROM sale_date) AS month,
       SUM(revenue) AS total_revenue
from sales
GROUP BY month
ORDER BY month;

--15 ROLLING UP AGGREGATE FUNCTIONS:
--Calculate revenue by category and region, and region with subtotals.
SELECT product_category, region, SUM(revenue) AS total_revenue
FROM sales
GROUP BY ROLLUP (product_category, region);