-- Validate import CSV files
SELECT * FROM "Cardholder";
SELECT * FROM "Creditcard";
SELECT * FROM "Merchant";
SELECT * FROM "Merchantcat";
SELECT * FROM "Transaction";


-- Create a view for transaction with less than $2.00
CREATE VIEW fraud1 AS
SELECT *
FROM "Transaction" as a
INNER JOIN "Creditcard" as b ON a.card = b.card_id
INNER JOIN "Cardholder" as c ON c.holder= b.holder_id
WHERE amount <2;

SELECT * FROM fraud1;

-- Count number of small transaction per cardholder
SELECT name, count(*)
FROM fraud1 
GROUP by name 
ORDER by count(*) Desc

-- Count number of small transaction per card
SELECT card, name, count(card)
FROM fraud1 
GROUP by card, name
ORDER by name Desc

-- Create a view for transaction between 7am and 9am 
CREATE VIEW fraud2 AS
SELECT *
FROM "Transaction"
WHERE EXTRACT(HOUR FROM date)>=7 and  EXTRACT(HOUR FROM date)<9
ORDER by amount Desc
LIMIT 100

SELECT * FROM fraud2;

-- Top 5 merchant with small transaction 
SELECT  merchant_id, count(*)
FROM fraud1
GROUP by  merchant_id 
ORDER by count(*) Desc
LIMIT 5
