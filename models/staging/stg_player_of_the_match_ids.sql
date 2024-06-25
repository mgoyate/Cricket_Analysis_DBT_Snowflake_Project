WITH source_data AS (
    SELECT
        *
    FROM
        {{ ref('player_of_the_match_ids') }}
)

-- Select from the source CTE
SELECT
    *
FROM
    source_data

