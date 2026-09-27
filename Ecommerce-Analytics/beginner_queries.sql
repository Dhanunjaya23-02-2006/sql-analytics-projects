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
-- Q3. What are all the unique product categories
--     in the dataset?
-- Concept: DISTINCT
-- =====================================================

SELECT DISTINCT product_category
FROM ecommerce_sales;


-- =====================================================
-- Q4. What are all the unique regions in the dataset?
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
-- Q8. What is the highest revenue generated
--     from a single order?
-- Concept: MAX()
-- =====================================================

SELECT MAX(revenue) AS highest_order_revenue
FROM ecommerce_sales;


-- =====================================================
-- Q9. What is the lowest revenue generated
--     from a single order?
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
-- Q11. Which orders have revenue greater than ₹2,000?
-- Concept: WHERE
-- =====================================================

SELECT *
FROM ecommerce_sales
WHERE revenue > 2000;


-- =====================================================
-- Q12. Which orders have a quantity of 5 or more?
-- Concept: WHERE, >=
-- =====================================================

SELECT *
FROM ecommerce_sales
WHERE quantity >= 5;


-- =====================================================
-- Q13. Which orders belong to the Electronics category?
-- Concept: WHERE
-- =====================================================

SELECT *
FROM ecommerce_sales
WHERE product_category = 'Electronics';


-- =====================================================
-- Q14. Which orders were placed in the South region?
-- Concept: WHERE
-- =====================================================

SELECT *
FROM ecommerce_sales
WHERE region = 'South';


-- =====================================================
-- Q15. Which orders received a customer rating of 5.0?
-- Concept: WHERE
-- =====================================================

SELECT *
FROM ecommerce_sales
WHERE customer_rating = 5.0;


-- =====================================================
-- Q16. Which orders were delivered within 3 days?
-- Concept: WHERE, <=
-- =====================================================

SELECT *
FROM ecommerce_sales
WHERE delivery_days <= 3;