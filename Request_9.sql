/*task 9: Which channel helped to bring more gross sales in the fiscal year 2021
and the percentage of contribution? The final output contains these fields,
channel
gross_sales_mln
percentage*/

WITH cte as(
SELECT 
c.channel,
concat(round(sum(g.gross_price*s.sold_quantity)/1000000,2),' M') as gross_sales
FROM  fact_sales_monthly s
JOIN dim_customer c
ON s.customer_code=c.customer_code
JOIN fact_gross_price g
ON s.product_code=g.product_code
where s.fiscal_year=2021
GROUP BY c.channel)
SELECT
*,
concat(round(((gross_sales/(sum(gross_sales) over()))*100),2),' %')  as percentage
FROM cte
GROUP by channel,gross_sales
