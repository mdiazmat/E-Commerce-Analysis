-- What are the top 10 product categories by total revenue?
SELECT
    t.product_category_name_english AS category,
    ROUND(SUM(i.price), 2) AS total_revenue,
    COUNT(DISTINCT i.order_id) AS total_orders
FROM olist_order_items i
JOIN olist_products p ON i.product_id = p.product_id
JOIN product_category_name_translation t
    ON p.product_category_name = t.product_category_name
GROUP BY category
ORDER BY total_revenue DESC
LIMIT 10;
