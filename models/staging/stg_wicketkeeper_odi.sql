with player_ids as (
    select
        Player_Name,
        player_id,
        Country
    from
        {{ ref('player_ids') }}
)

-- Update the wicketkeepers_odi table with player IDs
select
    odi.*,
    ids.player_id
from
    {{ ref('wicketkeepers_odi') }} odi
left join
    player_ids ids
on
    odi.Player_Name = ids.Player_Name
    and odi.Country = ids.Country
