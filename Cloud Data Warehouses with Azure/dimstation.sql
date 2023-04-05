IF OBJECT_ID(N'dbo.dimstation') IS NOT NULL
BEGIN
    DROP TABLE dimstation
END

GO

CREATE TABLE dimstation
(
    station_id nvarchar(500),
    name nvarchar(500),
    latitude float,
    longitude float
)

GO

INSERT INTO dimstation(station_id, name, latitude, longitude)
SELECT * FROM staging_station

GO

SELECT TOP 10 * FROM dimstation

GO