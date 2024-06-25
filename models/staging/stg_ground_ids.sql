WITH source_data AS (
    SELECT
        *
    FROM
        {{ ref('ground_ids') }}
)

-- Select from the source CTE
SELECT
    *
FROM
    source_data

