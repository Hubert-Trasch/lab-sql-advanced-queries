-- List each pair of actors that have worked together.


with actor_movies as (
  select actor_id, count(film_id) as num_films
  from film_actor
  group by actor_id
)

select fa1.film_id, concat(a1.first_name, ' ', a1.last_name), concat(a2.first_name, ' ', a2.last_name)
from sakila.actor a1
inner join film_actor fa1 on a1.actor_id = fa1.actor_id
inner join film_actor fa2 on (fa1.film_id = fa2.film_id) and (fa1.actor_id != fa2.actor_id)
inner join actor a2 on a2.actor_id = fa2.actor_id;


-- For each film, list actor that has acted in more films.

-- rank for actors and another query for movies


select fa1.film_id,concat(a1.first_name, ' ', a1.last_name),fa1.actor_id,fa2.actor_id
from sakila.actor a1
join film_actor fa1 on a1.actor_id=fa1.actor_id
join film_actor fa2 on fa1.film_id != fa2.film_id
join actor a2 on a2.actor_id=a1.actor_id;

