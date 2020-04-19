
/*Number1*/
select count(film) 
	from film 
	where fulltext @@ to_tsquery('astronaut');
/* so the answer is 78*/

/* Number 2*/
select rating, count(rating)
	from film
	where replacement_cost > 5 and replacement_cost <15
	group by rating;
/* so the answer is 52*/

/* Number 3*/
select staff.username, count(payment_id) as payments, sum(amount) as total_amount
	from payment
	join staff 
	on staff.staff_id = payment.staff_id
	group by staff.username
	order by payments desc; 
/* so the answer is Jon*/

/* Number 4*/
select rating, avg(replacement_cost) as average
	from film
	group by rating
	order by average desc;

/* Number 5*/
select customer.first_name,customer.last_name,customer.email, sum(amount) as amount
	from customer
	join payment
	on customer.customer_id = payment.customer_id
	group by customer.customer_id
	order by amount desc 
	limit 5;

/*then the lucky ones are Hunt, Seal, Snyder, Kennedy, Shaw*/

/*Number 6*/
select film_id, count(film_id) as copies, store_id 
	from inventory
	group by film_id, store_id
	order by store_id desc;

/*Number7*/
select customer.first_name, customer.last_name, customer.email, count(payment.amount) as total
	from customer
	join payment 
	on customer.customer_id = payment.customer_id
	group by customer.customer_id
	order by total desc;
