-- Define the source CTE
WITH source_data AS (
    SELECT
        *
    FROM
        {{ ref('stg_champion')}}
)

-- Select from the source CTE
SELECT
    *
FROM
    source_data
