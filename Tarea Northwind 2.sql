--TAREA 2: NORTHWIND (join)

-- Obtener un reporte de edades de los empleados para checar
-- su elegibilidad para seguro de gastos m�dicos menores.
select e.first_name, e.last_name, (age(now(), e.birth_date) - '30 years'::interval)
from employees e 

-- Cu�l es la orden m�s reciente por cliente
select c.company_name, max(o.order_id)
from customers c 
join orders o using (customer_id)
group by c.customer_id;


-- De nuestros clientes, qu� funci�n desempe�an y cu�ntos son?
select c.contact_title, count(c.contact_title)
from customers c 
group by contact_title 

-- Cu�ntos productos tenemos de cada categor�a?
select c.category_name , count(p.category_id)
from products p 
join categories c on c.category_id = p.category_id 
group by c.category_id 

-- C�mo podemos generar el reporte de reorder?
-- NO S� A QU� SE REFIERE

-- A donde va nuestro env�o m�s voluminoso?
select o.order_id, o.ship_country, o.ship_city, od.quantity 
from order_details od 
join orders o using (order_id)
order by od.quantity desc
limit 1

-- C�mo creamos una columna en customers que nos diga si un cliente es bueno, regular, o malo?
alter table customers add column tipo_cliente varchar(7) default false;

-- Qu� colaboradores chambearon durante las fiestas de navidad?
select e.first_name, e.last_name, o.order_date 
from employees e 
join orders o using (employee_id)
where o.order_date in ('1997-12-25', '1996-12-25')

-- Qu� productos mandamos en Navidad
select p2.product_name 
from products p2 
join order_details od using (product_id)
join orders o using (order_id)
where o.shipped_date in ('1997-12-25', '1996-12-25')

-- Qu� pa�s recibe el mayor volumen de producto?
select o.ship_country, sum(od.quantity)
from order_details od
join orders o using (order_id)
group by o.ship_country 
order by sum(od.quantity) desc
limit 1