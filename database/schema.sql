DROP TABLE IF EXISTS product;
CREATE TABLE product (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(32) NOT NULL,
	model VARCHAR(256),
	price DECIMAL(9,2) DEFAULT 0.0,
	quantity INT DEFAULT 0
);

INSERT INTO product (name, model, price, quantity) VALUES
('Laptop', 'Lenovo X1 Carbon', 3699.98, 100),
('Laptop', 'Dell Pavlion 3312', 2799.98, 120),
('USB', 'SanDisk Ultra 128GB', 69.99, 300);

----------------------------

-- DROP TABLE IF EXISTS PRODUCT;
-- CREATE TABLE PRODUCT (
-- 	ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
-- 	NAME VARCHAR(32) NOT NULL,
-- 	MODEL VARCHAR(256),
-- 	PRICE DECIMAL(9,2) DEFAULT 0.0,
-- 	QUANTITY INT DEFAULT 0
-- );

-- INSERT INTO PRODUCT (NAME, MODEL, PRICE, QUANTITY) VALUES
-- ('Laptop', 'Lenovo X1 Carbon', 3699.98, 100),
-- ('Laptop', 'Dell Pavlion 3312', 2799.98, 120),
-- ('USB', 'SanDisk Ultra 128GB', 69.99, 300);

