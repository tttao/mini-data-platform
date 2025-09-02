
  create or replace view
    "hive"."public"."stg_vaccines"
  security definer
  as
    with vaccines as (
    select
        cast (date as date) date,
        location_key,
        cast (new_persons_vaccinated as BIGINT) new_persons_vaccinated,
        cast (cumulative_persons_vaccinated as BIGINT) cumulative_persons_vaccinated,
        cast (new_persons_fully_vaccinated as BIGINT) new_persons_fully_vaccinated,
        cast (cumulative_persons_fully_vaccinated as BIGINT) cumulative_persons_fully_vaccinated,
        cast (new_vaccine_doses_administered as BIGINT) new_vaccine_doses_administered,
        cast (cumulative_vaccine_doses_administered as BIGINT) cumulative_vaccine_doses_administered,
        cast (new_persons_vaccinated_pfizer as BIGINT) new_persons_vaccinated_pfizer,
        cast (cumulative_persons_vaccinated_pfizer as BIGINT) cumulative_persons_vaccinated_pfizer,
        cast (new_persons_fully_vaccinated_pfizer as BIGINT) new_persons_fully_vaccinated_pfizer,
        cast (cumulative_persons_fully_vaccinated_pfizer as BIGINT) cumulative_persons_fully_vaccinated_pfizer,
        cast (new_vaccine_doses_administered_pfizer as BIGINT) new_vaccine_doses_administered_pfizer,
        cast (cumulative_vaccine_doses_administered_pfizer as BIGINT) cumulative_vaccine_doses_administered_pfizer,
        cast (new_persons_vaccinated_moderna as BIGINT) new_persons_vaccinated_moderna,
        cast (cumulative_persons_vaccinated_moderna as BIGINT) cumulative_persons_vaccinated_moderna,
        cast (new_persons_fully_vaccinated_moderna as BIGINT) new_persons_fully_vaccinated_moderna,
        cast (cumulative_persons_fully_vaccinated_moderna as BIGINT) cumulative_persons_fully_vaccinated_moderna,
        cast (new_vaccine_doses_administered_moderna as BIGINT) new_vaccine_doses_administered_moderna,
        cast (cumulative_vaccine_doses_administered_moderna as BIGINT) cumulative_vaccine_doses_administered_moderna,
        cast (new_persons_vaccinated_janssen as BIGINT) new_persons_vaccinated_janssen,
        cast (cumulative_persons_vaccinated_janssen as BIGINT) cumulative_persons_vaccinated_janssen,
        cast (new_persons_fully_vaccinated_janssen as BIGINT) new_persons_fully_vaccinated_janssen,
        cast (cumulative_persons_fully_vaccinated_janssen as BIGINT) cumulative_persons_fully_vaccinated_janssen,
        cast (new_vaccine_doses_administered_janssen as BIGINT) new_vaccine_doses_administered_janssen,
        cast (cumulative_vaccine_doses_administered_janssen as BIGINT) cumulative_vaccine_doses_administered_janssen,
        cast (new_persons_vaccinated_sinovac as BIGINT) new_persons_vaccinated_sinovac,
        cast (total_persons_vaccinated_sinovac as BIGINT) total_persons_vaccinated_sinovac,
        cast (new_persons_fully_vaccinated_sinovac as BIGINT) new_persons_fully_vaccinated_sinovac,
        cast (total_persons_fully_vaccinated_sinovac as BIGINT) total_persons_fully_vaccinated_sinovac,
        cast (new_vaccine_doses_administered_sinovac as BIGINT) new_vaccine_doses_administered_sinovac,
        cast (total_vaccine_doses_administered_sinovac as BIGINT) total_vaccine_doses_administered_sinovac
    from "covid"."default"."covid19_vaccines"
)
select * from vaccines
  ;
