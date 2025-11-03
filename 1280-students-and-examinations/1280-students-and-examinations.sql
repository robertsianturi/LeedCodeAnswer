-- Write your MySQL query statement below
WITH cross_data AS (
    SELECT 
        st.*,
        su.*
    FROM Students AS st
    CROSS JOIN Subjects AS su
)
SELECT 
    cd.student_id,
    cd.student_name,
    cd.subject_name,
    SUM(
        CASE 
            WHEN ex.subject_name IS NULL THEN 0 
            ELSE 1 
        END
    ) AS attended_exams
FROM cross_data AS cd
LEFT JOIN Examinations AS ex 
    ON cd.student_id = ex.student_id
    AND cd.subject_name = ex.subject_name
GROUP BY 
    cd.student_id,
    cd.student_name,
    cd.subject_name
ORDER BY 
    cd.student_id ASC,
    cd.subject_name ASC;
