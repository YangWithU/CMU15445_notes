CREATE TABLE q5_results (
    year TEXT,
    y_num INTEGER,
    avg_rating DOUBLE,
    mx_rating DOUBLE,
    mn_rating DOUBLE,
    cnt_movies BIGINT,
);

INSERT INTO q5_results(year, y_num, avg_rating, mx_rating, mn_rating, cnt_movies)
VALUES('1890s|', 1890, a_r, mx_r, mn_r, cnt_r);

SELECT
    '1890s|' || ROUND(AVG(rating), 2) AS a_r, MAX(rating) AS mx_r, MIN(rating) AS mn_r, COUNT(ratings.title_id) AS cnt_r
FROM
    ratings, titles
WHERE
    titles.premiered <= 1890



-- INSERT INTO q5_results('1990s|', 1990, AVG(rating), MAX(rating), MIN(rating), COUNT(ratings.title_id))
-- SELECT
--     '1990s|' || AVG(rating), MAX(rating), MIN(rating), COUNT(ratings.title_id)
-- FROM
--     ratings, titles
-- WHERE
--     titles.premiered <= 1990


-- INSERT INTO q5_results('2090s|', 2090, AVG(rating), MAX(rating), MIN(rating), COUNT(ratings.title_id))
-- SELECT
--     '2090s|' || AVG(rating), MAX(rating), MIN(rating), COUNT(ratings.title_id)
-- FROM
--     ratings, titles
-- WHERE
--     titles.premiered <= 2090


SELECT *
FROM q5_results
ORDER BY avg_rating DESC, y_num ASC;


-- HAVING
--     cnt_gpa >= 3.9
-- 1.average rating(.2f)
-- 2. top rating
-- 3. min rating
-- 4.