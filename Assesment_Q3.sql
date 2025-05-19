SELECT 
    id AS account_id,
    owner_id,
    'Savings' AS type,
    MAX(created_on) AS last_transaction_date,
    DATEDIFF(CURDATE(), MAX(created_on)) AS inactivity_days
FROM savings_savingsaccount
GROUP BY id, owner_id
HAVING inactivity_days > 365

UNION ALL

-- Get last inflow for investment plans
SELECT 
    id AS account_id,
    owner_id,
    'Investment' AS type,
    MAX(created_on) AS last_transaction_date,
    DATEDIFF(CURDATE(), MAX(created_on)) AS inactivity_days
FROM plans_plan 
GROUP BY id, owner_id
HAVING inactivity_days > 365;
