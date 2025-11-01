-- Write your MySQL query statement below
WITH product_status AS (
    SELECT 
        product_id,
        CASE 
            WHEN sale_date BETWEEN DATE('2019-01-01') AND DATE('2019-03-31') 
                THEN 'Yes'
            ELSE 'No' 
        END AS in_spring 
    FROM Sales
),

product_in_spring AS (
    SELECT 
        * 
    FROM product_status 
    WHERE in_spring = 'No'
)

SELECT 
    p.product_id,
    p.product_name
FROM Product AS p
WHERE p.product_id NOT IN (
        SELECT product_id 
        FROM product_in_spring
    )
    AND p.product_id IN (
        SELECT product_id 
        FROM Sales
    );
