# 🛒 E-Commerce Sales Analytics — SQL Project

## 📌 Project Overview

This project analyzes an e-commerce sales dataset using **MySQL** to identify sales trends, customer behavior, product performance, regional performance, payment preferences, delivery performance, and other business insights.

The objective is to transform raw e-commerce transaction data into meaningful business insights using SQL.

This project is part of my **Data Analytics Portfolio**, focusing on practical SQL skills and real-world business analysis.

---

## 🎯 Business Objective

The main objective of this project is to answer important business questions such as:

- How much revenue does the business generate?
- Which product categories generate the most revenue?
- Which regions perform the best?
- Who are the highest-value customers?
- How many customers are repeat customers?
- Which payment method is most commonly used?
- Does delivery time affect customer satisfaction?
- How does discounting affect revenue?
- How does revenue change over time?

---

## 📊 Dataset

The dataset contains **5,000 e-commerce orders**.

### Dataset Columns

| Column | Description |
|---|---|
| `order_id` | Unique identifier for each order |
| `order_date` | Date when the order was placed |
| `customer_id` | Unique customer identifier |
| `product_category` | Product category |
| `region` | Customer/order region |
| `quantity` | Number of products purchased |
| `unit_price` | Price per unit |
| `discount` | Discount applied to the order |
| `payment_method` | Payment method used |
| `delivery_days` | Number of days taken for delivery |
| `customer_rating` | Customer rating |
| `revenue` | Revenue generated from the order |

---

## 📈 Dataset Summary

- **Total Orders:** 5,000
- **Unique Customers:** 989
- **Product Categories:** Beauty, Clothing, Electronics, Home
- **Regions:** North, South, East, West
- **Payment Methods:** Wallet, Card, COD

---

## 🛠️ Technologies Used

- MySQL
- MySQL Workbench
- SQL
- VS Code
- Git
- GitHub

---

## 🧠 SQL Concepts Practiced

### Beginner

- `SELECT`
- `DISTINCT`
- `COUNT()`
- `COUNT(DISTINCT)`
- `SUM()`
- `AVG()`
- `MIN()`
- `MAX()`
- `WHERE`
- Comparison operators
- `ORDER BY`
- `LIMIT`
- `GROUP BY`

### Intermediate

- `CASE`
- Calculated columns
- `HAVING`
- Date functions
- Customer-level analysis
- Aggregations
- Revenue classification
- Subqueries

### Advanced

- CTEs
- Window functions
- `RANK()`
- `ROW_NUMBER()`
- `LAG()`
- Running totals
- Customer segmentation
- Percentage calculations
- Month-over-month growth
- Top-N analysis

---

## 📂 Project Structure

```text
Ecommerce-Analytics/
│
├── dataset/
│   └── ecommerce_sales_analytics_5000.csv
│
├── screenshots/
│   ├── 01_database.png
│   ├── 02_table_structure.png
│   ├── 03_data_validation.png
│   ├── 04_basic_analysis.png
│   ├── 05_sales_analysis.png
│   ├── 06_customer_analysis.png
│   ├── 07_advanced_sql.png
│   └── 08_final_results.png
│
├── beginner_queries.sql
├── intermediate_queries.sql
├── advanced_queries.sql
├── business_questions.sql
├── business_questions.md
├── insights.md
├── schema.sql
└── README.md