/*This Query Summarizes the amount of cases per industry and how many of 
and how many of them were for each gender*/

SELECT
MAX(products_industry_code) AS Industry_Code,
Max(Products_industry_name) AS Industry_Name,

COUNT(report_number) AS Number_Cases,

SUM(CASE WHEN consumer_gender = 'Male' THEN 1 ELSE 0 END) AS Male_Cases,
SUM(CASE WHEN consumer_gender = 'Female' THEN 1 ELSE 0 END) AS Female_Cases,
SUM(CASE WHEN consumer_gender IS NULL THEN 1 ELSE 0 END) AS Other_Cases

FROM bigquery-public-data.fda_food.food_events

GROUP BY 
products_industry_code

ORDER BY
Number_Cases DESC