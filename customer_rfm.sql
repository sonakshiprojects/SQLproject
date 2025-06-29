USE edaproject;
-- Customer RFM
--1.Average recency, total orders, and sales by customer segment
SELECT
       customer_segment,
       AVG(recency) AS avg_recency,
       AVG(total_orders) AS avg_orders,
       AVG(total_sales) AS avg_sales
FROM
       rcustomers
GROUP BY
       customer_segment;
--Insight: VIP customers generate the highest average sales per customer, while New and Regular customers place fewer orders and contribute lower revenue

--2.Customer segments with highest monthly spend
SELECT
       customer_segment,
       AVG(avg_monthly_spend) AS avg_monthly_spend
FROM
       rcustomers
GROUP BY
       customer_segment
ORDER BY
       avg_monthly_spend DESC;
--Insight: New customers have the highest average monthly spend, suggesting strong initial engagement compared to VIP and Regular segments.

--3.Age groups with highest average order value
SELECT
       age_group,
       AVG(avg_order_value) AS avg_order_value
FROM
       rcustomers
GROUP BY
       age_group
ORDER BY
       avg_order_value DESC;
--Insight: Customers aged 50 and above have the highest average order value, followed closely by the 40–49 age group, indicating higher purchasing power in older demographics.

--4.Total quantity purchased by age group
SELECT
       age_group,
       SUM(total_quantity) AS total_quantity
FROM
       rcustomers
GROUP BY
       age_group;
--Insight: Customers aged 50 and above purchased the highest total quantity, indicating they are the most active buyers among all age groups.

--5.High-value customers (total_sales > 5000)
SELECT
       customer_name,
       total_sales
FROM
       rcustomers
WHERE
       total_sales > 5000
ORDER BY
       total_sales DESC;
--Insight: High-value customers such as Kaitlyn Henderson and Nichole Nara contribute significantly to revenue, with sales exceeding ₹13,000, highlighting their importance for targeted retention strategies.