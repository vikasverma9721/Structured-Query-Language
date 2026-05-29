create database comapany;

use comapany;

select * from sales;

## Ques_01 Total sales per employee (Running Total)?
select id,employees,sales_amount, sum(sales_amount) over(partition by employees order by sales_amount) as Running_Total from sales;

## Ques_02 Row number per employee?
select id, employees, row_number() over(partition by employees) as Row_numbers from sales;

## Ques_03 Rank of sales per department.
select employees,department,sales_amount, rank() over(partition by department order by sales_amount) as RankSales from sales;

## Ques_04 Lead (next sale) per employee.
select employees, sales_amount, lead(sales_amount) over(partition by employees order by sales_amount) as NextSales from sales;

## Ques_05 Lag (previous sale) per employee.
select employees, sales_amount, lag(sales_amount) over(partition by employees order by sales_amount) as PreviousSales from sales;

## Ques_06 Average sales per employee.
select employees, sales_amount, avg(sales_amount) over(partition by employees order by sales_amount) AverageSales from sales;

## Ques_07 First and last sales per employee.
select employees,sales_amount, first_value(sales_amount) over(partition by employees order by sales_amount) as FirstSales, last_value(sales_amount) over(partition by employees order by sales_amount  rows between unbounded preceding and unbounded following) as LastSales from sales;

## Ques_08 Dense rank (no gaps).
select employees, sales_amount, dense_rank() over(partition by employees order by sales_amount) as DenseRank from sales; 

## Ques_09 Cumulative average per employee.
select employees,sales_amount, avg(sales_amount) over(partition by employees order by sales_amount) as CumulativeAverage from sales;

## Ques_10 Find highest sale per employee.
select employees, sales_amount, max(sales_amount) over(partition by employees) as HighestSale from sales;

## Ques_11 Sales difference from previous record.
select employees,sales_amount,lag(sales_amount) over(partition by employees order by sales_amount) as PreviousSales, sales_amount - lag(sales_amount) over(partition by employees order by sales_amount) as SalesDefference from sales;

## Ques_12 Cumulative count of sales per employee.
select employees,department,sales_amount,sales_date, count(sales_amount) over(partition by employees order by sales_date) as CountofSales from sales;

# Ques_13 Show if sale is above average per employee.
select employees, sales_amount, avg(sales_amount) over(partition by employees) as AverageSales,
case
when sales_amount > avg(sales_amount) over(partition by employees) then "Above Average"
else
"Below Average"
end
as AboveAverageEmployees from sales;

## Ques_14 Find second highest sale per employee.
select * from (select employees,sales_amount,dense_rank() over(partition by employees order by sales_amount desc) as DenseRank from sales) as SecondHighest where DenseRank = 2;