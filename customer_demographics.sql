USE edaproject;

--Customer Demographics (Univariate EDA)

--1.Count of customers by gender
SELECT
    gender,
    COUNT(*) AS customer_count
FROM dcustomers
WHERE gender IN ('Male', 'Female')  
GROUP BY gender;
--Insight: The customer base is nearly balanced by gender, with a slightly higher number of male customers than female.

--2.Distribution of marital status
SELECT
       marital_status,
       COUNT(*) AS count
FROM
       dcustomers
GROUP BY
       marital_status;
--Insight: Married customers make up a slightly larger portion of the customer base compared to single customers.

--3.Number of customers by country
SELECT
       country,
       COUNT(*) AS customers
FROM
       dcustomers
GROUP BY
       country
ORDER BY
       customers DESC;
--Insight: The United States has the largest customer base, while a small number of records with 'n/a' country values may indicate data entry issues.

--4.Top 5 countries with most customers
SELECT
       TOP 5 country,
       COUNT(*) AS customers
FROM
       dcustomers
GROUP BY
       country
ORDER BY
       customers DESC;
--Insight: The majority of customers are concentrated in the United States, followed by Australia and the United Kingdom, reflecting key target markets.

--5.Count of customers by year of account creation
SELECT
       YEAR(create_date) AS year,
       COUNT(*) AS customer_count
FROM
       dcustomers
GROUP BY
       YEAR(create_date)
ORDER BY
       year;
--Insight: A significant majority of customers created their accounts in 2026, indicating recent growth in user acquisition.