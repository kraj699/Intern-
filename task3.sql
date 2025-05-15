create table sales(
order_id INT,
order_date TIMESTAMP,
sku varchar(50),
color varchar(50),
size varchar(50),
unit_price int,
quantity int,
revenue int
);

COPY sales FROM '/tmp/women_clothing_ecommerce_sales.csv' DELIMITER ',' CSV HEADER;

select * from sales;
select * from sales where color = 'Dark Blue';
select * from sales order by revenue desc;
select color , sum(revenue)as total_sales from sales group by color;

SELECT a.color, a.order_id AS order_1, b.order_id AS order_2
FROM sales a
INNER JOIN sales b
    ON a.size = b.size
WHERE a.order_id < b.order_id;

select color,revenue from sales where revenue > (select avg(revenue) from sales)

explain analyse select * from sales where revenue = 298

CREATE VIEW customer_summary AS
SELECT 
	color,
	size,
    COUNT(order_id) AS total_orders,
    SUM(revenue) AS total_spent,
    AVG(revenue) AS avg_spent
FROM sales
GROUP BY color, size;

select * from customer_summary;