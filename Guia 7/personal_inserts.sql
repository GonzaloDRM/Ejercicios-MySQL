DROP DATABASE IF EXISTS personal;
CREATE DATABASE personal CHARACTER SET utf8mb4;
USE personal;

CREATE TABLE departamentos (
idDepto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
  nombreDpto VARCHAR(20) NOT NULL,
  ciudad VARCHAR(15) NULL,
  codDirector VARCHAR(12) NULL
);

CREATE TABLE empleados (
  idEmp INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre CHAR(30) NOT NULL,
  sexemp CHAR(1) NOT NULL,
  fecNac DATE NOT NULL,
  fecIncorporacion DATE NOT NULL,
  salEmp FLOAT NOT NULL,
  comisionE FLOAT NOT NULL,
  cargoE VARCHAR(15) NOT NULL,
  codJefe VARCHAR(12) NULL,  
	idDepto INT UNSIGNED NOT NULL,
  FOREIGN KEY (idDepto) REFERENCES departamentos(idDepto)
  );

-- Insertar datos en la tabla `departamentos`

INSERT INTO `departamentos` VALUES (1000,'GERENCIA','CIUDAD REAL','31.840.269');
INSERT INTO `departamentos` VALUES (1500,'PRODUCCIÓN','CIUDAD REAL','16.211.383');
INSERT INTO `departamentos` VALUES (2000,'VENTAS','CIUDAD REAL','31.178.144');
INSERT INTO `departamentos` VALUES (2100,'VENTAS','BARCELONA','16.211.383');
INSERT INTO `departamentos` VALUES (2200,'VENTAS','VALENCIA','16.211.383');
INSERT INTO `departamentos` VALUES (2300,'VENTAS','MADRID','16.759.060');
INSERT INTO `departamentos` VALUES (3000,'INVESTIGACIÓN','CIUDAD REAL','16.759.060');
INSERT INTO `departamentos` VALUES (3500,'MERCADEO','CIUDAD REAL','22.222.222');
INSERT INTO `departamentos` VALUES (4000,'MANTENIMIENTO','CIUDAD REAL','333.333.333');
INSERT INTO `departamentos` VALUES (4100,'MANTENIMIENTO','BARCELONA','16.759.060');
INSERT INTO `departamentos` VALUES (4200,'MANTENIMIENTO','VALENCIA','16.759.060');
INSERT INTO `departamentos` VALUES (4300,'MANTENIMIENTO','MADRID','16.759.060');

-- Insertar datos en la tabla `empleados`

INSERT INTO `empleados` VALUES (222,'José Giraldo','M','1985-01-20','2000-11-01',1200000,400000,'Asesor','22.222.222',3500);
INSERT INTO `empleados` VALUES (333,'Pedro Blanco','M','1987-10-28','2000-10-01',800000,3000000,'Vendedor','31.178.144',2000);
INSERT INTO `empleados` VALUES (444,'Jesús Alfonso','M','1988-03-14','2000-10-01',800000,3500000,'Vendedor','31.178.144',2000);
INSERT INTO `empleados` VALUES (555,'Julián Mora','M','1989-07-03','2000-10-01',800000,3100000,'Vendedor','31.178.144',2200);
INSERT INTO `empleados` VALUES (666,'Manuel Millán','M','1990-12-08','2004-06-01',800000,3700000,'Vendedor','31.178.144',2300);
INSERT INTO `empleados` VALUES (777,'Marcos Cortez','M','1986-06-23','2000-04-16',2550000,500000,'Mecánico','333.333.333',4000);
INSERT INTO `empleados` VALUES (782,'Antonio Gil','M','1980-01-23','2010-04-16',850000,1500000,'Técnico','16.211.383',1500);
INSERT INTO `empleados` VALUES (219,'Melissa Roa','F','1960-06-19','2001-03-16',2250000,2500000,'Vendedor','31.178.144',2100);
INSERT INTO `empleados` VALUES (111,'Irene Díaz','F','1979-09-28','2004-06-01',1050000,200000,'Mecánico','333.333.333',4200);
INSERT INTO `empleados` VALUES (383,'Luis Pérez','M','1956-02-25','2000-01-01',5050000,0,'Director','31.840.269',1500);
INSERT INTO `empleados` VALUES (060,'Darío Casas','M','1960-04-05','1992-11-01',4500000,500000,'Investigador','31.840.269',3000);
INSERT INTO `empleados` VALUES (802,'William Daza','M','1982-10-09','1999-12-16',2250000,1000000,'Investigador','16.759.060',3000);
INSERT INTO `empleados` VALUES (221,'Carla López','F','1975-05-11','2005-07-16',4500000,500000,'Jefe Mercadeo','31.840.269',3500);
INSERT INTO `empleados` VALUES (331,'Carlos Rozo','M','1975-05-11','2001-09-16',750000,500000,'Vigilante','31.840.269',3500);
INSERT INTO `empleados` VALUES (099,'Diana Solarte','F','1957-11-19','1990-05-16',1250000,500000,'Secretaria','31.840.269',1000);
INSERT INTO `empleados` VALUES (144,'Rosa Angulo','F','1957-03-15','1998-08-16',3250000,3500000,'Jefe Ventas','31.840.269',2000);
INSERT INTO `empleados` VALUES (269,'María Rojas','F','1959-01-15','1990-05-16',6250000,1500000,'Gerente',NULL,1000);
INSERT INTO `empleados` VALUES (343,'Elisa Rojas','F','1979-09-28','2004-06-01',3000000,1000000,'Jefe Mecánicos','31.840.269',4000);
INSERT INTO `empleados` VALUES (334,'Marisol Pulido','F','1979-10-01','1990-05-16',3250000,1000000,'Investigador','16.759.060',3000);
INSERT INTO `empleados` VALUES (335,'Ana Moreno','F','1992-01-05','2004-06-01',1200000,400000,'Secretaria','16.759.060',3000);
INSERT INTO `empleados` VALUES (336,'Carolina Ríos','F','1992-02-15','2000-10-01',1250000,500000,'Secretaria','16.211.383',1500);
INSERT INTO `empleados` VALUES (337,'Edith Muñoz','F','1992-03-31','2000-10-01',800000,3600000,'Vendedor','31.178.144',2100);
INSERT INTO `empleados` VALUES (338,'Abel Gómez','M','1939-12-24','2000-10-01',1050000,200000,'Mecánico','333.333.333',4300);
INSERT INTO `empleados` VALUES (689,'Mario Llano','M','1945-08-30','1990-05-16',2250000,2500000,'Vendedor','31.178.144',2300);
INSERT INTO `empleados` VALUES (785,'Joaquín Rosas','M','1947-07-07','1990-05-16',2250000,2500000,'Vendedor','31.178.144',2200);
INSERT INTO `empleados` VALUES (898,'Iván Duarte','M','1955-08-12','1998-05-16',1050000,200000,'Mecánico','333.333.333',4100);

