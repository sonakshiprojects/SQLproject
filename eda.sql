USE edaproject;

--1. Customer Demographics (Univariate EDA)
--Insight 1: Count of customers by gender
SELECT
       gender,
       COUNT(*) AS customer_count
FROM
       dcustomers
GROUP BY
       gender;

--Insight 2: Distribution of marital status
SELECT
       marital_status,
       COUNT(*) AS count
FROM
       dcustomers
GROUP BY
       marital_status;

--Insight 3: Number of customers by country
SELECT
       country,
       COUNT(*) AS customers
FROM
       dcustomers
GROUP BY
       country
ORDER BY
       customers DESC;

--Insight 4: Top 5 countries with most customers
SELECT
       TOP 5 country,
       COUNT(*) AS customers
FROM
       dcustomers
GROUP BY
       country
ORDER BY
       customers DESC;

--Insight 5: Count of customers by year of account creation
SELECT
       YEAR(create_date) AS year,
       COUNT(*) AS customer_count
FROM
       dcustomers
GROUP BY
       YEAR(create_date)
ORDER BY
       year;

-- 2. Customer RFM
--Insight 1: Average recency, total orders, and sales by customer segment
SELECT
       customer_segment,
       AVG(recency) AS avg_recency,
       AVG(total_orders) AS avg_orders,
       AVG(total_sales) AS avg_sales
FROM
       rcustomers
GROUP BY
       customer_segment;

--Insight 2: Customer segments with highest monthly spend
SELECT
       customer_segment,
       AVG(avg_monthly_spend) AS avg_monthly_spend
FROM
       rcustomers
GROUP BY
       customer_segment
ORDER BY
       avg_monthly_spend DESC;

--Insight 3: Age groups with highest average order value
SELECT
       age_group,
       AVG(avg_order_value) AS avg_order_value
FROM
       rcustomers
GROUP BY
       age_group
ORDER BY
       avg_order_value DESC;

--Insight 4: Total quantity purchased by age group
SELECT
       age_group,
       SUM(total_quantity) AS total_quantity
FROM
       rcustomers
GROUP BY
       age_group;

--Insight 5: High-value customers (total_sales > 5000)
SELECT
       customer_name,
       total_sales
FROM
       rcustomers
WHERE
       total_sales > 5000
ORDER BY
       total_sales DESC;

--3. Product Performance
--Insight 1: Top 5 highest selling products
SELECT
       TOP 5 product_name,
       total_sales
FROM
       rproducts
ORDER BY
       total_sales DESC;

--Insight 2: Product categories with highest sales
SELECT
       category,
       SUM(total_sales) AS category_sales
FROM
       rproducts
GROUP BY
       category
ORDER BY
       category_sales DESC;

--Insight 3: Product segments with highest revenue
SELECT
       product_segment,
       SUM(avg_order_revenue) AS total_revenue
FROM
       rproducts
GROUP BY
       product_segment
ORDER BY
       total_revenue DESC;

--Insight 4: Products with most customers
SELECT
       TOP 5 product_name,
       total_customers
FROM
       rproducts
ORDER BY
       total_customers DESC;

--Insight 5: Subcategories with high average selling price
SELECT
       subcategory,
       AVG(avg_selling_price) AS avg_price
FROM
       rproducts
GROUP BY
       subcategory
ORDER BY
       avg_price DESC;

-- 4 Customer Analysis
--Insight 1: Gender-wise total sales
SELECT
       d.gender,
       SUM(r.total_sales) AS total_sales
FROM
       dcustomers d
       JOIN rcustomers r ON d.customer_key = r.customer_key
GROUP BY
       d.gender;

--Insight 2: Country-wise average order value
SELECT
       d.country,
       AVG(r.avg_order_value) AS avg_order_value
FROM
       dcustomers d
       JOIN rcustomers r ON d.customer_key = r.customer_key
GROUP BY
       d.country;

--Insight 3: Marital status vs. total quantity purchased
SELECT
       d.marital_status,
       SUM(r.total_quantity) AS total_quantity
FROM
       dcustomers d
       JOIN rcustomers r ON d.customer_key = r.customer_key
GROUP BY
       d.marital_status;

--Insight 4: Lifespan comparison by gender
SELECT
       d.gender,
       AVG(r.lifespan) AS avg_lifespan
FROM
       dcustomers d
       JOIN rcustomers r ON d.customer_key = r.customer_key
GROUP BY
       d.gender;

--Insight 5: Segment-wise average monthly spend
SELECT
       d.country,
       r.customer_segment,
       AVG(r.avg_monthly_spend) AS avg_monthly_spend
