Examen Base de datos -MySQL


GRUPO ⬇︎
Maria Fernanda Gamez
Juan Felipe Paredes











1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
    SELECT codigo_oficina, ciudad 
    FROM oficina;

2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
    SELECT ciudad, telefono 
    FROM oficina 
    WHERE pais= 'España';

3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo
jefe tiene un código de jefe igual a 7.
    SELECT nombre, apellido1, apellido2, email 
    FROM empleado 
    WHERE codigo_jefe= 7;

4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la
empresa.
    SELECT nombre, apellido1, apellido2, puesto, emai
    FROM empleado 
    WHERE puesto!= 'Vendedor';

5. Devuelve un listado con el nombre, apellidos y puesto de aquellos
empleados que no sean representantes de ventas.
    

6. Devuelve un listado con el nombre de los todos los clientes españoles.
    SELECT estado 
    FROM pedido;
    SELECT nombre_cliente 
    FROM cliente 
    WHERE pais= 'España';

7. Devuelve un listado con los distintos estados por los que puede pasar un
pedido.
    SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega 
    FROM pedido 
    WHERE estado= 'No entregado';
    Consultas sobre una tabla


Consultas multitabla (Composición interna)
 1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.
    SELECT c.nombre_cliente, e.nombre, e.apellido1
    FROM cliente c
    JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado;

 2. Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.
    SELECT c.nombre_cliente, e.nombre, e.apellido1
    FROM cliente c
    JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
    JOIN pago p ON c.codigo_cliente = p.codigo_cliente;

 3. Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.
    SELECT c.nombre_cliente, e.nombre, e.apellido1, e.apellido2
    FROM cliente c
    JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
    LEFT JOIN pago p ON c.codigo_cliente = p.codigo_cliente
    WHERE p.codigo_cliente IS NULL;

 4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
    SELECT c.nombre_cliente, e.nombre, e.apellido1, e.apellido2, o.ciudad
    FROM cliente c
    JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
    JOIN pago p ON c.codigo_cliente = p.codigo_cliente
    JOIN oficina o ON e.codigo_oficina = o.codigo_oficina;

 5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
    SELECT c.nombre_cliente, e.nombre, e.apellido1, e.apellido2, o.ciudad
    FROM cliente c
    JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
    LEFT JOIN pago p ON c.codigo_cliente = p.codigo_cliente
    JOIN oficina o ON e.codigo_oficina = o.codigo_oficina
    WHERE p.codigo_cliente IS NULL;

 6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.
    SELECT o.linea_direccion1, o.linea_direccion2
    FROM oficina o
    JOIN cliente c ON o.codigo_oficina = c.codigo_oficina
    WHERE c.ciudad = 'Fuenlabrada';

 7. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
    SELECT c.nombre_cliente, e.nombre, e.apellido1, e.apellido2, o.ciudad
    FROM cliente c
    JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
    JOIN oficina o ON e.codigo_oficina = o.codigo_oficina;

 8. Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.
    SELECT e1.nombre AS nombre_empleado, e2.nombre AS nombre_jefe
    FROM empleado e1
    JOIN empleado e2 ON e1.codigo_jefe = e2.codigo_empleado;

 9. Devuelve un listado que muestre el nombre de cada empleado, el nombre de su jefe y el nombre del jefe de sus jefe.
    SELECT e1.nombre AS nombre_empleado, e2.nombre AS nombre_jefe, e3.nombre AS nombre_jefe_del_jefe
    FROM empleado e1
    JOIN empleado e2 ON e1.codigo_jefe = e2.codigo_empleado
    JOIN empleado e3 ON e2.codigo_jefe = e3.codigo_empleado;

 10. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.
    SELECT c.nombre_cliente
    FROM cliente c
    JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
    WHERE p.fecha_entrega > p.fecha_esperada;

 11. Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.
    SELECT c.nombre_cliente, gp.gama
    FROM cliente c
    JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
    JOIN detalle_pedido dp ON p.codigo_pedido = dp.codigo_pedido
    JOIN producto pr ON dp.codigo_producto = pr.codigo_producto
    JOIN gama_producto gp ON pr.gama = gp.gama;

 13. Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.
