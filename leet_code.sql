
---O'zim leetCodeda ishlaganman sizni bilmadim qanday qanday strukturaga tushunasiz,
--- past ball qoyib charchamadiz 2 ta darsdan buyon---

--------------------------Task1----------------------
---Create tables for the products---
Products table:
+-------------+----------+------------+
| product_id  | low_fats | recyclable |
+-------------+----------+------------+
| 0           | Y        | N          |
| 1           | Y        | Y          |
| 2           | N        | Y          |
| 3           | Y        | Y          |
| 4           | N        | N          |
+-------------+----------+------------+

---Select products from the table
-- Write a solution to find the ids of products that are both low fat and recyclable---
SELECT product_id
FROM products
where low_facts = 'Y'
  and recyclable = 'Y';


--------------------------Task2----------------------

---Create tables for the customers---
Customer table:
+----+------+------------+
| id | name | referee_id |
+----+------+------------+
| 1  | Will | null       |
| 2  | Jane | null       |
| 3  | Alex | 2          |
| 4  | Bill | null       |
| 5  | Zack | 1          |
| 6  | Mark | 2          |
+----+------+------------+

---Select customers from the customers table
-- Find the names of the customer that are not referred by the customer with id = 2---
SELECT name
FROM customers
WHERE referee_id != 2
   or referee_id is NULL;


--------------------------Task3----------------------

---Create tables for the world---
World table:
+-------------+-----------+---------+------------+--------------+
| name        | continent | area    | population | gdp          |
+-------------+-----------+---------+------------+--------------+
| Afghanistan | Asia      | 652230  | 25500100   | 20343000000  |
| Albania     | Europe    | 28748   | 2831741    | 12960000000  |
| Algeria     | Africa    | 2381741 | 37100000   | 188681000000 |
| Andorra     | Europe    | 468     | 78115      | 3712000000   |
| Angola      | Africa    | 1246700 | 20609294   | 100990000000 |
+-------------+-----------+---------+------------+--------------+


---Select the world from the table
-- it has an area of at least three million (i.e., 3000000 km2), or
-- it has a population of at least twenty-five million (i.e., 25000000).
-- Write a solution to find the name, population, and area of the big countries---
SELECT name, population, area
FROM world
where population > 25000000
   or area > 3000000;
   

--------------------------Task4----------------------

---Create tables for the views---
Views table:
+------------+-----------+-----------+------------+
| article_id | author_id | viewer_id | view_date  |
+------------+-----------+-----------+------------+
| 1          | 3         | 5         | 2019-08-01 |
| 1          | 3         | 6         | 2019-08-02 |
| 2          | 7         | 7         | 2019-08-01 |
| 2          | 7         | 6         | 2019-08-02 |
| 4          | 7         | 1         | 2019-07-22 |
| 3          | 4         | 4         | 2019-07-21 |
| 3          | 4         | 4         | 2019-07-21 |
+------------+-----------+-----------+------------+


---Select the views from the table
-- Write a solution to find all the authors that viewed at least one of their own articles---
SELECT DISTINCT author_id as id
FROM views
where author_id = viewer_id
ORDER BY id;


--------------------------Task5----------------------

---Create tables for the tweets---
Tweets table:
+----------+----------------------------------+
| tweet_id | content                          |
+----------+----------------------------------+
| 1        | Vote for Biden                   |
| 2        | Let us make America great again! |
+----------+----------------------------------+


-- Write a solution to find the IDs of the invalid tweets.
-- The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.---
SELECT tweet_id
FROM tweets
WHERE LENGTH(content) >= 15;



--------------------------Task6----------------------

---Create table for the employees---
Employees table:
+----+----------+
| id | name     |
+----+----------+
| 1  | Alice    |
| 7  | Bob      |
| 11 | Meir     |
| 90 | Winston  |
| 3  | Jonathan |
+----+----------+

---Create table for the employeeuni---
EmployeeUNI table:
+----+-----------+
| id | unique_id |
+----+-----------+
| 3  | 1         |
| 11 | 2         |
| 90 | 3         |
+----+-----------+

---Select the employee and employeeuni from the table---
---Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null.---
SELECT eu.unique_id, e.name from employees e left join employeeuni eu on e.id=eu.id;

--------------------------Task7----------------------

Sales table:
+---------+------------+------+----------+-------+
| sale_id | product_id | year | quantity | price |
+---------+------------+------+----------+-------+ 
| 1       | 100        | 2008 | 10       | 5000  |
| 2       | 100        | 2009 | 12       | 5000  |
| 7       | 200        | 2011 | 15       | 9000  |
+---------+------------+------+----------+-------+

Product table:
+------------+--------------+
| product_id | product_name |
+------------+--------------+
| 100        | Nokia        |
| 200        | Apple        |
| 300        | Samsung      |
+------------+--------------+

---Write a solution to report the product_name, year, and price for each sale_id in the Sales table--
SELECT 
(SELECT product_name FROM product WHERE product_id=s.product_id) as product_name, 
s.year, s.price 
FROM sales s;

--------------------------Task8----------------------

---Create table for the visitis---

+----------+-------------+
| visit_id | customer_id |
+----------+-------------+
| 1        | 23          |
| 2        | 9           |
| 4        | 30          |
| 5        | 54          |
| 6        | 96          |
| 7        | 54          |
| 8        | 54          |
+----------+-------------+

---Crete table for theTransactions---

+----------------+----------+--------+
| transaction_id | visit_id | amount |
+----------------+----------+--------+
| 2              | 5        | 310    |
| 3              | 5        | 300    |
| 9              | 5        | 200    |
| 12             | 1        | 910    |
| 13             | 2        | 970    |
+----------------+----------+--------+

---Write a solution to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.---

SELECT customer_id, 
count(visit_id) as count_no_trans FROM visits 
where visit_id not in (select visit_id from transactions) group by customer_id;

--------------------------Task9----------------------

---Crete table for the weather---

Weather table:
+----+------------+-------------+
| id | recordDate | temperature |
+----+------------+-------------+
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |
+----+------------+-------------+

---Write a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday).---

SELECT w1.id from weather w1 
where w1.temperature >(SELECT w2.temperature from weather w2 where w2.recorddate=subdate(w1.recorddate, 1));

--------------------------Task10----------------------

