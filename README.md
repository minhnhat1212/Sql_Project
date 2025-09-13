# SQL Project - Quản lý Cửa hàng

Đây là một project SQL cơ bản để quản lý cửa hàng với các bảng sản phẩm, khách hàng và đơn hàng.

## Cấu trúc Project

```
Sql_Project/
├── README.md
├── .gitignore
├── database/
│   ├── schema.sql
│   ├── sample_data.sql
│   └── queries.sql
├── docs/
│   └── database_design.md
└── scripts/
    └── setup.sql
```

## Cài đặt

1. Clone repository này về máy local
2. Import file `database/schema.sql` vào database của bạn
3. Chạy file `database/sample_data.sql` để thêm dữ liệu mẫu
4. Sử dụng file `database/queries.sql` để thực hành các câu truy vấn

## Cấu trúc Database

### Bảng Products (Sản phẩm)
- `id`: ID sản phẩm (Primary Key)
- `name`: Tên sản phẩm
- `price`: Giá sản phẩm
- `category`: Danh mục sản phẩm
- `stock_quantity`: Số lượng tồn kho

### Bảng Customers (Khách hàng)
- `id`: ID khách hàng (Primary Key)
- `name`: Tên khách hàng
- `email`: Email khách hàng
- `phone`: Số điện thoại
- `address`: Địa chỉ

### Bảng Orders (Đơn hàng)
- `id`: ID đơn hàng (Primary Key)
- `customer_id`: ID khách hàng (Foreign Key)
- `order_date`: Ngày đặt hàng
- `total_amount`: Tổng tiền

### Bảng Order_Items (Chi tiết đơn hàng)
- `id`: ID chi tiết (Primary Key)
- `order_id`: ID đơn hàng (Foreign Key)
- `product_id`: ID sản phẩm (Foreign Key)
- `quantity`: Số lượng
- `price`: Giá tại thời điểm mua

## Các câu truy vấn mẫu

Xem file `database/queries.sql` để tham khảo các câu truy vấn SQL cơ bản.

## Đóng góp

1. Fork project này
2. Tạo feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Mở Pull Request

## License

Distributed under the MIT License. See `LICENSE` for more information.
