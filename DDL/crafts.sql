CREATE TABLE crafts (
	craft_id NUMERIC(6,0) NOT NULL,
    craft_name VARCHAR(20) NOT NULL,
    selling_price NUMERIC(7,2) NOT NULL,
    manufacturing_cost NUMERIC(7,2) NOT NULL,
    size VARCHAR(4) NOT NULL,
    color VARCHAR(20),
    craft_type VARCHAR(20) NOT NULL,
    fit VARCHAR(20) NOT NULL,
    craft_description VARCHAR(100));
    
-- Primary Key
ALTER TABLE crafts
	ADD CONSTRAINT crafts_craft_id_pk
    PRIMARY KEY (craft_id);
    
-- Constraints
ALTER TABLE crafts
	ADD CONSTRAINT crafts_selling_price_gt_manufacturing_cost
    CHECK (selling_price > manufacturing_cost);
    
ALTER TABLE crafts
	ADD CONSTRAINT crafts_size
    CHECK (size IN ('xs', 's', 'm', 'l', 'xl'));
    
-- ---------------------------------------------------------------------------
-- 								TEST CASES
-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------
-- 					crafts_selling_price_gt_manufacturing_cost
-- ---------------------------------------------------------------------------

-- 						** Valid test **
-- Expected results: Insert statement add a row in the crafts table
-- Action:
INSERT INTO crafts 
VALUES (100000, 'Hat-Kors', 10.65, 3.80, 'm', 'lightblue', 'Hat', 'classic', 'Nice hat for cold weather');
-- Test results: 1 row Inserted

-- ---------------------------------------------------------------------------
-- 						** InValid test **
-- Expected results: Update statement fails to modify a row in the crafts table
-- Action:
UPDATE crafts
SET selling_price = 4.60, manufacturing_cost = 10.32;
-- Test results: 

-- ---------------------------------------------------------------------------
-- 								crafts_size
-- ---------------------------------------------------------------------------

-- 						** Valid test **
-- Expected results: Insert statement add a row in the crafts table
-- Action:
INSERT INTO crafts 
VALUES (100000, 'Hat-Kors', 10.65, 3.80, 'm', 'lightblue', 'Hat', 'classic', 'Nice hat for cold weather');
-- Test results: 1 row Inserted

-- ---------------------------------------------------------------------------
-- 						** InValid test **
-- Expected results: Update statement fails to modify a row in the crafts table
-- Action:
UPDATE crafts
SET size = 'p';
-- Test results: 