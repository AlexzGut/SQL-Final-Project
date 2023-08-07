CREATE TABLE departments (
	department_id NUMERIC(6,0) NOT NULL,
    department_name VARCHAR(30) NOT NULL,
    department_phone VARCHAR(10) NOT NULL,
    department_email VARCHAR(50) NOT NULL,
    department_budget NUMERIC(9,2) NOT NULL,
    department_description VARCHAR(100),
    manager_id NUMERIC(6,0));

-- Primary Key
ALTER TABLE departments
	ADD CONSTRAINT departments_department_id_pk
    PRIMARY KEY (department_id);
    
-- Unique Keys
ALTER TABLE departments
	ADD CONSTRAINT departments_department_name_uk
    UNIQUE (department_name);
    
ALTER TABLE departments
	ADD CONSTRAINT departments_department_phone_uk
    UNIQUE (department_phone);
    
ALTER TABLE departments
	ADD CONSTRAINT departments_department_email_uk
    UNIQUE (department_email);
    
-- Foreign Key
ALTER TABLE departments
	ADD CONSTRAINT departments_manager_id_fk
    FOREIGN KEY (manager_id)
    REFERENCES employees (employee_id);
    
-- Constraints
ALTER TABLE departments
	ADD CONSTRAINT departments_department_email
    CHECK (department_email LIKE '%@%.%');
    
ALTER TABLE departments
	ADD CONSTRAINT departments_department_budget
    CHECK (department_budget >= 100000 AND department_budget <= 1000000);