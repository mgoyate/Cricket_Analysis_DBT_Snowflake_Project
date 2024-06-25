-- Select team names and corresponding IDs from the staging table
with Team_ids as (
    select
        Team,
        Team_id
    from
        {{ ref('stg_team_ids') }}
)

-- Update the stg_batsmans_odi table with team IDs
select
    t20.*,
    ids.Team_id
from
    {{ ref('stg_batsmans_T20') }} t20
left join
    Team_ids ids
on
    t20.Country = ids.Team
