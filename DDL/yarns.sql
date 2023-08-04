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