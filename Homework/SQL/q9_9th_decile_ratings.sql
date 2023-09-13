WITH born_1955 AS (
    SELECT
        people.name,
        crew.title_id,
        people.person_id
    FROM
        people
        INNER JOIN crew ON people.person_id = crew.person_id
        INNER JOIN titles ON titles.title_id = crew.title_id
    WHERE
        people.born = 1955
        AND titles.type = 'movie'
),
tot_1995_ratings AS (
    SELECT
        name,
        ROUND(AVG(rating), 2) AS r_1995
    FROM
        ratings
        INNER JOIN born_1955 ON ratings.title_id = born_1955.title_id
    GROUP BY
        born_1955.person_id
),
divided_piles AS (
    SELECT
        *, -- must include tot_1995_ratings.name
        NTILE(10) OVER (
            ORDER BY
                r_1995 ASC
        ) AS rating_piles
    FROM
        tot_1995_ratings
)
SELECT
    name,
    r_1995
FROM
    divided_piles
WHERE
    rating_piles = 9
ORDER BY
    r_1995 DESC,
    name ASC;