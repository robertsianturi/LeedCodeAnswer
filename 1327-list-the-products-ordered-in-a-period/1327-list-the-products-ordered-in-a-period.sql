-- Write your MySQL query statement below
SELECT 
    p.product_name, 
    so.unit
FROM Products AS p
LEFT JOIN (
    SELECT 
        product_id,
        SUM(unit) AS unit
    FROM Orders
    WHERE order_date >= '2020-02-01' 
      AND order_date < '2020-03-01'
    GROUP BY product_id
) AS so
    ON p.product_id = so.product_id
WHERE so.unit >= 100;
