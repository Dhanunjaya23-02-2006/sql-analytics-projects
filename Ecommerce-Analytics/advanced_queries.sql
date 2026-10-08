-- =====================================================
-- E-COMMERCE SALES ANALYTICS
-- Advanced SQL Queries
-- Dataset: ecommerce_sales
-- Database: ecommerce_analytics
-- =====================================================


USE ecommerce_analytics;


-- =====================================================
-- SECTION 1: CTEs
-- =====================================================


-- =====================================================
-- Q49. Identify the top 10 customers based on total revenue.
-- Concept: CTE, SUM(), GROUP BY, ORDER BY, LIMIT
-- =====================================================

WITH customer_revenue AS (
    SELECT
        customer_id,
        SUM(revenue) AS total_revenue
    FROM ecommerce_sales
    GROUP BY customer_id
)
SELECT
    customer_id,
    total_revenue
FROM customer_revenue
ORDER BY total_revenue DESC
LIMIT 10;


-- =====================================================
-- Q50. Calculate category revenue and each category's
-- percentage of total revenue.
-- Concept: CTE, SUM() OVER()
-- =====================================================

WITH category_revenue AS (
    SELECT
        product_category,
        SUM(revenue) AS category_revenue
    FROM ecommerce_sales
    GROUP BY product_category
)
SELECT
    product_category,
    category_revenue,
    ROUND(
        category_revenue / SUM(category_revenue) OVER () * 100,
        2
    ) AS revenue_percentage
FROM category_revenue;


-- =====================================================
-- SECTION 2: WINDOW FUNCTIONS
-- =====================================================


-- =====================================================
-- Q51. Rank categories by total revenue.
-- Concept: RANK(), Window Function
-- =====================================================

SELECT
    product_category,
    SUM(revenue) AS total_revenue,
    RANK() OVER (
        ORDER BY SUM(revenue) DESC
    ) AS revenue_rank
FROM ecommerce_sales
GROUP BY product_category;


-- =====================================================
-- Q52. Rank customers by total revenue.
-- Concept: RANK(), Window Function
-- =====================================================

SELECT
    customer_id,
    SUM(revenue) AS total_revenue,
    RANK() OVER (
        ORDER BY SUM(revenue) DESC
    ) AS revenue_rank
FROM ecommerce_sales
GROUP BY customer_id;


-- =====================================================
-- Q53. Find the top 3 customers in each region.
-- Concept: RANK(), PARTITION BY, Subquery
-- =====================================================

SELECT
    region,
    customer_id,
    total_revenue,
    revenue_rank
FROM (
    SELECT
        region,
        customer_id,
        SUM(revenue) AS total_revenue,
        RANK() OVER (
            PARTITION BY region
            ORDER BY SUM(revenue) DESC
        ) AS revenue_rank
    FROM ecommerce_sales
    GROUP BY region, customer_id
) AS ranked_customers
WHERE revenue_rank <= 3
ORDER BY region, revenue_rank;


-- =====================================================
-- Q54. Calculate cumulative revenue over time.
-- Concept: SUM() OVER(), Running Total, Subquery
-- =====================================================

SELECT
    order_date,
    daily_revenue,
    SUM(daily_revenue) OVER (
        ORDER BY order_date
    ) AS cumulative_revenue
FROM (
    SELECT
        order_date,
        SUM(revenue) AS daily_revenue
    FROM ecommerce_sales
    GROUP BY order_date
) AS daily_sales
ORDER BY order_date;


-- =====================================================
-- Q55. Calculate monthly revenue and previous-month revenue.
-- Concept: LAG(), Window Function, Subquery
-- =====================================================

SELECT
    order_year,
    order_month,
    monthly_revenue,
    LAG(monthly_revenue) OVER (
        ORDER BY order_year, order_month
    ) AS previous_month_revenue
FROM (
    SELECT
        YEAR(order_date) AS order_year,
        MONTH(order_date) AS order_month,
        SUM(revenue) AS monthly_revenue
    FROM ecommerce_sales
    GROUP BY
        YEAR(order_date),
        MONTH(order_date)
) AS monthly_sales
ORDER BY
    order_year,
    order_month;


-- =====================================================
-- Q56. Calculate month-over-month revenue growth.
-- Concept: LAG(), Window Function, Percentage Calculation
-- =====================================================

SELECT
    order_year,
    order_month,
    monthly_revenue,
    previous_month_revenue,
    ROUND(
        (monthly_revenue - previous_month_revenue)
        / NULLIF(previous_month_revenue, 0) * 100,
        2
    ) AS month_over_month_growth
FROM (
    SELECT
        order_year,
        order_month,
        monthly_revenue,
        LAG(monthly_revenue) OVER (
            ORDER BY order_year, order_month
        ) AS previous_month_revenue
    FROM (
        SELECT
            YEAR(order_date) AS order_year,
            MONTH(order_date) AS order_month,
            SUM(revenue) AS monthly_revenue
        FROM ecommerce_sales
        GROUP BY
            YEAR(order_date),
            MONTH(order_date)
    ) AS monthly_revenue
) AS monthly_data
ORDER BY
    order_year,
    order_month;


-- =====================================================
-- SECTION 3: CUSTOMER SEGMENTATION
-- =====================================================


-- =====================================================
-- Q57. Classify customers as:
-- Low Value    : < 2000
-- Medium Value : 2000 - 5000
-- High Value   : > 5000
-- Concept: CASE, SUM(), GROUP BY, Subquery
-- =====================================================

SELECT
    customer_id,
    total_revenue,
    CASE
        WHEN total_revenue < 2000 THEN 'Low Value'
        WHEN total_revenue BETWEEN 2000 AND 5000 THEN 'Medium Value'
        WHEN total_revenue > 5000 THEN 'High Value'
    END AS customer_value
FROM (
    SELECT
        customer_id,
        SUM(revenue) AS total_revenue
    FROM ecommerce_sales
    GROUP BY customer_id
) AS customer_revenue;


-- =====================================================
-- Q58. Identify customers with only one order.
-- Concept: COUNT(), GROUP BY, HAVING
-- =====================================================

SELECT
    customer_id,
    COUNT(order_id) AS total_orders
FROM ecommerce_sales
GROUP BY customer_id
HAVING total_orders = 1;


-- =====================================================
-- Q59. Identify repeat customers.
-- Concept: COUNT(), GROUP BY, HAVING
-- =====================================================

SELECT
    customer_id,
    COUNT(order_id) AS total_orders
FROM ecommerce_sales
GROUP BY customer_id
HAVING total_orders > 1;


-- =====================================================
-- Q60. Calculate the percentage of customers
-- who are repeat customers.
-- Concept: COUNT(), DISTINCT, GROUP BY, HAVING, Subquery
-- =====================================================

SELECT
    ROUND(
        COUNT(*) * 100.0 / (
            SELECT COUNT(DISTINCT customer_id)
            FROM ecommerce_sales
        ),
        2
    ) AS repeat_customer_percentage
FROM (
    SELECT
        customer_id
    FROM ecommerce_sales
    GROUP BY customer_id
    HAVING COUNT(order_id) > 1
) AS repeat_customers;


-- =====================================================
-- END OF ADVANCED SQL QUERIES Q49-Q60
-- =====================================================