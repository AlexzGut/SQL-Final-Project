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