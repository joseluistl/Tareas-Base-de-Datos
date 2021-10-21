--Tarea 21/10/21

--C�mo obtenemos todos los nombres y correos de nuestros clientes canadienses para una campa�a?
select  c.last_name, c.first_name, c.email 
from customer c join address a using (address_id)
join city c2 using (city_id)
join country c3 using (country_id)
where c3.country = 'Canada';

--Qu� cliente ha rentado m�s de nuestra secci�n de adultos?
select c.first_name, c.last_name, count(r.rental_id)
from customer c join rental r using (customer_id)
join inventory i using (inventory_id)
join film f using (film_id)
where f.rating = 'R'
group by c.customer_id
order by count(r.rental_id) desc
limit 1;

--Qu� pel�culas son las m�s rentadas en todas nuestras stores?
select f.title, count(f.title) 
from film f join inventory i using (film_id)
join store s using (store_id)
group by f.film_id 
order by count(f.title) desc;

--Cu�l es nuestro revenue por store?
select s.store_id, (sum(p.amount))
from store s join inventory i using (store_id)
join rental r using (inventory_id)
join payment p using (rental_id)
group by s.store_id
order by s.store_id;