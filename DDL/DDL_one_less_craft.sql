CREATE SCHEMA one_less_craft;
-- DROP SCHEMA one_less_craft;

-- -------------------------------------------------------------------------
-- 									TABLES
-- -------------------------------------------------------------------------
CREATE TABLE crafts (
	craft_id NUMERIC(6,0) NOT NULL,
    craft_name VARCHAR(20) NOT NULL,
    selling_price NUMERIC(7,2) NOT NULL,
    manufacturing_cost NUMERIC(7,2) NOT NULL,
    size VARCHAR(4) NOT NULL,
    color VARCHAR(20),
    craft_type VARCHAR(20) NOT NULL,
    fit VARCHAR(20) NOT NULL,
    craft_description VARCHAR(100));
    
-- Primary Key
ALTER TABLE crafts
	ADD CONSTRAINT crafts_craft_id_pk
    PRIMARY KEY (craft_id);
    
-- Constraints
ALTER TABLE crafts
	ADD CONSTRAINT crafts_selling_price_gt_manufacturing_cost
    CHECK (selling_price > manufacturing_cost);
    
ALTER TABLE crafts
	ADD CONSTRAINT crafts_size
    CHECK (size IN ('xs', 's', 'm', 'l', 'xl'));
    
-- -------------------------------------------------------------------------
CREATE TABLE customers (
	customer_id NUMERIC(6,0) NOT NULL,
	first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(50) NOT NULL,
    gender CHAR(1),
    contact_number VARCHAR(10) NOT NULL,
    address VARCHAR(50) NOT NULL,
    shipping_address VARCHAR(50) NOT NULL,
    billing_address VARCHAR(50),
    favorite_craft NUMERIC(6,0),
    zip_code VARCHAR(10) NOT NULL,
    preferred_sales_rep NUMERIC(6,0));
    
-- Primary Key
ALTER TABLE customers 
	ADD CONSTRAINT customers_customer_id_pk
		PRIMARY KEY (customer_id);
        
-- Unique Keys
ALTER TABLE customers
	ADD CONSTRAINT customers_email_uk
		UNIQUE KEY (email);

ALTER TABLE customers
	ADD CONSTRAINT customers_contact_number_uk
		UNIQUE KEY (contact_number);

-- Constraints
ALTER TABLE customers
	ADD CONSTRAINT customers_email
    CHECK (email LIKE '%@%.%');
    
ALTER TABLE customers 
	ADD CONSTRAINT customer_gender
    CHECK (gender IN ('M', 'F'));

-- -------------------------------------------------------------------------
CREATE TABLE departments (
	department_id NUMERIC(6,0) NOT NULL,
    department_name VARCHAR(30) NOT NULL,
    department_phone VARCHAR(10) NOT NULL,
    department_email VARCHAR(50) NOT NULL,
    department_budget NUMERIC(7,2) NOT NULL,
    department_description VARCHAR(100),
    manager_id NUMERIC(6,0));

-- Primary Key
ALTER TABLE departments
	ADD CONSTRAINT departments_department_id_pk
    PRIMARY KEY (department_id);
    
-- Unique Keys
ALTER TABLE departments
	ADD CONSTRAINT departments_department_name_uk
    UNIQUE (department_name);
    
ALTER TABLE departments
	ADD CONSTRAINT departments_department_phone_uk
    UNIQUE (department_phone);
    
ALTER TABLE departments
	ADD CONSTRAINT departments_department_email_uk
    UNIQUE (department_email);
    
-- Constraints
ALTER TABLE departments
	ADD CONSTRAINT departments_department_email
    CHECK (department_email LIKE '%@%.%');
    
ALTER TABLE departments
	ADD CONSTRAINT departments_department_budget
    CHECK (department_budget >= 100000 AND department_budget <= 1000000);
    
-- -------------------------------------------------------------------------
CREATE TABLE employees (
	employee_id NUMERIC(6,0) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    date_of_birth DATE NOT NULL,
    address VARCHAR(50),
    contact_number NUMERIC(10,0) NOT NULL,
    email VARCHAR(50) NOT NULL,
    hire_date DATE DEFAULT (CURRENT_DATE),
    salary NUMERIC(7,2) NOT NULL,
    emp_status VARCHAR(15) NOT NULL,
    manager_id NUMERIC(6,0),
    store_id NUMERIC(6,0),
    department_id NUMERIC(6,0),
    job_id NUMERIC(6,0));

