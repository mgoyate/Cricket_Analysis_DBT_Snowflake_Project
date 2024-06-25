with Team_ids as (
    select
        Team,
        Team_id
    from
        {{ ref('stg_team_ids') }}
)


select
    odi.*,
    ids.Team_id
from
    {{ ref('stg_batsmans_odi') }} odi
left join
    Team_ids ids
on
    odi.Country = ids.Team
