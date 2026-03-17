-- Which states have the most customers?
SELECT 
    customer_state AS state,
    COUNT(DISTINCT customer_id) AS total_customers
FROM olist_customers
GROUP BY customer_state
ORDER BY total_customers DESC;