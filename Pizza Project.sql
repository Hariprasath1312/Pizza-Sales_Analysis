select * from pizza_sales;


-- Total Revenue

select round(sum(total_price)) as total_revenue 
from pizza_sales;


-- Avg order_value per order

select round(sum(total_price)/(count(distinct(order_id))))
from pizza_sales;

-- Total_pizza Sold

select sum(quantity) as total_pizza_sold
from pizza_sales;

-- Total_Order

select count(distinct(order_id)) as total_order
from pizza_sales;


-- Avg Pizza Per Order

select round(sum(quantity)/count(distinct order_id),2)
from pizza_sales;

-- Daily Trends for Total Orders:


SELECT 
    DAYNAME(order_date) AS day_name,
    COUNT(DISTINCT order_id) AS Total_Order
FROM pizza_sales
GROUP BY day_name
ORDER BY FIELD(day_name,
               'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday');

-- Houly Trends For total oders

select hour(order_time), count(distinct(order_id))
from pizza_sales
group by hour(order_time);


-- Monthly Trends FOr Total Orders

Select monthname(order_date) as MONTHS,count(distinct(order_id))
from pizza_sales
group by monthname(order_date)
order by field(months,
				'January','February','March','April','May','June','July','August','September','October','November','December');

-- percentaile of Sales by Catagory

select pizza_category, concat(round(sum(total_price)*100/(select sum(total_price) from pizza_sales),2),'%')  "percentaile of Sales by Catagory"
from pizza_sales
group by pizza_category;


-- percentage of sales by pizza size

select pizza_size, concat(round(sum(total_price)*100/(select sum(total_price) from pizza_sales),2),'%')  "percentaile of Sales by Catagory"
from pizza_sales
group by pizza_size;


-- TOtal Pizza Sold BY PIzza Category

select pizza_category , sum(quantity) as Total_Pizza
from pizza_sales
group by pizza_category;

-- TOP 5 Best seller by REvenue,Total Quantity , total Order

select pizza_name , round(sum(total_price)) as total_revenue,
		sum(quantity) as Total_quantity , count(distinct(order_id)) as Total_Orders
from pizza_sales
group by pizza_name
order by total_revenue desc ,Total_quantity desc,Total_orders desc
limit 5;

-- bottom 5 Best seller by REvenue,Total Quantity , total Order.

select pizza_name , round(sum(total_price)) as total_revenue,
		sum(quantity) as Total_quantity , count(distinct(order_id)) as Total_Orders
from pizza_sales
group by pizza_name
order by total_revenue asc,Total_quantity asc,Total_orders asc
limit 5;




