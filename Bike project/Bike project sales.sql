SELECT brand_name, sum(quantity) AS total_sales
FROM products pr
JOIN bikes.order_items boi
USING (product_id)
JOIN brands br
USING (brand_id)
GROUP BY brand_name
ORDER BY total_sales DESC