
{{ config(
    materialized='table'
) }}

-- Create a table with player_names and country from all seven tables and assign unique player_id
with merged_player_info as (
    select Player_Name, Country
    from (
        select Player_Name, Country from ASIA_CUP.RAW.batsman_data_odi
        union all
        select Player_Name, Country from ASIA_CUP.RAW.batsman_data_t20i
        union all
        select Player_Name, Country from ASIA_CUP.RAW.bowler_data_odi
        union all
        select Player_Name, Country from ASIA_CUP.RAW.bowler_data_t20i
        union all
        select Player_Name, Country from ASIA_CUP.RAW.wicketkeeper_data_odi
        union all
        select Player_Name, Country from ASIA_CUP.RAW.wicketkeeper_data_t20i
    )
)

-- Select distinct player_names, country, and assign unique player_id
select
    row_number() over (order by Player_Name,country) as player_id,
    Player_Name,
    Country
from (
    select distinct Player_Name, Country
    from merged_player_info
) as merged_player_names
