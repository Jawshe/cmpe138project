#This query extracts the year from the date_started and counts the number of cases per year.

SELECT
  EXTRACT(YEAR FROM date_started) AS Year,                           #Select the year from date_started (When food related event began, not report date)
  COUNT(*) AS TotalReports                                           #Counts number of reports for each month and year combo
FROM
  bigquery-public-data.fda_food.food_events
WHERE
  products_brand_name = 'JOHNSONS POWDER NO UPC'                     #Limits search to one product, can be changed to change product being searched
GROUP BY
  Year
ORDER BY
  Year;