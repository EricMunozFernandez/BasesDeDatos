/*# Ejercicio 1 - Crear tabla Alumnos

Crea un script SQL que contenga lo necesario para la creación de la tabla Alumnos, cuyas columnas y restricciones son:

**Columnas:**

 - DNI 	VARCHAR2(10)
 - NOMBRE 	VARCHAR2(30) 
 - EDAD 	NUMBER(2)
 - CURSO 	NUMBER(1)

**Restricciones:**

- El DNI no puede ser nulo.
- El DNI es la clave primaria.
- El NOMBRE no puede ser nulo.
- La EDAD ha de estar comprendida entre 5 y 20 años
- El NOMBRE ha de estar en mayúsculas.
- El CURSO sólo puede almacenar 1, 2 o 3.


*/

DROP TABLE ALUMNOS CASCADE CONSTRAINTS;

CREATE TABLE ALUMNOS(
DNI VARCHAR2(10),
NOMBRE VARCHAR2(30)NOT NULL,
EDAD NUMBER(2),
CURSO NUMBER(1),
CONSTRAINT ALUM_DNI_PK PRIMARY KEY(DNI),
CONSTRAINT ALUM_EDAD_CK CHECK (EDAD BETWEEN 5 AND 20),
CONSTRAINT ALUM_NOMBRE_CK CHECK(NOMBRE=UPPER(NOMBRE)),
CONSTRAINT ALUM_CURSO_CK CHECK(CURSO IN(1,2,3))
);


