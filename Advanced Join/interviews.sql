SELECT
    *
FROM
    (
        SELECT
            ct.contest_id,
            ct.hacker_id,
            ct.name,
            SUM(ss.sum_total_submissions) ts,
            SUM(ss.sum_total_accepted_submissions) tas,
            SUM(vs.sum_total_views) tv,
            SUM(vs.sum_total_unique_views) tuv
        FROM
            contests ct
            LEFT JOIN colleges cl ON ct.contest_id = cl.contest_id
            JOIN challenges ch ON cl.college_id = ch.college_id
            LEFT JOIN (
                SELECT
                    challenge_id,
                    SUM(total_views) sum_total_views,
                    SUM(total_unique_views) sum_total_unique_views
                FROM
                    view_stats
                GROUP BY
                    challenge_id
            ) vs ON ch.challenge_id = vs.challenge_id
            LEFT JOIN (
                SELECT
                    challenge_id,
                    SUM(total_submissions) sum_total_submissions,
                    SUM(total_accepted_submissions) sum_total_accepted_submissions
                FROM
                    submission_stats
                GROUP BY
                    challenge_id
            ) ss ON ch.challenge_id = ss.challenge_id
        GROUP BY
            ct.contest_id,
            ct.hacker_id,
            ct.name
    ) a
WHERE
    a.ts + a.tas + a.tv + a.tuv <> 0
ORDER BY
    a.contest_id;
