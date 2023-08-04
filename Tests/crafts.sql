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