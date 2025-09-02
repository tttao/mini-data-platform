
  create or replace view
    "hive"."public"."stg_codes_1"
  security definer
  as
    with codes as (
    select location_key,
           country_code,
           country_name,
           subregion1_name,
           subregion2_name,
           locality_name
    from "covid"."default"."covid19_codes_1"
)

select * from codes
  ;
