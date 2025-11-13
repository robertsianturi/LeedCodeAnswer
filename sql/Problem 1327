# Write your MySQL query statement below
select p.product_name, t1.unit
from products p
join
(select product_id, order_date, sum(unit) as unit
from orders
where DATE_FORMAT(order_date, '%Y-%m') like '2020-02%'
group by product_id
having sum(unit) >= 100
order by product_id) t1
on p.product_id = t1.product_id
