{{ config(
    materialized = 'incremental',
    format = 'delta'
) }}
with codes as (
    select location_key,
           country_code,
           country_name,
           subregion1_name,
           subregion2_name,
           locality_name
    from {{ source('covid_source', 'covid19_codes_2') }}
)

select * from codes