USE edaproject

--Time-Based Analysis

--1. New customers by year
SELECT
       YEAR(create_date) AS year,
       COUNT(*) AS new_customers
FROM
       dcustomers
GROUP BY
       YEAR(create_date)
ORDER BY
       year;
--Insight: The number of new customers grew substantially in 2026, reflecting a strong upward trend in customer acquisition.

--2. Product launches by year
SELECT
       YEAR(start_date) AS launch_year,
       COUNT(*) AS products_launched
FROM
       dproducts
GROUP BY
       YEAR(start_date)
ORDER BY
       launch_year;
--Insight: Product launches peaked in 2013, indicating a major expansion phase compared to earlier years.

--3. Last order trend by segment
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
--Insight: The year 2013 saw a surge in last orders across all customer segments, especially among New customers, suggesting a high engagement period.

--4. Product last sale trend by category
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
--Insight: Bikes continued to sell steadily from 2011 to 2013, while Accessories and Clothing saw their last sales peak in 2014, indicating a shift in product focus or lifecycle.

--5. Product recency analysis
SELECT
       product_name,
       recency_in_months
FROM
       rproducts
ORDER BY
       recency_in_months;
--Insight: The 'Mountain Bottle Cage' has the most recent purchase activity, suggesting it remains a consistently in-demand product
