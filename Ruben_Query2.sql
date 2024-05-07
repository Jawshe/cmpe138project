/*Determines the percentage of each outcome for each Gender*/
SELECT
products_industry_code AS Industry_Code,
products_industry_name AS Industry_Name,

SUM(CASE WHEN consumer_gender = 'Female' THEN 1 ELSE 0 END) AS Female_Cases,
ROUND((SUM(CASE WHEN outcomes = 'Death' AND consumer_gender = 'Female' THEN 1 ELSE 0 END) / NULLIF(SUM(CASE WHEN consumer_gender = 'Female' THEN 1 ELSE 0 END), 0)) * 100, 2) AS F_Death,
ROUND((SUM(CASE WHEN outcomes = 'Life Threatening' AND consumer_gender = 'Female' THEN 1 ELSE 0 END) / NULLIF(SUM(CASE WHEN consumer_gender = 'Female' THEN 1 ELSE 0 END), 0)) * 100, 2) AS F_Life_Threatening,
ROUND((SUM(CASE WHEN outcomes = 'Hospitalization' AND consumer_gender = 'Female' THEN 1 ELSE 0 END) / NULLIF(SUM(CASE WHEN consumer_gender = 'Female' THEN 1 ELSE 0 END), 0)) * 100, 2) AS F_Hospitalization,
ROUND((SUM(CASE WHEN outcomes = 'Disability' AND consumer_gender = 'Female' THEN 1 ELSE 0 END) / NULLIF(SUM(CASE WHEN consumer_gender = 'Female' THEN 1 ELSE 0 END), 0)) * 100, 2) AS F_Disability,
ROUND((SUM(CASE WHEN outcomes IN ('Visited Emergency Room', 'Other') AND consumer_gender = 'Female' THEN 1 ELSE 0 END) / NULLIF(SUM(CASE WHEN consumer_gender = 'Female' THEN 1 ELSE 0 END), 0)) * 100, 2) AS F_Other,

SUM(CASE WHEN consumer_gender = 'Male' THEN 1 ELSE 0 END) AS Male_Cases,
ROUND((SUM(CASE WHEN outcomes = 'Death' AND consumer_gender = 'Male' THEN 1 ELSE 0 END) / NULLIF(SUM(CASE WHEN consumer_gender = 'Male' THEN 1 ELSE 0 END), 0)) * 100, 2) AS M_Death,
ROUND((SUM(CASE WHEN outcomes = 'Life Threatening' AND consumer_gender = 'Male' THEN 1 ELSE 0 END) / NULLIF(SUM(CASE WHEN consumer_gender = 'Male' THEN 1 ELSE 0 END), 0)) * 100, 2) AS M_Life_Threatening,
ROUND((SUM(CASE WHEN outcomes = 'Hospitalization' AND consumer_gender = 'Male' THEN 1 ELSE 0 END) / NULLIF(SUM(CASE WHEN consumer_gender = 'Male' THEN 1 ELSE 0 END), 0)) * 100, 2) AS M_Hospitalization,
ROUND((SUM(CASE WHEN outcomes = 'Disability' AND consumer_gender = 'Male' THEN 1 ELSE 0 END) / NULLIF(SUM(CASE WHEN consumer_gender = 'Male' THEN 1 ELSE 0 END), 0)) * 100, 2) AS M_Disability,
ROUND((SUM(CASE WHEN outcomes IN ('Visited Emergency Room', 'Other') AND consumer_gender = 'Male' THEN 1 ELSE 0 END) / NULLIF(SUM(CASE WHEN consumer_gender = 'Male' THEN 1 ELSE 0 END), 0)) * 100, 2) AS M_Other,

SUM(CASE WHEN consumer_gender IS NULL THEN 1 ELSE 0 END) AS Other_Cases,
ROUND((SUM(CASE WHEN outcomes = 'Death' AND consumer_gender IS NULL THEN 1 ELSE 0 END) / NULLIF(SUM(CASE WHEN consumer_gender IS NULL THEN 1 ELSE 0 END), 0)) * 100, 2) AS O_Death,
ROUND((SUM(CASE WHEN outcomes = 'Life Threatening' AND consumer_gender IS NULL THEN 1 ELSE 0 END) / NULLIF(SUM(CASE WHEN consumer_gender IS NULL THEN 1 ELSE 0 END), 0)) * 100, 2) AS O_Life_Threatening,
ROUND((SUM(CASE WHEN outcomes = 'Hospitalization' AND consumer_gender IS NULL THEN 1 ELSE 0 END) / NULLIF(SUM(CASE WHEN consumer_gender IS NULL THEN 1 ELSE 0 END), 0)) * 100, 2) AS O_Hospitalization,
ROUND((SUM(CASE WHEN outcomes = 'Disability' AND consumer_gender IS NULL THEN 1 ELSE 0 END) / NULLIF(SUM(CASE WHEN consumer_gender IS NULL THEN 1 ELSE 0 END), 0)) * 100, 2) AS O_Disability,
ROUND((SUM(CASE WHEN outcomes IN ('Visited Emergency Room', 'Other') AND consumer_gender IS NULL THEN 1 ELSE 0 END) / NULLIF(SUM(CASE WHEN consumer_gender IS NULL THEN 1 ELSE 0 END), 0)) * 100, 2) AS O_Other

FROM bigquery-public-data.fda_food.food_events

GROUP BY 
products_industry_code, products_industry_name

ORDER BY
Female_Cases DESC