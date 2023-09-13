SELECT
    primary_title,
    votes AS c_votes
FROM
    ratings
INNER JOIN titles
    ON titles.title_id = ratings.title_id
INNER JOIN crew
    ON crew.title_id = ratings.title_id
INNER JOIN people
    ON people.person_id = crew.person_id
WHERE
    people.name LIKE '%Cruise%'
    AND people.born = 1962
ORDER BY
    c_votes DESC
LIMIT 10;