-- Primary Key
ALTER TABLE employees 
	ADD CONSTRAINT employees_employee_id_pk
		PRIMARY KEY (employee_id);
        
-- Unique Key
ALTER TABLE employees 
	ADD CONSTRAINT employees_contact_number_uk
		UNIQUE KEY (contact_number);
        
ALTER TABLE employees 
	ADD CONSTRAINT employees_email_uk
		UNIQUE KEY (email);
        
-- Constraints
ALTER TABLE employees
	ADD CONSTRAINT employees_salary_range
    CHECK (salary >= 20000 AND salary <= 200000);

ALTER TABLE employees
	ADD CONSTRAINT employees_emp_status
    CHECK (emp_status IN ('Active', 'Inactive', 'Retired', 'On Vacation'));
    
ALTER TABLE employees
	ADD CONSTRAINT employees_hire_date_gt_date_of_birth
    CHECK (hire_date > date_of_birth);
    
ALTER TABLE employees
	ADD CONSTRAINT employees_email
    CHECK (email LIKE '%@%.%');
    
-- -------------------------------------------------------------------------
CREATE TABLE jobs (
	job_id NUMERIC(6,0) NOT NULL,
	job_title VARCHAR(30) NOT NULL);

-- Primary Key
ALTER TABLE jobs 
	ADD CONSTRAINT jobs_job_id_pk
		PRIMARY KEY (job_id);
        
-- -------------------------------------------------------------------------
CREATE TABLE orders (
	order_id NUMERIC(6,0) NOT NULL,
    order_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    shipped_date DATE NOT NULL,
    shipped_status VARCHAR(15) NOT NULL,
    customer_id NUMERIC(6,0) NOT NULL,
    employee_id NUMERIC(6,0) NOT NULL,
    return_period VARCHAR(30) NOT NULL);
    
-- Primary Key
ALTER TABLE orders
	ADD CONSTRAINT orders_order_id_pk
		PRIMARY KEY (order_id);
        
-- Constraints
ALTER TABLE orders
	ADD CONSTRAINT orders_order_date_lt_shipped_date
    CHECK (order_date <= shipped_date);
    
-- -------------------------------------------------------------------------
CREATE TABLE stores (
	store_id NUMERIC(6,0) NOT NULL,
    store_name VARCHAR(20) NOT NULL,
    phone_number VARCHAR(10) NOT NULL,
    email VARCHAR(30) NOT NULL,
    website VARCHAR(30),
    address VARCHAR(50) NOT NULL,
    zip_code VARCHAR(10) NOT NULL,
    manager_id NUMERIC(6,0));

-- Primary Key
ALTER TABLE stores
	ADD CONSTRAINT stores_store_id_pk
		PRIMARY KEY (store_id);

-- Unique Keys
ALTER TABLE stores
	ADD CONSTRAINT stores_phone_number_uk
    UNIQUE KEY (phone_number);

ALTER TABLE stores
	ADD CONSTRAINT stores_email_uk
    UNIQUE KEY (email);
    
-- Constraints
ALTER TABLE stores
	ADD CONSTRAINT stores_email
    CHECK (email LIKE '%@%.%');
    
-- -------------------------------------------------------------------------
CREATE TABLE suppliers (
	supplier_id NUMERIC(6,0) NOT NULL,
	supplier_name NUMERIC(6,0) NOT NULL,
    supplier_contact VARCHAR (10) NOT NULL,
    supplier_address VARCHAR (50) NOT NULL);

-- Primary Key
ALTER TABLE suppliers 
	ADD CONSTRAINT suppliers_supplier_id_pk
		PRIMARY KEY (supplier_id);
        
-- -------------------------------------------------------------------------
CREATE TABLE warehouses (
	warehouse_id NUMERIC(6,0) NOT NULL,
    warehouse_name VARCHAR(30) NOT NULL,
    address VARCHAR(50) NOT NULL,
    capacity NUMERIC(8,2) NOT NULL,
    zip_code VARCHAR(10) NOT NULL);
    
-- Primary Key
ALTER TABLE warehouses
	ADD CONSTRAINT warehouses_warehouse_id_pk
		PRIMARY KEY (warehouse_id);