SELECT 
    codigo_cliente,
    forma_pago,
    id_transaccion,
    fecha_pago,
    total
FROM 
    pago
WHERE 
    YEAR(fecha_pago) = 2008
    AND forma_pago = 'Paypal'
ORDER BY 
    total DESC;

 14. Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.
SELECT DISTINCT forma_pago
FROM pago;

 15. Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.
SELECT 
    codigo_producto,
    nombre,
    precio_venta,
    cantidad_en_stock
FROM producto
WHERE gama = 'Ornamentales'AND cantidad_en_stock > 100
ORDER BY precio_venta DESC;

 16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.
SELECT 
    c.codigo_cliente,
    c.nombre_cliente,
    c.nombre_contacto,
    c.apellido_contacto,
    c.telefono,
    c.ciudad,
    c.region,
    c.pais,
    c.codigo_postal
FROM cliente c
JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
WHERE  c.ciudad = 'Madrid'AND e.codigo_empleado IN (11, 30);



Consultas multitabla (Composición externa)
Resuelva todas las consultas utilizando las cláusulas LEFT JOIN, RIGHT JOIN, NATURAL
LEFT JOIN y NATURAL RIGHT JOIN.

1. Devuelve un listado que muestre solamente los clientes que no han
realizado ningún pago.
    SELECT p.codigo_cliente, c.nombre_cliente
    FROM pago p
    LEFT JOIN cliente c ON p.codigo_cliente=c.codigo_cliente
    WHERE p.id_transaccion IS NULL;


2. Devuelve un listado que muestre solamente los clientes que no han
realizado ningún pedido.
    SELECT p.codigo_cliente, c.nombre_cliente
    FROM pedido p
    LEFT JOIN cliente c ON p.codigo_cliente=c.codigo_cliente
    WHERE p.codigo_pedido IS NULL;

3. Devuelve un listado que muestre los clientes que no han realizado ningún
pago y los que no han realizado ningún pedido.
    SELECT 


4. Devuelve un listado que muestre solamente los empleados que no tienen
una oficina asociada.
    SELECT 


5. Devuelve un listado que muestre solamente los empleados que no tienen un
cliente asociado.
6. Devuelve un listado que muestre solamente los empleados que no tienen un
cliente asociado junto con los datos de la oficina donde trabajan.
7. Devuelve un listado que muestre los empleados que no tienen una oficina
asociada y los que no tienen un cliente asociado.
8. Devuelve un listado de los productos que nunca han aparecido en un
pedido.
9. Devuelve un listado de los productos que nunca han aparecido en un
pedido. El resultado debe mostrar el nombre, la descripción y la imagen del
producto.

10. Devuelve las oficinas donde no trabajan ninguno de los empleados que
hayan sido los representantes de ventas de algún cliente que haya realizado
la compra de algún producto de la gama Frutales.
11. Devuelve un listado con los clientes que han realizado algún pedido pero no
han realizado ningún pago.
12. Devuelve un listado con los datos de los empleados que no tienen clientes
asociados y el nombre de su jefe asociado.



Consultas resumen
1. ¿Cuántos empleados hay en la compañía?
    SELECT COUNT(*)
    FROM empleado;

2. ¿Cuántos clientes tiene cada país?
    SELECT COUNT(*)
    FROM cliente
    GROUP BY pais;

3. ¿Cuál fue el pago medio en 2009?
    SELECT AVG(total)
    FROM pago
    WHERE fecha_pago='2009';

4. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.
    SELECT

5. Calcula el precio de venta del producto más caro y más barato en una
misma consulta.
    SELECT 
        MAX(p.precio_venta) AS precio_max,
        MIN(p.precio_venta) AS precio_min
    FROM producto p;

6. Calcula el número de clientes que tiene la empresa.
    SELECT COUNT(*)
    FROM cliente;

7. ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?
    SELECT COUNT(codigo_cliente)
    FROM cliente
    WHERE ciudad = 'Madrid';

8. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan
por M?
    SELECT COUNT(codigo_cliente)
    FROM cliente
    WHERE ciudad LIKE 'M%';

9. Devuelve el nombre de los representantes de ventas y el número de clientes
al que atiende cada uno.
    SELECT 
        e.nombre AS nombre_representante, 
        COUNT(c.codigo_cliente) AS numero_clientes
    FROM empleado e
    LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
    GROUP BY e.codigo_empleado, e.nombre;


10. Calcula el número de clientes que no tiene asignado representante de
ventas.
11. Calcula la fecha del primer y último pago realizado por cada uno de los
clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.

12. Calcula el número de productos diferentes que hay en cada uno de los
pedidos.
    SELECT DISTINCT COUNT(codigo_pedido)
    FROM detalle_producto;

13. Calcula la suma de la cantidad total de todos los productos que aparecen en
cada uno de los pedidos.
    SELECT 
        p.codigo_pedido,
        SUM(d.cantidad) AS suma_cantidad_total
    FROM pedido p
    JOIN detalle_pedido d ON p.codigo_pedido = d.codigo_pedido
    GROUP BY p.codigo_pedido;

14. Devuelve un listado de los 20 productos más vendidos y el número total de
unidades que se han vendido de cada uno. El listado deberá estar ordenado
por el número total de unidades vendidas.
    SELECT 
        d.codigo_producto, 
        p.nombre, 
        SUM(d.cantidad) AS total_unidades_vendidas
    FROM detalle_pedido d
    JOIN producto p ON d.codigo_producto = p.codigo_producto
    GROUP BY d.codigo_producto, p.nombre
    ORDER BY total_unidades_vendidas DESC
    LIMIT 20;

15. La facturación que ha tenido la empresa en toda la historia, indicando la
base imponible, el IVA y el total facturado. La base imponible se calcula
sumando el coste del producto por el número de unidades vendidas de la
tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la
suma de los dos campos anteriores.
    SELECT 
        SUM(dp.cantidad * p.precio_proveedor) AS base_imponible,
        SUM(dp.cantidad * p.precio_proveedor * 0.21) AS iva,
        SUM(dp.cantidad * p.precio_proveedor * 1.21) AS total_facturado
FROM detalle_pedido dp
JOIN producto p ON dp.codigo_producto = p.codigo_producto;


16. La misma información que en la pregunta anterior, pero agrupada por
código de producto.
    SELECT 
        dp.codigo_producto,
        p.nombre,
        SUM(dp.cantidad * p.precio_proveedor) AS base_imponible,
        SUM(dp.cantidad * p.precio_proveedor * 0.21) AS iva,
        SUM(dp.cantidad * p.precio_proveedor * 1.21) AS total_facturado
FROM detalle_pedido dp
JOIN producto p ON dp.codigo_producto = p.codigo_producto
GROUP BY dp.codigo_producto, p.nombre;

17. La misma información que en la pregunta anterior, pero agrupada por
código de producto filtrada por los códigos que empiecen por OR.
    SELECT 
        dp.codigo_producto,
        p.nombre,
        SUM(dp.cantidad * p.precio_proveedor) AS base_imponible,
        SUM(dp.cantidad * p.precio_proveedor * 0.21) AS iva,
        SUM(dp.cantidad * p.precio_proveedor * 1.21) AS total_facturado
    FROM detalle_pedido dp
    JOIN producto p ON dp.codigo_producto = p.codigo_producto
    WHERE dp.codigo_producto LIKE 'OR%'
    GROUP BY dp.codigo_producto, p.nombre;

18. Lista las ventas totales de los productos que hayan facturado más de 3000
euros. Se mostrará el nombre, unidades vendidas, total facturado y total
facturado con impuestos (21% IVA).
19. Muestre la suma total de todos los pagos que se realizaron para cada uno
de los años que aparecen en la tabla pagos.
