#Selects date_started and number of cases per day

SELECT
  date_started,                                                      #Selects date_started
  COUNT(*) AS TotalReports                                           #Counts number of reports for each date_started
FROM
  bigquery-public-data.fda_food.food_events
WHERE
  products_brand_name = 'JOHNSONS POWDER NO UPC'                     #Limits search to one product, can be changed to change product being searched
GROUP BY
  date_started
ORDER BY
  date_started