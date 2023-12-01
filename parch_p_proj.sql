---1. Provide a table for all web_events associated with account name of Walmart. 
---There should be three columns. Be sure to include the primary_poc, 
--time of the event, and the channel for each event. 
--Additionally, you might choose to add a fourth column to assure only Walmart events were chosen.

SELECT primary_poc, occurred_at AS time_of_event, channel, name
FROM web_events
JOIN accounts
ON web_events.account_id = accounts.id
WHERE name = 'Walmart';


--2. Provide a table that provides the region for each sales_rep along with their associated accounts. 
--Your final table should include three columns: the region name, the sales rep name, and the account name. 
--Sort the accounts alphabetically (A-Z) according to account name.

SELECT region.name AS region_name, sales_reps.name AS sales_rep_name, 
accounts.name AS account_name
FROM sales_reps
JOIN region ON region.id = sales_reps.region_id
JOIN accounts ON sales_rep_id = accounts.sales_rep_id
ORDER BY accounts.name ASC;

--3. Provide the name for each region for every order, 
--as well as the account name and the unit price they paid (total_amt_usd/total) for the order.
--Your final table should have 3 columns: region name, account name, and unit price. 
--A few accounts have 0 for total, so I divided by (total + 0.01) to assure not dividing by zero.

SELECT region.name, 
       accounts.name, 
       total_amt_usd / (total + 0.01) AS unit_price
FROM accounts
JOIN orders ON accounts.id = orders.account_id
JOIN region ON region.id = accounts.id;

--4. Provide a table that provides the region for each sales_rep along with their associated accounts. 
-- This time only for the Midwest region.
-- Your final table should include three columns: the region name, 
-- the sales rep name, and the account name. 
-- Sort the accounts alphabetically (A-Z) according to account name

SELECT region.name AS region_name, sales_reps.name AS sales_rep_name, 
accounts.name AS account_name
FROM sales_reps
JOIN region ON region.id = sales_reps.region_id
JOIN accounts ON sales_reps.id = accounts.sales_rep_id
WHERE region.name = 'Midwest'
ORDER BY accounts.name ASC;


--5. Provide a table that provides the region for each sales_rep along with their associated accounts. 
--This time only for accounts where the sales rep has a first name starting with S and in the Midwest region. 
--Your final table should include three columns:
--the region name, the sales rep name, and the account name. 
--Sort the accounts alphabetically (A-Z) according to account name.

SELECT region.name AS region_name, sales_reps.name AS sales_rep_name, 
accounts.name AS account_name
FROM sales_reps
JOIN region ON region.id = sales_reps.region_id
JOIN accounts ON sales_reps.id = accounts.sales_rep_id
WHERE sales_reps.name LIKE 'S%' 
AND region.name = 'Midwest'
ORDER BY accounts.name ASC;


--6. Provide a table that provides the region for each sales_rep along with their associated accounts.
--This time only for accounts where the sales rep has a last name starting with K and in the Midwest region. 
--Your final table should include three columns: the region name, the sales rep name, and the account name. 
--Sort the accounts alphabetically (A-Z) according to account name.

SELECT region.name AS region_name, sales_reps.name AS sales_rep_name, 
accounts.name AS account_name 
FROM sales_reps
JOIN region ON sales_reps.region_id = region.id
JOIN accounts ON sales_reps.id = accounts.sales_rep_id
WHERE sales_reps.name LIKE '% K%' AND region.name = 'Midwest'
ORDER BY accounts.name ASC;


--7. Provide the name for each region for every order, 
--as well as the account name and the unit price they paid (total_amt_usd/total) for the order.
--However, you should only provide the results if the standard order quantity exceeds 100.
--Your final table should have 3 columns: region name, account name, and unit price.
--In order to avoid a division by zero error, 
--adding .01 to the denominator here is helpful total_amt_usd/(total+0.01).

SELECT region.name AS region_name, accounts.name AS region_name, 
orders.total_amt_usd / (total +0.01) AS unit_price
FROM accounts 
JOIN orders ON accounts.id = orders.account_id
LEFT OUTER JOIN region ON accounts.id = region.id
WHERE standard_qty > 100;


--8. Provide the name for each region for every order, 
--as well as the account name and the unit price they paid (total_amt_usd/total) for the order. 
--However, you should only provide the results if the standard order quantity exceeds 100 
--and the poster order quantity exceeds 50. 
--Your final table should have 3 columns: region name, account name, and unit price. 
--Sort for the smallest unit price first. In order to avoid a division by zero error, 
--adding .01 to the denominator here is helpful (total_amt_usd/(total+0.01).

SELECT region.name AS region_name, accounts.name AS region_name, 
orders.total_amt_usd / (total +0.01) AS unit_price
FROM accounts 
JOIN orders ON accounts.id = orders.account_id
LEFT OUTER JOIN region ON accounts.id = region.id
WHERE standard_qty > 100 AND poster_qty > 50


--9. What are the different channels used by account id 1001? 
--Your final table should have only 2 columns: account name and the different channels.
--You can try SELECT DISTINCT to narrow down the results to only the unique values.

SELECT accounts.name AS account_name, web_events.channel AS channels
FROM accounts
LEFT JOIN web_events ON accounts.id = web_events.account_id
WHERE accounts.id = 1001;

SELECT DISTINCT accounts.name AS account_name, web_events.channel AS channels
FROM accounts
LEFT JOIN web_events ON accounts.id = web_events.account_id
WHERE accounts.id = 1001;





