-- -------------------------------------------------------------------------
CREATE TABLE yarns (
	yarn_id NUMERIC(6,0) NOT NULL,
	yarn_type VARCHAR(15) NOT NULL,
    yarn_weight VARCHAR(15) NOT NULL,
    yarn_color VARCHAR(15) NOT NULL,
    yarn_price NUMERIC(7,2) NOT NULL,
    yarn_quality VARCHAR(20) NOT NULL,
    yarn_description VARCHAR(100));

-- Primary Key
ALTER TABLE yarns 
	ADD CONSTRAINT yarns_yarn_id_pk
		PRIMARY KEY (yarn_id);
        
-- Constraints
ALTER TABLE yarns
	ADD CONSTRAINT yarns__yarn_quality
    CHECK (yarn_quality IN ('common', 'rare', 'premium', 'custom'));
    
ALTER TABLE yarns
	ADD CONSTRAINT yarns_yarn_price
    CHECK (yarn_price > 0);

-- -------------------------------------------------------------------------
CREATE TABLE zips (
	zip_code VARCHAR(10) NOT NULL,
    city VARCHAR(20) NOT NULL,
    province VARCHAR(20) NOT NULL,
    country VARCHAR(20) NOT NULL);
    
-- Primary Key
ALTER TABLE zips
	ADD CONSTRAINT zips_zip_code_pk
		PRIMARY KEY (zip_code);

-- -------------------------------------------------------------------------
-- 							INSTERSECTION TABLES
-- -------------------------------------------------------------------------
CREATE TABLE inventories (
	warehouse_id NUMERIC(6,0) NOT NULL,
	craft_id NUMERIC(6,0) NOT NULL,
    quantity NUMERIC(8,0) NOT NULL,
	update_date DATE NOT NULL DEFAULT (CURRENT_DATE));

-- Primary Key
ALTER TABLE inventories 
	ADD CONSTRAINT inventories_warehouse_id_craft_id_pk
		PRIMARY KEY (warehouse_id, craft_id);
        
-- Foreign Key
ALTER TABLE inventories 
	ADD CONSTRAINT inventories_warehouse_id_fk
		FOREIGN KEY (warehouse_id)
        REFERENCES warehouses (warehouse_id);
        
ALTER TABLE inventories 
	ADD CONSTRAINT inventories_craft_id_fk
		FOREIGN KEY (craft_id)
        REFERENCES crafts (craft_id);

-- Constraints 
ALTER TABLE inventories 
	ADD CONSTRAINT inventories_quantity
    CHECK (quantity > 0);
    
-- -------------------------------------------------------------------------
CREATE TABLE crafts_orders (
	craft_id NUMERIC(6,0) NOT NULL,
	order_id NUMERIC(6,0) NOT NULL,
    quantity NUMERIC(10,0) NOT NULL);

-- Primary Key
ALTER TABLE crafts_orders 
	ADD CONSTRAINT crafts_orders_craft_id_order_id_pk
		PRIMARY KEY (craft_id, order_id);

-- Foreign Key
ALTER TABLE crafts_orders 
	ADD CONSTRAINT crafts_orders_craft_id_fk
		FOREIGN KEY (craft_id)
        REFERENCES crafts (craft_id);
        
ALTER TABLE crafts_orders 
	ADD CONSTRAINT crafts_orders_order_id_fk
		FOREIGN KEY (order_id)
        REFERENCES orders (order_id);
        
-- -------------------------------------------------------------------------
CREATE TABLE crafts_yarns (
	craft_id NUMERIC(6,0) NOT NULL,
    yarn_id NUMERIC(6,0) NOT NULL,
    quantity NUMERIC(6,0));

-- Primary Keys
ALTER TABLE crafts_yarns
	ADD CONSTRAINT crafts_yarns_craft_id_yarn_id_pk
    PRIMARY KEY (craft_id, yarn_id);
    
-- Foreign Keys
ALTER TABLE crafts_yarns
	ADD CONSTRAINT crafts_yarns_craft_id_fk
    FOREIGN KEY (craft_id)
		REFERENCES crafts (craft_id);
        
ALTER TABLE crafts_yarns
	ADD CONSTRAINT crafts_yarns_yarn_id_fk
    FOREIGN KEY (yarn_id)
		REFERENCES yarns (yarn_id);

-- Constraints
ALTER TABLE crafts_yarns
	ADD CONSTRAINT crafts_yarns_quantity
    CHECK (quantity > 0);
-- -------------------------------------------------------------------------
CREATE TABLE warehouses_stores (
	warehouse_id NUMERIC(6,0) NOT NULL,
    store_id NUMERIC(6,0) NOT NULL);

