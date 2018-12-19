/*
# Ejercicio 2 - Mejorar la tabla Alumnos

Añade al final del script SQL anterior las sentencias necesarias para :

- Añadir a la tabla ALUMNOS dos columnas: SEXO e IMPORTE.
 Definir la columna SEXO con la restricción NOT NULL. Sólo podrán introducir los valores M o F.
       
       La columna IMPORTE numerica entera de precisión 10 con dos decimales. Por defecto, contendrá el valor 0 .


- Eliminar la columna EDAD.


- Añadir dos nuevas columnas:
	- FECHA_NAC que contiene la fecha de nacimiento.
	- FECHA_ALTA que es la fecha de ingreso en la escuela. 
          
- Añadir una restricción que haga cumplir que la FECHA_NAC sea siempre anterior a la FECHA_ALTA. 

  ¿Podrías luego eliminar la columna FECHA_NAC?
  

- Cambiar el nombre de la columna IMPORTE que pasará a denominarse TASAS.
*/
SELECT *
FROM ALUMNOS;

ALTER TABLE ALUMNOS ADD(
SEXO VARCHAR2(1) NOT NULL,
IMPORTE NUMBER(10,2) DEFAULT 0,
FECHA_NAC DATE,
FECHA_ALTA DATE,
CONSTRAINT ALUM_SEXO_CK CHECK(SEXO IN('M','F')),
CONSTRAINT ALUM_FECHA_ORDEN_CK CHECK(FECHA_NAC<FECHA_ALTA)
);

SELECT *
FROM ALUMNOS;

ALTER TABLE ALUMNOS DROP(
EDAD
);

SELECT *
FROM ALUMNOS;

/*NO SE PODRIA ELIMINAR
ALTER TABLE ALUMNOS DROP(
FECHA_NAC
);*/

ALTER TABLE ALUMNOS 
RENAME COLUMN IMPORTE TO TASA;

SELECT *
FROM ALUMNOS;


