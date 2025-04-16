CREATE DATABASE IF NOT EXISTS lab_mysql;

USE lab_mysql;

CREATE TABLE if not exists customers (
    customer_id INT  PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100),
    address VARCHAR(100),
    city VARCHAR(50),
    state_province VARCHAR(50),
    country VARCHAR(50),
    postal_code VARCHAR(20)
);
INSERT INTO customers (customer_id,first_name, last_name, phone, email, address, city, state_province, country, postal_code)
VALUES 
(1,'John', 'Doe', '555-0101', 'john.doe@email.com', '123 Main St', 'Austin', 'Texas', 'USA', '78701'),
(2,'Jane', 'Smith', '555-0102', 'jane.smith@email.com', '456 Oak Ave', 'Boston', 'Massachusetts', 'USA', '02108'),
(3,'Robert', 'Johnson', '555-0103', 'robert.j@email.com', '789 Pine Rd', 'Chicago', 'Illinois', 'USA', '60601');
select * from customers;

CREATE TABLE if not exists salespersons (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    store_location VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20)
);
INSERT INTO salespersons (staff_id,first_name, last_name, store_location, email, phone)
VALUES
(4,'Michael', 'Brown', 'Downtown Showroom', 'michael.b@dealership.com', '555-0201'),
(5,'Sarah', 'Williams', 'Northside Location', 'sarah.w@dealership.com', '555-0202'),
(6,'David', 'Lee', 'Southside Location', 'david.l@dealership.com', '555-0203');
select*from salespersons;


CREATE TABLE if not exists cars (
    car_id INT AUTO_INCREMENT PRIMARY KEY,
    vin VARCHAR(17) UNIQUE NOT NULL,
    manufacturer VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year YEAR NOT NULL,
    color VARCHAR(30),
    price DECIMAL(10,2) NOT NULL,
    inventory_date DATE NOT NULL
);
INSERT INTO cars (car_id,vin, manufacturer, model, year, color, price, inventory_date)
VALUES
(7,'1HGCM82633A123456', 'Honda', 'Accord', 2023, 'Blue', 28750.00, '2023-05-15'),
(8,'5XYZUDLB7NG012345', 'Kia', 'Sorento', 2023, 'Silver', 34500.00, '2023-06-20'),
(9,'WAUZZZFY2N2012345', 'Audi', 'A4', 2023, 'Black', 42900.00, '2023-04-10');
select * from cars;

CREATE TABLE if not exists invoices (
    invoice_id INT AUTO_INCREMENT PRIMARY KEY,
    invoice_number VARCHAR(20) UNIQUE NOT NULL,
    date DATE NOT NULL,
    car_id INT UNIQUE NOT NULL,
    customer_id INT NOT NULL,
    salesperson_id INT NOT NULL,
    sale_price DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(50),
    FOREIGN KEY (car_id) REFERENCES cars(car_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (salesperson_id) REFERENCES salespersons(staff_id)
);
INSERT INTO invoices (invoice_id, invoice_number, date, car_id, customer_id, salesperson_id, sale_price, payment_method)
SELECT 
  10, 'INV-1001', '2023-07-05', 1, 1, 1, 28750.00, 'Bank Finance'
WHERE @valid = 1;

INSERT INTO invoices (invoice_id, invoice_number, date, car_id, customer_id, salesperson_id, sale_price, payment_method)
SELECT 
  11, 'INV-1002', '2023-07-12', 2, 2, 2, 34500.00, 'Cash'
WHERE @valid = 1;

INSERT INTO invoices (invoice_id, invoice_number, date, car_id, customer_id, salesperson_id, sale_price, payment_method)
SELECT 
  12, 'INV-1003', '2023-07-18', 3, 3, 3, 42900.00, 'Lease'
WHERE @valid = 1;
select * from invoices;