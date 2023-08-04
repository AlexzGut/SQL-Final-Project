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