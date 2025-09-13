# Database Design Documentation

## Tổng quan

Hệ thống quản lý cửa hàng được thiết kế để quản lý sản phẩm, khách hàng, đơn hàng và nhà cung cấp. Database được thiết kế theo mô hình quan hệ chuẩn hóa để đảm bảo tính nhất quán và hiệu suất.

## Sơ đồ ERD (Entity Relationship Diagram)

```
Categories (1) -----> (N) Products
                           |
                           | (N)
                           |
                    Order_Items (N) <----- (1) Orders
                           |                    |
                           |                    | (N)
                           |                    |
                    Product_Suppliers (N) <----- (1) Customers
                           |
                           | (N)
                           |
                    Suppliers
```

## Mô tả các bảng

### 1. Categories (Danh mục sản phẩm)
- **Mục đích**: Phân loại sản phẩm theo danh mục
- **Khóa chính**: `id`
- **Các trường**:
  - `id`: ID duy nhất (AUTO_INCREMENT)
  - `name`: Tên danh mục (VARCHAR(100), NOT NULL)
  - `description`: Mô tả danh mục (TEXT)
  - `created_at`: Thời gian tạo (TIMESTAMP)

### 2. Products (Sản phẩm)
- **Mục đích**: Lưu trữ thông tin sản phẩm
- **Khóa chính**: `id`
- **Khóa ngoại**: `category_id` → `categories(id)`
- **Các trường**:
  - `id`: ID duy nhất (AUTO_INCREMENT)
  - `name`: Tên sản phẩm (VARCHAR(255), NOT NULL)
  - `description`: Mô tả sản phẩm (TEXT)
  - `price`: Giá sản phẩm (DECIMAL(10,2), NOT NULL)
  - `category_id`: ID danh mục (INT, Foreign Key)
  - `stock_quantity`: Số lượng tồn kho (INT, DEFAULT 0)
  - `sku`: Mã sản phẩm (VARCHAR(50), UNIQUE)
  - `created_at`: Thời gian tạo (TIMESTAMP)
  - `updated_at`: Thời gian cập nhật (TIMESTAMP)

### 3. Customers (Khách hàng)
- **Mục đích**: Lưu trữ thông tin khách hàng
- **Khóa chính**: `id`
- **Các trường**:
  - `id`: ID duy nhất (AUTO_INCREMENT)
  - `name`: Tên khách hàng (VARCHAR(255), NOT NULL)
  - `email`: Email (VARCHAR(255), UNIQUE, NOT NULL)
  - `phone`: Số điện thoại (VARCHAR(20))
  - `address`: Địa chỉ (TEXT)
  - `date_of_birth`: Ngày sinh (DATE)
  - `created_at`: Thời gian tạo (TIMESTAMP)
  - `updated_at`: Thời gian cập nhật (TIMESTAMP)

