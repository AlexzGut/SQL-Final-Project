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
    
-- Foreign Key
ALTER TABLE stores
	ADD CONSTRAINT stores_zip_code_fk
    FOREIGN KEY (zip_code)
    REFERENCES zips (zip_code);

ALTER TABLE stores
	ADD CONSTRAINT stores_manager_id_fk
    FOREIGN KEY (manager_id)
    REFERENCES employees (employee_id);
    
-- Constraints
ALTER TABLE stores
	ADD CONSTRAINT stores_email
    CHECK (email LIKE '%@%.%');