--Qué contactos de proveedores tienen la posición de sales representative?
select  s.contact_name
from suppliers s 
where contact_title in ('Sales Representative');

--Qué contactos de proveedores no son marketing managers?
select  s.contact_name 
from suppliers s 
where not contact_title in ('Marketing Manager');

--Cuales órdenes no vienen de clientes en Estados Unidos?
select  o.order_id 
from orders o 
where not ship_country in ('USA');

--Qué productos de los que transportamos son quesos?
select  p.product_name
from products p 
where category_id in (4);

--Qué ordenes van a Bélgica o Francia?
select  o.order_id, o.ship_country 
from orders o 
where ship_country in ('France', 'Belgium');

--Qué órdenes van a LATAM?
--Nota: Se agrega esto para ver los países que hay y seleccionar los de LATAM
select  o.ship_country 
from orders o 
group by ship_country;

select  o.order_id, o.ship_country
from orders o 
where ship_country in ('Argentina', 'Venezuela', 'Mexico', 'Brazil');

--Qué órdenes no van a LATAM?
select  o.order_id, o.ship_country
from orders o 
where  not ship_country in ('Argentina', 'Venezuela', 'Mexico', 'Brazil');

--Necesitamos los nombres completos de los empleados, nombres y apellidos unidos en un mismo registro
select CONCAT_WS(', ', last_name, first_name) nombre_completo
from employees e;

--Cuánta lana tenemos en inventario?
select sum(p.unit_price*p.units_in_stock) from products p;

--Cuantos clientes tenemos de cada país?
select count(c.country), c.country 
from customers c 
group by country 
