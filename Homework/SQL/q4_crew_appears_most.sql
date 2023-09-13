SELECT
    people.name, COUNT(*) AS count 
FROM 
    crew 
JOIN people ON crew.person_id = people.person_id
GROUP BY
    people.name 
ORDER BY
    count DESC
LIMIT 20;