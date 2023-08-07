-- ---------------------------------------------------------------------------
-- 								TEST CASES
-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------
-- 						 customers_customer_id_pk
-- ---------------------------------------------------------------------------

-- 						** Valid test **
-- Expected results: Insert statement add a row in the customers table
-- Action:
INSERT INTO customers 
VALUES (100000, 'Maria', 'Gutierrez', '2000-08-17', 'maria@gmail.com', 'F', '3183908929', 'Torres de la Javeriana', 'Torres de la Javeriana', NULL, NULL, 'M4H1B6', NULL);
-- Test results: 1 row Inserted

-- ---------------------------------------------------------------------------
-- 						** InValid test **
-- Expected results: Insert statement fails to add a row in the customers table
-- Action:
INSERT INTO customers 
VALUES (100000, 'John', 'Alexander', '1995-10-17', 'alexander@gmail.com', 'M', '6478601662', '347 Lawson Road', '347 Lawson Road', NULL, NULL, 'M1C2J8', NULL);
-- Test results: 

-- ---------------------------------------------------------------------------
-- 						 customers_email_uk
-- ---------------------------------------------------------------------------

-- 						** Valid test **
-- Expected results: Insert statement add a row in the customers table
-- Action:
INSERT INTO customers 
VALUES (100001, 'Paul', 'Smith', '1994-05-25', 'paula@gmail.com', 'F', '3102245116', 'Midland 54675 RD', 'Midland 54675 RD', NULL, NULL, 'M2M3W8', NULL);
-- Test results: 1 row Inserted

-- ---------------------------------------------------------------------------
-- 						** InValid test **
-- Expected results: Update statement fails to modify a row in the customers table
-- Action:
UPDATE customers
SET email = 'paula@gmail.com'
WHERE customer_id = 100000;
-- Test results: 

-- ---------------------------------------------------------------------------
-- 						 customers_contact_number_uk
-- ---------------------------------------------------------------------------

-- 						** Valid test **
-- Expected results: Update statement modifies a row in the customers table
-- Action:
UPDATE customers
SET contact_number = '3152896959'
WHERE customer_id = 100000;
-- Test results: 1 row Inserted

-- ---------------------------------------------------------------------------
-- 						** InValid test **
-- Expected results: Update statement fails to modify a row in the customers table
-- Action:
UPDATE customers
SET contact_number = '3152896959'
WHERE customer_id = 100001;
-- Test results: 

-- ---------------------------------------------------------------------------
-- 						 customers_favorite_craft_fk
-- ---------------------------------------------------------------------------
-- IMPORTANT: 000001, 000002, 000003 craft_id exits in crafts table
-- 						** Valid test **
-- Expected results: Update statement modifies a row in the customers table
-- Action:
UPDATE customers
SET favorite_craft = 100000
WHERE customer_id = 100000;
-- Test results: 1 row Inserted

-- ---------------------------------------------------------------------------
-- 						** InValid test **
-- Expected results: Update statement fails to modify a row in the customers table
-- Action:
UPDATE customers
SET favorite_craft = 000004
WHERE customer_id = 100000;
-- Test results: 

-- ---------------------------------------------------------------------------
-- 						 customers_zip_code_fk
-- ---------------------------------------------------------------------------
-- IMPORTANT: M1C2J8, M4H1B6, M2M3W8 zip_code exits in zips table
-- 						** Valid test **
-- Expected results: Update statement modifies a row in the customers table
-- Action:
UPDATE customers
SET zip_code = 'M1C2J8'
WHERE customer_id = 100000;
-- Test results: 1 row Inserted

-- ---------------------------------------------------------------------------
-- 						** InValid test **
-- Expected results: Update statement fails to modify a row in the customers table
-- Action:
UPDATE customers
SET zip_code = 'M4T9K3'
WHERE customer_id = 100000;
-- Test results: 

-- ---------------------------------------------------------------------------
-- 						 customers_preferred_sales_rep_fk
-- ---------------------------------------------------------------------------
-- IMPORTANT: 100001, 100002, 100003 employee_id exits in employees table
-- 						** Valid test **
-- Expected results: Update statement modifies a row in the customers table
-- Action:
UPDATE customers
SET preferred_sales_rep = 100001
WHERE customer_id = 100000;
-- Test results: 1 row Inserted

-- ---------------------------------------------------------------------------
-- 						** InValid test **
-- Expected results: Update statement fails to modify a row in the customers table
-- Action:
UPDATE customers
SET preferred_sales_rep = 100004
WHERE customer_id = 100000;
-- Test results: 

-- ---------------------------------------------------------------------------
-- 								customers_email
-- ---------------------------------------------------------------------------

-- 						** Valid test **
-- Expected results: Insert statement add a row in the customers table
-- Action:
INSERT INTO customers 
VALUES (100002, 'John', 'Alexander', '1995-10-17', 'alexander@gmail.com', 'M', '6478601662', '347 Lawson Road', '347 Lawson Road', NULL, NULL, 'M1C2J8', NULL);
-- Test results: 1 row Inserted

-- ---------------------------------------------------------------------------
-- 						** InValid test **
-- Expected results: Update statement fails to modify a row in the customers table
-- Action:
UPDATE customers
SET email = 'alexander@gmailcom'
WHERE customer_id = 100002;
-- Test results: 

-- ---------------------------------------------------------------------------
-- 								customers_gender
-- ---------------------------------------------------------------------------

-- 						** Valid test **
-- Expected results: Insert statement add a row in the customers table
-- Action:
INSERT INTO customers 
VALUES (100003, 'Tatiana', 'Marquez', '1997-09-16', 'tatiana@gmail.com', 'F', '6474536789', '347 Lawson Road', '347 Lawson Road', NULL, NULL, 'M1C2J8', NULL);
-- Test results: 1 row Inserted

-- ---------------------------------------------------------------------------
-- 						** InValid test **
-- Expected results: Update statement fails to modify a row in the customers table
-- Action:
UPDATE crafts
SET gender = 'B'
WHERE customer_id = 100003;
-- Test results: 