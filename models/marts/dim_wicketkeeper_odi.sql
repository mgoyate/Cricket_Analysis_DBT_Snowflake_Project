-- Select team names and corresponding IDs from the staging table
with Team_ids as (
    select
        Team,
        Team_id
    from
        {{ ref('stg_team_ids') }}
)

-- Update the wicketkeeper_odi table with team IDs
select
    odi.*,
    ids.Team_id
from
    {{ ref('stg_wicketkeeper_odi') }} odi
left join
    Team_ids ids
on
    odi.Country = ids.Team
