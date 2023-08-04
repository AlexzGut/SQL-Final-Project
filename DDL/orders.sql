CREATE TABLE orders (
	order_id NUMERIC(6,0) NOT NULL,
    order_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    shipped_date DATE NOT NULL,
    shipped_status VARCHAR(15) NOT NULL,
    customer_id NUMERIC(6,0) NOT NULL,
    employee_id NUMERIC(6,0) NOT NULL,
    return_period VARCHAR(30) NOT NULL);
    
-- Primary Key
ALTER TABLE orders
	ADD CONSTRAINT orders_order_id_pk
		PRIMARY KEY (order_id);

-- Foreign Key
ALTER TABLE orders
	ADD CONSTRAINT orders_customer_id_fk
		FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id);
        
ALTER TABLE orders
	ADD CONSTRAINT orders_employee_id_fk
		FOREIGN KEY (employee_id)
        REFERENCES employees (employee_id);
        
-- Constraints
ALTER TABLE orders
	ADD CONSTRAINT orders_order_date_lt_shipped_date
    CHECK (order_date <= shipped_date);