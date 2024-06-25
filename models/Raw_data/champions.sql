{{ config(
    materialized='incremental',
    unique_key = 'incremental_id'
) }}

-- Define the source CTE
with source as (
    select
        Year,
        Host,
        No_Of_Team,
        Champion,
        Runner_Up,
        Player_Of_The_Series,
        Highest_Run_Scorer,
        Highest_Wicket_Taker,
        created_at

    from ASIA_CUP.RAW.champion
),

-- Define the renamed CTE
renamed as (
    select
        ROW_NUMBER() OVER (ORDER BY (SELECT 1)) AS incremental_id ,
        Year,
        Host,
        No_Of_Team,
        Champion,
        Runner_Up,
        Player_Of_The_Series,
        Highest_Run_Scorer,
        Highest_Wicket_Taker,
        created_at

    from source
)

-- Select from the renamed CTE
select * from renamed
