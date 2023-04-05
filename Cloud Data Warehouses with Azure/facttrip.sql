IF OBJECT_ID(N'dbo.facttrip') IS NOT NULL
BEGIN
    DROP TABLE facttrip
END
GO;

CREATE TABLE facttrip 
( 
    trip_id nvarchar(500),
    rideable_type nvarchar(500),
    start_at date,
    ended_at date,
    start_station_id nvarchar(500),
    end_station_id nvarchar(500),
    rider_id int,
    rider_trip_age int,
    total_minutes_trip int
)

GO;

INSERT INTO facttrip(trip_id, rideable_type, start_at, ended_at, start_station_id, end_station_id, rider_id, rider_trip_age, total_minutes_trip)
SELECT 
    t.trip_id as trip_id, 
    t.rideable_type as rideable_type, 
    t.start_at as start_at, 
    t.ended_at as ended_at,
    t.start_station_id as start_station_id,
    t.end_station_id as end_station_id,
    t.rider_id as rider_id,
    (DATEDIFF(YEAR, 
        r.birthday,
        CONVERT(DATETIME, SUBSTRING(t.start_at, 1, 19),120)) - (
            CASE WHEN MONTH(r.birthday) > MONTH(CONVERT(DATETIME, SUBSTRING(t.start_at, 1, 19),120))
            OR MONTH(r.birthday) = MONTH(CONVERT(DATETIME, SUBSTRING(t.start_at, 1, 19),120))
                AND DAY(r.birthday) >  DAY(CONVERT(DATETIME, SUBSTRING(t.start_at, 1, 19),120))
            THEN 1 ELSE 0 END
    )) AS rider_trip_age,
    DATEDIFF(MINUTE, CONVERT(Datetime, SUBSTRING(t.start_at, 1, 19),120), CONVERT(Datetime, SUBSTRING(t.ended_at, 1, 19),120)) as total_minutes_trip
FROM staging_trip as t
JOIN staging_rider as r ON (t.rider_id = r.rider_id)

GO

SELECT TOP 10 * FROM facttrip

GO