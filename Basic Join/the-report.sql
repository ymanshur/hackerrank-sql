SELECT
    (
        CASE
            WHEN g.grade < 8 THEN "NULL"
            ELSE s.name
        END
    ),
    g.grade,
    s.marks
FROM
    students s
    JOIN grades g ON s.marks >= g.min_mark
    AND s.marks <= g.max_mark
ORDER BY
    g.grade DESC,
    s.name ASC;
