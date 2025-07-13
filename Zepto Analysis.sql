--Q1.Find the top 10 best-value products based on the discount percentage.
select distinct name,mrp,discountPercent
from zepto
order by discountPercent
limit 10;


--Q2. What are the Products with High MRP but out of stock.
select distinct name,mrp
from zepto
where outOfStock= True and mrp>300
order by mrp desc;

--Q3.calculate estimated Revenue for each category.
select category,
sum(discountedsellingPrice * availableQuantity) as total_revenue
from zepto
group by category
order by total_revenue;

--Q4.Find all products where MRP is greater then 500 and discount is less than 10%.
select distinct name,mrp,discountPercent
from zepto
where mrp>500 and discountPercent<10
order by mrp desc,discountPercent desc;

--Q5.Identify the top 5 categories offering the highest average discount percentage.
select category,
round(avg(discountPercent),2) as avg_discount
from zepto
group by category
order by avg_discount desc
limit 5;

--Q6. Find the prie per gram for products above 100g and sort by best value.
select distinct name,weightInGms,discountedsellingPrice,
round(discountedSellingPrice/weightInGms,2) as price_per_gram
from zepto
where weightInGms>=100
order by price_per_gram;

--Q7.Group the products into categories like Low,Medium,Bulk.
select distinct name,weightInGms,
case when weightInGms <1000 then 'Low'
    when weightInGms <5000 then 'Medium'
	else 'Bulk'
	end as weight_category
from zepto;

--Q8.What is the Total Inventory weight per Category.
select category,
sum(weightInGms * availableQuantity) as total_weight
from zepto
group by category
order by total_weight;
