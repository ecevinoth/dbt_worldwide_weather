with gsod2016 as (
    select * from `bigquery-public-data.noaa_gsod.gsod2016` limit 10000
)

select * from gsod2016