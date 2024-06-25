{{ config(
    materialized='incremental',
    unique_key = 'incremental_id'
) }}

-- Define the source CTE
with source as (
    select
        Team,
        Opponent,
        Format,
        Ground,
        Year,
        Toss,
        Selection,
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
        Highest_Individual_Wicket,
        Player_Of_The_Match,
        Result,
        created_at
    from asia_cup.RAW.asia_cup
),

-- Define the renamed CTE
renamed as (
    select
        ROW_NUMBER() OVER (ORDER BY (SELECT 1)) AS incremental_id ,
        CEIL(ROW_NUMBER() OVER (ORDER BY (SELECT 1)) / 2.0) AS match_id,
        DENSE_RANK()OVER(ORDER BY(Team)) as Team_id,
        DENSE_RANK()OVER(ORDER BY(Ground)) as ground_id,
        DENSE_RANK()OVER(ORDER BY(Player_Of_The_Match)) as Player_Of_The_Match_id,
        Team,
        Opponent,
        Format,
        Ground,
        Year,
        CASE WHEN UPPER(Toss) = 'WIN' THEN 'Win' ELSE Toss END AS Toss,
        Selection,
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
        Highest_Individual_Wicket,
        Player_Of_The_Match,
        CASE 
            WHEN UPPER(Result) = 'WIN' THEN 'Win'
            WHEN UPPER(Result) = ' WIN D/L' THEN 'Win'
            WHEN TRIM(UPPER(Result)) = 'LOSE D/L' THEN 'Lose'
            ELSE Result
        END AS Result,
        created_at
    from source
)

-- Select from the renamed CTE with a condition to filter out records with any NULL values
select *
from renamed
where Run_Scored IS NOT NULL
  and Team IS NOT NULL
  and Opponent IS NOT NULL
  and Format IS NOT NULL
  and Ground IS NOT NULL
  and Year IS NOT NULL
  and Toss IS NOT NULL
  and Selection IS NOT NULL
  and Wicket_Lost IS NOT NULL
  and Fours IS NOT NULL
  and Sixes IS NOT NULL
  and Extras IS NOT NULL
  and Run_Rate IS NOT NULL
  and Avg_Bat_Strike_Rate IS NOT NULL
  and Highest_Score IS NOT NULL
  and Wicket_Taken IS NOT NULL
  and Given_Extras IS NOT NULL
  and Highest_Individual_Wicket IS NOT NULL
  and Player_Of_The_Match IS NOT NULL
  and Result IS NOT NULL
ORDER BY match_id ASC