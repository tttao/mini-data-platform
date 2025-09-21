select v.*,
       c.country_code,
       c.country_name,
       c.subregion1_name,
       c.subregion2_name,
       c.locality_name
from {{ ref('stg_vaccines') }} v
join {{ ref('int_codes') }} c on v.location_key = c.location_key