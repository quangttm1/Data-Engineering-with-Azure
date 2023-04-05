IF OBJECT_ID(N'dbo.factpayment') IS NOT NULL
BEGIN
    DROP TABLE factpayment
END
GO;

CREATE TABLE factpayment ( 
    payment_id BIGINT,
    date DATE,
    amount FLOAT,
    rider_id BIGINT

)

GO;

INSERT INTO factpayment(payment_id, date, amount, rider_id)
SELECT p.payment_id as payment_id, p.date as date, p.amount as amount, p.rider_id as rider_id
FROM staging_payment as p

GO

SELECT TOP 10 * FROM factpayment

GO