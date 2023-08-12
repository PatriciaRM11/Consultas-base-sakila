#Consultas sobre la base de datos sakila

use sakila;

#Nombre de las películas y su categoría. 
select f.title, ca.name from sakila.film f inner join film_category c on (f.film_id=c.film_id) inner join sakila.category ca on (ca.category_id=c.category_id);

#Numero total de peliculas
select count(title) from sakila.film;

#Numero de películas por categoría.
select count(f.title), ca.name from sakila.film f inner join film_category c on (f.film_id=c.film_id) inner join sakila.category ca on (ca.category_id=c.category_id) group by ca.name;

#Nombre de las películas y el nombre de los actores.
select f.title, a.first_name, a.last_name  from film f inner join film_actor fa on (f.film_id=fa.film_id) inner join actor a on (a.actor_id=fa.actor_id) order by f.title

#Número de películas que ha realizado la actriz SANDRA PECK
select count(f.title) as n_de_peliculas, a.first_name, a.last_name  from film f inner join film_actor fa on (f.film_id=fa.film_id) inner join actor a on (a.actor_id=fa.actor_id) where a.first_name='SANDRA' AND a.last_name='PECK';

#Peliculas de categoría Acción 
select f.title, ca.name from sakila.film f inner join film_category c on (f.film_id=c.film_id) inner join sakila.category ca on (ca.category_id=c.category_id) where ca.name='ACTION';

#Peliculas de categoría Acción y Animación
select f.title, ca.name from sakila.film f inner join film_category c on (f.film_id=c.film_id) inner join sakila.category ca on (ca.category_id=c.category_id) where ca.name in ('ACTION','ANIMATION');

#Consulta sobre las clientes Mary y Patricia
select * from sakila.customer where first_name in ('Mary', 'Patricia');

#Nombre de los clientes y su tienda
select c.first_name, s.store_id from sakila.customer c left join sakila.store s on (c.store_id=s.store_id);

#Actores cuyo nombre empieza por A y apellido por B
select * from sakila.actor where first_name like 'A%' and last_name like 'B%';

#Listado de peliculas y su idioma
select f.title, f.description, l.name from sakila.film f left join sakila.language l on (f.language_id=l.language_id);
