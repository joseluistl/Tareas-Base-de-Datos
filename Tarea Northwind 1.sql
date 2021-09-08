--Qu� contactos de proveedores tienen la posici�n de sales representative?
select  s.contact_name
from suppliers s 
where contact_title in ('Sales Representative');

--Qu� contactos de proveedores no son marketing managers?
select  s.contact_name 
from suppliers s 
where not contact_title in ('Marketing Manager');

--Cuales �rdenes no vienen de clientes en Estados Unidos?
select  o.order_id 
from orders o 
where not ship_country in ('USA');

--Qu� productos de los que transportamos son quesos?
select  p.product_name
from products p 
where category_id in (4);

--Qu� ordenes van a B�lgica o Francia?
select  o.order_id, o.ship_country 
from orders o 
where ship_country in ('France', 'Belgium');

--Qu� �rdenes van a LATAM?
--Nota: Se agrega esto para ver los pa�ses que hay y seleccionar los de LATAM
select  o.ship_country 
from orders o 
group by ship_country;

select  o.order_id, o.ship_country
from orders o 
where ship_country in ('Argentina', 'Venezuela', 'Mexico', 'Brazil');

--Qu� �rdenes no van a LATAM?
select  o.order_id, o.ship_country
from orders o 
where  not ship_country in ('Argentina', 'Venezuela', 'Mexico', 'Brazil');

--Necesitamos los nombres completos de los empleados, nombres y apellidos unidos en un mismo registro
select CONCAT_WS(', ', last_name, first_name) nombre_completo
from employees e;

--Cu�nta lana tenemos en inventario?
select sum(p.unit_price*p.units_in_stock) from products p;

--Cuantos clientes tenemos de cada pa�s?
select count(c.country), c.country 
from customers c 
group by country 
