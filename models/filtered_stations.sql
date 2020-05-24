with filtered_stations as (
    SELECT
        stn.*
FROM
  {{ ref('stg_stations') }} AS stn
JOIN {{ ref('stg_gsod2016') }} AS wx
    ON stn.wban=wx.wban
    AND stn.usaf=wx.stn
)

select * From filtered_stations
