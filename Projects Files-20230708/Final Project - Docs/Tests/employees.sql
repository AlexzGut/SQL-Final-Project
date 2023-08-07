-- ---------------------------------------------------------------------------
-- 								TEST CASES
-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------
-- 						  employees_employee_id_pk
-- ---------------------------------------------------------------------------

-- 						** Valid test **
-- Expected results: Insert statement add a row in the employees table
-- Action:
INSERT INTO employees 
VALUES (100002, 'Bryan', 'Bonilla', '1996-02-08', '1245 Kingston Rd', '6475368908', 'b.bonilla@gmail.com', '2023-04-19', 150000, 'Active', NULL, NULL, NULL, NULL);
-- Test results: 1 row Inserted

-- ---------------------------------------------------------------------------
-- 						** InValid test **
-- Expected results: Insert statement fails to add a row in the employees table
-- Action:
INSERT INTO employees 
VALUES (100002, 'Rocio', 'Alarcon', '1971-02-28', '19 Urbe Village', '3165090921', 'r.alarcon@gmail.com', '2021-08-06', 190000, 'Active', NULL, NULL, NULL, NULL);
-- Test results: 

-- ---------------------------------------------------------------------------
-- 						  employees_contact_number_uk
-- ---------------------------------------------------------------------------

-- 						** Valid test **
-- Expected results: Update statement modifies a row in the employees table
-- Action:
INSERT INTO employees 
VALUES (100003, 'Rocio', 'Alarcon', '1971-02-28', '19 Urbe Village', '3165090921', 'r.alarcon@gmail.com', '2021-08-06', 190000, 'Active', NULL, NULL, NULL, NULL);

-- Test results: 1 row Inserted

-- ---------------------------------------------------------------------------
-- 						** InValid test **
-- Expected results: Update statement fails to modify a row in the employees table
-- Action:
UPDATE employees
SET contact_number = '3165090921'
WHERE employee_id = 100002;
-- Test results: 

-- ---------------------------------------------------------------------------
-- 						 employees_email_uk
-- ---------------------------------------------------------------------------

-- 						** Valid test **
-- Expected results: Insert statement add a row in the employees table
-- Action:
UPDATE employees
SET email = 'bryan@gmail.com'
WHERE employee_id = 100002;
-- Test results: 1 row Inserted

-- ---------------------------------------------------------------------------
-- 						** InValid test **
-- Expected results: Update statement fails to modify a row in the employees table
-- Action:
UPDATE employees
SET email = 'bryan@gmail.com'
WHERE employee_id = 100003;
-- Test results: 

-- ---------------------------------------------------------------------------
-- 						 employees_manager_id_fk
-- ---------------------------------------------------------------------------

-- 						** Valid test **
-- Expected results: Insert statement add a row in the employees table
-- Action:
INSERT INTO employees 
VALUES (100004, 'Bailey', 'Brown', '2001-09-03', '78 Snowboard Street', '8609875467', 'b.brown@gmail.com', '2017-03-18', 100000, 'Active', 100002, NULL, NULL, NULL);
-- Test results: 1 row Inserted

-- ---------------------------------------------------------------------------
-- 						** InValid test **
-- Expected results: Update statement fails to modify a row in the employees table
-- Action:
UPDATE employees
SET manager_id = 100005
WHERE employee_id = 100002;
-- Test results: 

-- ---------------------------------------------------------------------------
-- 						 employees_store_id_fk
-- ---------------------------------------------------------------------------
-- IMPORTANT: 123456, 123457, 123458 store_id exist in the stores table.
-- 						** Valid test **
-- Expected results: Update statement modifies a row in the employees table
-- Action:
UPDATE employees
SET store_id = 123456
WHERE employee_id = 100002;
-- Test results: 1 row Inserted

-- ---------------------------------------------------------------------------
-- 						** InValid test **
-- Expected results: Update statement fails to modify a row in the employees table
-- Action:
UPDATE employees
SET store_id = 101010
WHERE employee_id = 100002;
-- Test results: 

-- ---------------------------------------------------------------------------
-- 						 employees_department_id_fk
-- ---------------------------------------------------------------------------
-- IMPORTANT: 000111, 000222, 000333 department_id exist in the departments table.
-- 						** Valid test **
-- Expected results: Update statement modifies a row in the employees table
-- Action:
UPDATE employees
SET department_id = 000333
WHERE employee_id = 100002;
-- Test results: 1 row Inserted

-- ---------------------------------------------------------------------------
-- 						** InValid test **
-- Expected results: Update statement fails to modify a row in the employees table
-- Action:
UPDATE employees
SET department_id = 999999
WHERE employee_id = 100002;
-- Test results: 

