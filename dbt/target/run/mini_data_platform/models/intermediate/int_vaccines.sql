
  create or replace view
    "hive"."public"."int_vaccines"
  security definer
  as
    select v.*,
       c.country_code,
       c.country_name,
       c.subregion1_name,
       c.subregion2_name,
       c.locality_name
from "hive"."public"."stg_vaccines" v
join "hive"."public"."int_codes" c on v.location_key = c.location_key
  ;
