SELECT DISTINCT
    stg_player_ids.*,
    dim_batsmans_t20.team_id as country_id
FROM
    {{ ref('stg_player_ids') }} stg_player_ids
LEFT JOIN
    {{ ref('dim_batsmans_t20') }} dim_batsmans_t20
ON
    stg_player_ids.country = dim_batsmans_t20.country
