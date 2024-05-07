/*This Query Summarizes the amount of cases per industry and how many of 
and how many of them were for each gender*/

SELECT
products_industry_code AS Industry_Code,
products_industry_name AS Industry_Name,

COUNT(report_number) AS Number_Cases,

SUM(CASE WHEN consumer_gender = 'Male' THEN 1 ELSE 0 END) AS Male_Cases,
SUM(CASE WHEN consumer_gender = 'Female' THEN 1 ELSE 0 END) AS Female_Cases,
SUM(CASE WHEN consumer_gender IS NULL THEN 1 ELSE 0 END) AS Other_Cases,

SUM(CASE WHEN outcomes = 'Death' THEN 1 ELSE 0 END) AS Death,
SUM(CASE WHEN outcomes = 'Life Threatening' THEN 1 ELSE 0 END) AS Life_Threatening,
SUM(CASE WHEN outcomes = 'Hospitalization' THEN 1 ELSE 0 END) AS Hospitalization,
SUM(CASE WHEN outcomes = 'Disability' THEN 1 ELSE 0 END) AS Disability,
SUM(CASE WHEN outcomes IN ('Visited Emergency Room', 'Other') THEN 1 ELSE 0 END) AS Other

FROM bigquery-public-data.fda_food.food_events

GROUP BY 
products_industry_code, products_industry_name

ORDER BY
Number_Cases DESC