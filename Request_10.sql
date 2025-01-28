/*task 10: Get the Top 3 products in each division that have a high
total_sold_quantity in the fiscal_year 2021? The final output contains these
fields,
division
product_code
product
total_sold_quantity
rank_order*/ 

WITH cte1 as(SELECT 
p.division,
p.product_code,
p.product,
sum(s.sold_quantity) as total_sold_quantity
FROM fact_sales_monthly s
JOIN dim_product p
ON s.product_code=p.product_code
WHERE s.fiscal_year=2021
GROUP BY p.division,p.product_code,p.product),
cte2 as(SELECT
*,
DENSE_RANK() OVER(PARTITION BY division ORDER BY total_sold_quantity DESC) as rank_order
FROM cte1)
SELECT *
FROM cte2 WHERE rank_order<=3