### 4. Orders (Đơn hàng)
- **Mục đích**: Lưu trữ thông tin đơn hàng
- **Khóa chính**: `id`
- **Khóa ngoại**: `customer_id` → `customers(id)`
- **Các trường**:
  - `id`: ID duy nhất (AUTO_INCREMENT)
  - `customer_id`: ID khách hàng (INT, NOT NULL, Foreign Key)
  - `order_date`: Ngày đặt hàng (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
  - `total_amount`: Tổng tiền (DECIMAL(10,2), NOT NULL)
  - `status`: Trạng thái đơn hàng (ENUM)
  - `shipping_address`: Địa chỉ giao hàng (TEXT)
  - `notes`: Ghi chú (TEXT)
  - `created_at`: Thời gian tạo (TIMESTAMP)
  - `updated_at`: Thời gian cập nhật (TIMESTAMP)

### 5. Order_Items (Chi tiết đơn hàng)
- **Mục đích**: Lưu trữ chi tiết từng sản phẩm trong đơn hàng
- **Khóa chính**: `id`
- **Khóa ngoại**: 
  - `order_id` → `orders(id)`
  - `product_id` → `products(id)`
- **Các trường**:
  - `id`: ID duy nhất (AUTO_INCREMENT)
  - `order_id`: ID đơn hàng (INT, NOT NULL, Foreign Key)
  - `product_id`: ID sản phẩm (INT, NOT NULL, Foreign Key)
  - `quantity`: Số lượng (INT, NOT NULL, CHECK > 0)
  - `unit_price`: Giá đơn vị (DECIMAL(10,2), NOT NULL)
  - `total_price`: Tổng tiền (DECIMAL(10,2), NOT NULL)
  - `created_at`: Thời gian tạo (TIMESTAMP)

### 6. Suppliers (Nhà cung cấp)
- **Mục đích**: Lưu trữ thông tin nhà cung cấp
- **Khóa chính**: `id`
- **Các trường**:
  - `id`: ID duy nhất (AUTO_INCREMENT)
  - `name`: Tên nhà cung cấp (VARCHAR(255), NOT NULL)
  - `contact_person`: Người liên hệ (VARCHAR(255))
  - `email`: Email (VARCHAR(255))
  - `phone`: Số điện thoại (VARCHAR(20))
  - `address`: Địa chỉ (TEXT)
  - `created_at`: Thời gian tạo (TIMESTAMP)

### 7. Product_Suppliers (Liên kết sản phẩm - nhà cung cấp)
- **Mục đích**: Quản lý mối quan hệ nhiều-nhiều giữa sản phẩm và nhà cung cấp
- **Khóa chính**: `id`
- **Khóa ngoại**: 
  - `product_id` → `products(id)`
  - `supplier_id` → `suppliers(id)`
- **Các trường**:
  - `id`: ID duy nhất (AUTO_INCREMENT)
  - `product_id`: ID sản phẩm (INT, NOT NULL, Foreign Key)
  - `supplier_id`: ID nhà cung cấp (INT, NOT NULL, Foreign Key)
  - `supplier_sku`: Mã SKU của nhà cung cấp (VARCHAR(100))
  - `cost_price`: Giá nhập (DECIMAL(10,2))
  - `created_at`: Thời gian tạo (TIMESTAMP)

## Ràng buộc và Quy tắc

### 1. Ràng buộc khóa ngoại
- Khi xóa category, sản phẩm sẽ có `category_id = NULL`
- Khi xóa customer, tất cả orders sẽ bị xóa (CASCADE)
- Khi xóa order, tất cả order_items sẽ bị xóa (CASCADE)
- Khi xóa product, tất cả order_items và product_suppliers liên quan sẽ bị xóa (CASCADE)

### 2. Ràng buộc dữ liệu
- `quantity` trong `order_items` phải > 0
- `email` trong `customers` phải unique
- `sku` trong `products` phải unique
- `status` trong `orders` chỉ chấp nhận các giá trị: 'pending', 'processing', 'shipped', 'delivered', 'cancelled'

### 3. Indexes
- `idx_products_category`: Tối ưu truy vấn theo danh mục
- `idx_products_sku`: Tối ưu tìm kiếm theo SKU
- `idx_orders_customer`: Tối ưu truy vấn đơn hàng theo khách hàng
- `idx_orders_date`: Tối ưu truy vấn theo ngày
- `idx_customers_email`: Tối ưu tìm kiếm khách hàng theo email

## Các truy vấn quan trọng

### 1. Báo cáo doanh thu
```sql
SELECT 
    DATE(order_date) as date,
    SUM(total_amount) as daily_revenue
FROM orders 
WHERE status = 'delivered'
GROUP BY DATE(order_date)
ORDER BY date DESC;
```

### 2. Sản phẩm bán chạy
```sql
SELECT 
    p.name,
    SUM(oi.quantity) as total_sold
FROM products p
JOIN order_items oi ON p.id = oi.product_id
JOIN orders o ON oi.order_id = o.id
WHERE o.status = 'delivered'
GROUP BY p.id, p.name
ORDER BY total_sold DESC;
```

### 3. Khách hàng VIP
```sql
SELECT 
    c.name,
    SUM(o.total_amount) as total_spent
FROM customers c
JOIN orders o ON c.id = o.customer_id
WHERE o.status = 'delivered'
GROUP BY c.id, c.name
HAVING total_spent > 50000000
ORDER BY total_spent DESC;
```

## Mở rộng trong tương lai

1. **Bảng Reviews**: Đánh giá sản phẩm từ khách hàng
2. **Bảng Discounts**: Mã giảm giá và khuyến mãi
3. **Bảng Inventory**: Lịch sử nhập/xuất kho
4. **Bảng Payments**: Thông tin thanh toán
5. **Bảng Shipping**: Thông tin vận chuyển
