with 
a as 
(
    select id,
    email,
        RANK() over(partition by email order by id asc) as row_numbers
    from Person
)
delete Person.*
from Person
left join a 
    on Person.id = a.id
where row_numbers != 1