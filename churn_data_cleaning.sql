SELECT COUNT(*) AS total_rows
FROM customer_churn;


-- Checking for dupicates in the data. 
SELECT
    `Call  Failure`,
    Complains,
    `Subscription  Length`,
    `Charge  Amount`,
    `Seconds of Use`,
    `Frequency of use`,
    `Frequency of SMS`,
    `Distinct Called Numbers`,
    `Age Group`,
    `Tariff Plan`,
    Status,
    Churn,
    `Customer Value`,
    COUNT(*) AS duplicate_count
FROM customer_churn
GROUP BY
    `Call  Failure`,
    Complains,
    `Subscription  Length`,
    `Charge  Amount`,
    `Seconds of Use`,
    `Frequency of use`,
    `Frequency of SMS`,
    `Distinct Called Numbers`,
    `Age Group`,
    `Tariff Plan`,
    Status,
    Churn,
    `Customer Value`
HAVING COUNT(*) > 1;


-- Check for null values in the data.
 SELECT
    COUNT(*) AS total_rows,
    COUNT(`Call  Failure`) AS call_failure,
    COUNT(Complains) AS complains,
    COUNT(`Subscription  Length`) AS subscription_length,
    COUNT(`Charge  Amount`) AS charge_amount,
    COUNT(`Seconds of Use`) AS seconds_of_use,
    COUNT(`Frequency of use`) AS frequency_of_use,
    COUNT(`Frequency of SMS`) AS frequency_of_sms,
    COUNT(`Distinct Called Numbers`) AS distinct_called_numbers,
    COUNT(`Age Group`) AS age_group,
    COUNT(`Tariff Plan`) AS tariff_plan,
    COUNT(Status) AS status,
    COUNT(Churn) AS churn,
    COUNT(`Customer Value`) AS customer_value
FROM customer_churn;

SELECT
    Churn,
    COUNT(*) AS total_customers
FROM customer_churn
GROUP BY Churn
ORDER BY Churn;


SELECT
    Complains,
    COUNT(*) AS total_customers
FROM customer_churn
GROUP BY Complains
ORDER BY Complains;


SELECT
    `Tariff Plan`,
    COUNT(*) AS total_customers
FROM customer_churn
GROUP BY `Tariff Plan`
ORDER BY `Tariff Plan`;


SELECT
    Status,
    COUNT(*) AS total_customers
FROM customer_churn
GROUP BY Status
ORDER BY Status;


-- Checking for numbers and if there any that dont makie sense for the data. 
SELECT
    MIN(`Call  Failure`) AS min_call_failure,
    MAX(`Call  Failure`) AS max_call_failure
FROM customer_churn;

SELECT
    MIN(`Subscription  Length`) AS min_subscription,
    MAX(`Subscription  Length`) AS max_subscription
FROM customer_churn;

SELECT
    MIN(`Charge  Amount`) AS min_charge,
    MAX(`Charge  Amount`) AS max_charge
FROM customer_churn;

SELECT
    `Charge  Amount`,
    COUNT(*) AS total_customers
FROM customer_churn
WHERE `Charge  Amount` = 10
GROUP BY `Charge  Amount`;

SELECT *
FROM customer_churn
WHERE `Charge  Amount` = 10;


SELECT
    MIN(`Seconds of Use`) AS min_seconds,
    MAX(`Seconds of Use`) AS max_seconds
FROM customer_churn;

SELECT
    MIN(`Frequency of use`) AS min_frequency,
    MAX(`Frequency of use`) AS max_frequency
FROM customer_churn;

SELECT
    MIN(`Frequency of SMS`) AS min_sms,
    MAX(`Frequency of SMS`) AS max_sms
FROM customer_churn;

SELECT
    MIN(`Distinct Called Numbers`) AS min_distinct_numbers,
    MAX(`Distinct Called Numbers`) AS max_distinct_numbers
FROM customer_churn;

SELECT
    MIN(`Customer Value`) AS min_customer_value,
    MAX(`Customer Value`) AS max_customer_value
FROM customer_churn;

SELECT
    MIN(Age) AS min_age,
    MAX(Age) AS max_age
FROM customer_churn;

SELECT
    `Age Group`,
    MIN(Age) AS youngest_age,
    MAX(Age) AS oldest_age,
    COUNT(*) AS total_customers
FROM customer_churn
GROUP BY `Age Group`
ORDER BY `Age Group`;


ALTER TABLE customer_churn
RENAME COLUMN Complains TO complains;

ALTER TABLE customer_churn
RENAME COLUMN `Subscription  Length` TO subscription_length;

ALTER TABLE customer_churn
RENAME COLUMN `Charge  Amount` TO charge_amount;

ALTER TABLE customer_churn
RENAME COLUMN `Seconds of Use` TO seconds_of_use;

ALTER TABLE customer_churn
RENAME COLUMN `Frequency of use` TO frequency_of_use;

ALTER TABLE customer_churn
RENAME COLUMN `Frequency of SMS` TO frequency_of_sms;

ALTER TABLE customer_churn
RENAME COLUMN `Distinct Called Numbers` TO distinct_called_numbers;

ALTER TABLE customer_churn
RENAME COLUMN `Age Group` TO age_group;

ALTER TABLE customer_churn
RENAME COLUMN `Tariff Plan` TO tariff_plan;

ALTER TABLE customer_churn
RENAME COLUMN `Customer Value` TO customer_value;

ALTER TABLE customer_churn
RENAME COLUMN Age TO age;

ALTER TABLE customer_churn
RENAME COLUMN Churn TO churn;

ALTER TABLE customer_churn
RENAME COLUMN Status TO status;





SELECT *
FROM customer_churn;
