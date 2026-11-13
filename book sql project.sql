--customer who order atleast 2 order:
select o.customer_id from customers as c join orders as o on c.customer_id=o.customer_id group by o.customer_id 
having count(order_id)>=2

--find the most frequently ordered book:
select o.book_id,count(order_id) as most_frequently_book from books as b join orders as o on o.book_id=b.book_id
group by o.book_id order by count(order_id) desc limit 1

--show the top 3 most expensive biiks of 'Fanstasy' genre:
select * from books where genre='Fantasy' order by price desc limit 3

--Reterive the toatla qunatity of books sold by each author:
select author ,sum(quantity) as total  from books as b join orders as o on b.book_id=o.book_id group by author


--list the cities where customers who spent over $30 are located:
select distinct city from customers as c join orders as o on c.customer_id=o.customer_id  where total_amount>30
group by city

--Find the customer who spent the most on orders:
select c.customer_id,name,sum(total_amount) as total from customers as c join orders as o on c.customer_id=o.customer_id 
group by c.customer_id order by total desc limit 1

--Find the customer who spent the most on orders:
select sum(stock-quantity) from books as b join orders as o on o.book_id=b.book_id

--Calculate the stock remaining after fulfilling all orders:
select b.book_id,title,stock,coalesce(sum(quantity),0),stock-coalesce(sum(quantity),0) from books as b left
join orders as o on o.book_id=b.book_id group by b.book_id

