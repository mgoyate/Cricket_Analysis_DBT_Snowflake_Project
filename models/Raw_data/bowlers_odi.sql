-- models/bowler_data_t20i.sql

{{ config(
    materialized='incremental',
    unique_key = 'incremental_id'
) }}

-- Define the source CTE
with source as (
    select
        Player_Name,
        Country,
        Time_Period,
        Matches,
        Played,
        Overs,
        Maiden_Overs,
        Runs,
        Wickets,
        Best_Figure,
        Bowling_Average,
        Economy_Rate,
        Strike_Rate,
        Four_Wickets,
        Five_Wickets,
        created_at
    from ASIA_CUP.RAW.bowler_data_odi
),

-- Define the transformed CTE
transformed_data as (
    select
        ROW_NUMBER() OVER (ORDER BY (SELECT 1)) AS incremental_id ,
        Player_Name,
        Country,
        Time_Period,
        Matches,
        Played,
        Overs,
        Maiden_Overs,
        Runs,
        Wickets,
        {{ transform_best_figure('Best_Figure') }},
        Bowling_Average,
        Economy_Rate,
        Strike_Rate,
        Four_Wickets,
        Five_Wickets,
        created_at
    from source
)

-- Select from the transformed CTE
select * from transformed_data
