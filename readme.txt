LIÊN HỆ- GIAO HÀNG 

1. GIỚI THIỆU
Module gồm 7 chức năng chính:
Đăng nhập - phân quyền
Quản lý khách hàng
Nhân viên CSKH
Quản lý đơn hàng
Liên hệ
Vận chuyển
Dịch vụ khách hàng ( chat khách hàng ↔ Nhân viên CSKH)
2. CHỨC NĂNG HỆ THỐNG 
2.1.Đăng nhập – Đăng ký – Phân quyền
-Đăng ký tài khoản khách hàng
-Đăng nhập
-Đăng xuất
-Phân quyền
Mỗi role có giao diện riêng:
customer: mua hàng, xem đơn, chat CSKH.
staff (CSKH): xem contact, trả lời chat, xử lý đơn.
delivery: xem danh sách đơn giao, cập nhật trạng thái.
admin: toàn quyền quản trị.
2.2.Quản lý Khách hàng
-Lưu thông tin khách hàng gồm họ tên, số điện thoại, email, địa chỉ.
-Khi khách hàng đặt hàng hoặc gửi liên hệ, hệ thống tự động liên kết CustomerID.
-Dữ liệu được lưu vào bảng customer.
2.3.Quản lý Đơn hàng
-Người dùng đặt hàng và nhập thông tin giao hàng.
-Hệ thống tự động tạo đơn mới và lưu vào bảng orders.
-Cập nhật trạng thái đơn hàng: chờ xử lý, đang giao, hoàn tất.
 2.4.Trang Liên hệ
-Người dùng gửi câu hỏi, góp ý, yêu cầu hỗ trợ.
-Hệ thống lưu thông tin vào bảng contact.
-Hiển thị thông báo gửi thành công hoặc thất bại.
2.5.Quản lý Vận chuyển
-Người dùng nhập mã đơn để xem trạng thái giao hàng.
-Nhân viên giao hàng cập nhật tình trạng vận chuyển.
-Thông tin được lưu vào bảng delivery.
2.6.Dịch vụ khách hàng
-Hiển thị chính sách đổi trả, bảo hành, phương thức thanh toán.
-Hỗ trợ giải đáp thắc mắc cho khách hàng.
-Liên kết với bảng customer_service để quản lý nhân viên hỗ trợ.
2.7.Chat Khách Hàng ↔ Nhân Viên CSKH
-Hỗ trợ chat 2 chiều real-time (AJAX hoặc WebSocket).
Giao diện chat:
Khung nhập tin nhắn.
Danh sách cuộc trò chuyện (dành cho CSKH).
-Nhân viên CSKH:
Trả lời nhiều khách cùng lúc.

3. CÀI ĐẶT MÔI TRƯỜNG
Yêu cầu:
• XAMPP (Apache + PHP)
• MySQL Server
• MySQL Workbench


Cách chạy:
1. Sao chép thư mục vào đường dẫn 
   C:\xampp\htdocs\GIAYDEP

2. Khởi động XAMPP:
   - Start Apache

3. Mở MySQL Workbench → Kết nối MySQL Server

4. Tạo database:
   CREATE DATABASE giaohang;
   USE giaohang;

5. Cấu hình kết nối config.php:
   Mở file config.php và chỉnh:
      $host = "127.0.0.1"; 
      $user = "root"; 
      $pass = "********"; 
      $db   = "giaohang";
6.Chạy website qua trình duyệt:
   http://localhost/GIAYDEP/.....
 
4.CHI TIẾT TỪNG TRANG 
4.1.Tang đăng nhập/ đăng xuất (khách hàng, nhân viên, tài xế)
Đăng nhập: Chức năng
-Người dùng nhập username & password.
-Kiểm tra thông tin trong bảng USERS.
-Phân quyền truy cập:
Admin
Nhân viên (Staff)
Khách hàng (Customer)
-Lưu SESSION sau khi đăng nhập.
-Chuyển hướng đúng theo role.
Đăng xuất: Chức năng
-Xoá toàn bộ session đăng nhập.
-Trả về trang đăng nhập.
-Ngăn truy cập trang hệ thống nếu không đăng nhập.
4.2.Trang chủ
Chức năng:
-Hiển thị tổng quan hệ thống:( dành cho nhân viên)
Tổng số đơn hàng
Đơn hàng hôm nay
Doanh thu tháng
-Chào người dùng theo từng role (Admin / Staff / Customer).
-Menu truy cập các trang: Đơn hàng – Chat – Liên hệ tài xế – Đăng xuất.
4.3.Trang Chat Hỗ Trợ
Chức năng:
-Khách hàng gửi tin nhắn cho nhân viên CSKH.
-Nhân viên CSKH trả lời trực tiếp.
-Tin nhắn lưu tại bảng MESSAGES.
-Chat theo thời gian thực (nếu dùng AJAX).
-Mỗi user chỉ được chat bằng tài khoản đã đăng nhập.
4.4.Trang Đơn Hàng 
Chức năng đối với từng loại tài khoản:
✔ Admin
-Xem toàn bộ đơn hàng.
-Cập nhật trạng thái đơn hàng.
-Xem chi tiết đơn hàng.
✔ Tài xế
-Xử lý đơn hàng được phân công.
-Cập nhật trạng thái: chờ – đang giao – đã giao.
-Xem thông tin khách hàng và địa chỉ giao hàng.
✔ Khách hàng (Customer)
-Xem danh sách đơn hàng của riêng mình.
-Theo dõi trạng thái đơn hàng.
-Xem chi tiết đơn hàng.
4.5.Trang Liên Hệ Tài Xế 
Chức năng: Chỉ nhân viên cửa hàng và admin được truy cập.
-Nhân viên chọn đơn hàng cần giao.
-Gọi/nhắn tin cho tài xế phụ trách (DriverID).
-Cập nhật thông tin giao hàng vào bảng DELIVERY.
-Theo dõi tình trạng giao hàng.
-Khách hàng không được phép truy cập trang này.

