-- Insertar datos en la tabla gama_producto
INSERT INTO gama_producto (gama, descripcion_texto, descripcion_html, imagen)
VALUES 
('Decoración', 'Productos de decoración', '<p>Productos de decoración</p>', 'decoracion.jpg'),
('Jardinería', 'Herramientas y accesorios de jardinería', '<p>Herramientas y accesorios de jardinería</p>', 'jardineria.jpg'),
('Mobiliario', 'Muebles para exteriores', '<p>Muebles para exteriores</p>', 'mobiliario.jpg'),
('Iluminación', 'Iluminación para jardín', '<p>Iluminación para jardín</p>', 'iluminacion.jpg'),
('Riego', 'Sistemas de riego', '<p>Sistemas de riego</p>', 'riego.jpg');

-- Insertar datos en la tabla producto
INSERT INTO producto (codigo_producto, nombre, gama, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor)
VALUES 
('P001', 'Maceta de barro', 'Decoración', '20x20 cm', 'Proveedor A', 'Maceta de barro color rojo', 100, 15.50, 10.00),
('P002', 'Tijeras de podar', 'Jardinería', '25 cm', 'Proveedor B', 'Tijeras de acero inoxidable', 50, 12.00, 8.00),
('P003', 'Silla de jardín', 'Mobiliario', '60x60x80 cm', 'Proveedor C', 'Silla de plástico resistente', 200, 25.00, 18.00),
('P004', 'Lámpara solar', 'Iluminación', '30 cm', 'Proveedor D', 'Lámpara solar LED', 150, 20.00, 14.00),
('P005', 'Aspersor', 'Riego', '15 cm', 'Proveedor E', 'Aspersor ajustable', 75, 10.00, 7.00);

-- Insertar datos en la tabla oficina
INSERT INTO oficina (codigo_oficina, ciudad, pais, region, codigo_postal, telefono, linea_direccion1, linea_direccion2)
VALUES 
('O001', 'Madrid', 'España', 'Europa', '28001', '+34 910 000 000', 'Calle Mayor, 1', 'Planta 3'),
('O002', 'Barcelona', 'España', 'Europa', '08001', '+34 930 000 000', 'Calle Gran Vía, 5', ''),
('O003', 'Valencia', 'España', 'Europa', '46001', '+34 960 000 000', 'Avenida del Puerto, 15', ''),
('O004', 'Sevilla', 'España', 'Europa', '41001', '+34 954 000 000', 'Calle Sierpes, 20', '2º Piso'),
('O005', 'Bilbao', 'España', 'Europa', '48001', '+34 944 000 000', 'Plaza Moyúa, 3', '');

-- Insertar datos en la tabla empleado
INSERT INTO empleado (codigo_empleado, nombre, apellido1, apellido2, extension, email, codigo_oficina, codigo_jefe, puesto)
VALUES 
(1, 'Juan', 'Pérez', 'Gómez', '1234', 'juan.perez@empresa.com', 'O001', NULL, 'Gerente'),
(2, 'María', 'López', 'Martínez', '1235', 'maria.lopez@empresa.com', 'O002', 1, 'Subgerente'),
(3, 'Pedro', 'García', 'Fernández', '1236', 'pedro.garcia@empresa.com', 'O003', 1, 'Vendedor'),
(4, 'Ana', 'Sánchez', 'Ruiz', '1237', 'ana.sanchez@empresa.com', 'O004', 1, 'Vendedor'),
(5, 'Luis', 'Martín', 'Hernández', '1238', 'luis.martin@empresa.com', 'O005', 1, 'Vendedor');

-- Insertar datos en la tabla cliente
INSERT INTO cliente (codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, codigo_empleado_rep_ventas, limite_credito)
VALUES 
(1, 'Jardinería S.L.', 'María', 'López', '+34 910 000 001', '+34 910 000 002', 'Avenida de la Paz, 10', '', 'Madrid', 'Europa', 'España', '28002', 3, 5000.00),
(2, 'Floristería La Rosa', 'Pedro', 'García', '+34 930 000 001', '+34 930 000 002', 'Calle de las Flores, 8', '', 'Barcelona', 'Europa', 'España', '08002', 3, 3000.00),
(3, 'Viveros Valencia', 'Ana', 'Sánchez', '+34 960 000 001', '+34 960 000 002', 'Calle del Jardín, 12', '', 'Valencia', 'Europa', 'España', '46002', 4, 4000.00),
(4, 'Paisajismo Sevilla', 'Luis', 'Martín', '+34 954 000 001', '+34 954 000 002', 'Avenida de la Alameda, 5', '', 'Sevilla', 'Europa', 'España', '41002', 5, 4500.00),
(5, 'Huertos Bilbao', 'Carlos', 'Hernández', '+34 944 000 001', '+34 944 000 002', 'Plaza del Arenal, 9', '', 'Bilbao', 'Europa', 'España', '48002', 2, 3500.00);

-- Insertar datos en la tabla pago
INSERT INTO pago (codigo_cliente, forma_pago, id_transaccion, fecha_pago, total)
VALUES 
(1, 'Tarjeta de crédito', 'T123456789', '2024-07-01', 150.75),
(2, 'Transferencia bancaria', 'T987654321', '2024-07-02', 300.50),
(3, 'Efectivo', 'T112233445', '2024-07-03', 500.00),
(4, 'PayPal', 'T554433221', '2024-07-04', 250.25),
(5, 'Cheque', 'T998877665', '2024-07-05', 400.00);

-- Insertar datos en la tabla pedido
INSERT INTO pedido (codigo_pedido, fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, codigo_cliente)
VALUES 
(1, '2024-07-01', '2024-07-10', '2024-07-08', 'Entregado', 'Pedido entregado a tiempo', 1),
(2, '2024-07-02', '2024-07-11', '2024-07-09', 'Entregado', 'Pedido entregado a tiempo', 2),
(3, '2024-07-03', '2024-07-12', '2024-07-10', 'Entregado', 'Pedido entregado a tiempo', 3),
(4, '2024-07-04', '2024-07-13', '2024-07-11', 'Entregado', 'Pedido entregado a tiempo', 4),
(5, '2024-07-05', '2024-07-14', '2024-07-12', 'Entregado', 'Pedido entregado a tiempo', 5);

-- Insertar datos en la tabla detalle_pedido
INSERT INTO detalle_pedido (codigo_pedido, codigo_producto, cantidad, precio_unidad, numero_linea)
VALUES 
(1, 'P001', 10, 15.50, 1),
(2, 'P002', 5, 12.00, 1),
(3, 'P003', 3, 25.00, 1),
(4, 'P004', 7, 20.00, 1),
(5, 'P005', 4, 10.00, 1),
(1, 'P002', 2, 12.00, 2),
(2, 'P003', 1, 25.00, 2),
(3, 'P004', 5, 20.00, 2),
(4, 'P005', 6, 10.00, 2),
(5, 'P001', 8, 15.50, 2);
