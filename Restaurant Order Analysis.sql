# Objective 1
# Explore the items table
# Your first objective is to better understand the items table by finding the number of rows in the table, the least and most expensive items, and the item prices within each category.


# 1.1 View the menu_items table and write a query to find the nuber of items on the menu
-- number of menu items
SELECT DISTINCT COUNT(menu_item_id) AS item_count
FROM menu_items;-- 32 items

# 1.2 What are the least and most expensive items on the menu?
SELECT item_name, MIN(price) AS min_price
FROM menu_items
GROUP BY item_name
ORDER BY min_price
LIMIT 1; -- Least expensive:Edamame $5.00

SELECT item_name, MAX(price) AS max_price
FROM menu_items
GROUP BY item_name
ORDER BY max_price DESC
LIMIT 1; -- Most expensive: Shrimp Scampi $19.95

# 1.3.a How many Italian dishes are on the menu? 
SELECT DISTINCT COUNT(menu_item_id) AS item_count
FROM menu_items
WHERE category = 'Italian'; -- 9 Italian dishes

# 1.3.b What are the least and most expensive Italian dishes on the menu?
SELECT item_name, category, MAX(price) AS price
FROM menu_items
WHERE category = 'Italian'
GROUP BY item_name, category
ORDER BY price DESC
LIMIT 1;-- Most expensive: Shrimp Scampi $19.95

SELECT item_name, category, MIN(price) AS price
FROM menu_items
WHERE category = 'Italian'
GROUP BY item_name, category
ORDER BY 3
LIMIT 2;-- Least expensive: Spaghetti and Fettuccine Alfredo $14.50

# 1.4 How many dishes are in each category? What is the average dish price within each category?
SELECT DISTINCT category, COUNT(menu_item_id) AS number_of_dishes, ROUND(AVG(price), 2) AS avg_dish_price
FROM menu_items
GROUP BY category;
# category		number_of_dishes		avg_dish_price
# American		6						$10.07
# Asian			8						$13.48
# Mexican		9						$11.80
# Italian		9						$16.75


# Objective 2
# Explore the orders table
# Your second objective is to better understand the orders table by finding the date range, the number of items within each order, and the orders with the highest number of items.

# 2.1.a View the order_details table. 
SELECT * FROM order_details;

# 2.1.b What is the date range of the table?
SELECT MIN(order_date), MAX(order_date)
FROM order_details;-- 2023-01-01 - 2023-03-31

# 2.2.a How many orders were made within this date range? 
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM order_details;
-- total_orders 5370

# 2.2.b How many items were ordered within this date range?
SELECT COUNT(*) AS total_items
FROM order_details;
-- total_items 12234

# 2.3 Which orders had the most number of items
SELECT order_id, COUNT(item_id) AS total_items
FROM order_details
GROUP BY order_id
ORDER BY total_items DESC
LIMIT 7; -- 7 orders has the same number of items
# Order_id	Total_Items
# 1957		14
# 4305		14
# 440		14
# 443		14
# 3473		14
# 330		14
# 2675		14

# 2.4 How many orders had more than 12 items?
SELECT COUNT(order_id) total_orders
FROM
    (SELECT order_id, COUNT(item_id)
    FROM order_details
    GROUP BY order_id
    HAVING COUNT(item_id) > 12) order_count;
-- 20 orders have more than 12 items


# Objective 3
# Analyze customer behavior
# Your final objective is to combine the items and orders tables, find the least and most ordered categories, and dive into the details of the highest spend orders.

# 3.1 Combine the menu_items and order_details table into a single table
DROP TABLE IF EXISTS menu_orders;
CREATE TABLE menu_orders 
(SELECT 
	mi.menu_item_id
    ,mi.item_name
   ,mi.category
    ,mi.price
    ,od.order_details_id
    ,od.order_id
    ,od.order_date
    ,od.order_time 
FROM menu_items mi
	INNER JOIN order_details od 
		ON mi.menu_item_id = od.item_id);
select count(*) from menu_items;

# 3.2 What were the least and most ordered items? What categories were they in?
DROP TABLE IF EXISTS ordered_items; 
CREATE TEMPORARY TABLE ordered_items 
(SELECT item_name, category, COUNT(menu_item_id) AS item_count
FROM menu_orders
GROUP BY item_name, category);

select * from ordered_items;
-- most ordered item
SELECT item_name, category, MAX(item_count) AS most_ordered
FROM ordered_items
GROUP BY item_name, category
ORDER BY most_ordered DESC
LIMIT 1; -- Hamburger, American, 622

-- least ordered item
SELECT item_name, category, MIN(item_count) AS least_ordered
FROM ordered_items
GROUP BY item_name, category
ORDER BY least_ordered
LIMIT 1; -- Chicken Tacos, Mexican, 123
        
# 3.3 What were the top 5 orders that spent the most money?
SELECT order_id, sum(price) AS order_total
FROM menu_orders
GROUP BY order_id
ORDER BY order_total DESC
LIMIT 5;
# order_id	order_total
# 440		192.15
# 2075		191.05
# 1957		190.10
# 330		189.70
# 2675		185.10

# 3.4 View the details of the highest spend order. Which specific items were purchased?
-- find order with the highest total (order id 440)
SELECT order_id, sum(price) AS order_total
FROM menu_orders 
GROUP BY order_id
ORDER BY order_total DESC
LIMIT 1;

-- find all orders
SELECT * 
FROM menu_orders
WHERE order_id = 440;

-- order caregories
-- find specific items purchased
SELECT DISTINCT category, count(item_name) AS total_items
FROM menu_orders
WHERE order_id = 440
group by 1;
# category	total_items
# Mexican	2
# American	2
# Italian	8
# Asian		2

-- find specific items purchased
SELECT DISTINCT item_name, count(item_name) AS total_items
FROM menu_orders
WHERE order_id = 440
group by 1;
# item_name				total_items
# Steak Tacos			1
# Hot Dog				1
# Spaghetti				1
# Spaghetti & Meatballs	2
# Fettuccine Alfredo	2
# Korean Beef Bowl		1
# Meat Lasagna			1


# 3.5 BONUS: View the details of the top 5 highest spend orders
SELECT order_id, sum(price) AS order_total
FROM menu_orders 
GROUP BY order_id
ORDER BY order_total DESC
LIMIT 5;

# order_id	 order_total
# 440		 192.15
# 2075		 191.05
# 1957		 190.10
# 330		 189.70
# 2675		 185.10

SELECT order_id, category, count(item_name) AS total_items
FROM menu_orders
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY order_id, category;