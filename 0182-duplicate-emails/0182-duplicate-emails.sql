# Write your MySQL query statement below
with 
duplicates as 
(
    select 
        email, 
        count(email) as dups 
    from Person
    group by 1
),

list_email as 
(
    select email as list_email from duplicates
    where dups > 1
)

select distinct email as Email from Person
left join list_email on Person.email = list_email.list_email
where Person.email = list_email.list_email