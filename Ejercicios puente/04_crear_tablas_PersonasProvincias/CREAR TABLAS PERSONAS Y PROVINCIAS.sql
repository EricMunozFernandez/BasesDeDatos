/*# Ejercicio 4 - Crear tablas Personas y Provincias

Crea un script SQL que contenga lo necesario para la creación de las tablas Personas y Provincias.

Para crear las tablas utiliza el siguiente esquema relacional.

![](./relacional_personas_provincias.jpg)

Una vez creadas, añade al final de tu script SQL, las consultas necesarias para  visualizar las restricciones definidas para las tablas PROVINCIAS y PERSONAS.
*/
DROP TABLE PROVINCIAS CASCADE CONSTRAINTS;
DROP TABLE PERSONAS CASCADE CONSTRAINTS;

CREATE TABLE PROVINCIAS(
COD_PROV NUMBER(2),
NOM_PROV VARCHAR2(15),
CONSTRAINT PROV_COD_PK PRIMARY KEY(COD_PROV)
);

CREATE TABLE PERSONAS(
DNI NUMBER(8),
NOMBRE VARCHAR2(15),
DIRECCION VARCHAR2 (25),
POBLACION VARCHAR2(20),
COD_PROV NUMBER(2),
CONSTRAINT PERS_DNI_PK PRIMARY KEY(DNI),
CONSTRAINT PERS_PROV_FK FOREIGN KEY(COD_PROV) REFERENCES PROVINCIAS(COD_PROV)
);

DESC USER_CONSTRAINTS
SELECT CONSTRAINT_NAME,CONSTRAINT_TYPE,TABLE_NAME 
FROM USER_CONSTRAINTS 
WHERE UPPER(TABLE_NAME) IN ('PROVINCIAS','PERSONAS');