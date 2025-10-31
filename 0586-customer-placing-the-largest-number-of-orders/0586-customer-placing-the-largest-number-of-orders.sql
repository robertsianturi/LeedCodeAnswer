# Write your MySQL query statement below
Select
    customer_number
from (
    select 
        customer_number,
        count(order_number) total_order
    from Orders
    group by 1
) a
order by total_order desc
limit 1

