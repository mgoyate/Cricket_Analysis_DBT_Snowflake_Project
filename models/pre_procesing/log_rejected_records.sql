WITH rejected_records AS (
    SELECT
        Team,
        Opponent,
        Format,
        Ground,
        Year,
        Run_Scored,
        Fours,
        Sixes,
        Extras,
        (Fours * 4 + Sixes * 6 + Extras) AS calculated_score
    FROM ASIA_CUP.RAW.asia_cup
)
SELECT
    Team,
    Opponent,
    Format,
    Ground,
    Year,
    Run_Scored,
    Fours,
    Sixes,
    Extras,
    calculated_score,
    'Rejected record found' AS log_message
FROM rejected_records r
WHERE Run_Scored < calculated_score
