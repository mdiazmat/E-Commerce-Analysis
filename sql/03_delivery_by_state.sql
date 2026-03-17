-- What is the average delivery time per state, and which states are slowest?
SELECT
    c.customer_state AS state, 
    ROUND(AVG(
        EXTRACT(EPOCH FROM (o.order_delivered_customer_date 
        - o.order_purchase_timestamp)) / 86400
        ), 1) AS avg_delivery_days,
        COUNT(*) AS total_delivered_orders
FROM olist_orders o 
JOIN olist_customers c ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered'
    AND o.order_delivered_customer_date IS NOT NULL
GROUP BY state
ORDER BY avg_delivery_days DESC;
