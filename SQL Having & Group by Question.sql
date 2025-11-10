create database college1;

use college1;

select * from employee2;

update employee2
set category = "Furniture" where sale_id in (3,4,7,9);
set sql_safe_updates = 0;

# Ques_01 Find total sales ammount for each region.
select region,
sum(price) as total_ammount from employee2
group by region;
  
  # Ques_02 find total quantity sold by each salesperson
  select salesperson,
  sum(quantity) as total_quantity from employee2
  group by salesperson;
  
  # Ques_03 Show categories where total quantity sold is more than 30.
  select category,
  sum(quantity) as total_quantity from employee2
  group by category
  having sum(quantity) > 30;
  
  # Ques_04 Find total revenue by each categories.
select category,
sum(price*quantity) as total_revenue from employee2
group by category;

# Ques_05 find sales_person who sold total quantity more than 20
select salesperson,
sum(quantity) as total_quantity from employee2
group by salesperson
having sum(quantity) > 20;


# Ques_06 find region-wise average sale price.
select region,
avg(price) as average_sale_price
from employee2
group by region;

# Ques_07 find total revenue for each salesperson and show only those having revenue above 300000.
select salesperson,
sum(price*quantity) as revenue from employee2
group by salesperson
having sum(price*quantity) > 300000;

# Ques_08 find how many products each category has.
select category,
count(category) as product from employee2
group by category;

# Ques_09 find total sales per month.
# Month of name
select monthname(sale_date) as per_month,
sum(price) as total_sales from employee2
group by monthname(sale_date);

# Month 
select month(sale_date) as per_month,
sum(price) as total_sales from employee2
group by month(sale_date);


# Ques_10 find each region's maxium sale price.
select region,
max(price) as max_sales from employee2
group by region;

# Ques_11 find each category's average quantity sold, but show only where avg > 10.
select category,
avg(quantity) as average_qauntity 
from employee2
group by category
having avg(quantity) > 10;

# Ques_12 find total revenue by region and category.
select region,category,
sum(price) as revenue from employee2
group by region,category;

# Ques_13 find how many sales each salesperson made in each region.
select region,salesperson,
count(sale_date) as total_sales 
from employee2
group by region,salesperson;

# Ques_14 find the region where total quantity sold exceeds 20.
select region,
sum(quantity) as total_quantity from employee2
group by region
having sum(quantity) > 20;

# Ques_15 find salesperson who sold in more than one region.
select salesperson,
count(region) as region
from employee2
group by salesperson
having count(region) > 1;

# Ques_16 find category having total revenue between 200000 and 1000000.
select category,
sum(price*quantity) as total_revenue
from employee2
group by category
having sum(price) between 200000 and 1000000;

# Ques_17 find top 1 category with the highest total sales.
select category,
sum(price) as highest_total_sales
from employee2
group by category
having sum(price) order by category desc limit 1;

# Ques_18 find salespersn's average sale value per transaction.
select salesperson,
avg(price) as sale_value
from employee2
group by salesperson;

# Ques_19 find category with minimum average price greater than 20000.
select category,
avg(price*quantity) as minimum_average
from employee2
group by category
having avg(price*quantity) > 20000;

# Ques_20 find region and salesperson combination where revenue > 200000.
select region,salesperson,
sum(price*quantity) as revenue
from employee2 
group by region,salesperson
having sum(price*quantity) > 200000;