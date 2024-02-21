-- Viewing all transaction records
SELECT * FROM sales.transactions;

-- Viewing total records of sales transaction 
SELECT count(*) FROM sales.transactions;

-- Total number  of customer
SELECT count(*) FROM sales.customers;

-- first five transaction made
SELECT * FROM sales.transactions
order by transactions.order_date DESC
Limit 5;

-- transactions performed in Chennai with market_code "Mark001"
SELECT count(*) FROM sales.transactions
where market_code = "Mark001"
order by transactions.order_date;

-- transactions  performed in 2020
SELECT sales.transactions.*, sales.date.*
From sales.transactions
INNER JOIN sales.date ON sales.transactions.order_date = sales.date.date
where sales.date.year = 2020;

-- Total revenue in 2020
SELECT SUM(sales.transactions.sales_amount)
From sales.transactions
INNER JOIN sales.date ON sales.transactions.order_date = sales.date.date
where sales.date.year = 2020;


-- Distinct product sold in Chennai in 2020
SELECT Distinct product_code
From sales.transactions
INNER JOIN sales.date ON sales.transactions.order_date = sales.date.date
where sales.date.year = 2020 and sales.transactions.market_code = "Mark001";
