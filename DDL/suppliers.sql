CREATE TABLE suppliers (
	supplier_id NUMERIC(6,0) NOT NULL,
	supplier_name NUMERIC(6,0) NOT NULL,
    supplier_contact VARCHAR (10) NOT NULL,
    supplier_address VARCHAR (50) NOT NULL);

-- Primary Key
ALTER TABLE suppliers 
	ADD CONSTRAINT suppliers_supplier_id_pk
		PRIMARY KEY (supplier_id);
