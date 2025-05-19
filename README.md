# 2-Assessment
Cowrywise Data Analyst Assessment

1. High-Value Customers with Multiple Products
Based on the hints provided in the assessment document, the field that confirms savings_plan is “is_regular_savings = 1” and investment_plan = “is_a_fund = 1”. I wrote a simpler query to verify the occurrence of the conditions in the plans table, the query also served as a base guide when writing the main query so as to avoid inflated numbers.
















A snippet showing the output of the query to test the conditions on the base table.




2. Used subqueires to group the requirements for question 2 and joined with the select, was not as stressful as no 1.
3. Used a UNION ALL to join the investment and savings plans together
4. The 4th one seemed as though it would be the toughest especially due to the terms, looking closer, realized the calculations were literally there and just had to follow the formula. Had to check online to get some of the formulas tho e.g TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE()) AS tenure_months checked how to get the time diff.