FROM
       dcustomers d
       JOIN rcustomers r ON d.customer_key = r.customer_key
GROUP BY
       d.country,
       r.customer_segment
ORDER BY
       avg_monthly_spend ASC;

-- 5. Product Analysis
--Insight 1: Category-wise product performance
SELECT
       dp.category,
       SUM(rp.total_sales) AS total_sales
FROM
       dproducts dp
       JOIN rproducts rp ON dp.product_key = rp.product_key
GROUP BY
       dp.category;

--Insight 2: Product line vs average monthly revenue
SELECT
       dp.product_line,
       AVG(rp.avg_monthly_revenue) AS avg_monthly_revenue
FROM
       dproducts dp
       JOIN rproducts rp ON dp.product_key = rp.product_key
GROUP BY
       dp.product_line;

--Insight 3: Cost comparison for products under maintenance
SELECT
       dp.maintenance,
       AVG(dp.cost) AS avg_cost
FROM
       dproducts dp
GROUP BY
       dp.maintenance;

--Insight 4: Subcategory-wise total customers
SELECT
       dp.subcategory,
       SUM(rp.total_customers) AS total_customers
FROM
       dproducts dp
       JOIN rproducts rp ON dp.product_key = rp.product_key
GROUP BY
       dp.subcategory;

--Insight 5: Lifespan of products by category
SELECT
       dp.category,
       AVG(rp.lifespan) AS avg_lifespan
FROM
       dproducts dp
       JOIN rproducts rp ON dp.product_key = rp.product_key
GROUP BY
       dp.category;

--6. Time-Based Analysis
--Insight 1: New customers by year
SELECT
       YEAR(create_date) AS year,
       COUNT(*) AS new_customers
FROM
       dcustomers
GROUP BY
       YEAR(create_date)
ORDER BY
       year;

--Insight 2: Product launches by year
SELECT
       YEAR(start_date) AS launch_year,
       COUNT(*) AS products_launched
FROM
       dproducts
GROUP BY
       YEAR(start_date)
ORDER BY
       launch_year;

--Insight 3: Last order trend by segment
SELECT
       customer_segment,
       YEAR(last_order_date) AS year,
       COUNT(*) AS orders
FROM
       rcustomers
GROUP BY
       customer_segment,
       YEAR(last_order_date)
ORDER BY
       year;

--Insight 4: Product last sale trend by category
SELECT
       category,
       YEAR(last_sale_date) AS year,
       COUNT(*) AS last_sales
FROM
       rproducts
GROUP BY
       category,
       YEAR(last_sale_date)
ORDER BY
       year;

--Insight 5: Product recency analysis (<= 3 months)
SELECT
       product_name,
       recency_in_months
FROM
       rproducts
WHERE
       recency_in_months <= 3
ORDER BY
       recency_in_months;

--Product Line vs Customer Spend
SELECT
       dp.product_line,
       AVG(rc.avg_monthly_spend) AS avg_spend
FROM
       dproducts dp
       CROSS JOIN rcustomers rc
GROUP BY
       dp.product_line;

--Lifespan: Products & Customers
SELECT
       rc.lifespan AS customer_lifespan,
       rp.lifespan AS product_lifespan,
       COUNT(*) AS pairings
FROM
       rcustomers rc
       JOIN rproducts rp ON rc.lifespan = rp.lifespan
GROUP BY
       rc.lifespan,
       rp.lifespan;

--Customer Gender vs Product Subcategory Revenue
SELECT
       dc.gender,
       dp.subcategory,
       AVG(rp.avg_order_revenue) AS avg_revenue
FROM
       dcustomers dc
       JOIN rcustomers rc ON dc.customer_key = rc.customer_key
       CROSS JOIN dproducts dp
       JOIN rproducts rp ON dp.product_key = rp.product_key
GROUP BY
       dc.gender,
       dp.subcategory;

--Customer Segment vs Most Common Product Segment
SELECT
       rc.customer_segment,
       rp.product_segment,
       COUNT(*) AS segment_overlap
FROM
       rcustomers rc
       CROSS JOIN rproducts rp
GROUP BY
       rc.customer_segment,
       rp.product_segment
ORDER BY
       segment_overlap DESC;

-- Customer Age Group vs Product Subcategory Preference
SELECT
       rc.age_group,
       dp.subcategory,
       COUNT(*) AS pair_count
FROM
       rcustomers rc
       CROSS JOIN dproducts dp
GROUP BY
       rc.age_group,
       dp.subcategory
ORDER BY
       pair_count DESC;