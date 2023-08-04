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