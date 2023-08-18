-- Show the CUSTOMERS that live in Missisauga, over 18 years old and have purchased a total amount greater than or equal to 4000 dollars.

CREATE OR REPLACE VIEW promotion_in_mississauga AS
	SELECT cu.email -- SUM(cr.selling_price)
	FROM customers AS cu
		INNER JOIN orders AS o USING (customer_id)  
		INNER JOIN zips AS z USING (zip_code)
		INNER JOIN crafts_orders AS co USING (order_id) 
		INNER JOIN crafts AS cr USING (craft_id)
	WHERE ((YEAR(CURRENT_DATE)) - YEAR(cu.date_of_birth) >= 18)  AND (LOWER(z.city) = 'Mississauga')
	GROUP BY cu.email
    HAVING (SUM(cr.selling_price) > 4000);
    
select * from promotion_in_mississauga;


select * from customers;
select * from employees;
select * from orders;
select * from crafts_orders;
select * from crafts;
select * from zips;


INSERT INTO orders 
VALUES (222, DEFAULT, '2023-08-12', 'Good', 100000, 100002, '2023-12-31');
INSERT INTO orders 
VALUES (223, DEFAULT, '2023-08-12', 'Good', 100000, 100002, '2023-12-31');
INSERT INTO orders 
VALUES (224, DEFAULT, '2023-08-12', 'Good', 100000, 100002, '2023-12-31');



INSERT INTO crafts
VALUES (999, 'Sweater', 40.50, 12.99, 'm', 'red', 'clothe', 'slim', NULL);
INSERT INTO crafts
VALUES (998, 'Hat', 11.50, 5.99, 'm', 'red', 'clothe', 'slim', NULL);
INSERT INTO crafts
VALUES (997, 'Bag', 77.50, 12.99, 'm', 'red', 'clothe', 'slim', NULL);
INSERT INTO crafts
VALUES (996, 'Pants', 65.50, 12.99, 'm', 'red', 'clothe', 'slim', NULL);
INSERT INTO crafts
VALUES (995, 'T-shirt', 25.50, 12.99, 'm', 'red', 'clothe', 'slim', NULL);


INSERT INTO crafts_orders 
VALUES (999, 222, 8);
INSERT INTO crafts_orders 
VALUES (998, 222, 5);
INSERT INTO crafts_orders 
VALUES (997, 222, 4);
INSERT INTO crafts_orders 
VALUES (996, 222, 7);

INSERT INTO crafts_orders 
VALUES (995, 223, 2);
INSERT INTO crafts_orders 
VALUES (996, 223, 10);


INSERT INTO crafts_orders 
VALUES (995, 224, 8);
INSERT INTO crafts_orders 
VALUES (996, 224, 5);
INSERT INTO crafts_orders 
VALUES (997, 224, 4);

-- -----------------------------------------------------------------------------------------------
INSERT INTO orders 
VALUES (322, DEFAULT, '2023-08-12', 'Good', 100001, 100002, '2023-12-31');
INSERT INTO orders 
VALUES (323, DEFAULT, '2023-08-12', 'Good', 100001, 100002, '2023-12-31');
INSERT INTO orders 
VALUES (324, DEFAULT, '2023-08-12', 'Good', 100001, 100002, '2023-12-31');


INSERT INTO crafts
VALUES (199, 'Pack Sweater', 400.50, 12.99, 'm', 'red', 'clothe', 'slim', NULL);
INSERT INTO crafts
VALUES (198, 'Pack Hat', 110.50, 5.99, 'm', 'red', 'clothe', 'slim', NULL);
INSERT INTO crafts
VALUES (197, 'Pack Bag', 770.50, 12.99, 'm', 'red', 'clothe', 'slim', NULL);
INSERT INTO crafts
VALUES (196, 'Pack Pants', 650.50, 12.99, 'm', 'red', 'clothe', 'slim', NULL);
INSERT INTO crafts
VALUES (195, 'Pack T-shirt', 250.50, 12.99, 'm', 'red', 'clothe', 'slim', NULL);


INSERT INTO crafts_orders 
VALUES (199, 322, 18);
INSERT INTO crafts_orders 
VALUES (198, 322, 15);
INSERT INTO crafts_orders 
VALUES (197, 322, 14);
INSERT INTO crafts_orders 
VALUES (196, 322, 17);

INSERT INTO crafts_orders 
VALUES (195, 323, 12);
INSERT INTO crafts_orders 
VALUES (196, 323, 10);


INSERT INTO crafts_orders 
VALUES (195, 324, 18);
INSERT INTO crafts_orders 
VALUES (196, 324, 15);
INSERT INTO crafts_orders 
VALUES (197, 324, 14);

-- ------------------------------------------------------------------------------------------------------------------------------------------------------

-- Total sales amount by location of all orders for the past 6 months

SELECT z.city, SUM(cr.selling_price)
FROM customers AS cu
		INNER JOIN orders AS o USING (customer_id)  
		INNER JOIN zips AS z USING (zip_code)
		INNER JOIN crafts_orders AS co USING (order_id) 
		INNER JOIN crafts AS cr USING (craft_id)
WHERE (TIMESTAMPDIFF(MONTH, o.order_date, CURRENT_DATE) >= 0)
GROUP BY z.city;
