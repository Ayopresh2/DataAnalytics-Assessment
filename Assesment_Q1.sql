
  
  SELECT 
  p.owner_id,
  MAX(CONCAT(u.first_name, ' ', u.last_name)) AS name,
  SUM(CASE WHEN p.is_regular_savings = 1 THEN 1 ELSE 0 END) AS savings_count,
  SUM(CASE WHEN p.is_a_fund = 1 THEN 1 ELSE 0 END) AS investment_count,
  ROUND(SUM(s.total_confirmed_amount) / 100.0, 2) AS total_deposit
FROM plans_plan p
JOIN users_customuser u ON p.owner_id = u.id
-- USED A SUBQUERY TO GET THE TTOTAL AMOUNT, WHEN I JOINED DIRECTLY, IT WAS INFLTING THE COUNTS OF THE PLANS
LEFT JOIN (
  SELECT plan_id, SUM(confirmed_amount) AS total_confirmed_amount
  FROM savings_savingsaccount
  GROUP BY plan_id
) s ON p.id = s.plan_id
-- WHERE p.owner_id = '427085b0eb1048f29d882d645658c09d'
GROUP BY p.owner_id
HAVING 
  MAX(p.is_regular_savings) = 1
  AND MAX(p.is_a_fund) = 1;
