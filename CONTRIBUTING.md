# Hướng dẫn Đóng góp (Contributing Guide)

Cảm ơn bạn đã quan tâm đến việc đóng góp cho project SQL này! 

## Cách đóng góp

### 1. Fork và Clone
```bash
# Fork repository này trên GitHub
# Sau đó clone về máy local
git clone https://github.com/YOUR_USERNAME/Sql_Project.git
cd Sql_Project
```

### 2. Tạo Branch mới
```bash
git checkout -b feature/your-feature-name
# hoặc
git checkout -b fix/your-bug-fix
```

### 3. Thực hiện thay đổi
- Thêm các file SQL mới vào thư mục `database/`
- Cập nhật documentation trong thư mục `docs/`
- Thêm các script hữu ích vào thư mục `scripts/`
- Cập nhật README.md nếu cần

### 4. Commit và Push
```bash
git add .
git commit -m "Add: Mô tả ngắn gọn về thay đổi"
git push origin feature/your-feature-name
```

### 5. Tạo Pull Request
- Vào GitHub repository
- Click "New Pull Request"
- Chọn branch của bạn
- Mô tả chi tiết về thay đổi
- Submit Pull Request

## Quy tắc đóng góp

### 1. Naming Convention
- **Files**: Sử dụng snake_case (ví dụ: `user_management.sql`)
- **Branches**: Sử dụng kebab-case (ví dụ: `feature/add-user-table`)
- **Commits**: Sử dụng tiếng Anh, format: `type: description`

### 2. Commit Types
- `feat`: Thêm tính năng mới
- `fix`: Sửa lỗi
- `docs`: Cập nhật documentation
- `style`: Thay đổi format code (không ảnh hưởng logic)
- `refactor`: Refactor code
- `test`: Thêm test cases
- `chore`: Cập nhật build tools, dependencies

### 3. SQL Code Style
```sql
-- Sử dụng UPPERCASE cho keywords
SELECT 
    column1,
    column2,
    column3
FROM table_name
WHERE condition = 'value'
ORDER BY column1;

-- Thêm comments giải thích
-- Lấy danh sách sản phẩm bán chạy nhất
SELECT 
    p.name,
    SUM(oi.quantity) as total_sold
FROM products p
JOIN order_items oi ON p.id = oi.product_id
GROUP BY p.id, p.name
ORDER BY total_sold DESC;
```

### 4. File Structure
```
database/
├── schema.sql          # Database schema
├── sample_data.sql     # Sample data
├── queries.sql         # Common queries
└── migrations/         # Database migrations
    └── 001_add_new_table.sql

docs/
├── database_design.md  # Database design docs
├── api_documentation.md
└── tutorials/
    └── getting_started.md

scripts/
├── setup.sql          # Setup script
├── backup.sql         # Backup script
└── maintenance.sql    # Maintenance queries
```

## Các loại đóng góp được chào đón

### 1. Database Schema
- Thêm bảng mới
- Cải thiện existing tables
- Thêm indexes để tối ưu performance
- Thêm constraints và validations

### 2. Sample Data
- Thêm dữ liệu mẫu realistic
- Tạo test cases
- Thêm edge cases

### 3. Queries
- Thêm useful queries
- Optimize existing queries
- Thêm complex reporting queries
- Performance tuning

### 4. Documentation
- Cải thiện README
- Thêm tutorials
- API documentation
- Code comments

### 5. Scripts
- Setup scripts
- Backup/restore scripts
- Maintenance scripts
- Migration scripts

## Báo cáo lỗi (Bug Reports)

Khi báo cáo lỗi, vui lòng bao gồm:

1. **Mô tả lỗi**: Mô tả rõ ràng lỗi gì xảy ra
2. **Steps to reproduce**: Các bước để tái tạo lỗi
3. **Expected behavior**: Hành vi mong đợi
4. **Actual behavior**: Hành vi thực tế
5. **Environment**: 
   - Database system (MySQL, PostgreSQL, SQL Server, etc.)
   - Version
   - OS
6. **Screenshots**: Nếu có thể

## Đề xuất tính năng (Feature Requests)

Khi đề xuất tính năng mới:

1. **Mô tả tính năng**: Mô tả chi tiết tính năng muốn thêm
2. **Use case**: Tại sao tính năng này hữu ích
3. **Implementation ideas**: Ý tưởng về cách implement
4. **Breaking changes**: Có ảnh hưởng gì đến existing code không

## Code Review Process

1. Tất cả PR sẽ được review bởi maintainers
2. Có thể cần thay đổi trước khi merge
3. Maintainers sẽ test code trước khi approve
4. PR sẽ được merge sau khi approved

## Liên hệ

Nếu có câu hỏi, vui lòng:
- Tạo issue trên GitHub
- Liên hệ qua email: [minhnhat12122004@gmail.com]

Cảm ơn bạn đã đóng góp! 🎉
