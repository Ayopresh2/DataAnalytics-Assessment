
-- First, try to get the number of transactions each user makes per month
WITH tx_by_user_month AS (
  SELECT 
    owner_id,
    DATE_FORMAT(created_on, '%Y-%m') AS tx_month, -- just getting the month part
    COUNT(*) AS monthly_tx
  FROM savings_savingsaccount
  GROUP BY owner_id, tx_month
),
-- Now get the average number of transactions each user does monthly
avg_tx_per_user AS (
  SELECT 
    owner_id,
    ROUND(AVG(monthly_tx), 2) AS avg_tx_per_month
  FROM tx_by_user_month
  GROUP BY owner_id
)
-- Finally, categorize users based on their average transaction frequency
SELECT 
  CASE
    WHEN avg_tx_per_month >= 10 THEN 'High Frequency'
    WHEN avg_tx_per_month >= 3 THEN 'Medium Frequency'
    ELSE 'Low Frequency'
  END AS frequency_category,
  COUNT(*) AS customer_count,
  ROUND(AVG(avg_tx_per_month), 1) AS avg_transactions_per_month
FROM avg_tx_per_user
GROUP BY frequency_category
ORDER BY FIELD(frequency_category, 'High Frequency', 'Medium Frequency', 'Low Frequency');



SELECT 
  owner_id,
  DATE_FORMAT(created_on, '%Y-%m') AS tx_month,
  COUNT(*) AS monthly_tx
FROM savings_savingsaccount
GROUP BY owner_id, tx_month