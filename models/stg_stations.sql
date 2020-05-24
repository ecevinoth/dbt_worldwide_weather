{{ config( materialized="table" ) }}

with station as (
    select * from `fh-bigquery.weather_gsod.stations` limit 10000
)

select * from station