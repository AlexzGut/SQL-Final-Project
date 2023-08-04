CREATE TABLE employees (
	employee_id NUMERIC(6,0) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    date_of_birth DATE NOT NULL,
    address VARCHAR(50),
    contact_number NUMERIC(10,0) NOT NULL,
    email VARCHAR(50) NOT NULL,
    hire_date DATE DEFAULT (CURRENT_DATE),
    salary NUMERIC(7,2) NOT NULL,
    emp_status VARCHAR(15) NOT NULL,
    manager_id NUMERIC(6,0),
    store_id NUMERIC(6,0),
    department_id NUMERIC(6,0),
    job_id NUMERIC(6,0));

-- Primary Key
ALTER TABLE employees 
	ADD CONSTRAINT employees_employee_id_pk
		PRIMARY KEY (employee_id);
        
-- Unique Key
ALTER TABLE employees 
	ADD CONSTRAINT employees_contact_number_uk
		UNIQUE KEY (contact_number);
        
ALTER TABLE employees 
	ADD CONSTRAINT employees_email_uk
		UNIQUE KEY (email);
        
-- Foreign Key
ALTER TABLE employees 
	ADD CONSTRAINT employees_manager_id_fk
		FOREIGN KEY (manager_id)
        REFERENCES employees (employee_id);
        
ALTER TABLE employees 
	ADD CONSTRAINT employees_store_id_fk
		FOREIGN KEY (store_id)
        REFERENCES stores (store_id);
        
ALTER TABLE employees 
	ADD CONSTRAINT employees_department_id_fk
		FOREIGN KEY (department_id)
        REFERENCES departments (department_id);

ALTER TABLE employees 
	ADD CONSTRAINT employees_job_id_fk
		FOREIGN KEY (job_id)
        REFERENCES jobs (job_id);
        
-- Constraints
ALTER TABLE employees
	ADD CONSTRAINT employees_salary_range
    CHECK (salary >= 20000 AND salary <= 200000);

ALTER TABLE employees
	ADD CONSTRAINT employees_emp_status
    CHECK (emp_status IN ('Active', 'Inactive', 'Retired', 'On Vacation'));
    
ALTER TABLE employees
	ADD CONSTRAINT employees_hire_date_gt_date_of_birth
    CHECK (hire_date > date_of_birth);
    
ALTER TABLE employees
	ADD CONSTRAINT employees_email
    CHECK (email LIKE '%@%.%');