
  
    

    create table "hive"."public"."int_codes"
      
      
    as (
      with codes_1 as (
    select location_key,
           country_code,
           country_name,
           subregion1_name,
           subregion2_name,
           locality_name
    from "covid"."default"."covid19_codes_1"
),
codes_2 as (
    select location_key,
           country_code,
           country_name,
           subregion1_name,
           subregion2_name,
           locality_name
    from "covid"."default"."covid19_codes_2"
),
codes_3 as (
    select location_key,
           country_code,
           country_name,
           subregion1_name,
           subregion2_name,
           locality_name
    from "covid"."default"."covid19_codes_3"
)

select * from codes_1
union all
select * from codes_2
union all
select * from codes_3
    );

  