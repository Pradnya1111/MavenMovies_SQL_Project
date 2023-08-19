use  mavenmovies;

/*QUESTION 1 TO COUNT NUMBER OF CHARA EXCEPT THE SPACE FOR EACH ACTOR RETURN FIRST 10 ACTOR NAME LENGTH  ALONG WITH THEIR NAME */
select first_name, last_name, length(concat(first_name, last_name)) as length from actor LIMIT 10;

/*QUESTION 2 actors who received oscar awards */
select concat(first_name,' ',last_name) as name from actor_award
where awards like '%Oscar%';

/*Queston 3 Actors acted in  film Frost Head*/
Select concat(a.first_name," ",a.last_name) as name from actor a
left join film_actor fa on fa.actor_id = a.actor_id
inner join film f on fa.film_id = f.film_id
where title='Frost Head';

/*Question 4 Pull all films acted by the actor Will Wilson*/
SELECT f.title from film f 
left join film_actor fa on f.film_id =fa.film_id
inner join actor a on a.actor_id = fa.actor_id
where first_name ='Will' and last_name ='Wilson';

/*QUESTION 5 all films which were rented  in month of may and dates between 15 and 31*/
SELECT f.title from film f 
left join inventory i on f.film_id = i.film_id
inner join rental r on i.inventory_id = r.inventory_id
where  (month(rental_date)='5') and (day(rental_date) between '15' and '31');

/* QUESTION 6 all films with comedy category*/
SELECT f.title from film f 
left join  film_category fc on f.film_id = fc.film_id
inner join category as c on fc.category_id = c.category_id
where c.category_id=5;
