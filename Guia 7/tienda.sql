DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE fabricante (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);



/* 1. Lista el nombre de todos los productos que hay en la tabla producto.*/
SELECT nombre FROM producto;
/* 2. Lista los nombres y los precios de todos los productos de la tabla producto.*/
SELECT nombre, precio FROM producto;
/* 3. Lista todas las columnas de la tabla producto.*/
SELECT * FROM producto;
/* 4. Lista el nombre de los productos, el precio en euros y el precio en dólares
estadounidenses (USD).*/
SELECT *,precio/200 as 'Dolares', precio/220 as 'Euros' FROM producto;
/* 5. Lista los nombres y los precios de todos los productos de la tabla producto,
convirtiendo los nombres a mayúscula.*/
SELECT upper(nombre), precio FROM producto;
/* 6. Lista el nombre de todos los fabricantes en una columna, y en otra columna
obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.*/
SELECT nombre, upper(left(nombre,2)) FROM fabricante;
/* 7. Lista los nombres y los precios de todos los productos de la tabla producto,
redondeando el valor del precio.*/
SELECT nombre, round(precio) FROM producto;
/* 8. Lista los nombres y los precios de todos los productos de la tabla producto,
truncando el valor del precio para mostrarlo sin ninguna cifra decimal.*/
SELECT nombre, truncate(precio,0) FROM producto ;
/* 9. Lista el código de los fabricantes que tienen productos en la tabla producto.*/
SELECT * FROM fabricante WHERE codigo in (SELECT codigo FROM producto) ORDER BY nombre;
/* 10. Lista el código de los fabricantes que tienen productos en la tabla producto, sin
mostrar los repetidos.*/
SELECT * FROM fabricante WHERE codigo in (SELECT codigo FROM producto) ORDER BY nombre;
/* 11. Lista los nombres de los fabricantes ordenados de forma ascendente.*/
SELECT nombre FROM fabricante ORDER BY nombre;
/* 12. Lista los nombres de los productos ordenados en primer lugar por el nombre de
forma ascendente y en segundo lugar por el precio de forma descendente.*/
SELECT nombre FROM producto ORDER BY nombre;
SELECT nombre, precio FROM producto ORDER BY precio DESC;
/* 13. Devuelve una lista con las 5 primeras filas de la tabla fabricante.*/
SELECT * FROM fabricante LIMIT 5;
/* 14. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas
ORDER BY y LIMIT)*/
SELECT * FROM producto ORDER BY precio LIMIT 1;
/* 15. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas
ORDER BY y LIMIT)*/
SELECT * FROM producto ORDER BY precio DESC limit 1;
/* 16. Lista el nombre de todos los productos del fabricante cuyo código de fabricante es
igual a 2.*/
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
/* 17. Lista el nombre de los productos que tienen un precio menor o igual a $120.*/
SELECT nombre FROM producto WHERE precio<120;
/* 18. Lista todos los productos que tengan un precio entre $80 y $300. Sin utilizar el
operador BETWEEN.*/
SELECT * FROM producto WHERE precio<300 and precio>80;
/* 19. Lista todos los productos que tengan un precio entre $60 y $200. Utilizando el
operador BETWEEN.*/
SELECT * FROM producto WHERE precio BETWEEN 60 and 200;
/* 20. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Sin utilizar el
operador IN.*/
SELECT * FROM producto WHERE codigo=1 or codigo=3 or codigo=5;
/* 21. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el
operador IN.*/
SELECT * FROM producto WHERE codigo in (1,3,5);
/* 22. Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por
100 el valor del precio). Cree un alias para la columna que contiene el precio que se
llame céntimos.*/
SELECT nombre, precio, precio*100 as centimos FROM producto;
/* 23. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.*/
SELECT nombre FROM fabricante WHERE length(nombre)=4;
/* 24. Devuelve una lista con el nombre de todos los productos que contienen la cadena
Portátil en el nombre.*/
SELECT nombre FROM producto WHERE nombre LIKE '%Portátil%';
/* Consultas multitabla (Composición interna)
1. Devuelve una lista con el código del producto, nombre del producto, código del
fabricante y nombre del fabricante, de todos los productos de la base de datos.*/ 
SELECT p.codigo, p.nombre, f.codigo, f.nombre FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo;
/* 2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de
todos los productos de la base de datos. Ordene el resultado por el nombre del
fabricante, por orden alfabético.*/
SELECT p.nombre, p.precio, f.nombre FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo ORDER BY f.nombre;
/* 3. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del
producto más barato.*/ 
SELECT p.nombre, p.precio, f.nombre FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo ORDER BY p.precio LIMIT 1;
/* 4. Devuelve una lista de todos los productos del fabricante Lenovo.*/
SELECT * FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo HAVING f.nombre LIKE 'Lenovo';                        
/* 5. Devuelve una lista de todos los productos del fabricante Crucial que tengan un
precio mayor que $200.*/
SELECT * FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo HAVING f.nombre LIKE 'Crucial' and p.precio>200;     
/* 6. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-
Packard. Sin utilizar el operador IN.*/ 
SELECT * FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo HAVING f.nombre LIKE 'Asus' or f.nombre LIKE 'Hewlett-Packard';
/* 7. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-
Packard. Utilizando el operador IN.*/
SELECT * FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo HAVING f.nombre in ('Asus','Hewlett-Packard');
/* 8. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de
todos los productos que tengan un precio mayor o igual a $180. Ordene el resultado
en primer lugar por el precio (en orden descendente) y en segundo lugar por el
nombre (en orden ascendente)*/
SELECT p.nombre, p.precio, f.nombre FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo HAVING p.precio>=180 ORDER BY p.precio DESC;
SELECT p.nombre, p.precio, f.nombre FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo HAVING p.precio>=180 ORDER BY p.nombre;
/* Consultas multitabla (Composición externa)
Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.
1. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto
con los productos que tiene cada uno de ellos. El listado deberá mostrar también
aquellos fabricantes que no tienen productos asociados.*/ 
SELECT * FROM producto p RIGHT JOIN fabricante f ON p.codigo_fabricante = f.codigo;        
/* 2. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen
ningún producto asociado.*/ 
SELECT * FROM fabricante f 
WHERE NOT EXISTS (SELECT * FROM producto p 
WHERE f.codigo = p.codigo_fabricante);
SELECT * FROM fabricante f
LEFT OUTER JOIN producto p on f.codigo=p.codigo_fabricante
WHERE p.codigo is NULL;          
/* Subconsultas (En la cláusula WHERE)
Con operadores básicos de comparación
1. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).*/
SELECT p.* FROM fabricante f, producto p WHERE p.codigo_fabricante =  f.codigo and f.nombre = 'Lenovo';
/* 2. Devuelve todos los datos de los productos que tienen el mismo precio que el
producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).*/
SELECT * FROM producto WHERE precio = (SELECT max(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Levono'));
/* 3. Lista el nombre del producto más caro del fabricante Lenovo.*/
SELECT p.* FROM fabricante f, producto p WHERE p.codigo_fabricante =  f.codigo and f.nombre = 'Lenovo' HAVING max(p.precio);
/* 4. Lista todos los productos del fabricante Asus que tienen un precio superior al precio
medio de todos sus productos. */
SELECT * FROM producto WHERE precio >= (SELECT avg(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus'));
/* Subconsultas con ALL y ANY
1. Devuelve el producto más caro que existe en la tabla producto sin hacer uso de
MAX, ORDER BY ni LIMIT.*/
SELECT * FROM producto WHERE precio >= ANY (SELECT precio FROM producto WHERE precio > 600);
/* 2. Devuelve el producto más barato que existe en la tabla producto sin hacer uso de
MIN, ORDER BY ni LIMIT.*/
SELECT * FROM producto WHERE precio <= ANY (SELECT precio FROM producto WHERE precio < 70);
/* 3. Devuelve los nombres de los fabricantes que tienen productos asociados.
(Utilizando ALL o ANY).*/
SELECT distinct f.* FROM fabricante f, producto p WHERE f.codigo = p.codigo_fabricante and p.codigo_fabricante = any (SELECT codigo FROM fabricante); 
/* 4. Devuelve los nombres de los fabricantes que no tienen productos asociados.
(Utilizando ALL o ANY).*/
SELECT nombre FROM fabricante WHERE codigo <> ALL (SELECT codigo_fabricante FROM  producto);
/* Subconsultas con IN y NOT IN
1. Devuelve los nombres de los fabricantes que tienen productos asociados.
(Utilizando IN o NOT IN).*/
SELECT nombre FROM fabricante WHERE codigo in (SELECT codigo_fabricante FROM  producto);
/* 2. Devuelve los nombres de los fabricantes que no tienen productos asociados.
(Utilizando IN o NOT IN). */ 
SELECT nombre FROM fabricante WHERE codigo not in (SELECT codigo_fabricante FROM  producto);
/* Subconsultas con EXISTS y NOT EXISTS
1. Devuelve los nombres de los fabricantes que tienen productos asociados.
(Utilizando EXISTS o NOT EXISTS).*/
SELECT nombre FROM fabricante WHERE EXISTS (SELECT codigo_fabricante FROM producto WHERE producto.codigo_fabricante=fabricante.codigo);
/* 2. Devuelve los nombres de los fabricantes que no tienen productos asociados.
(Utilizando EXISTS o NOT EXISTS).*/
SELECT nombre FROM fabricante WHERE NOT EXISTS (SELECT codigo_fabricante FROM producto WHERE producto.codigo_fabricante=fabricante.codigo);
/* Subconsultas (En la cláusula HAVING)
1. Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo
número de productos que el fabricante Lenovo. */
SELECT f.nombre, count(*) as 'Total productos'
FROM producto
inner join fabricante f on codigo_fabricante = f.codigo
WHERE codigo_fabricante != 2
group by codigo_fabricante
HAVING count(codigo_fabricante) = (SELECT count(*) FROM producto WHERE codigo_fabricante = 2);


DROP SCHEMA tienda;


