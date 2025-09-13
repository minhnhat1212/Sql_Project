-- =============================================
-- Backup Script for Store Management Database
-- =============================================

-- Script này tạo backup cho database store_management
-- Sử dụng cho MySQL/MariaDB

-- Tạo backup của toàn bộ database
-- mysqldump -u username -p store_management > backup_$(date +%Y%m%d_%H%M%S).sql

-- Tạo backup chỉ schema (không có data)
-- mysqldump -u username -p --no-data store_management > schema_backup_$(date +%Y%m%d_%H%M%S).sql

-- Tạo backup chỉ data (không có schema)
-- mysqldump -u username -p --no-create-info store_management > data_backup_$(date +%Y%m%d_%H%M%S).sql

-- Backup các bảng cụ thể
-- mysqldump -u username -p store_management products customers orders > tables_backup_$(date +%Y%m%d_%H%M%S).sql

-- Restore từ backup
-- mysql -u username -p store_management < backup_file.sql

-- Kiểm tra kích thước database
SELECT 
    table_schema as 'Database',
    ROUND(SUM(data_length + index_length) / 1024 / 1024, 2) as 'Size (MB)'
FROM information_schema.tables 
WHERE table_schema = 'store_management'
GROUP BY table_schema;

-- Kiểm tra kích thước từng bảng
SELECT 
    table_name as 'Table',
    ROUND(((data_length + index_length) / 1024 / 1024), 2) as 'Size (MB)',
    table_rows as 'Rows'
FROM information_schema.tables 
WHERE table_schema = 'store_management'
ORDER BY (data_length + index_length) DESC;
