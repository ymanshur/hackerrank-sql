-- SELECT * FROM functions WHERE (y, x) IN (SELECT * FROM functions) AND x < y UNION
-- SELECT * FROM functions WHERE x = y GROUP BY x, y HAVING COUNT(x) = 2
-- ORDER BY x;
-- SELECT DISTINCT f1.x, f1.y
-- FROM functions f1
--     JOIN functions f2 ON f1.x = f2.y AND f1.y = f2.x
-- WHERE
--     f1.x <= f1.y OR
--     (f1.x = f2.y AND f1.x IN (SELECT x FROM functions WHERE x = y GROUP BY x, y HAVING COUNT(x) > 1))
-- ORDER BY f1.x ASC;
SELECT DISTINCT
    f1.x,
    f1.y
FROM
    functions f1
    JOIN functions f2 ON f1.x = f2.y
    AND f1.y = f2.x
WHERE
    f1.x <= f1.y
GROUP BY
    f1.x,
    f1.y
HAVING
    COUNT(f1.x) > 1
    OR f1.x <> f1.y
ORDER BY
    f1.x ASC;
