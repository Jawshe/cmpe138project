#Uses COUNT to list the total number of reports per product name in descending order. Used to see which item has the most reports.

SELECT 
  COUNT(DISTINCT report_number) AS TotalReports, products_brand_name #Selects number of individual report numbers and product names
FROM 
  bigquery-public-data.fda_food.food_events                          #Only displays outputs with industry product code for cometics
GROUP BY
  products_brand_name                                                #Groups results by products
ORDER BY
  TotalReports DESC                                                  #Orders results by number of results (descending)
LIMIT 20



