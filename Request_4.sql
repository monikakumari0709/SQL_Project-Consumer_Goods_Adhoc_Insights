/*task 4: Follow-up: Which segment had the most increase in unique products in
2021 vs 2020? The final output contains these fields,
segment
product_count_2020
product_count_2021
difference*/

WITH cte1 as(
SELECT 
segment,
COUNT(distinct p.product_code) as product_count_2020
FROM dim_product p
JOIN fact_sales_monthly s
ON p.product_code=s.product_code
WHERE s.fiscal_year=2020
GROUP BY segment),

cte2 as(
SELECT 
segment,
COUNT(distinct p.product_code) as product_count_2021
FROM dim_product p
JOIN fact_sales_monthly s
ON p.product_code=s.product_code
WHERE s.fiscal_year=2021
GROUP BY segment)

SELECT 
cte1.segment,
cte1.product_count_2020,cte2.product_count_2021,
(product_count_2021 - product_count_2020) as difference
FROM cte1
JOIN cte2
ON cte1.segment=cte2.segment