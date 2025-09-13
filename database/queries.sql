-- =============================================
-- Sample SQL Queries for Store Management System
-- =============================================

-- 1. Truy vấn cơ bản - Lấy tất cả sản phẩm
SELECT * FROM products;

-- 2. Lấy sản phẩm theo danh mục
SELECT p.name, p.price, c.name as category_name
FROM products p
JOIN categories c ON p.category_id = c.id
WHERE c.name = 'Điện tử';

-- 3. Lấy top 5 sản phẩm có giá cao nhất
SELECT name, price, stock_quantity
FROM products
ORDER BY price DESC
LIMIT 5;

-- 4. Lấy thông tin khách hàng và tổng số đơn hàng
SELECT 
    c.name,
    c.email,
    COUNT(o.id) as total_orders,
    SUM(o.total_amount) as total_spent
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.name, c.email;

-- 5. Lấy chi tiết đơn hàng với tên sản phẩm
SELECT 
    o.id as order_id,
    c.name as customer_name,
    o.order_date,
    o.total_amount,
    o.status
FROM orders o
JOIN customers c ON o.customer_id = c.id
ORDER BY o.order_date DESC;

-- 6. Lấy sản phẩm bán chạy nhất (theo số lượng đã bán)
SELECT 
    p.name,
    p.sku,
    SUM(oi.quantity) as total_sold,
    SUM(oi.total_price) as total_revenue
FROM products p
JOIN order_items oi ON p.id = oi.product_id
JOIN orders o ON oi.order_id = o.id
WHERE o.status != 'cancelled'
GROUP BY p.id, p.name, p.sku
ORDER BY total_sold DESC;

-- 7. Lấy doanh thu theo tháng
SELECT 
    YEAR(order_date) as year,
    MONTH(order_date) as month,
    COUNT(*) as total_orders,
    SUM(total_amount) as total_revenue
FROM orders
WHERE status = 'delivered'
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year DESC, month DESC;

-- 8. Lấy sản phẩm sắp hết hàng (stock < 30)
SELECT 
    name,
    sku,
    stock_quantity,
    price
FROM products
WHERE stock_quantity < 30
ORDER BY stock_quantity ASC;

-- 9. Lấy thông tin nhà cung cấp và sản phẩm của họ
SELECT 
    s.name as supplier_name,
    s.contact_person,
    s.phone,
    p.name as product_name,
    ps.supplier_sku,
    ps.cost_price
FROM suppliers s
JOIN product_suppliers ps ON s.id = ps.supplier_id
JOIN products p ON ps.product_id = p.id
ORDER BY s.name, p.name;

-- 10. Lấy đơn hàng chưa được xử lý
SELECT 
    o.id,
    c.name as customer_name,
    c.phone,
    o.order_date,
    o.total_amount,
    o.status
FROM orders o
JOIN customers c ON o.customer_id = c.id
WHERE o.status IN ('pending', 'processing')
ORDER BY o.order_date ASC;

-- 11. Tính tổng doanh thu theo danh mục sản phẩm
SELECT 
    c.name as category_name,
    COUNT(DISTINCT oi.order_id) as total_orders,
    SUM(oi.quantity) as total_quantity_sold,
    SUM(oi.total_price) as total_revenue
FROM categories c
JOIN products p ON c.id = p.category_id
JOIN order_items oi ON p.id = oi.product_id
JOIN orders o ON oi.order_id = o.id
WHERE o.status = 'delivered'
GROUP BY c.id, c.name
ORDER BY total_revenue DESC;

-- 12. Lấy khách hàng VIP (tổng mua hàng > 50 triệu)
SELECT 
    c.name,
    c.email,
    c.phone,
    COUNT(o.id) as total_orders,
    SUM(o.total_amount) as total_spent
FROM customers c
JOIN orders o ON c.id = o.customer_id
WHERE o.status = 'delivered'
GROUP BY c.id, c.name, c.email, c.phone
HAVING total_spent > 50000000
ORDER BY total_spent DESC;

-- 13. Cập nhật số lượng tồn kho sau khi bán
-- (Ví dụ: sau khi bán 2 sản phẩm có ID = 1)
UPDATE products 
SET stock_quantity = stock_quantity - 2 
WHERE id = 1;

-- 14. Thêm sản phẩm mới
INSERT INTO products (name, description, price, category_id, stock_quantity, sku)
VALUES ('Laptop Gaming', 'Laptop chơi game cao cấp', 15990000, 1, 15, 'LG-001');

-- 15. Xóa đơn hàng đã hủy (cẩn thận khi sử dụng)
-- DELETE FROM orders WHERE status = 'cancelled' AND order_date < '2024-01-01';
