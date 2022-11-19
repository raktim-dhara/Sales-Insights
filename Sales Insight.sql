-- All Customers Record

	select *
	from customers;


-- Total Number of Customers

	select count(*)
	from customers;


-- Transactions for Chennai Market (Market Code for Chennai is 'Mark001')

	select *
	from transactions
	Where market_code = "Mark001";


	select *
	from transactions t inner join markets m
	on t.market_code = m. markets_code
	where m.markets_name = 'Chennai';


-- Distrinct Product Codes that Were Sold in Chennai

	select distinct product_code
	from transactions
	where market_code = 'Mark001';


-- Transactions Where Currency is USD

	select *
	from transactions
	where currency = "USD";


-- Transactions in 2020 Join by 'Date' Table

	select *
	from transactions t inner join date d
	on t.order_date = d.date;


-- Total Revenue in Year 2020

	select sum(sales_amount)
	from transactions t inner join date d
	on t.order_date = d.date
	where d.year = 2020 and (t.currency = 'INR\r' or t.currency = 'USD\r');


-- Total Revenue in Year 2020, January Month

	select sum(sales_amount)
	from transactions t inner join date d
	on t.order_date = d.date
	where d.year = 2020 and d.month_name = 'January' and (t.currency = 'INR\r' or t.currency = 'USD\r');


-- Total Revenue in Year 2020 in Chennai

	select sum(t.sales_amount)
	from transactions t inner join markets m
	on t.market_code = m. markets_code inner join date d
	on t.order_date = d.date
	where d.year = 2020 and m.markets_name = 'Chennai';


-- Worst Performing Zone (According to Revenue)

	select m.zone, sum(t.sales_amount) as zonal_revenue
	from transactions t inner join markets m
	on t.market_code = m. markets_code
	group by m.zone
	order by zonal_revenue ASC
	limit 1;