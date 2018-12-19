/*
# Ejercicio 2 - Mejorar la tabla Alumnos

A�ade al final del script SQL anterior las sentencias necesarias para :

- A�adir a la tabla ALUMNOS dos columnas: SEXO e IMPORTE.
 Definir la columna SEXO con la restricci�n NOT NULL. S�lo podr�n introducir los valores M o F.
       
       La columna IMPORTE numerica entera de precisi�n 10 con dos decimales. Por defecto, contendr� el valor 0 .


- Eliminar la columna EDAD.


- A�adir dos nuevas columnas:
	- FECHA_NAC que contiene la fecha de nacimiento.
	- FECHA_ALTA que es la fecha de ingreso en la escuela. 
          
- A�adir una restricci�n que haga cumplir que la FECHA_NAC sea siempre anterior a la FECHA_ALTA. 

  �Podr�as luego eliminar la columna FECHA_NAC?
  

- Cambiar el nombre de la columna IMPORTE que pasar� a denominarse TASAS.
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


