SELECT
    N,
    CASE
        WHEN P IS NULL THEN "Root"
        WHEN N IN (
            SELECT
                P
            FROM
                BST
        ) THEN "Inner"
        ELSE "Leaf"
    END type
FROM
    BST
ORDER BY
    N ASC;
