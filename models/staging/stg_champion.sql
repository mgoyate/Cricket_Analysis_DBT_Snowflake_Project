SELECT DISTINCT
    champions.*,
    Team_ids.team_id as champion_id
FROM
    {{ ref('champions') }} champions
LEFT JOIN
    {{ ref('Team_ids') }} Team_ids
ON
    champions.champion = Team_ids.team
