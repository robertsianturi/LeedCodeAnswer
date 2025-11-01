-- Write your MySQL query statement below
SELECT 
    actor_id, 
    director_id
FROM (
    SELECT 
        actor_id, 
        director_id,
        COUNT(`timestamp`) AS total_cooperate
    FROM ActorDirector
    GROUP BY 
        actor_id, 
        director_id
) AS a
WHERE 
    total_cooperate >= 3;
