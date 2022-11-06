-- 1. How many actors are there with the last name 'Wahlberg'? (2)
select first_name, last_name
from actor 
where last_name like 'Wahlberg';

-- 2. How many payments were made between $3.99 and $5.99? (5,602)
select COUNT(amount)
from payment
where amount between 3.99 and 5.99;

-- 3. What film does the store have the most of ? (Film_id 350)
select film_id, COUNT(film_id) as value_occurrence
from inventory
group by film_id
order by value_occurrence desc
limit 1;

-- 4. How many customers have the last name 'William'? (None)
select first_name, last_name
from customer 
where last_name like 'William';

-- 5. What store employee (get the id) sold the most rentals? (Mike Hillyer, 8040)
select COUNT(staff_id), staff_id
from rental
group by staff_id;

-- 6. How many different district names are there? (378)
select COUNT(distinct district)
from address;

-- 7. What film has the most actors in it ? (508 Lambs Cincinatti, 15 actors)
select film_id, COUNT(distinct actor_id)
from film_actor 
group by film_id
order by COUNT(distinct actor_id) desc;

-- 8. From store_id 1, how many customers have a last name ending with 'es'? (13)
select first_name, last_name
from customer 
where store_id = '1' and last_name like '%es'; 

-- 9. How many payment amounts (4.99, 5.99, etc. ) had a number of rentals above 250 for customers 
-- with ids between 380 and 430? (3)
select amount
from payment 
where customer_id between 380 and 430
group by amount 
having COUNT(rental_id) > 250;

-- 10. Within the film table, how many rating categories are there? 
-- And what rating has the most movies total?(5, 223 PG-13 Ratings)
select COUNT(distinct film_id), rating
from film 
group by rating;