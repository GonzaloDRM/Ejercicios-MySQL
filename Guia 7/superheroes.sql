DROP DATABASE IF EXISTS superheroes;
CREATE DATABASE superheroes CHARACTER SET utf8mb4;
USE superheroes;

CREATE TABLE creador (
id_creador INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
  nombre VARCHAR(20) NOT NULL
);


CREATE TABLE personajes (
  id_personaje INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre_real VARCHAR(20) NOT NULL,
  personaje VARCHAR(20) NOT NULL,
  inteligencia INT(10) NOT NULL,
  fuerza VARCHAR(10) NOT NULL,
  velocidad INT(11) NOT NULL,
  poder INT(11) NOT NULL,
  aparicion INT(11) NOT NULL,
  ocupacion VARCHAR(30) NULL,
  id_creador INT UNSIGNED NOT NULL,
  FOREIGN KEY (id_creador) REFERENCES creador(id_creador)
  );

SELECT * FROM creador;
SELECT * FROM personajes;

INSERT INTO creador VALUES(1, 'Marvel');
INSERT INTO creador VALUES(2,'DC Comics');

INSERT INTO personajes VALUES(1,'Bruce Banner','Hulk',160,600000,75,98,1962,'Fisico Nuclear',1);
INSERT INTO personajes VALUES(2,'Tony Stark','Iron Man',170,200000,70,123,1963,'Inventor Industrial',1);
INSERT INTO personajes VALUES(3,'Thor Odison','Thor',145,'infinita',100,235,1962,'Rey de Asgard',1);
INSERT INTO personajes VALUES(10,'Barry Allen','Flash',160,10000,120,168,1956,'Cientifico Forense',2);
INSERT INTO personajes VALUES(12,'Clarck Kent','Superman',165,'infinita',120,182,1948,'Reportero',2);

UPDATE personajes SET aparicion=1938 WHERE id_personaje=12;

DELETE FROM personajes WHERE id_personaje=10;

DROP SCHEMA superheroes;