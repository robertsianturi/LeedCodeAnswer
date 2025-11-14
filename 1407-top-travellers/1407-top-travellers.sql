-- Write your MySQL query statement below
SELECT 
    name,
    travelled_distance
FROM (
    SELECT 
        u.id,
        u.name,
        SUM(COALESCE(r.distance, 0)) AS travelled_distance
    FROM Users AS u
    LEFT JOIN Rides AS r
        ON u.id = r.user_id
    GROUP BY 
        u.id,
        u.name
) AS table_summary
ORDER BY 
    travelled_distance DESC,
    name ASC;
