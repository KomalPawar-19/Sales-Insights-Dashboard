/*
=====================================================
Sales Insights Dashboard - SQL Queries
Author: Komal Pawar

Purpose:
- Database exploration
- Data extraction
- Business analysis queries

Note:
Data cleaning and transformation were performed
using Power Query in Power BI.
=====================================================
*/


-- ==============================================
-- 1. Check Customers Table
-- ==============================================

SELECT *
FROM customers;



-- ==============================================
-- 2. Check Markets Table
-- ==============================================

SELECT *
FROM markets;



-- ==============================================
-- 3. Check Products Table
-- ==============================================

SELECT *
FROM products;



-- ==============================================
-- 4. Check Transactions Table
-- ==============================================

SELECT *
FROM transactions;



-- ==============================================
-- 5. Total Revenue Analysis
-- ==============================================

SELECT 
    SUM(sales_amount) AS Total_Revenue
FROM transactions;



-- ==============================================
-- 6. Total Sales Quantity Analysis
-- ==============================================

SELECT 
    SUM(sales_qty) AS Total_Sales_Quantity
FROM transactions;



-- ==============================================
-- 7. Revenue by Market
-- ==============================================

SELECT
    m.markets_name,
    SUM(t.sales_amount) AS Revenue
FROM transactions t
JOIN markets m
ON t.market_code = m.markets_code
GROUP BY m.markets_name
ORDER BY Revenue DESC;



-- ==============================================
-- 8. Sales Quantity by Market
-- ==============================================

SELECT
    m.markets_name,
    SUM(t.sales_qty) AS Total_Quantity
FROM transactions t
JOIN markets m
ON t.market_code = m.markets_code
GROUP BY m.markets_name
ORDER BY Total_Quantity DESC;



-- ==============================================
-- 9. Top Customers by Revenue
-- ==============================================

SELECT
    c.customers_name,
    SUM(t.sales_amount) AS Revenue
FROM transactions t
JOIN customers c
ON t.customer_code = c.customer_code
GROUP BY c.customers_name
ORDER BY Revenue DESC;



-- ==============================================
-- 10. Product Performance Analysis
-- ==============================================

SELECT
    p.product_code,
    SUM(t.sales_qty) AS Quantity_Sold,
    SUM(t.sales_amount) AS Revenue
FROM transactions t
JOIN products p
ON t.product_code = p.product_code
GROUP BY p.product_code
ORDER BY Revenue DESC;



-- ==============================================
-- 11. Monthly Revenue Trend
-- ==============================================

SELECT
    YEAR(order_date) AS Year,
    MONTH(order_date) AS Month,
    SUM(sales_amount) AS Revenue
FROM transactions
GROUP BY 
    YEAR(order_date),
    MONTH(order_date)
ORDER BY Year, Month;



-- ==============================================
-- 12. Yearly Revenue Analysis
-- ==============================================

SELECT
    YEAR(order_date) AS Year,
    SUM(sales_amount) AS Revenue
FROM transactions
GROUP BY YEAR(order_date)
ORDER BY Year;