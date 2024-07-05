Examen Base de datos -MySQL


GRUPO ⬇︎
Maria Fernanda Gamez
Juan Felipe Paredes






CONSULTAS ⬇︎

--Consultas sobre una tabla

1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
    SELECT codigo_oficina, ciudad
    FROM oficina;

2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo
jefe tiene un código de jefe igual a 7.
4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la
empresa.
5. Devuelve un listado con el nombre, apellidos y puesto de aquellos
empleados que no sean representantes de ventas.

6. Devuelve un listado con el nombre de los todos los clientes españoles.
    SELECT nombre
    FROM cliente
    WHERE pais = 'España';


7. Devuelve un listado con los distintos estados por los que puede pasar un
pedido.
    SELECT
8. Devuelve un listado con el código de cliente de aquellos clientes que
realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar
aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
• Utilizando la función YEAR de MySQL.
• Utilizando la función DATE_FORMAT de MySQL.
• Sin utilizar ninguna de las funciones anteriores.
9. Devuelve un listado con el código de pedido, código de cliente, fecha
esperada y fecha de entrega de los pedidos que no han sido entregados a
tiempo.
10. Devuelve un listado con el código de pedido, código de cliente, fecha
esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al
menos dos días antes de la fecha esperada.
• Utilizando la función ADDDATE de MySQL.
• Utilizando la función DATEDIFF de MySQL.
• ¿Sería posible resolver esta consulta utilizando el operador de suma + o
resta -?
11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.
12. Devuelve un listado de todos los pedidos que han sido entregados en el
mes de enero de cualquier año.

13. Devuelve un listado con todos los pagos que se realizaron en el
año 2008 mediante Paypal. Ordene el resultado de mayor a menor.
14. Devuelve un listado con todas las formas de pago que aparecen en la
tabla pago. Tenga en cuenta que no deben aparecer formas de pago
repetidas.
15. Devuelve un listado con todos los productos que pertenecen a la
gama Ornamentales y que tienen más de 100 unidades en stock. El listado
deberá estar ordenado por su precio de venta, mostrando en primer lugar
los de mayor precio.
16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y
cuyo representante de ventas tenga el código de empleado 11 o 30.


--Consultas multitabla (Composición interna)

1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su
representante de ventas.
    SELECT c.nombre_cliente, e.codigo_empleado
    FROM cliente c
    JOIN empleado e ON c.codigo_empleado_rep_ventas=e.codigo_empleado;
    

2. Muestra el nombre de los clientes que hayan realizado pagos junto con el
nombre de sus representantes de ventas.
    SELECT p.codigo_cliente, codigo_empleado_rep_ventas


3. Muestra el nombre de los clientes que no hayan realizado pagos junto con
el nombre de sus representantes de ventas.



4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus
representantes junto con la ciudad de la oficina a la que pertenece el
representante.
    SELECT 


5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre
de sus representantes junto con la ciudad de la oficina a la que pertenece el
representante.


6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.
    SELECT 


7. Devuelve el nombre de los clientes y el nombre de sus representantes junto
con la ciudad de la oficina a la que pertenece el representante.
8. Devuelve un listado con el nombre de los empleados junto con el nombre
de sus jefes.

9. Devuelve un listado que muestre el nombre de cada empleados, el nombre
de su jefe y el nombre del jefe de sus jefe.
10. Devuelve el nombre de los clientes a los que no se les ha entregado a
tiempo un pedido.
11. Devuelve un listado de las diferentes gamas de producto que ha comprado
cada cliente.