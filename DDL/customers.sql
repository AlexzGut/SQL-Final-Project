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

-- Constraints
ALTER TABLE customers
	ADD CONSTRAINT customers_email
    CHECK (email LIKE '%@%.%');
    
ALTER TABLE customers 
	ADD CONSTRAINT customer_gender
    CHECK (gender IN ('M', 'F'));