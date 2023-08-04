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

-- Foreign Key
ALTER TABLE warehouses
	ADD CONSTRAINT warehouses_zip_code_fk
		FOREIGN KEY (zip_code)
        REFERENCES zips (zip_code);