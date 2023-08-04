-- ---------------------------------------------------------------------------
-- 								TEST CASES
-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------
-- 								customers_email
-- ---------------------------------------------------------------------------

-- 						** Valid test **
-- Expected results: Insert statement add a row in the customers table
-- Action:
INSERT INTO customers 
VALUES (100000, 'John', 'Alexander', '1995-10-17', 'alexander@gmail.com', 'M', '6478601662', '347 Lawson Road', '347 Lawson Road', NULL, NULL, 'M1C2J8', NULL);
-- Test results: 1 row Inserted

-- ---------------------------------------------------------------------------
-- 						** InValid test **
-- Expected results: Update statement fails to modify a row in the customers table
-- Action:
UPDATE crafts
SET email = 'alexander@gmailcom';
-- Test results: 

-- ---------------------------------------------------------------------------
-- 								customers_gender
-- ---------------------------------------------------------------------------

-- 						** Valid test **
-- Expected results: Insert statement add a row in the customers table
-- Action:
INSERT INTO customers 
VALUES (100001, 'Tatiana', 'Marquez', '1997-09-16', 'tatiana@gmail.com', 'F', '6474536789', '347 Lawson Road', '347 Lawson Road', NULL, NULL, 'M1C2J8', NULL);
-- Test results: 1 row Inserted

-- ---------------------------------------------------------------------------
-- 						** InValid test **
-- Expected results: Update statement fails to modify a row in the customers table
-- Action:
UPDATE crafts
SET gender = 'B';
-- Test results: 