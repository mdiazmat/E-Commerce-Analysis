-- What precentage of orders were dilivered late?
SELECT
    COUNT(*) AS total_orders,
    SUM(CASE WHEN order_delivered_customer_date
    > order_estimated_delivery_date THEN 1 ELSE 0 END) AS late_orders,
    ROUND(100.0 *
        SUM(CASE WHEN order_delivered_customer_date
            > order_estimated_delivery_date THEN 1 ELSE 0 END)
        / COUNT(*), 1) AS late_pct
FROM olist_orders
WHERE order_status = 'delivered'
    AND order_delivered_customer_date IS NOT NULL
    AND order_estimated_delivery_date IS NOT NULL;
