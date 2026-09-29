use ecommerce_analytics;

SELECT 
    *
FROM
    ecommerce_sales;

SELECT 
    order_id,
    revenue,
    CASE
        WHEN revenue < 500 THEN 'Low'
        WHEN revenue BETWEEN 500 AND 1500 THEN 'Medium'
        WHEN revenue > 1500 THEN 'High'
    END AS revenue_category
FROM
    ecommerce_sales;

SELECT 
    order_id,
    quantity,
    unit_price,
    quantity * unit_price AS pre_discount_value
FROM
    ecommerce_sales;

SELECT 
    order_id,
    quantity,
    unit_price,
    discount,
    (quantity * unit_price) * discount / 100 AS discount_amount
FROM
    ecommerce_sales;

SELECT
    product_category,
    SUM(revenue) AS total_revenue
FROM ecommerce_sales
GROUP BY product_category
HAVING total_revenue > 1000000;

SELECT
    region,
    COUNT(*) AS total_orders
FROM ecommerce_sales
GROUP BY region
HAVING total_orders > 1200;

SELECT
    payment_method,
    SUM(revenue) AS total_revenue
FROM ecommerce_sales
GROUP BY payment_method
HAVING total_revenue > 1500000;