USE edaproject;

-- Standardize gender values
UPDATE
    dcustomers
SET
    gender = CASE
        WHEN gender IN ('M', 'MALE', 'male') THEN 'Male'
        WHEN gender IN ('F', 'FEMALE', 'female') THEN 'Female'
        ELSE 'Unknown'
    END;

-- Trim whitespace in text columns
UPDATE
    dcustomers
SET
    first_name = LTRIM(RTRIM(first_name)),
    last_name = LTRIM(RTRIM(last_name)),
    gender = LTRIM(RTRIM(gender)),
    country = LTRIM(RTRIM(country)),
    marital_status = LTRIM(RTRIM(marital_status));

-- Trim whitespace
UPDATE
    rcustomers
SET
    customer_segment = LTRIM(RTRIM(customer_segment));

-- Remove unrealistic ages
DELETE FROM
    rcustomers
WHERE
    age < 0
    OR age > 120;

UPDATE
    dproducts
SET
    category = LTRIM(RTRIM(category)),
    subcategory = LTRIM(RTRIM(subcategory)),
    product_line = LTRIM(RTRIM(product_line));

-- Remove invalid negative values
DELETE FROM
    rproducts
WHERE
    total_sales < 0
    OR cost < 0;

-- See what remains as 'Unknown'
SELECT
    gender,
    COUNT(*)
FROM
    dcustomers
GROUP BY
    gender;

SELECT
    customer_segment,
    COUNT(*)
FROM
    rcustomers
GROUP BY
    customer_segment;