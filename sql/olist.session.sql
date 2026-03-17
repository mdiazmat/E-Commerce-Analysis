-- Verify data loaded correctly
SELECT 'orders' AS table_name, COUNT(*) AS row_count FROM olist_orders
UNION ALL 
SELECT 'order_items', COUNT(*) FROM olist_order_items
UNION ALL
SELECT 'customers', COUNT(*) FROM olist_customers
UNION ALL 
SELECT 'products', COUNT(*) FROM olist_products;
