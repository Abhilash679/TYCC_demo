CREATE DATABASE TYCC;
USE TYCC;

CREATE TABLE IF NOT EXISTS menu_items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10, 2),
    category VARCHAR(50),
    department VARCHAR(50),
    stock_qty INT DEFAULT(0),
    unit_type TEXT,
    is_available BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    table_number VARCHAR(20),
    order_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    order_summary TEXT,
    total_amount DECIMAL(10, 2),
    status ENUM('pending', 'completed', 'cancelled') DEFAULT 'pending'
);
 SELECT * FROM menu_items;
 SELECT * FROM orders;
 
 CREATE TABLE IF NOT EXISTS order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    item_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (item_id) REFERENCES menu_items(item_id)
);
SELECT * FROM order_items;

CREATE TABLE IF NOT EXISTS inventory_movements (
    movement_id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT NOT NULL,
    movement_type ENUM('inbound', 'outbound') NOT NULL,
    quantity INT NOT NULL,
    note TEXT,
    movement_date DATE NOT NULL DEFAULT (CURDATE()),
    FOREIGN KEY (item_id) REFERENCES menu_items(item_id)
);
SELECT * FROM inventory_movements;

