/*# Ejercicio 3 - Ver restricciones de la tabla Alumnos

A�ade al final del script SQL anterior las sentencias necesarias para :

- Comprobar las restricciones de la tabla ALUMNOS. 

 Para cada restricci�n debes indicar el nombre de la restricci�n, el nombre de la tabla y el tipo de restricci�n.

- �Hay alguna restricci�n NOT NULL?. �De qu� tipo es?.

- Nos d�n las siguientes sentencias `INSERT`, para a�adir al final de nuestro script SQL. 
 
El objetivo es a�adir filas a nuestra tabla Alumnos. 

�Ser� posible realizar las siguientes altas en la tabla de Alumos? Completa el comentario que hay detras de cada sentencia ``INSERT `` indicado si se ejecutar� o no, justificando tu respuesta.

```
INSERT   INTO   ALUMNOS VALUES('1111','Pepe',4,1);
#
INSERT   INTO   ALUMNOS VALUES('1111','PEPE',4,1);
#
INSERT   INTO   ALUMNOS VALUES('1112','PEPE',10,2);
#
INSERT   INTO   ALUMNOS VALUES('1113','MARIA',32,2);
#
INSERT   INTO   ALUMNOS VALUES('2222','MARIA',12,5);
#
INSERT   INTO   ALUMNOS VALUES('2224','MARiA',22,3);
#
```
*/

DESC USER_CONSTRAINTS
SELECT USER_CONSTRAINTS.CONSTRAINT_NAME,CONSTRAINT_TYPE,USER_CONSTRAINTS.TABLE_NAME,
SEARCH_CONDITION,USER_CONS_COLUMNS.COLUMN_NAME 
FROM USER_CONSTRAINTS, USER_CONS_COLUMNS
WHERE UPPER(USER_CONSTRAINTS.TABLE_NAME)='ALUMNOS'
AND USER_CONSTRAINTS.TABLE_NAME=USER_CONS_COLUMNS.TABLE_NAME--JOIN
;

--NOMBRE ES NOT NULL PORQUE LO HEMOS DEFINIDO EN LA TABLA Y ES UN VARCHAR2, LO MISMO CON SEXO A LA HORA DE MODIFICARLA
DESC ALUMNOS;

INSERT   INTO   ALUMNOS VALUES('1111','Pepe',4,1);

/*
NO SE EJECUTA YA QUE A LA HORA DE ALTERAR LA TABLA HEMOS ELIMINADO Y ALTERADO COLUMNAS HACIENDO QUE LOS VALORES NO ESTEN CORRECTOS O SIMPLEMENTE NO EXISTAN.
UNA SOLUCION SERIA PONER LOS VALORES A LOS QUE HACE REFERENCIA ESOS DATOS, YA QUE SI NO PONEMOS NADA EL PROGRAMA LOS IDENTIFICA EN ORDEN DE LA TABLA (DNI, NOMBRE, CURSO, SEXO, TASA, FECHA_NAC, FECHA_ALTA).
ADEMAS, LA COLUMNA NOMBRE TIENE UNA RESTRICCION QUE OBLIGA A QUE TODO ESTE MAYUSCULAS.
POSIBLE SOLUCION: INSERT INTO ALUMNOS(DNI, NOMBRE, CURSO, SEXO, TASA, FECHA_NAC, FECHA_ALTA) VALUES (DATO DNI, DATO NOMBRE, DATO CURSO, DATO SEXO, DATO TASA, DATO FECHA_NAC, DATO FECHA_ALTA);

*/

INSERT   INTO   ALUMNOS VALUES('1111','PEPE',4,1);

/*
APARTA DE LA RAZON DEL ANTERIOR QUE OCURREN EN TODOS LOS INSERT DE AQUI TODOS LOS DATOS INSERTADOS SON LOS MISMOS, POR LO TANTO NOS DARIA ERROR DE QUE LA FILA YA EXISTE. 
*/

INSERT   INTO   ALUMNOS VALUES('1112','PEPE',10,2);

