-- In the United States, fast food is the cornerstone of it's very society. Without it, it would cease to exist.

-- But which region spends the most money on fast food?

-- Write a query to determine which region spends the most amount of money on fast food

 with cte as 
   (SELECT region,sum(fast_food_millions) as sum1
    FROM food_regions
    group by 1)

select region
from cte 
order by sum1 desc
limit 1

------------------------------------------------------------------------------------------------

-- Cars need to be inspected every year in order to pass inspection and be street legal. If a car has any critical issues it will fail inspection or if it has more than 3 minor issues it will also fail.

-- Write a query to identify all of the cars that passed inspection.

-- Output should include the owner name and vehicle name. Order by the owner name alphabetically.

SELECT owner_name, vehicle
FROM inspections 
where critical_issues < 1 and minor_issues <= 3
order by 1

-- statements
-- has 1 critical_issues or has minor_issues >= 3 
-- find passed inspections

-- output
-- owner name and vehicle name
-- order by owner name alph

------------------------------------------------------------------------------------------------

-- Yan is a sandwich enthusiast and is determined to try every combination of sandwich possible. 
-- He wants to start with every combination of bread and meats and then move on from there, but he wants to do it in a systematic way.

-- Below we have 2 tables, bread and meats

-- Output every possible combination of bread and meats to help Yan in his endeavors.

-- Order by the bread and then meat alphabetically. This is what Yan prefers.

SELECT b.bread_name,s.meat_name
FROM bread_table b 
CROSS JOIN meat_table s
order by b.bread_name, s.meat_name

-- SELECT bread_name, meat_name FROM bread_table,meat_table
-- order by bread_name, meat_name

------------------------------------------------------------------------------------------------

-- Tech companies have been laying off employees after a large surge of hires in the past few years.

-- Write a query to determine the percentage of employees that were laid off from each company.

-- Output should include the company and the percentage (to 2 decimal places) of laid off employees.

-- Order by company name alphabetically.

SELECT company, round((employees_fired::NUMERIC / company_size::NUMERIC) * 100,2) as cnt
FROM tech_layoffs
GROUP BY 1,2
order by 1

-- percentage of emp for each company

-- output
-- company and percentage 2 dec. emp
-- order by company name alph.

------------------------------------------------------------------------------------------------

-- Return all the candidate IDs that have problem solving skills, SQL experience, knows Python or R, and has domain knowledge.

-- Order output on IDs from smallest to largest.

SELECT candidate_id FROM candidates
WHERE problem_solving = 'X' and 
      sql_experience = 'X' AND
      domain_knowledge = 'X' AND
      (python = 'X' or 
      r_programming = 'X')
order by 1

-- problem_solving,sql_experience,python or r_programming,
-- domain_knowledge
