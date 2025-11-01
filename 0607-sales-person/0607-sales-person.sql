-- Write your MySQL query statement below
WITH red_com AS (
    SELECT 
        o.sales_id AS red_sales, 
        o.com_id AS red_com_id
    FROM Orders AS o
    LEFT JOIN Company AS c 
        ON o.com_id = c.com_id
    WHERE c.name = 'RED'
)
SELECT 
    s.name
FROM SalesPerson AS s
WHERE s.sales_id NOT IN (
    SELECT red_sales 
    FROM red_com
)
