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