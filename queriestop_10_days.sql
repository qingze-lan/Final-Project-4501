
    WITH hired_trips AS (
        SELECT pickup_datetime, distance
        FROM taxi_trips
        WHERE pickup_datetime BETWEEN '2009-01-01' AND '2010-01-01'
        UNION ALL
        SELECT pickup_datetime, distance
        FROM uber_trips
        WHERE pickup_datetime BETWEEN '2009-01-01' AND '2010-01-01'
    )
    SELECT date(pickup_datetime) AS time, AVG(distance) AS avg_distance, COUNT(*) AS count
    FROM hired_trips
    GROUP BY time
    ORDER BY count DESC
    LIMIT 10;
