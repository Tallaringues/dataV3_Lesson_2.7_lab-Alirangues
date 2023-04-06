-- Lab | SQL Queries - Lesson 2.7
-- Week 2 -Day 4 -- Morning
USE sakila;

-- How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT * FROM category;
SELECT * FROM film_category;

SELECT c.name, count(c.category_id) AS number_films FROM category AS c
JOIN film_category as f
ON c.category_id=f.category_id
GROUP BY c.name;

-- Display the total amount rung up by each staff member in August of 2005.
SELECT * FROM payment;
SELECT * FROM staff;

SELECT s.first_name, sum(p.amount) AS "Total_earned"
FROM payment as p
LEFT JOIN staff AS s
ON p.staff_id=s.staff_id
WHERE MONTH(p.payment_date) = 8 AND YEAR(p.payment_date)=2005
GROUP BY s.first_name;

SELECT staff_id, sum(amount) as tota_earned FROM payment
WHERE MONTH(payment_date) = 8 AND YEAR(payment_date)=2005
group by staff_id;

-- Which actor has appeared in the most films?
SELECT * FROM film_actor;
SELECT * FROM actor;

SELECT actor_id, count(film_id) AS number_films FROM film_actor
GROUP BY actor_id
ORDER BY number_films DESC
LIMIT 1;

-- Most active customer (the customer that has rented the most number of films)
SELECT * FROM rental;

SELECT customer_id, count(customer_id) as number_rentals
FROM rental
GROUP BY customer_id
ORDER BY number_rentals DESC
LIMIT 1;

-- Display the first and last names, as well as the address, of each staff member.
SELECT * FROM staff;
SELECT * FROM address;

SELECT s.first_name AS "First name", last_name AS "Last name", a.address AS Address 
FROM staff as s
LEFT JOIN address as a
ON s.address_id = a.address_id;

-- List each film and the number of actors who are listed for that film.
SELECT * FROM film_actor; -- number of actors
SELECT * FROM film; -- title

SELECT f.title AS title, count(fa.actor_id) AS number_actors
FROM film as f
JOIN film_actor AS fa
ON f.film_id=fa.film_id
group by f.title;

/*
Using the tables payment and customer and the JOIN command, list the total paid by each customer.
List the customers alphabetically by last name.
*/
SELECT * FROM customer; -- last name
SELECT * FROM payment; -- amount

SELECT c.last_name as last_name, sum(p.amount) AS total_paid
FROM customer AS c
JOIN payment AS p
ON c.customer_id = p.customer_id
GROUP BY c.last_name
ORDER BY last_name ASC;

-- List number of films per category.
SELECT c.name, count(c.category_id) AS number_films FROM category AS c
JOIN film_category as f
ON c.category_id=f.category_id
GROUP BY c.name;