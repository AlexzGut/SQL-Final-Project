-- 1. Retrieve the CUSTOMERS that live in Toronto, over 18 years old and have purchased a total amount greater than or equal to 10 dollars.

CREATE OR REPLACE VIEW promotion_in_mississauga AS
SELECT cu.email 
	FROM customers AS cu
		INNER JOIN orders USING (customer_id)  
		INNER JOIN zips AS z USING (zip_code)
		INNER JOIN crafts_orders USING (order_id) 
		INNER JOIN crafts AS cr USING (craft_id)
WHERE ((YEAR(CURRENT_DATE)) - YEAR(cu.date_of_birth) >= 18)  AND (LOWER(z.city) = 'toronto')
	GROUP BY cu.email
    	HAVING (SUM(cr.selling_price) > 10);

-- 2. Retrieve the total sales amount by location of all orders for the past 6 months to know which city has sold more crafts.

SELECT z.city, SUM(cr.selling_price)
FROM customers
		INNER JOIN orders AS o USING (customer_id)  
		INNER JOIN zips AS z USING (zip_code)
		INNER JOIN crafts_orders USING (order_id) 
		INNER JOIN crafts AS cr USING (craft_id)
WHERE (TIMESTAMPDIFF(MONTH, o.order_date, CURRENT_DATE) >= 6)
GROUP BY z.city;

-- 3. Create a view that shows the yarns that are mostly used by calculating the crafts ordered multiplied by the quantity of the crafts sold.

CREATE VIEW most_ordered_yarns AS
SELECT
    Y.yarn_id,
    Y.yarn_type,
    Y.yarn_color,
    Y.yarn_description,
    COALESCE((
        SELECT SUM(CO.quantity * CY.quantity)
        FROM crafts_orders CO
        JOIN crafts_yarns CY ON CO.craft_id = CY.craft_id
        WHERE CY.yarn_id = Y.yarn_id
    ), 'Not used yet') AS total_ordered_quantity
FROM yarns Y;

-- 4. List the total sales of each employee that is Sales Representatives.

CREATE VIEW Employee_sales AS
SELECT
    E.employee_id,
    E.first_name,
    E.last_name,
    (
        SELECT COALESCE(SUM(CO.quantity * C.selling_price), 0)
        FROM crafts_orders CO
        JOIN crafts C ON CO.craft_id = C.craft_id
        JOIN orders O ON CO.order_id = O.order_id
        WHERE O.employee_id = E.employee_id
    ) AS total_sales_amount
FROM employees E
WHERE E.job_id = 301; -- Job IDs Sales Representatives (301)

-- 5. Retrieve the customers and its favorite craft with the highest selling price.

CREATE OR REPLACE VIEW highest_selling_favorite_craft AS
SELECT CONCAT(c.first_name,' ', c.last_name) AS customer_name,
cr.craft_name AS favorite_craft,
cr.selling_price
FROM customers c
	LEFT JOIN crafts cr ON c.favorite_craft = cr.craft_id
WHERE cr.selling_price = (SELECT MAX(selling_price) FROM crafts);

-- 6. Retrieve the list of crafts along with the total quantity available in each warehouse.

CREATE OR REPLACE VIEW craft_total_quantity AS
SELECT c.craft_name,
w.warehouse_name,
COALESCE(SUM(i.quantity), 0) AS total_quantity
FROM crafts c
CROSS JOIN warehouses w
LEFT JOIN inventories i ON c.craft_id = i.craft_id AND w.warehouse_id = i.warehouse_id
GROUP BY c.craft_id, w.warehouse_id;

-- 7. Retrieve how many craft items are available and how many have been ordered, helping track craft supplies.

CREATE VIEW CraftInventorySummary AS
SELECT c.craft_id,
    	c.craft_name,
    	i.quantity AS inventory_quantity,
    	COALESCE(SUM(co.quantity), 0) AS total_ordered_quantity
FROM crafts c
LEFT JOIN inventories i ON c.craft_id = i.craft_id
LEFT JOIN crafts_orders co ON c.craft_id = co.craft_id
GROUP BY c.craft_id, c.craft_name, i.quantity;


-- 8. Retrieve the list of employees with their department.

CREATE VIEW EmployeeDepartmentSummary AS
SELECT e.employee_id,
    	e.first_name,
    	e.last_name,
    	d.department_id,
    	d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;

-- 9. Retrieve the list of employees and the quantity of craft sold.

SELECT e.employee_id, CONCAT(e.first_name, ' ', e.last_name) AS "Full Name",
co.quantity,
co.craft_id
FROM employees AS e
	JOIN orders AS q USING (employee_id)
	JOIN crafts_orders AS co USING(order_id);

-- 10. warehouse with highest capacity in an specific province

CREATE VIEW highest_warehouse_capacity AS
SELECT w.warehouse_id, w.warehouse_name, w.address, w.capacity, z.zip_code, z.city, z.province, z.country
FROM warehouses w
JOIN zips z ON w.zip_code = z.zip_code
WHERE z.province = 'Ontario'
AND w.capacity = (
    SELECT MAX(capacity)
    FROM warehouse_details
);

-- 11. Retrieve warehouse details with the capacity in a specific city

SELECT w.warehouse_id, w.warehouse_name, w.address, w.capacity, z.zip_code, z.city,      z.province, z.country
FROM warehouses w
JOIN zips z ON w.zip_code = z.zip_code
WHERE city = 'Toronto';

-- 12. Retrieve the number of warehouses per province

SELECT z.province, COUNT(w.warehouse_id) AS "Number of warehouses"
FROM warehouses AS w
INNER JOIN zips AS z USING (zip_code)
GROUP BY z.province;
