USE edaproject;

-- Customer Analysis
-- 1. Gender-wise total sales
SELECT
       d.gender,
       SUM(r.total_sales) AS total_sales
FROM
       dcustomers d
       JOIN rcustomers r ON d.customer_key = r.customer_key
GROUP BY
       d.gender;
--Insight: Female customers generated slightly higher total sales than male customers, while a small portion of sales came from customers with unknown gender.

--2. Country-wise average order value
SELECT
       d.country,
       AVG(r.avg_order_value) AS avg_order_value
FROM
       dcustomers d
       JOIN rcustomers r ON d.customer_key = r.customer_key
GROUP BY
       d.country
ORDER BY
       AVG(r.avg_order_value) DESC;
--Insight: Australia recorded the highest average order value, while entries marked as 'n/a' had the lowest, indicating possible data quality issues.

--3. Marital status vs. total quantity purchased
SELECT
       d.marital_status,
       SUM(r.total_quantity) AS total_quantity
FROM
       dcustomers d
       JOIN rcustomers r ON d.customer_key = r.customer_key
GROUP BY
       d.marital_status;
--Insight: Married customers purchased a higher total quantity of products compared to single customers, suggesting stronger purchase behavior.

--4. Lifespan comparison by gender
SELECT
       d.gender,
       AVG(r.lifespan) AS avg_lifespan
FROM
       dcustomers d
       JOIN rcustomers r ON d.customer_key = r.customer_key
GROUP BY
       d.gender;
--Insight: Both male and female customers have an average customer lifespan of 3 years, while unknown gender entries show a slightly lower lifespan.

--5. Country-wise average monthly spend
SELECT
       d.country,
       AVG(r.avg_monthly_spend) AS avg_monthly_spend
FROM
       dcustomers d
       JOIN rcustomers r ON d.customer_key = r.customer_key
GROUP BY
       d.country
ORDER BY
       avg_monthly_spend ASC;
--Insight: Canada and the United States lead in average monthly spend, while 'n/a' entries report the highest value, likely due to incomplete or misclassified data.