/*
NO SE EJECUTA YA QUE A LA HORA DE ALTERAR LA TABLA HEMOS ELIMINADO Y ALTERADO COLUMNAS HACIENDO QUE LOS VALORES NO ESTEN CORRECTOS O SIMPLEMENTE NO EXISTAN.
UNA SOLUCION SERIA PONER LOS VALORES A LOS QUE HACE REFERENCIA ESOS DATOS, YA QUE SI NO PONEMOS NADA EL PROGRAMA LOS IDENTIFICA EN ORDEN DE LA TABLA (DNI, NOMBRE, CURSO, SEXO, TASA, FECHA_NAC, FECHA_ALTA).
POSIBLE SOLUCION: INSERT INTO ALUMNOS(DNI, NOMBRE, CURSO, SEXO, TASA, FECHA_NAC, FECHA_ALTA) VALUES (DATO DNI, DATO NOMBRE, DATO CURSO, DATO SEXO, DATO TASA, DATO FECHA_NAC, DATO FECHA_ALTA);
*/

INSERT   INTO   ALUMNOS VALUES('1113','MARIA',32,2);

/*
NO SE EJECUTA YA QUE A LA HORA DE ALTERAR LA TABLA HEMOS ELIMINADO Y ALTERADO COLUMNAS HACIENDO QUE LOS VALORES NO ESTEN CORRECTOS O SIMPLEMENTE NO EXISTAN.
UNA SOLUCION SERIA PONER LOS VALORES A LOS QUE HACE REFERENCIA ESOS DATOS, YA QUE SI NO PONEMOS NADA EL PROGRAMA LOS IDENTIFICA EN ORDEN DE LA TABLA (DNI, NOMBRE, CURSO, SEXO, TASA, FECHA_NAC, FECHA_ALTA).
POSIBLE SOLUCION: INSERT INTO ALUMNOS(DNI, NOMBRE, CURSO, SEXO, TASA, FECHA_NAC, FECHA_ALTA) VALUES (DATO DNI, DATO NOMBRE, DATO CURSO, DATO SEXO, DATO TASA, DATO FECHA_NAC, DATO FECHA_ALTA);
*/

INSERT   INTO   ALUMNOS VALUES('2222','MARIA',12,5);

/*
NO SE EJECUTA YA QUE A LA HORA DE ALTERAR LA TABLA HEMOS ELIMINADO Y ALTERADO COLUMNAS HACIENDO QUE LOS VALORES NO ESTEN CORRECTOS O SIMPLEMENTE NO EXISTAN.
UNA SOLUCION SERIA PONER LOS VALORES A LOS QUE HACE REFERENCIA ESOS DATOS, YA QUE SI NO PONEMOS NADA EL PROGRAMA LOS IDENTIFICA EN ORDEN DE LA TABLA (DNI, NOMBRE, CURSO, SEXO, TASA, FECHA_NAC, FECHA_ALTA).
POSIBLE SOLUCION: INSERT INTO ALUMNOS(DNI, NOMBRE, CURSO, SEXO, TASA, FECHA_NAC, FECHA_ALTA) VALUES (DATO DNI, DATO NOMBRE, DATO CURSO, DATO SEXO, DATO TASA, DATO FECHA_NAC, DATO FECHA_ALTA);
*/

INSERT   INTO   ALUMNOS VALUES('2224','MARiA',22,3);

/*
NO SE EJECUTA YA QUE A LA HORA DE ALTERAR LA TABLA HEMOS ELIMINADO Y ALTERADO COLUMNAS HACIENDO QUE LOS VALORES NO ESTEN CORRECTOS O SIMPLEMENTE NO EXISTAN.
UNA SOLUCION SERIA PONER LOS VALORES A LOS QUE HACE REFERENCIA ESOS DATOS, YA QUE SI NO PONEMOS NADA EL PROGRAMA LOS IDENTIFICA EN ORDEN DE LA TABLA (DNI, NOMBRE, CURSO, SEXO, TASA, FECHA_NAC, FECHA_ALTA).
ADEMAS, LA COLUMNA NOMBRE TIENE UNA RESTRICCION QUE OBLIGA A QUE TODO ESTE MAYUSCULAS.
POSIBLE SOLUCION: INSERT INTO ALUMNOS(DNI, NOMBRE, CURSO, SEXO, TASA, FECHA_NAC, FECHA_ALTA) VALUES (DATO DNI, DATO NOMBRE, DATO CURSO, DATO SEXO, DATO TASA, DATO FECHA_NAC, DATO FECHA_ALTA);
*/

