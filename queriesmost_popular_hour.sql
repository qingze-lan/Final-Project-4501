
    SELECT strftime('%H', pickup_datetime) AS time, COUNT(*) AS count
    FROM taxi_trips
    GROUP BY time
    ORDER BY count DESC;
