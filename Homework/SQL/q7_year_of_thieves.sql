SELECT
    COUNT(title_id) as tot
FROM
    titles
WHERE
    premiered = (
        SELECT
            premiered
        FROM
            titles
        WHERE
            primary_title LIKE 'Army of Thieves'
    )
