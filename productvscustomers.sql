USE edaproject;

--1. Product Line vs Customer Spend
SELECT
       dp.product_line,
       AVG(rc.avg_monthly_spend) AS avg_spend
FROM
       dproducts dp
       CROSS JOIN rcustomers rc
GROUP BY
       dp.product_line;
--Insight: All product lines show identical average customer spend, suggesting either a uniform pricing strategy or possible data aggregation issues including entries marked as 'n/a'.

--2. Lifespan: Products & Customers
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
--Insight: The majority of customer-product pairings occur at a shared lifespan of 11–12 months, suggesting typical engagement and purchase cycles, with fewer long-term pairings beyond 20 months.

--3. Customer Gender vs Product Subcategory Revenue
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
--Insight: Revenue across product subcategories remains consistent regardless of customer gender, suggesting that product pricing and engagement are uniform across all demographics.

--4. Customer Segment vs Most Common Product Segment
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
--Insight: New customers most frequently purchase High-Performer and Mid-Range products, while VIP and Regular segments also show strong overlap with premium categories, highlighting their preference for quality.

--5. Customer Age Group vs Product Subcategory Preference
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
--Insight: Customers aged 50 and above show a strong preference for Road Bikes, contributing significantly to the total sales in that subcategory.