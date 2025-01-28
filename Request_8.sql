/*task 8: In which quarter of 2020, got the maximum total_sold_quantity? The final
output contains these fields sorted by the total_sold_quantity,
Quarter
total_sold_quantity*/

SELECT 
CASE
	when month(date) IN(9,10,11) then 'Q1'
    when month(date) IN(12,1,2) then 'Q2'
    when month(date) IN(3,4,5) then 'Q3'
    when month(date) IN(6,7,8) then 'Q4'
END as Quarters,
ROUND(sum(sold_quantity)/1000000,2) as total_sold_quantity_in_millions
FROM fact_sales_monthly
WHERE fiscal_year=2020
GROUP BY Quarters