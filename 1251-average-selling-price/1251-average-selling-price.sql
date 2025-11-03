-- Write your MySQL query statement below
WITH a AS (
    SELECT 
        p.product_id,
        p.price,
        p.start_date,
        p.end_date,
        u.purchase_date,
        IFNULL(u.units, 0) AS units,
        p.price * IFNULL(u.units, 0) AS total_price
    FROM Prices AS p
    LEFT JOIN UnitsSold AS u
        ON p.product_id = u.product_id
        AND u.purchase_date BETWEEN p.start_date AND p.end_date
),
b AS (
    SELECT 
        product_id,
        SUM(total_price) AS total_price,
        SUM(units) AS units
    FROM a
    GROUP BY product_id
)
SELECT 
    product_id,
    CASE 
        WHEN units = 0 THEN 0 
        ELSE ROUND(total_price / units, 2) 
    END AS average_price
FROM b;
