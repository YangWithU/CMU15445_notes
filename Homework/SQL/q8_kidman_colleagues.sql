WITH Nicole_title_id AS (
    SELECT
        DISTINCT(crew.title_id)
    FROM
        people
        INNER JOIN crew ON crew.person_id = people.person_id
        AND people.name = 'Nicole Kidman'
        AND people.born = 1967
),
kidman_colleague_id AS (
    SELECT
        DISTINCT(crew.person_id) AS p_id
    FROM
        crew
    WHERE
        title_id IN Nicole_title_id
        AND (
            category = 'actor'
            OR category = 'actress'
        )
)
SELECT
    name
FROM
    people
    INNER JOIN kidman_colleague_id ON kidman_colleague_id.p_id = people.person_id
ORDER BY
    name ASC;