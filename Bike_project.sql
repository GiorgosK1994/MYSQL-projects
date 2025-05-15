Select brand_name, product_name, round(sum(oi.list_price),2) AS total_profit_per_product
FROM order_items oi
JOIN products pr
USING (product_id)
JOIN brands br
USING (brand_id)
GROUP BY product_name, brand_name
order by brand_name, total_profit_per_product DESC
