# Exploring Movies with SQL: MavenMovies Dataset<br>
Data set contains following tables:<br>

actor,
address,
advisor,
actor_award,
category,
city,
country,
customer,
film,
film_actor,
film_category,
film_text,
inventory,
investor,
language,
payment,
rental,
staff,
store.

Dive into the world of movies with our MavenMovies SQL project! We're using data to answer some interesting questions about actors and films.<br>

Question 1: Ever wondered how long actors' names are? We're counting the letters in each actor's name, excluding spaces. Check out the first ten actors and their name lengths!<br>
```sql
select first_name, last_name, length(concat(first_name, last_name)) as length from actor LIMIT 10;
```

Question 2: Who's won Oscars? Our query finds the actors who've received those shiny awards, highlighting their exceptional achievements.<br>
```sql
select concat(first_name,' ',last_name) as name from actor_award
where awards like '%Oscar%';
```
Question 3: Meet the cast of "Frost Head"! Our query reveals the actors who brought this film to life, giving you a peek behind the scenes.<br>
```sql
Select concat(a.first_name," ",a.last_name) as name from actor a
left join film_actor fa on fa.actor_id = a.actor_id
inner join film f on fa.film_id = f.film_id
where title='Frost Head';
```
Question 4: Curious about actor Will Wilson's filmography? We've got you covered. Our query lists all the films he's acted in.<br>
```sql
SELECT f.title from film f 
left join film_actor fa on f.film_id =fa.film_id
inner join actor a on a.actor_id = fa.actor_id
where first_name ='Will' and last_name ='Wilson';
```
Question 5: Let's talk May movie trends! We're looking at films rented and returned during the month of May, offering a snapshot of popular choices during that time.<br>
```sql
SELECT f.title from film f 
left join inventory i on f.film_id = i.film_id
inner join rental r on i.inventory_id = r.inventory_id
where  (month(rental_date)='5') and (day(rental_date) between '15' and '31');
```
Question 6: Need a good laugh? Our query gathers all the comedy films, ensuring you're well-stocked with entertainment that tickles your funny bone.<br>
```sql
SELECT f.title from film f 
left join  film_category fc on f.film_id = fc.film_id
inner join category as c on fc.category_id = c.category_id
where c.category_id=5;
```
Our MavenMovies project takes you on a cinematic journey, using simple SQL queries to reveal insights about actors, films, and viewing habits. It's a fun and accessible way to discover the magic behind the movies!
