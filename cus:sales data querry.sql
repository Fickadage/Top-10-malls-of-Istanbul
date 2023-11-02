CREATE TABLE customer_data(customer_id TEXT, gender VARCHAR(250),
						   age INT,	
						   payment_method VARCHAR(250));
						   
SELECT * FROM customer_data;	


CREATE TABLE sales_data(invoice_no TEXT, customer_id TEXT, category	VARCHAR(250),
						quantity INT, price DECIMAL, invoice_date TEXT,
						shopping_mall VARCHAR(250));
						  

SELECT * FROM sales_data;


WITH customer_sales_data AS (SELECT DISTINCT(cus.customer_id),sales.category,sales.quantity,
sales.price,sales.invoice_date,
sales.shopping_mall,cus.payment_method
FROM customer_data cus
JOIN sales_data sales
ON cus.customer_id = sales.customer_id
GROUP BY cus.customer_id,sales.category,sales.quantity,
sales.price,sales.invoice_date,
sales.shopping_mall,cus.payment_method
ORDER BY quantity DESC) SELECT SUM(price) AS total_price,shopping_mall,
SUM(quantity) AS quantity_sold,
COUNT(customer_id) AS total_customers,
category
FROM customer_sales_data
GROUP BY category,shopping_mall
ORDER BY total_price DESC;



