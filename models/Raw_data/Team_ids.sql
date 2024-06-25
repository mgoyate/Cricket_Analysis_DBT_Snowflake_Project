SELECT ROW_NUMBER() OVER (ORDER BY team) AS team_id, team
FROM (
    SELECT DISTINCT team FROM ASIA_CUP.RAW.asia_cup
    UNION
    SELECT DISTINCT country AS team FROM ASIA_CUP.RAW.batsman_data_odi
    UNION
    SELECT DISTINCT country AS team FROM ASIA_CUP.RAW.batsman_data_t20i
    UNION
    SELECT DISTINCT country AS team FROM ASIA_CUP.RAW.bowler_data_odi
    UNION
    SELECT DISTINCT country AS team FROM ASIA_CUP.RAW.bowler_data_t20i
    UNION
    SELECT DISTINCT country AS team FROM ASIA_CUP.RAW.wicketkeeper_data_odi
    UNION
    SELECT DISTINCT country AS team FROM ASIA_CUP.RAW.wicketkeeper_data_t20i
) AS extra_countries
