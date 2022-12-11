
    SELECT strftime('%w', pickup_datetime) AS time, COUNT(*) AS count
    FROM uber_trips
    GROUP BY time
    ORDER BY count DESC;
