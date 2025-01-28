/*task 7 : Get the complete report of the Gross sales amount for the customer “Atliq
Exclusive” for each month. This analysis helps to get an idea of low and
high-performing months and take strategic decisions.
The final report contains these columns:
Month
Year
Gross sales Amount*/

SELECT 
date_format(s.date, '%M(%Y)') as month,
s.fiscal_year as fiscal_year,
round(sum(g.gross_price*s.sold_quantity)/1000000,2) as gross_sales_amount_in_millions
FROM fact_sales_monthly s
JOIN dim_customer c
ON s.customer_code=c.customer_code
JOIN fact_gross_price g
ON s.product_code=g.product_code
where c.customer="Atliq Exclusive"
group by s.date,s.fiscal_year
order by s.fiscal_year;