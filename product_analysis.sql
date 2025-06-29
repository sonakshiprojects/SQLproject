USE edaproject;

-- Product Analysis

--1.Category-wise product performance
SELECT
       dp.category,
       SUM(rp.total_sales) AS total_sales
FROM
       dproducts dp
       JOIN rproducts rp ON dp.product_key = rp.product_key
GROUP BY
       dp.category;
--Insight: The Bikes category dominates product performance by a large margin, contributing the highest sales, while Accessories and Clothing generate comparatively lower revenue.

--2.Product line vs average monthly revenue
SELECT
       dp.product_line,
       AVG(rp.avg_monthly_revenue) AS avg_monthly_revenue
FROM
       dproducts dp
       JOIN rproducts rp ON dp.product_key = rp.product_key
GROUP BY
       dp.product_line;
--Insight: The Road product line leads in average monthly revenue, followed by Mountain and Touring, suggesting these categories drive consistent income.


--3.Cost comparison for products under maintenance
SELECT
       dp.maintenance,
       AVG(dp.cost) AS avg_cost
FROM
       dproducts dp
GROUP BY
       dp.maintenance;
--Insight: A majority of products under maintenance incur costs, with only a small fraction having zero associated maintenance expenses.

--4.Subcategory-wise total customers
SELECT
       dp.subcategory,
       SUM(rp.total_customers) AS total_customers
FROM
       dproducts dp
       JOIN rproducts rp ON dp.product_key = rp.product_key
GROUP BY
       dp.subcategory;
--Insight: The highest number of customers are associated with the Tires and Tubes subcategory, followed by Road Bikes and Bottles and Cages, indicating their popularity across the customer base.

--5.Lifespan of products by category
SELECT
       dp.category,
       AVG(rp.lifespan) AS avg_lifespan
FROM
       dproducts dp
       JOIN rproducts rp ON dp.product_key = rp.product_key
GROUP BY
       dp.category;
--Insight: The 'Tires and Tubes' and 'Road Bikes' subcategories have the highest customer counts, indicating strong popularity and demand in these product types.