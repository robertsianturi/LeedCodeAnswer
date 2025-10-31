# Write your MySQL query statement below
# 175. Combine Two Tables
# Link: https://leetcode.com/problems/combine-two-tables/description/

SELECT 
    Person.firstName,
    Person.lastName,
    Address.city,
    Address.state
FROM Person
LEFT JOIN Address 
    ON Person.personId = Address.personID
