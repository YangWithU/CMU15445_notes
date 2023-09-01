select
    name,
    CASE
        WHEN died NOT NULL THEN died - born
        ELSE 2022 - born
    END

FROM people
WHERE born >= 1900
ORDER BY
    CASE
        WHEN died NOT NULL THEN died - born
        ELSE 2022 - born
    END
DESC LIMIT 1;
