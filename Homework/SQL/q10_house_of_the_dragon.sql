WITH
    get_title AS (
        SELECT
            titles.primary_title AS pm_title,
            akas.title AS ak_title
        FROM
            titles
            INNER JOIN akas ON titles.title_id = akas.title_id
        WHERE
            pm_title = 'House of the Dragon'
            AND titles.type = 'tvSeries'
        GROUP BY
            pm_title,
            ak_title
        ORDER BY
            ak_title
    ),
    mark_number AS (
        SELECT
            ROW_NUMBER() OVER (
                ORDER BY
                    get_title.pm_title ASC
            ) AS num_seq,
            get_title.ak_title AS ak_title
        FROM
            get_title
    ),
    RECURSIVE dfs_concatenate As (
        SELECT
            num_seq,
            ak_title
        FROM
            mark_number
        WHERE
            num_seq = 1
        UNION ALL
        SELECT
            mark_number.num_seq,
            cur.ak_title || ',' || mark_number.ak_title
        FROM
            mark_number
            JOIN dfs_concatenate cur ON mark_number.num_seq = cur.num_seq + 1
    )
SELECT
    *
FROM
    dfs_concatenate
ORDER BY
    num_seq;