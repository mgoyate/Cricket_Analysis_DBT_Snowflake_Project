-- Select player names and corresponding IDs from the staging table
with Team_ids as (
    select
        Team,
        Team_id
    from
        {{ ref('stg_team_ids') }}
)

-- Update the bowlers_odi table with player IDs
select
    odi.*,
    ids.Team_id
from
    {{ ref('stg_bowlers_odi') }} odi
left join
    Team_ids ids
on
    odi.Country = ids.Team
