
    WITH hired_trips AS (
        SELECT strftime('%Y-%m-%d %H', pickup_datetime) AS date
        FROM taxi_trips
        WHERE pickup_datetime BETWEEN '2012-10-22' AND '2012-11-07'
        UNION ALL
        SELECT  strftime('%Y-%m-%d %H', pickup_datetime)
        FROM uber_trips
        WHERE pickup_datetime BETWEEN '2012-10-22' AND '2012-11-07'
    )
    SELECT strftime('%Y-%m-%d %H', hourly_weather.DATE) AS wea_date, COALESCE(COUNT(hired_trips.DATE), 0) AS count, HourlyPrecipitation, HourlyWindSpeed
    FROM hourly_weather
    LEFT JOIN hired_trips
    ON wea_date = hired_trips.DATE
    WHERE wea_date BETWEEN '2012-10-22' AND '2012-11-07'
    GROUP BY wea_date
