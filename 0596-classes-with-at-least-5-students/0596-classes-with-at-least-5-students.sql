# Write your MySQL query statement below
select class
from (
    select class,
    count(student) as student
    from Courses 
    group by 1
) a
where student >= 5