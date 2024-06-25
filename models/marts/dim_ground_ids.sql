-- Define the source CTE
WITH source_data AS (
    SELECT
        *
    FROM
        {{ ref('stg_ground_ids')}}
)

-- Select from the source CTE
SELECT
    *
FROM
    source_data
