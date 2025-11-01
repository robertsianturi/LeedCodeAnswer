# Write your MySQL query statement below
with 
single_num as 
(
    select distinct num, count(num) count_num from MyNumbers 
    group by 1
)
select max(num) num from single_num
where count_num = 1