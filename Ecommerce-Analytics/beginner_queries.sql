-- =====================================================
-- E-COMMERCE SALES ANALYTICS
-- Beginner SQL Queries
-- Dataset: ecommerce_sales
-- =====================================================


-- =====================================================
-- Q1. How many total orders are present in the dataset?
-- Concept: COUNT()
-- =====================================================

SELECT COUNT(order_id) AS total_orders
FROM ecommerce_sales;


-- =====================================================
-- Q2. How many unique customers are present?
-- Concept: COUNT(DISTINCT)
-- =====================================================

SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM ecommerce_sales;


-- =====================================================
-- Q3. What are the unique product categories?
-- Concept: DISTINCT
-- =====================================================

SELECT DISTINCT product_category
FROM ecommerce_sales;


-- =====================================================
-- Q4. What are the unique regions?
-- Concept: DISTINCT
-- =====================================================

SELECT DISTINCT region
FROM ecommerce_sales;


-- =====================================================
-- Q5. What payment methods are available?
-- Concept: DISTINCT
-- =====================================================

SELECT DISTINCT payment_method
FROM ecommerce_sales;


-- =====================================================
-- Q6. What is the total revenue generated?
-- Concept: SUM()
-- =====================================================

SELECT SUM(revenue) AS total_revenue
FROM ecommerce_sales;


-- =====================================================
-- Q7. What is the average revenue per order?
-- Concept: AVG()
-- =====================================================

SELECT AVG(revenue) AS average_revenue_per_order
FROM ecommerce_sales;


-- =====================================================
-- Q8. What is the highest revenue generated from a single order?
-- Concept: MAX()
-- =====================================================

SELECT MAX(revenue) AS highest_order_revenue
FROM ecommerce_sales;


-- =====================================================
-- Q9. What is the lowest revenue generated from a single order?
-- Concept: MIN()
-- =====================================================

SELECT MIN(revenue) AS lowest_order_revenue
FROM ecommerce_sales;


-- =====================================================
-- Q10. What is the average customer rating?
-- Concept: AVG()
-- =====================================================

SELECT AVG(customer_rating) AS average_customer_rating
FROM ecommerce_sales;


-- =====================================================
-- Q11. How many orders have revenue greater than ₹2,000?
-- Concept: WHERE
-- =====================================================

SELECT *
FROM ecommerce_sales
WHERE revenue > 2000;


-- =====================================================
-- Q12. How many orders have a quantity of 5 or more?
-- Concept: WHERE with comparison operator
-- =====================================================

SELECT *
FROM ecommerce_sales
WHERE quantity >= 5;


-- =====================================================
-- Q13. How many orders belong to the Electronics category?
-- Concept: WHERE
-- =====================================================

SELECT *
FROM ecommerce_sales
WHERE product_category = 'Electronics';


-- =====================================================
-- Q14. How many orders were placed in the South region?
-- Concept: WHERE
-- =====================================================

SELECT *
FROM ecommerce_sales
WHERE region = 'South';


-- =====================================================
-- Q15. How many orders received a 5.0 customer rating?
-- Concept: WHERE
-- =====================================================

SELECT *
FROM ecommerce_sales
WHERE customer_rating = 5.0;


-- =====================================================
-- Q16. How many orders were delivered within 3 days?
-- Concept: WHERE with comparison operator
-- =====================================================

SELECT *
FROM ecommerce_sales
WHERE delivery_days <= 3;


-- =====================================================
-- Q17. What are the top 10 orders by revenue?
-- Concept: ORDER BY + LIMIT
-- =====================================================

SELECT *
FROM ecommerce_sales
ORDER BY revenue DESC
LIMIT 10;


-- =====================================================
-- Q18. What are the 10 lowest-revenue orders?
-- Concept: ORDER BY + LIMIT
-- =====================================================

SELECT *
FROM ecommerce_sales
ORDER BY revenue ASC
LIMIT 10;


-- =====================================================
-- Q19. What are the 10 highest-rated orders?
-- Concept: ORDER BY + LIMIT
-- =====================================================

SELECT *
FROM ecommerce_sales
ORDER BY customer_rating DESC
LIMIT 10;


-- =====================================================
-- Q20. Which 10 orders had the longest delivery times?
-- Concept: ORDER BY + LIMIT
-- =====================================================

SELECT *
FROM ecommerce_sales
ORDER BY delivery_days DESC
LIMIT 10;


-- =====================================================
-- Q21. How many orders were placed in each product category?
-- Concept: GROUP BY + COUNT()
-- =====================================================

SELECT
    product_category,
    COUNT(*) AS total_orders
FROM ecommerce_sales
GROUP BY product_category;


-- =====================================================
-- Q22. How much revenue was generated by each product category?
-- Concept: GROUP BY + SUM()
-- =====================================================

SELECT
    product_category,
    SUM(revenue) AS total_revenue
FROM ecommerce_sales
GROUP BY product_category;


-- =====================================================
-- Q23. What is the average revenue per order for each
-- product category?
-- Concept: GROUP BY + AVG()
-- =====================================================

SELECT
    product_category,
    AVG(revenue) AS average_revenue_per_order
FROM ecommerce_sales
GROUP BY product_category;


-- =====================================================
-- Q24. How many orders were placed in each region?
-- Concept: GROUP BY + COUNT()
-- =====================================================

SELECT
    region,
    COUNT(*) AS total_orders
FROM ecommerce_sales
GROUP BY region;


-- =====================================================
-- Q25. How much revenue was generated in each region?
-- Concept: GROUP BY + SUM()
-- =====================================================

SELECT
    region,
    SUM(revenue) AS total_revenue
FROM ecommerce_sales
GROUP BY region;


-- =====================================================
-- Q26. What is the average customer rating in each region?
-- Concept: GROUP BY + AVG()
-- =====================================================

SELECT
    region,
    AVG(customer_rating) AS average_rating
FROM ecommerce_sales
GROUP BY region;


-- =====================================================
-- Q27. How many orders were placed using each payment method?
-- Concept: GROUP BY + COUNT()
-- =====================================================

SELECT
    payment_method,
    COUNT(*) AS total_orders
FROM ecommerce_sales
GROUP BY payment_method;


-- =====================================================
-- Q28. How much revenue was generated through each
-- payment method?
-- Concept: GROUP BY + SUM()
-- =====================================================

SELECT
    payment_method,
    SUM(revenue) AS total_revenue
FROM ecommerce_sales
GROUP BY payment_method;


-- =====================================================
-- Q29. What is the average delivery time for each
-- product category?
-- Concept: GROUP BY + AVG()
-- =====================================================

SELECT
    product_category,
    AVG(delivery_days) AS average_delivery_days
FROM ecommerce_sales
GROUP BY product_category;


-- =====================================================
-- Q30. What is the average discount offered for each
-- product category?
-- Concept: GROUP BY + AVG()
-- =====================================================

SELECT
    product_category,
    AVG(discount) AS average_discount
FROM ecommerce_sales
GROUP BY product_category;