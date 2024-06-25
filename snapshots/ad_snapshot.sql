{% snapshot ads_snapshot %}

{{
    config(
      target_database='asia_cup',
      target_schema='snapshots',
      unique_key='ad_id',

      strategy='timestamp',
      updated_at='updated_at',
    )
}}

select * from {{ source('ad_platform', 'RAW_AD_PLATFORM') }}

{% endsnapshot %}