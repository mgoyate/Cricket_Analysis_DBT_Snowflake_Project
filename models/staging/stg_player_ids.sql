-- Define the source CTE
WITH source_data AS (
    SELECT
        *
    FROM
        {{ ref('player_ids') }}
)

-- Select from the source CTE
SELECT
    *
FROM
    source_data
