-- database: :memory:
-- source_east table
CREATE TABLE sales_east (
  sales_id INT PRIMARY KEY,
  customer_id INT,
  product_id INT,
  quantity INT,
  amount DECIMAL(10,2),
  sale_timestamp TIMESTAMP
);
-- initial load
INSERT INTO sales_east VALUES
(1,101,201,2,200.00, '2025-08-01 10:00:00'),
(2,102,202,1,150.00, '2025-08-02 10:05:00'),
(3,103,203,5,750.00, '2025-08-03 10:10:00'),
(4,104,204,3,450.00, '2025-08-04 10:15:00'),
(5,105,205,4,600.00, '2025-08-05 10:20:00');

-- # Insert 2 (Incremental Load)
INSERT INTO sales_east VALUES
(6, 101, 203, 1, 100.00, '2025-08-02 09:00:00'),
(7, 106, 206, 2, 250.00, '2025-08-02 09:15:00');

-----------------------------------------------------------------------------------

-- create ewst table
CREATE TABLE sales_west (
  sales_id INT PRIMARY KEY,
  customer_id INT,
  product_id INT,
  quantity INT,
  amount DECIMAL(10,2),
  sale_timestamp TIMESTAMP
);

--insert 1 (Initial load)
INSERT INTO sales_west VALUES
(6,106,206,2,220.00, '2025-08-06 10:25:00'),
(7,107,207,1,180.00, '2025-08-07 10:30:00'),
(8,108,208,4,640.00, '2025-08-08 10:35:00'),
(9,109,209,3,480.00, '2025-08-09 10:40:00'),
(10,110,210,5,800.00, '2025-08-10 10:45:00');

-- Insert 2 (Incremental Load)
INSERT INTO sales_west VALUES
(13, 112, 212, 2, 300.00, '2025-08-02 09:30:00'),
(14, 107, 208, 1, 130.00, '2025-08-02 09:45:00');
----------------------------------------------------------------------------------------------------------------------
-- create products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    last_updated TIMESTAMP
);

-- Insert 1 (Initial Load)
INSERT INTO products VALUES
(201, 'Laptop', 'Electronics', 1000.00, '2025-07-31 12:00:00'),
(202, 'Phone', 'Electronics', 120.00, '2025-07-31 12:05:00'),
(203, 'Monitor', 'Electronics', 100.00, '2025-07-31 12:10:00'),
(204, 'Chair', 'Furniture', 110.00, '2025-07-31 12:15:00'),
(205, 'Desk', 'Furniture', 150.00, '2025-07-31 12:20:00'),
(206, 'Mouse', 'Electronics', 50.00, '2025-07-31 12:25:00'),
(207, 'Keyboard', 'Electronics', 60.00, '2025-07-31 12:30:00'),
(208, 'Lamp', 'Furniture', 130.00, '2025-07-31 12:35:00'),
(209, 'Router', 'Electronics', 130.00, '2025-07-31 12:40:00'),
(210, 'Table', 'Furniture', 130.00, '2025-07-31 12:45:00'),
(211, 'Notebook', 'Stationery', 140.00, '2025-07-31 12:50:00'),
(212, 'Pen', 'Stationery', 150.00, '2025-07-31 12:55:00');


--  Insert 2 (SCD Update)
-- Price change for product_id 203
INSERT INTO products VALUES
(203, 'Monitor', 'Electronics', 90.00, '2025-08-02 08:00:00');

-- -- Name change for product_id 208
INSERT INTO products VALUES
(208, 'Desk Lamp', 'Furniture', 130.00, '2025-08-02 08:10:00');

------------------------------------------------------------------------------------------------------------------------
-- create customer table

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    region VARCHAR(50),
    last_updated TIMESTAMP
);


--  Insert 1 (Initial Load)
INSERT INTO customers VALUES
(101, 'Alice', 'East', '2025-07-31 13:00:00'),
(102, 'Bob', 'East', '2025-07-31 13:05:00'),
(103, 'Charlie', 'East', '2025-07-31 13:10:00'),
(104, 'Diana', 'East', '2025-07-31 13:15:00'),
(105, 'Ethan', 'East', '2025-07-31 13:20:00'),
(106, 'Fiona', 'East', '2025-07-31 13:25:00'),
(107, 'George', 'West', '2025-07-31 13:30:00'),
(108, 'Hannah', 'West', '2025-07-31 13:35:00'),
(109, 'Ian', 'West', '2025-07-31 13:40:00'),
(110, 'Jane', 'West', '2025-07-31 13:45:00'),
(111, 'Kevin', 'West', '2025-07-31 13:50:00'),
(112, 'Laura', 'West', '2025-07-31 13:55:00');


--  Insert 2 (SCD Update)
-- Region change for customer 103
INSERT INTO customers VALUES
(103, 'Charlie', 'Central', '2025-08-02 08:30:00');

-- Name correction for customer 107
INSERT INTO customers VALUES
(107, 'George Smith', 'West', '2025-08-02 08:40:00');











