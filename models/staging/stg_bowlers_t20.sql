with player_ids as (
    select
        Player_Name,
        player_id,
        Country
    from
        {{ ref('player_ids') }}
)

-- Update the bowlers_t20 table with player IDs
select
    t20.*,
    ids.player_id
from
    {{ ref('bowlers_t20') }} t20
left join
    player_ids ids
on
    t20.Player_Name = ids.Player_Name
    and t20.Country = ids.Country