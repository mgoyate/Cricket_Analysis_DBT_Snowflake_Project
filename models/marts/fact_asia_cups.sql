-- Define the source CTE
WITH source_data AS (
    SELECT
        *
    FROM
        {{ ref('stg_asia_cups')}}
)

-- Select from the source CTE
SELECT
    *
FROM
    source_data
