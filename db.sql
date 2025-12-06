
CREATE DATABASE IF NOT EXISTS giaohang1
CHARACTER SET utf8
COLLATE utf8_general_ci;

USE giaohang1;


/* ============================================
   ============================================ */
CREATE TABLE USERS (
    ID INT(11) NOT NULL AUTO_INCREMENT,
    USERNAME VARCHAR(50) UNIQUE NOT NULL,
    PASSWORD VARCHAR(255) NOT NULL,
    ROLE ENUM('customer','staff','driver') NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;



/* ============================================
BẢNG CUSTOMER
   ============================================ */
CREATE TABLE CUSTOMER (
    CustomerID INT(11) NOT NULL AUTO_INCREMENT,
    FullName VARCHAR(255) COLLATE utf8_general_ci NOT NULL,
    PhoneNumber VARCHAR(20),
    Address VARCHAR(255) COLLATE utf8_general_ci,
    Email VARCHAR(100),
    PRIMARY KEY (CustomerID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


/* ============================================
  BẢNG CUSTOMER_SERVICE (nhân viên CSKH)
   ============================================ */
CREATE TABLE CUSTOMER_SERVICE (
    CustomerServiceID INT(11) NOT NULL AUTO_INCREMENT,
    FullName VARCHAR(255) COLLATE utf8_general_ci NOT NULL,
    PhoneNumber VARCHAR(20),
    PRIMARY KEY (CustomerServiceID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


/* ============================================
  BẢNG ORDERS
   ============================================ */
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


/* ============================================
  BẢNG DELIVERY
   ============================================ */
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


/* ============================================
   BẢNG CONTACT (liên hệ CSKH)
   ============================================ */
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


/* ============================================
BẢNG MESSAGES (chat khách ↔ nhân viên)
   ============================================ */
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


CREATE TABLE MESSAGES_DRIVER (
    ID INT(11) NOT NULL AUTO_INCREMENT,
    SENDER_ID INT(11) NOT NULL,
    RECEIVER_ID INT(11) NOT NULL,
    MESSAGE TEXT NOT NULL,
    SENT_AT DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (ID),
    FOREIGN KEY (SENDER_ID) REFERENCES USERS(ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (RECEIVER_ID) REFERENCES USERS(ID) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO USERS (USERNAME, PASSWORD, ROLE) VALUES
('khach1', '123456', 'customer'),
('nhanvien1', '123456', 'staff'),
('khach2', '123456', 'customer'),
('taixe1', '123456', 'driver'),
('taixe2', '123456', 'driver');
