IF OBJECT_ID(N'dbo.dimrider') IS NOT NULL
BEGIN
    DROP TABLE dimrider
END

GO

CREATE TABLE dimrider
(
    rider_id bigint,
    first nvarchar(500),
	last nvarchar(500),
	address nvarchar(500),
	birthday date,
	account_start_date date,
	account_end_date date,
	rider_account_age int,
    is_member bit
)

GO

INSERT INTO dimrider(rider_id, first, last, address, birthday, 
account_start_date, account_end_date, rider_account_age, is_member)

SELECT
    r.rider_id as rider_id,
    r.first as first,
    r.last as last,
    r.address as address,
    r.birthday as birthday,
    r.account_start_date as account_start_date,
    r.account_end_date as account_end_date,
    (
    DATEDIFF(YEAR, 
    r.birthday,
    CONVERT(DATETIME, SUBSTRING(r.account_start_date, 1, 19),120)) - 
    (CASE 
    WHEN MONTH(r.birthday) > MONTH(CONVERT(DATETIME, SUBSTRING(r.account_start_date, 1, 19),120))
    OR 
    (MONTH(r.birthday) = MONTH(CONVERT(DATETIME, SUBSTRING(r.account_start_date, 1, 19),120))
    AND DAY(r.birthday) > DAY(CONVERT(DATETIME, SUBSTRING(r.account_start_date, 1, 19),120)))
    THEN 1 ELSE 0 END)
    ) AS rider_account_age,
    r.is_member as is_member
FROM staging_rider AS r

GO

SELECT TOP 10 * FROM dimrider