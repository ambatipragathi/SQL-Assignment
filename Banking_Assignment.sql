SHOW databases;
USE banking_assignment;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    city VARCHAR(50)
);
SHOW TABLES;
INSERT INTO customers (name, city) VALUES
('Janani','Chennai'),
('Arun','Coimbatore'),
('Priya','Madurai'),
('Karthik','Salem');
SELECT * FROM customers;


CREATE TABLE accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO accounts (customer_id, account_type, balance) VALUES
(1,'Savings',50000),
(1,'Current',20000),
(2,'Savings',30000),
(3,'Savings',15000),
(4,'Current',40000);

SELECT * FROM accounts;



-- Question 1: Retrieve all accounts with balance greater than 20,000
SELECT *
FROM accounts
WHERE balance > 20000;


-- Question 2: Find customers who live in Chennai
SELECT *
FROM customers
WHERE city = 'Chennai';


-- Question 3: Display accounts with balance between 20,000 and 50,000
SELECT *
FROM accounts
WHERE balance BETWEEN 20000 AND 50000;


-- Question 4: Find customers whose names start with 'J'
SELECT *
FROM customers
WHERE name LIKE 'J%';


-- Question 5: Retrieve accounts of type 'Savings' or 'Current'
SELECT *
FROM accounts
WHERE account_type IN ('Savings', 'Current');


-- Question 6: Display accounts that are not 'Savings'
SELECT *
FROM accounts
WHERE account_type <> 'Savings';


-- Question 7: Find customers whose names contain the letter 'a'
SELECT *
FROM customers
WHERE name LIKE '%a%';


-- Question 8: Retrieve accounts with balance less than or equal to 30,000
SELECT *
FROM accounts
WHERE balance <= 30000;


-- Question 9: Find customers who are not from Madurai
SELECT *
FROM customers
WHERE city <> 'Madurai';


-- Question 10: Display accounts where balance is not between 10,000 and 40,000
SELECT *
FROM accounts
WHERE balance NOT BETWEEN 10000 AND 40000;


-- Question 11: Retrieve customers whose names end with 'i'
SELECT *
FROM customers
WHERE name LIKE '%i';


-- Question 12: Find accounts with balance equal to 50,000
SELECT *
FROM accounts
WHERE balance = 50000;


-- Question 13: Display customers whose city is either Chennai or Salem
SELECT *
FROM customers
WHERE city IN ('Chennai', 'Salem');


-- Question 14: Find accounts with balance greater than 10,000 and less than 40,000
SELECT *
FROM accounts
WHERE balance > 10000
  AND balance < 40000;


-- Question 15: Retrieve accounts where account type is not 'Current'
SELECT *
FROM accounts
WHERE account_type NOT IN ('Current');



-- Question 16: Display all accounts sorted by balance in descending order
SELECT *
FROM accounts
ORDER BY balance DESC;


-- Question 17: List customers sorted alphabetically by name
SELECT *
FROM customers
ORDER BY name ASC;


-- Question 18: Display accounts sorted by account type and then by balance (descending)
SELECT *
FROM accounts
ORDER BY account_type ASC, balance DESC;


-- Question 19: Find the total balance of all accounts
SELECT SUM(balance) AS total_balance
FROM accounts;


-- Question 20: Calculate the average balance of accounts
SELECT AVG(balance) AS average_balance
FROM accounts;


-- Question 21: Find the maximum account balance
SELECT MAX(balance) AS maximum_balance
FROM accounts;


-- Question 22: Find the minimum account balance
SELECT MIN(balance) AS minimum_balance
FROM accounts;


-- Question 23: Count the total number of customers
SELECT COUNT(*) AS total_customers
FROM customers;


-- Question 24: Find total balance grouped by account type
SELECT account_type, SUM(balance) AS total_balance
FROM accounts
GROUP BY account_type;


-- Question 25: Find average balance for each account type
SELECT account_type, AVG(balance) AS average_balance
FROM accounts
GROUP BY account_type;


-- Question 26: Display account types having average balance greater than 20,000
SELECT account_type, AVG(balance) AS average_balance
FROM accounts
GROUP BY account_type
HAVING AVG(balance) > 20000;


-- Question 27: Count number of accounts for each customer
SELECT customer_id, COUNT(*) AS account_count
FROM accounts
GROUP BY customer_id;


-- Question 28: Display customers having more than one account
SELECT c.customer_id, c.name, COUNT(a.account_id) AS account_count
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.name
HAVING COUNT(a.account_id) > 1;


-- Question 29: Retrieve customer names along with their account balances
SELECT c.name, a.balance
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id;


-- Question 30: Display all customers and their accounts (including customers without accounts)
SELECT c.name, a.account_id, a.account_type, a.balance
FROM customers c
LEFT JOIN accounts a
ON c.customer_id = a.customer_id;


-- Question 31: Display all accounts and corresponding customer details
SELECT a.account_id, a.account_type, a.balance,
       c.customer_id, c.name, c.city
FROM accounts a
JOIN customers c
ON a.customer_id = c.customer_id;


-- Question 32: Retrieve customer names and account types where balance is greater than 20,000
SELECT c.name, a.account_type
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id
WHERE a.balance > 20000;


-- Question 33: List customers with their total balance using JOIN
SELECT c.name, SUM(a.balance) AS total_balance
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.name;


-- Question 34: Display customer names and balances sorted by balance
SELECT c.name, a.balance
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id
ORDER BY a.balance ASC;


-- Question 35: Count number of accounts for each city using JOIN
SELECT c.city, COUNT(a.account_id) AS account_count
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id
GROUP BY c.city;


-- Question 36: Find accounts with balance greater than average balance
SELECT *
FROM accounts
WHERE balance > (
    SELECT AVG(balance)
    FROM accounts
);


-- Question 37: Retrieve customers who have accounts
SELECT *
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM accounts
);


-- Question 38: Find customers who do not have any accounts
SELECT *
FROM customers
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM accounts
);


-- Question 39: Display account(s) with the maximum balance
SELECT *
FROM accounts
WHERE balance = (
    SELECT MAX(balance)
    FROM accounts
);


-- Question 40: Find customers whose total balance is greater than 40,000
SELECT c.customer_id, c.name, SUM(a.balance) AS total_balance
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.name
HAVING SUM(a.balance) > 40000;

