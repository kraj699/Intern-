select * from sales;

alter table sales add column order_month integer;
update sales set order_month = extract(month from order_date);


SELECT 
  EXTRACT(YEAR FROM order_date) AS order_year,
  EXTRACT(MONTH FROM order_date) AS order_month,
  count(order_date) AS first_order_date
FROM sales
GROUP BY EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)


select distinct extract(year from order_month) as order_year from sales;

select sum(revenue) as total_revenue from sales;

select distinct(size) from sales;

SELECT size,count(*) from sales 
group by size
order by size asc;

SELECT SUM(revenue) from sales where order_date between '2022-06-01 16:05:00' and '2022-06-09 20:16:01';
