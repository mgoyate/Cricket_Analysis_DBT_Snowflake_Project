WITH source_data AS (
    SELECT
        *
    FROM
        {{ ref('Team_ids')}}
)

-- Select from the source CTE
SELECT
    *
FROM
    source_data
