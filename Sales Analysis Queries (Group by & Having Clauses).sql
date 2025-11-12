create database company1;

use company1;

create table sale(sale_id int unique, product varchar(50), category varchar(50), quantity int, price int, region varchar(50), sales_person varchar(50), sale_date date);

insert into sale(sale_id,product,category,quantity,price,region,sales_person,sale_date) values
(1,"Laptop","Electronics",5,50000,"East","John","2024-01-05"),
(2,"Mobile","Electronics",10,20000,"West","Mary","2024-01-10"),
(3,"Chair","Furniture",20,1500,"East","John","2024-02-15"),
(4,"Table","Furniture",8,5000,"North","Steve","2024-02-18"),
(5,"Laptop","Electronics",7,55000,"South","Mary","2024-03-01"),
(6,"Mobile","Electronics",15,18000,"East","John","2024-03-05"),
(7,"Sofa","Furniture",3,25000,"West","Steve","2024-03-20"),
(8,"Laptop","Electronics",2,52000,"North","Mary","2024-04-02"),
(9,"Chair","Furniture",30,1200,"South","John","2024-04-12"),
(10,"Mobile","Electronics",12,22000,"West","Steve","2024-04-15");

select * from sale;

#1.Find total sales amount for each region.
select region, sum(price * quantity) as Sales_amount
from sale
group by region;

#2.Find total quantity sold by each sales_person.
select sales_person, sum(quantity) as Total_quantity
from sale
group by sales_person;

#3.Show categories where total quantity sold is more than 30.
select category, sum(quantity) as Total_quantity
from sale
group by category
having  Total_quantity > 30;

#4.Find total revenue by each categories.
select category, sum(price * quantity) as Total_revenue
from sale
group by category;

#5. Find sales_person who sold total quantity more than 20.
select sales_person, sum(quantity) as Total_quantity
from sale
group by sales_person
having Total_quantity > 20;

#6. Fund region-wise average sale price.
select region, avg(price) as Average_sale_price
from sale
group by region;

#7. Find total revenue for each sales_person and show only those having revenue above 300000. 
select sales_person, sum(price * quantity) as Total_Revenue
from sale
group by sales_person
having Total_Revenue > 300000;

#8. Find how many products each category.
select category, count(distinct product) as product
from sale
group by category;

#9.Find total sales per months.
#(i)..
select monthname(sale_date) as "Months",
sum(price) as "Total Sale"
from sale
group by monthname(sale_date);

#(ii)..
select extract(month from sale_date) as "Months",
sum(price) as "Total sale"
from sale
group by extract(month from sale_date);

#(iii)..
select month(sale_date) as "Months",
sum(price) as "Total Sale"
from sale
group by month(sale_date);

#10. Find each region's maximum sale price.
select region, max(price) as Maximum_Sale_Price
from sale
group by region;

#11. Find each category's average quantity sold, but show only where avg > 10.
select category, avg(quantity) as Average_Quantity_Sold
from sale
group by category
having Average_Quantity_Sold > 10;

#12. Find total revenue by each region and category.
select category, sum(price * quantity) as Total_Revenue, region
from sale 
group by category, region
order by category, region;

#13. Find how many sales each sales_person made in each region.
select sales_person, region, count(*) as sales
from sale
group by sales_person, region;

#14. Find the region where total quantity sold exceeds 20.
select region, sum(quantity) as Total_sold
from sale
group by region
having Total_sold > 20;

#15. Find sales_person who sold in more one region.
select sales_person, count(distinct region) as Region
from sale
group by sales_person
having count(distinct region) > 1;

#16. Find category having total revenue between 200000 and 1000000.
select category, sum(price * quantity) as Total_Revenue
from sale
group by category
having Total_Revenue between 200000 and 1000000;

#17. Find top 1 category with the highest total sales.
select category, sum(price * quantity) as Highest_Total_Sale
from sale 
group by category
order by Highest_Total_Sale DESC
limit 1;

#18. Find sales_person's average sale value per transaction.
select sales_person, avg(price * quantity) as Average_sale
from sale
group by sales_person;

#19. Find category with minimum average price greater than 20000.
select category, avg(price) as Minimum_average
from sale
group by category
having avg(price) > 20000
order by Minimum_average limit 1;

#20. Find region and sales_person combination where revenue > 200000.
select region, sales_person, sum(price * quantity) as Revenue
from sale
group by region, sales_person
having sum(price * quantity) > 200000;