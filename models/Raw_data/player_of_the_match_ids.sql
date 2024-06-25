WITH distinct_player_of_the_match AS (
    SELECT DISTINCT player_of_the_match
    FROM {{ ref('Asia_cups') }}
)

SELECT
    ROW_NUMBER() OVER (ORDER BY Player_Of_The_Match) AS player_of_the_match_id,
    player_of_the_match
FROM distinct_player_of_the_match

