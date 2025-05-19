SELECT 
  u.id AS customer_id,
  CONCAT(u.first_name, ' ', u.last_name) AS name,
  TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE()) AS tenure_months,
  COUNT(s.id) AS total_transactions,
  
  -- estimate CLV based on average monthly profit
  ROUND((COUNT(s.id) / TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE())) * 12 * (0.001 * (SUM(s.confirmed_amount) / COUNT(s.id))),2) AS estimated_clv
FROM users_customuser u
JOIN savings_savingsaccount s ON u.id = s.owner_id

GROUP BY u.id, u.first_name, u.last_name, u.date_joined

ORDER BY estimated_clv DESC;