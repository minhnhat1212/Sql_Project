-- =============================================
-- Setup Script for Store Management Database
-- =============================================

-- Script này chứa các lệnh để thiết lập database từ đầu
-- Chạy các file theo thứ tự:
-- 1. database/schema.sql
-- 2. database/sample_data.sql
-- 3. database/queries.sql (để test)

-- Tạo database mới (uncomment nếu cần)
-- DROP DATABASE IF EXISTS store_management;
-- CREATE DATABASE store_management;
-- USE store_management;

-- Kiểm tra xem database có tồn tại không
SELECT 'Database setup completed successfully!' as status;

-- Hiển thị thông tin các bảng đã tạo
SELECT 
    TABLE_NAME as 'Table Name',
    TABLE_ROWS as 'Number of Rows',
    CREATE_TIME as 'Created At'
FROM information_schema.TABLES 
WHERE TABLE_SCHEMA = DATABASE()
ORDER BY TABLE_NAME;

-- Hiển thị thống kê tổng quan
SELECT 
    'Total Tables' as Metric,
    COUNT(*) as Value
FROM information_schema.TABLES 
WHERE TABLE_SCHEMA = DATABASE()

UNION ALL

SELECT 
    'Total Products',
    COUNT(*)
FROM products

UNION ALL

SELECT 
    'Total Customers',
    COUNT(*)
FROM customers

UNION ALL

SELECT 
    'Total Orders',
    COUNT(*)
FROM orders

UNION ALL

SELECT 
    'Total Categories',
    COUNT(*)
FROM categories

UNION ALL

SELECT 
    'Total Suppliers',
    COUNT(*)
FROM suppliers;
