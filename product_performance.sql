USE edaproject;

--Product Performance

--1. Top 5 highest selling products
SELECT
       TOP 5 product_name,
       total_sales
FROM
       rproducts
ORDER BY
       total_sales DESC;
--Insight: The top-selling products are all variants of the Mountain-200 series, with the Black and Silver models consistently leading in sales across different sizes.

--2. Product categories with highest sales
SELECT
       category,
       SUM(total_sales) AS category_sales
FROM
       rproducts
GROUP BY
       category
ORDER BY
       category_sales DESC;
--Insight: The Bikes category overwhelmingly leads in total sales, far surpassing Accessories and Clothing, making it the primary revenue driver.

--3. Product segments with highest revenue
SELECT
       product_segment,
       SUM(avg_order_revenue) AS total_revenue
FROM
       rproducts
GROUP BY
       product_segment
ORDER BY
       total_revenue DESC;
--Insight: High-Performer products generate the majority of revenue, indicating they are the most commercially successful segment by a wide margin.

--4. Products with most customers
SELECT
       TOP 5 product_name,
       total_customers
FROM
       rproducts
ORDER BY
       total_customers DESC;
--Insight: The 'Water Bottle - 30 oz.' is the most popular product by customer count, followed by tire tubes and patch kits, reflecting high demand for essential accessories.

--5. Subcategories with high average selling price
SELECT
       subcategory,
       ROUND(AVG(avg_selling_price),0) AS avg_price
FROM
       rproducts
GROUP BY
       subcategory
ORDER BY
       avg_price DESC;
--Insight: Mountain, Road, and Touring Bikes have the highest average selling prices, while smaller accessories like caps, socks, and bottles fall at the lower end of the pricing spectrum.