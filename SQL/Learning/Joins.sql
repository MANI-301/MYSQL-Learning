use classicmodels;
select productname, textdescription from products p 
inner join productlines pl
on p.productLine = pl.productLine;

select o.ordernumber , o.status,sum(quantityOrdered*priceEach)
as total_sales from orders o inner join orderdetails od
on o.orderNumber = od. orderNumber group by o.orderNumber;

select o.ordernumber,o.status,od.quantityOrdered,od.priceEach,
o.orderDate,productName from orders o 
inner join orderdetails od on o.orderNumber = od.orderNumber
inner join products using (productcode)
order by productname;