-- ---------------------------------------------------------------------------
-- 						 employees_job_id_fk
-- ---------------------------------------------------------------------------
-- IMPORTANT: 111000, 222000, 333000 job_id exist in the jobs table.
-- 						** Valid test **
-- Expected results: Update statement modifies a row in the employees table
-- Action:
UPDATE employees
SET job_id = 333000
WHERE employee_id = 100002;
-- Test results: 1 row Inserted

-- ---------------------------------------------------------------------------
-- 						** InValid test **
-- Expected results: Update statement fails to modify a row in the employees table
-- Action:
UPDATE employees
SET job_id = 567467
WHERE employee_id = 100002;
-- Test results: 

-- ---------------------------------------------------------------------------
-- 						 employees_salary_range
-- ---------------------------------------------------------------------------

-- 						** Valid test #1 **
-- Expected results: Update statement modifies a row in the employees table
-- Action:
UPDATE employees
SET salary = 20000
WHERE employee_id = 100002;
-- Test results: 1 row Inserted

-- 						** Valid test #2 **
-- Expected results: Update statement modifies a row in the employees table
-- Action:
UPDATE employees
SET salary = 200000
WHERE employee_id = 100002;
-- Test results: 1 row Inserted

-- 						** Valid test #3 **
-- Expected results: Update statement modifies a row in the employees table
-- Action:
UPDATE employees
SET salary = 85000
WHERE employee_id = 100002;
-- Test results: 1 row Inserted

-- ---------------------------------------------------------------------------
-- 						** InValid test #1 **
-- Expected results: Update statement fails to modify a row in the employees table
-- Action:
UPDATE employees
SET salary = 19999
WHERE employee_id = 100002;
-- Test results: 

-- 						** InValid test #2 **
-- Expected results: Update statement fails to modify a row in the employees table
-- Action:
UPDATE employees
SET salary = 200001
WHERE employee_id = 100002;
-- Test results: 

-- ---------------------------------------------------------------------------
-- 						 employees_emp_status
-- ---------------------------------------------------------------------------

-- 						** Valid test #1 **
-- Expected results: Update statement modifies a row in the employees table
-- Action:
UPDATE employees
SET emp_status = 'On vacation'
WHERE employee_id = 100002;
-- Test results: 1 row Inserted

-- 						** Valid test #2 **
-- Expected results: Update statement modifies a row in the employees table
-- Action:
UPDATE employees
SET emp_status = 'Retired'
WHERE employee_id = 100002;
-- Test results: 1 row Inserted

-- 						** Valid test #3 **
-- Expected results: Update statement modifies a row in the employees table
-- Action:
UPDATE employees
SET emp_status = 'Inactive'
WHERE employee_id = 100002;
-- Test results: 1 row Inserted

-- 						** Valid test #4 **
-- Expected results: Update statement modifies a row in the employees table
-- Action:
UPDATE employees
SET emp_status = 'Active'
WHERE employee_id = 100002;
-- Test results: 1 row Inserted

-- ---------------------------------------------------------------------------
-- 						** InValid test **
-- Expected results: Update statement fails to modify a row in the employees table
-- Action:
UPDATE employees
SET emp_status = 'Time Off'
WHERE employee_id = 100002;
-- Test results: 

-- ---------------------------------------------------------------------------
-- 						 employees_hire_date_gt_date_of_birth
-- ---------------------------------------------------------------------------
-- DOB = '1996-02-08'
-- 						** Valid test **
-- Expected results: Update statement modifies a row in the employees table
-- Action:
UPDATE employees
SET hire_date = '2022-06-11'
WHERE employee_id = 100002;
-- Test results: 1 row Inserted

-- ---------------------------------------------------------------------------
-- 						** InValid test **
-- Expected results: Update statement fails to modify a row in the employees table
-- Action:
UPDATE employees
SET hire_date = '1995-10-25'
WHERE employee_id = 100002;
-- Test results: 

-- ---------------------------------------------------------------------------
-- 						 employees_email
-- ---------------------------------------------------------------------------

-- 						** Valid test **
-- Expected results: Update statement modifies a row in the employees table
-- Action:
UPDATE employees
SET email = 'bryan.bonilla@outlook.com'
WHERE employee_id = 100002;
-- Test results: 1 row Inserted

-- ---------------------------------------------------------------------------
-- 						** InValid test #1 **
-- Expected results: Update statement fails to modify a row in the employees table
-- Action:
UPDATE employees
SET email = 'bryan.bonillaoutlook.com'
WHERE employee_id = 100002;
-- Test results: 

-- 						** InValid test #2 **
-- Expected results: Update statement fails to modify a row in the employees table
-- Action:
UPDATE employees
SET email = 'bryan.bonilla@outlookcom'
WHERE employee_id = 100002;
-- Test results: 