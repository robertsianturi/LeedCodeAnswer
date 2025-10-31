# Write your MySQL query statement below
SELECT 
    w2.id
from Weather w1
left join Weather w2 
    on W1.recordDate = w2.recordDate - INTERVAL 1 DAY
where w2.temperature > w1.temperature