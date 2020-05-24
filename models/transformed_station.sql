with transformed_station as (

    SELECT 
        state
        , name
        , min(a.year) as year
        , min(a.wban) wban
        , min(a.stn) stn
        , COUNT(*) c
        , SUM(IF(prcp=99.99,0,prcp)) rain
        , min(lat) lat
        , min(lon) long
    FROM {{ ref('stg_gsod2016') }} a
    JOIN {{ ref('stg_stations') }} b 
    ON a.wban=b.wban
    AND a.usaf=b.usaf
    WHERE country='US' AND state='TX' AND name like '%AUST%'
    GROUP BY 1,2
    limit 1000

)

select * from transformed_station