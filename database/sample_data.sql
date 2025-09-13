-- =============================================
-- Sample Data for Store Management System
-- =============================================

-- Thêm dữ liệu mẫu cho bảng categories
INSERT INTO categories (name, description) VALUES
('Điện tử', 'Các sản phẩm điện tử và công nghệ'),
('Thời trang', 'Quần áo, giày dép và phụ kiện'),
('Gia dụng', 'Đồ dùng trong nhà và nội thất'),
('Sách', 'Sách và tài liệu học tập'),
('Thể thao', 'Dụng cụ và trang phục thể thao');

-- Thêm dữ liệu mẫu cho bảng suppliers
INSERT INTO suppliers (name, contact_person, email, phone, address) VALUES
('Công ty ABC Electronics', 'Nguyễn Văn A', 'contact@abcelectronics.com', '0123456789', '123 Đường ABC, Quận 1, TP.HCM'),
('Fashion House Ltd', 'Trần Thị B', 'info@fashionhouse.com', '0987654321', '456 Đường XYZ, Quận 2, TP.HCM'),
('Home & Living Co', 'Lê Văn C', 'sales@homeliving.com', '0369258147', '789 Đường DEF, Quận 3, TP.HCM');

-- Thêm dữ liệu mẫu cho bảng products
INSERT INTO products (name, description, price, category_id, stock_quantity, sku) VALUES
('iPhone 15 Pro', 'Điện thoại thông minh cao cấp', 29990000, 1, 50, 'IPH15PRO'),
('Samsung Galaxy S24', 'Điện thoại Android flagship', 24990000, 1, 30, 'SGS24'),
('MacBook Air M2', 'Laptop Apple với chip M2', 25990000, 1, 25, 'MBA-M2'),
('Áo thun nam', 'Áo thun cotton 100%', 199000, 2, 100, 'AT-001'),
('Quần jean nữ', 'Quần jean slim fit', 599000, 2, 80, 'QJ-001'),
('Giày sneaker', 'Giày thể thao đa năng', 1299000, 2, 60, 'GS-001'),
('Nồi cơm điện', 'Nồi cơm điện tử 1.8L', 899000, 3, 40, 'NCE-001'),
('Máy lọc nước', 'Máy lọc nước RO 5 cấp', 2999000, 3, 20, 'MLN-001'),
('Sách lập trình', 'Clean Code - Robert Martin', 299000, 4, 50, 'SC-001'),
('Bóng đá', 'Bóng đá chính thức FIFA', 299000, 5, 30, 'BD-001');

-- Thêm dữ liệu mẫu cho bảng customers
INSERT INTO customers (name, email, phone, address, date_of_birth) VALUES
('Nguyễn Văn An', 'an.nguyen@email.com', '0123456789', '123 Đường A, Quận 1, TP.HCM', '1990-05-15'),
('Trần Thị Bình', 'binh.tran@email.com', '0987654321', '456 Đường B, Quận 2, TP.HCM', '1985-08-20'),
('Lê Văn Cường', 'cuong.le@email.com', '0369258147', '789 Đường C, Quận 3, TP.HCM', '1992-12-10'),
('Phạm Thị Dung', 'dung.pham@email.com', '0741852963', '321 Đường D, Quận 4, TP.HCM', '1988-03-25'),
('Hoàng Văn Em', 'em.hoang@email.com', '0159753186', '654 Đường E, Quận 5, TP.HCM', '1995-07-08');

-- Thêm dữ liệu mẫu cho bảng orders
INSERT INTO orders (customer_id, total_amount, status, shipping_address, notes) VALUES
(1, 29990000, 'delivered', '123 Đường A, Quận 1, TP.HCM', 'Giao hàng trong giờ hành chính'),
(2, 25990000, 'shipped', '456 Đường B, Quận 2, TP.HCM', 'Giao hàng nhanh'),
(3, 1299000, 'processing', '789 Đường C, Quận 3, TP.HCM', 'Kiểm tra kỹ trước khi giao'),
(1, 199000, 'delivered', '123 Đường A, Quận 1, TP.HCM', 'Đã giao thành công'),
(4, 2999000, 'pending', '321 Đường D, Quận 4, TP.HCM', 'Chờ xác nhận thanh toán');

-- Thêm dữ liệu mẫu cho bảng order_items
INSERT INTO order_items (order_id, product_id, quantity, unit_price, total_price) VALUES
(1, 1, 1, 29990000, 29990000),
(2, 3, 1, 25990000, 25990000),
(3, 6, 1, 1299000, 1299000),
(4, 4, 1, 199000, 199000),
(5, 8, 1, 2999000, 2999000);

-- Thêm dữ liệu mẫu cho bảng product_suppliers
INSERT INTO product_suppliers (product_id, supplier_id, supplier_sku, cost_price) VALUES
(1, 1, 'ABC-IPH15PRO', 25000000),
(2, 1, 'ABC-SGS24', 20000000),
(3, 1, 'ABC-MBA-M2', 22000000),
(4, 2, 'FH-AT001', 120000),
(5, 2, 'FH-QJ001', 350000),
(6, 2, 'FH-GS001', 800000),
(7, 3, 'HL-NCE001', 600000),
(8, 3, 'HL-MLN001', 2000000),
(9, 3, 'HL-SC001', 200000),
(10, 3, 'HL-BD001', 200000);
