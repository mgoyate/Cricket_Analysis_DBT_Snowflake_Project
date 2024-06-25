WITH distinct_ground AS (
    SELECT DISTINCT ground
    FROM 
         ASIA_CUP.RAW.asia_cup
)

SELECT
    ROW_NUMBER() OVER (ORDER BY ground) AS ground_id,
    ground
FROM distinct_ground