SELECT * FROM empleados;
SELECT * FROM departamentos;
SELECT * FROM empleados WHERE cargoE='Secretaria';
SELECT nombre, salEmp FROM empleados;
SELECT * FROM empleados WHERE cargoE='Vendedor' ORDER BY nombre;
SELECT nombreDpto FROM departamentos;                                                           /*    6    */        

SELECT nombre, cargoE FROM empleados ORDER BY salEmp;
SELECT salEmp, comisionE FROM empleados WHERE idDepto=2000 ORDER BY comisionE;
SELECT comisionE FROM empleados;
SELECT SUM(comisionE+ salEmp + 500) FROM empleados WHERE idDepto=3000;
SELECT * FROM empleados WHERE comisionE > salEmp;
SELECT * FROM empleados WHERE comisionE <= salEmp*0.3;
SELECT nombre, cargoE,idEmp FROM empleados;
SELECT * FROM empleados WHERE nombre BETWEEN 'J%' AND 'Z%' ORDER BY nombre; 
SELECT salEmp, comisionE, (salEmp + comisionE), nombre FROM empleados WHERE comisionE > 1000;    /* 15    */

SELECT salEmp, comisionE, (salEmp + comisionE), nombre FROM empleados WHERE comisionE = 0;
SELECT * FROM empleados WHERE NOT nombre LIKE '%MA%';
SELECT * FROM departamentos WHERE NOT nombreDpto LIKE 'VENTAS' OR nombreDpto LIKE 'INVESTIGACIÓN' OR nombreDpto LIKE 'MANTENIMIENTO';
SELECT nombre,cargoE FROM empleados WHERE cargoE LIKE 'Secretaria' OR cargoE LIKE 'Vendedor' AND idDepto=1500 AND salEmp > 1000;
SELECT * FROM empleados WHERE CHAR_LENGTH(nombre) = 11;                                            /*     20          */
SELECT * FROM empleados WHERE LENGTH(nombre) >= 11; 
SELECT * FROM empleados WHERE nombre LIKE 'M%' AND salEmp > 800 AND comisionE > 0 AND (idDepto LIKE 2000 OR idDepto LIKE 2100 OR idDepto LIKE 2200 OR idDepto LIKE 2300);
SELECT MAX(salEmp) FROM empleados;
SELECT nombre FROM empleados WHERE idEmp =(select MAX(idEmp) FROM empleados);					/*       24          */
SELECT nombre FROM empleados ORDER BY nombre DESC LIMIT 1;                                     /*         24         */
SELECT MAX(salEmp), MIN(salEmp), (MAX(salEmp) - MIN(salEmp)) FROM empleados;
SELECT count(*) FROM empleados GROUP BY sexemp;
SELECT cargoE, AVG(salEmp) FROM empleados GROUP BY cargoE;
SELECT * FROM empleados WHERE salEmp >= (SELECT AVG(salEmp) FROM empleados) ORDER BY cargoE;
SELECT cargoE,count(*) FROM empleados GROUP BY cargoE HAVING count(*)>=3;                   	  /*    29           */

SELECT d.idDepto, e.codJefe, count(*) as 'num empleado' FROM departamentos d, empleados e WHERE d.idDepto = e.idDepto 
GROUP BY d.nombreDpto HAVING count(*) > 2; 															/*    30     */

SELECT d.idDepto, e.codJefe, count(*) as 'empleados' 
FROM departamentos d, empleados e
WHERE d.idDepto = e.idDepto
GROUP BY d.idDepto
HAVING count(*) > 2;

SELECT d.nombreDpto, sum(salEmp) 
FROM departamentos d, empleados e
WHERE d.idDepto = e.idDepto
group by d.nombreDpto 
order by sum(e.salEmp) desc
limit 1;
