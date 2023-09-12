SELECT
    CAST(premiered / 100 AS TEXT) || 's' AS time,
    ROUND(AVG(rating), 2) AS avg_rating,
    MAX(rating) AS mx_rating,
    MIN(rating) AS mn_rating,
    COUNT(*) AS tot
FROM
    titles
INNER JOIN ratings
    ON ratings.title_id = titles.title_id
WHERE premiered NOT NULL
GROUP BY time
ORDER BY avg_rating DESC, time ASC;
