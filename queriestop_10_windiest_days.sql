
    SELECT date(pickup_datetime) AS date, COUNT(*) AS count
    FROM (
        SELECT pickup_datetime
        FROM taxi_trips
        UNION ALL
        SELECT pickup_datetime
        FROM uber_trips
    )
    GROUP BY date
    HAVING date IN (
        SELECT date(DATE)
        FROM daily_weather
        WHERE DATE BETWEEN '2014-01-01' AND '2015-01-01'
        ORDER BY DailyWindSpeed DESC
        LIMIT 10
    )
