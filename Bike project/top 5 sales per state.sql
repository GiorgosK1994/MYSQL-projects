WITH product_sales AS (
  SELECT 
    p.product_name,
    c.state,
    SUM(oi.quantity) AS total_sales,
    ROW_NUMBER() OVER (
      PARTITION BY c.state
      ORDER BY SUM(oi.quantity) DESC
    ) AS rn
  FROM order_items oi
  JOIN products p 
  USING (product_id)
  JOIN orders o 
  USING (order_id)
  JOIN customers c 
  USING (customer_id)
  GROUP BY c.state, p.product_name
)
SELECT product_name, state, total_sales
FROM product_sales
WHERE rn <= 5
ORDER BY state, total_sales DESC