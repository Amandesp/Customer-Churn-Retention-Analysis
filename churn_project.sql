-- View the entire dataset
SELECT *
FROM customer_churn;


-- Count customers who churned
SELECT COUNT(*) AS churned_customers
FROM customer_churn
WHERE churn = 1;

-- Result: 495 customers churned


-- Count customers who did not churn
SELECT COUNT(*) AS non_churned_customers
FROM customer_churn
WHERE churn = 0;

-- Result: 2,655 customers did not churn


-- Calculate overall churn rate
SELECT
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers,
    ROUND(SUM(churn) / COUNT(*) * 100, 2) AS churn_rate
FROM customer_churn;

-- Result: Customer churn rate is 15.71%



-- How many customers complained and how many did not?
SELECT
    complains,
    COUNT(*) AS customer_count
FROM customer_churn
GROUP BY complains
ORDER BY complains;


-- Churn rate by complaint status
SELECT
    complains,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers,
    ROUND(SUM(churn) / COUNT(*) * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY complains
ORDER BY churn_rate DESC;

-- Finding:
-- Customers who complained had a much higher churn rate
-- than customers who did not complain.


-- Create subscription length groups
SELECT
    subscription_length,
    CASE
        WHEN subscription_length <= 6 THEN '0-6 months'
        WHEN subscription_length <= 12 THEN '7-12 months'
        WHEN subscription_length <= 24 THEN '13-24 months'
        ELSE '25+ months'
    END AS subscription_group
FROM customer_churn;


-- Churn rate by subscription length group
SELECT
    CASE
        WHEN subscription_length <= 6 THEN '0-6 months'
        WHEN subscription_length <= 12 THEN '7-12 months'
        WHEN subscription_length <= 24 THEN '13-24 months'
        ELSE '25+ months'
    END AS subscription_group,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers,
    ROUND(SUM(churn) / COUNT(*) * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY subscription_group
ORDER BY churn_rate DESC;


-- Churn rate by tariff plan
SELECT
    tariff_plan,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers,
    ROUND(SUM(churn) / COUNT(*) * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY tariff_plan
ORDER BY churn_rate DESC;


-- Average seconds of use by churn status
SELECT
    churn,
    COUNT(*) AS total_customers,
    ROUND(AVG(seconds_of_use), 2) AS avg_seconds_used
FROM customer_churn
GROUP BY churn
ORDER BY churn;

-- Finding:
-- Customers who churned had substantially lower
-- average service usage than customers who stayed.


-- Average call frequency by churn status
SELECT
    churn,
    COUNT(*) AS total_customers,
    ROUND(AVG(frequency_of_use), 2) AS avg_calls
FROM customer_churn
GROUP BY churn
ORDER BY churn;

-- Finding:
-- Customers who churned had substantially lower
-- call frequency than customers who stayed.


-- Average SMS frequency by churn status
SELECT
    churn,
    COUNT(*) AS total_customers,
    ROUND(AVG(frequency_of_sms), 2) AS avg_sms
FROM customer_churn
GROUP BY churn
ORDER BY churn;

-- Finding:
-- Customers who stayed had a higher average SMS usage
-- than customers who churned.


-- Average call failures by churn status
SELECT
    churn,
    COUNT(*) AS total_customers,
    ROUND(AVG(call_failure), 2) AS avg_call_failures
FROM customer_churn
GROUP BY churn
ORDER BY churn;

-- Finding:
-- Call failures were slightly higher for customers who stayed.
-- The difference was not substantially different between groups.


-- Average customer value by churn status
SELECT
    churn,
    COUNT(*) AS total_customers,
    ROUND(AVG(customer_value), 2) AS avg_customer_value
FROM customer_churn
GROUP BY churn
ORDER BY churn;

-- Finding:
-- Customers who churned had substantially lower
-- average customer value than customers who stayed.


-- Minimum, maximum, and average customer value
SELECT
    MIN(customer_value) AS minimum_value,
    MAX(customer_value) AS maximum_value,
    ROUND(AVG(customer_value), 2) AS average_value
FROM customer_churn;


-- Create customer value groups
SELECT
    CASE
        WHEN customer_value < 250 THEN 'Low Value'
        WHEN customer_value < 500 THEN 'Medium Value'
        WHEN customer_value < 1000 THEN 'High Value'
        ELSE 'Very High Value'
    END AS value_group,
    COUNT(*) AS total_customers
FROM customer_churn
GROUP BY value_group
ORDER BY total_customers DESC;


-- Churn rate by customer value group
SELECT
    CASE
        WHEN customer_value < 250 THEN 'Low Value'
        WHEN customer_value < 500 THEN 'Medium Value'
        WHEN customer_value < 1000 THEN 'High Value'
        ELSE 'Very High Value'
    END AS value_group,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers,
    ROUND(SUM(churn) / COUNT(*) * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY value_group
ORDER BY churn_rate DESC;


-- Count customers who both complained and churned
SELECT
    COUNT(*) AS total_customers
FROM customer_churn
WHERE churn = 1
  AND complains = 1;


-- Analyze complaints and tariff plan together
SELECT
    complains,
    tariff_plan,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers,
    ROUND(SUM(churn) / COUNT(*) * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY
    complains,
    tariff_plan
ORDER BY churn_rate DESC;


-- Identify active customers who have not churned,
-- have complained, and are on the pay-as-you-go plan.
--
-- These customers may represent a potential
-- retention opportunity.

SELECT
    COUNT(*) AS potential_retention_customers
FROM customer_churn
WHERE status = 1
  AND churn = 0
  AND complains = 1
  AND tariff_plan = 1;


-- Examine these potential retention customers
SELECT
    subscription_length,
    customer_value,
    seconds_of_use,
    frequency_of_use,
    frequency_of_sms,
    call_failure,
    age_group,
    tariff_plan,
    status,
    complains
FROM customer_churn
WHERE status = 1
  AND churn = 0
  AND complains = 1
  AND tariff_plan = 1;


-- Rank potential retention customers
-- by customer value
SELECT
    customer_value,
    subscription_length,
    seconds_of_use,
    frequency_of_use,
    frequency_of_sms,
    call_failure,
    age_group
FROM customer_churn
WHERE status = 1
  AND churn = 0
  AND complains = 1
  AND tariff_plan = 1
ORDER BY customer_value DESC;



-- Categorize potential retention customers
-- based on customer value.

SELECT
    CASE
        WHEN customer_value >= 500 THEN 'High Priority'
        WHEN customer_value >= 250 THEN 'Medium Priority'
        ELSE 'Low Priority'
    END AS retention_priority,
    COUNT(*) AS customer_count
FROM customer_churn
WHERE status = 1
  AND churn = 0
  AND complains = 1
  AND tariff_plan = 1
GROUP BY retention_priority
ORDER BY customer_count DESC;



-- Churn rate by age group
SELECT
    age_group,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers,
    ROUND(SUM(churn) / COUNT(*) * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY age_group
ORDER BY age_group;