-- Primary Keys
ALTER TABLE warehouses_stores
	ADD CONSTRAINT warehouses_stores_warehouse_id_store_id_pk
    PRIMARY KEY (warehouse_id, store_id);
    
-- Foreign Keys
ALTER TABLE warehouses_stores
	ADD CONSTRAINT warehouses_stores_warehouse_id_fk
    FOREIGN KEY (warehouse_id)
		REFERENCES warehouses (warehouse_id);
        
ALTER TABLE warehouses_stores
	ADD CONSTRAINT warehouses_stores_store_id_fk
    FOREIGN KEY (store_id)
		REFERENCES stores (store_id);
        
-- -------------------------------------------------------------------------
CREATE TABLE yarns_suppliers (
	yarn_id NUMERIC(6,0) NOT NULL,
	supplier_id NUMERIC(6,0) NOT NULL);

-- Primary Key
ALTER TABLE yarns_suppliers 
	ADD CONSTRAINT yarns_suppliers_yarn_id_supplier_id_pk
		PRIMARY KEY (yarn_id, supplier_id);

-- Foreign Key
ALTER TABLE yarns_suppliers 
	ADD CONSTRAINT yarns_suppliers_yarn_id_fk
		FOREIGN KEY (yarn_id)
        REFERENCES yarns (yarn_id);
        
ALTER TABLE yarns_suppliers 
	ADD CONSTRAINT yarns_suppliers_supplier_id_fk
		FOREIGN KEY (supplier_id)
        REFERENCES suppliers (supplier_id);
        
-- -------------------------------------------------------------------------
-- 								FOREIGN KEYS
-- -------------------------------------------------------------------------
-- 								  CUSTOMERS
-- FOREIGN Keys
ALTER TABLE customers
	ADD CONSTRAINT customers_favorite_craft_fk
		FOREIGN KEY (favorite_craft)
        REFERENCES crafts (craft_id);
        
ALTER TABLE customers
	ADD CONSTRAINT customers_zip_code_fk
		FOREIGN KEY (zip_code)
        REFERENCES zips (zip_code);
        
ALTER TABLE customers
	ADD CONSTRAINT customers_preferred_sales_rep_fk
		FOREIGN KEY (preferred_sales_rep)
        REFERENCES employees (employee_id);
        
-- -------------------------------------------------------------------------
-- 								  DEPARTMENTS
-- Foreign Key
ALTER TABLE departments
	ADD CONSTRAINT departments_manager_id_fk
    FOREIGN KEY (manager_id)
    REFERENCES employees (employee_id);
    
-- -------------------------------------------------------------------------
-- 								  EMPLOYEES
-- Foreign Key
ALTER TABLE employees 
	ADD CONSTRAINT employees_manager_id_fk
		FOREIGN KEY (manager_id)
        REFERENCES employees (employee_id);
        
ALTER TABLE employees 
	ADD CONSTRAINT employees_store_id_fk
		FOREIGN KEY (store_id)
        REFERENCES stores (store_id);
        
ALTER TABLE employees 
	ADD CONSTRAINT employees_department_id_fk
		FOREIGN KEY (department_id)
        REFERENCES departments (department_id);

ALTER TABLE employees 
	ADD CONSTRAINT employees_job_id_fk
		FOREIGN KEY (job_id)
        REFERENCES jobs (job_id);
        
-- -------------------------------------------------------------------------
-- 								    ORDERS
-- Foreign Key
ALTER TABLE orders
	ADD CONSTRAINT orders_customer_id_fk
		FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id);
        
ALTER TABLE orders
	ADD CONSTRAINT orders_employee_id_fk
		FOREIGN KEY (employee_id)
        REFERENCES employees (employee_id);

-- -------------------------------------------------------------------------
-- 								    STORES
-- Foreign Key
ALTER TABLE stores
	ADD CONSTRAINT stores_zip_code_fk
    FOREIGN KEY (zip_code)
    REFERENCES zips (zip_code);

ALTER TABLE stores
	ADD CONSTRAINT stores_manager_id_fk
    FOREIGN KEY (manager_id)
    REFERENCES employees (manager_id);
-- -------------------------------------------------------------------------
-- 								  WAREHOUSES
-- Foreign Key
ALTER TABLE warehouses
	ADD CONSTRAINT warehouses_zip_code_fk
		FOREIGN KEY (zip_code)
        REFERENCES zips (zip_code);