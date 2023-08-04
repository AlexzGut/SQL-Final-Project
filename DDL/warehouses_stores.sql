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
    