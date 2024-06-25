WITH P AS (
    -- Common Table Expression (CTE) to collect players' information
    SELECT
        Player_Name,
        TRY_CAST(SPLIT_PART(Time_Period, ' - ', 1) AS INT) AS Year,
        Country AS Team
    FROM ASIA_CUP.RAW.batsman_data_odi
    UNION ALL
    SELECT
        Player_Name,
        TRY_CAST(SPLIT_PART(Time_Period, ' - ', 1) AS INT) AS Year,
        Country AS Team
    FROM ASIA_CUP.RAW.batsman_data_t20i

    -- Bowlers
    UNION ALL
    SELECT
        Player_Name,
        TRY_CAST(SPLIT_PART(Time_Period, ' - ', 1) AS INT) AS Year,
        Country AS Team
    FROM ASIA_CUP.RAW.bowler_data_t20i
    UNION ALL
    SELECT
        Player_Name,
        TRY_CAST(SPLIT_PART(Time_Period, ' - ', 1) AS INT) AS Year,
        Country AS Team
    FROM ASIA_CUP.RAW.bowler_data_odi

    -- Wicket-keepers
    UNION ALL
    SELECT
        Player_Name,
        TRY_CAST(SPLIT_PART(Time_Period, ' - ', 1) AS INT) AS Year,
        Country AS Team
    FROM ASIA_CUP.RAW.wicketkeeper_data_t20i
    UNION ALL
    SELECT
        Player_Name,
        TRY_CAST(SPLIT_PART(Time_Period, ' - ', 1) AS INT) AS Year,
        Country AS Team
    FROM ASIA_CUP.RAW.wicketkeeper_data_odi
)

-- Common Table Expression (CTE) to calculate the year range for each team in the Asia Cup
, team_year_range AS (
    SELECT
        Team,
        MIN(Year) AS min_year,
        MAX(Year) AS max_year
    FROM ASIA_CUP.RAW.asia_cup
    GROUP BY Team
)

-- Verify the time range of players - Batsmen, Bowlers, and Wicket-keepers
SELECT
    P.Player_Name,
    P.Year AS Player_Start_Year,
    P.Team,
    T.min_year AS team_min_year,
    T.max_year AS team_max_year
FROM P
JOIN team_year_range T ON P.Team = T.Team
WHERE
    P.Year >= T.min_year
    AND P.Year <= T.max_year
    AND P.Year >= T.min_year
