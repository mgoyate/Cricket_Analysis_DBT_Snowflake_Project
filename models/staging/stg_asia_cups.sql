WITH source_data AS (
    SELECT
        ac.match_id,
        ac.Team,
        ac.Opponent,
        ti.Team_id,  -- Using Team_id from team_ids table
        ac.ground_id,
        ac.Ground,
        ac.Format,
        ac.Toss,
        ac.Selection,
        ac.Result,
        ac.Player_Of_The_Match_id,
        ac.Player_Of_The_Match,
        ac.Year,
        ac.Run_Scored,
        ac.Wicket_Lost,
        ac.Fours,
        ac.Sixes,
        ac.Extras,
        ac.Run_Rate,
        ac.Avg_Bat_Strike_Rate,
        ac.Highest_Score,
        ac.Wicket_Taken,
        ac.Given_Extras,
        ac.Highest_Individual_Wicket
    FROM
        {{ ref('Asia_cups') }} ac
    JOIN
        {{ ref('Team_ids') }} ti ON ac.Team = ti.Team
)

-- Select from the source CTE
SELECT
    match_id,
    Team,
    Opponent,
    Format,
    Team_id,
    ground_id,
    Ground,
    Toss,
    Selection,
    Result,
    Player_Of_The_Match_id,
    Player_Of_The_Match,
    Year,
    Run_Scored,
    Wicket_Lost,
    Fours,
    Sixes,
    Extras,
    Run_Rate,
    Avg_Bat_Strike_Rate,
    Highest_Score,
    Wicket_Taken,
    Given_Extras,
    Highest_Individual_Wicket
FROM
    source_data