5.CẤU TRÚC BẢNG TRONG MYSQL
--Lưu toàn bộ tài khoản đăng nhập (cả khách hàng và nhân viên)
CREATE TABLE USERS (
    ID INT(11) NOT NULL AUTO_INCREMENT,
    USERNAME VARCHAR(50) UNIQUE NOT NULL,
    PASSWORD VARCHAR(255) NOT NULL,
    ROLE ENUM('customer','staff') NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--Lưu thông tin khách hàng 
 CREATE TABLE CUSTOMER (
    CustomerID INT(11) NOT NULL AUTO_INCREMENT,
    FullName VARCHAR(255) COLLATE utf8_general_ci NOT NULL,
    PhoneNumber VARCHAR(20),
    Address VARCHAR(255) COLLATE utf8_general_ci,
    Email VARCHAR(100),
    PRIMARY KEY (CustomerID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--Lưu thông tin nhân viên CSKH (người xử lý liên hệ & chat)
CREATE TABLE CUSTOMER_SERVICE (
    CustomerServiceID INT(11) NOT NULL AUTO_INCREMENT,
    FullName VARCHAR(255) COLLATE utf8_general_ci NOT NULL,
    PhoneNumber VARCHAR(20),
    PRIMARY KEY (CustomerServiceID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--Lưu toàn bộ đơn hàng mà khách đặt.
CREATE TABLE ORDERS (
    OrderID INT(11) NOT NULL AUTO_INCREMENT,
    CustomerID INT(11) NOT NULL,
    OrderDate DATE,
    ShippingAddress VARCHAR(255) COLLATE utf8_general_ci,
    TotalAmount DECIMAL(10,2),
    OrderStatus VARCHAR(50) COLLATE utf8_general_ci,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
--Lưu thông tin giao hàng cho từng đơn.
CREATE TABLE DELIVERY (
    DeliveryID INT(11) NOT NULL AUTO_INCREMENT,
    OrderID INT(11) NOT NULL,
    DriverID INT(11),
    DeliveryDate DATE,
    DeliveryStatus VARCHAR(50) COLLATE utf8_general_ci,
    PRIMARY KEY (DeliveryID),
    FOREIGN KEY (OrderID) REFERENCES ORDERS(OrderID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--Lưu các yêu cầu liên hệ mà khách gửi đến CSKH.
CREATE TABLE CONTACT (
    ContactID INT(11) NOT NULL AUTO_INCREMENT,
    CustomerID INT(11) NOT NULL,
    CustomerServiceID INT(11),
    ContactDate DATE,
    Content VARCHAR(255) COLLATE utf8_general_ci,
    ContactStatus VARCHAR(50) COLLATE utf8_general_ci,
    PRIMARY KEY (ContactID),
FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (CustomerServiceID) REFERENCES CUSTOMER_SERVICE(CustomerServiceID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--Lưu tin nhắn chat giữa khách hàng ↔ nhân viên CSKH.
CREATE TABLE MESSAGES (
    ID INT(11) NOT NULL AUTO_INCREMENT,
    SENDER_ID INT(11) NOT NULL,
    RECEIVER_ID INT(11) NOT NULL,
    MESSAGE TEXT COLLATE utf8_general_ci NOT NULL,
    SENT_AT DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (ID),
    FOREIGN KEY (SENDER_ID) REFERENCES USERS(ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (RECEIVER_ID) REFERENCES USERS(ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

6.LƯU Ý 
• Chỉ cần MySQL Workbench để tạo database và bảng.
• Không sử dụng phpMyAdmin.
• Kiểm tra Apache đang chạy trước khi truy cập website.
• Nếu website báo lỗi kết nối → kiểm tra config.php.
