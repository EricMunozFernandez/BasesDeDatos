/*# Ejercicio 5 - Cambiar nombre a la tabla Personas 

Modifica el script SQL anterior para cambiar el nombre de la tabla Personas. 

Cambia el nombre de la tabla PERSONAS a CIUDADANOS. 

Visualizar de nuevo las restricciones para las tablas PROVINCIAS y CIUDADANOS. 

Observar que ha pasado con las restricciones.
*/
DESC TABEL_NAME
SELECT TABLE_NAME 
FROM USER_TABLES 
WHERE UPPER(TABLE_NAME) IN ('PROVINCIAS','PERSONAS','CIUDADANOS');

RENAME PERSONAS TO CIUDADANOS;


SELECT TABLE_NAME 
FROM USER_TABLES 
WHERE UPPER(TABLE_NAME) IN ('PROVINCIAS','PERSONAS','CIUDADANOS');


DESC USER_CONSTRAINTS
SELECT CONSTRAINT_NAME,CONSTRAINT_TYPE,TABLE_NAME, SEARCH_CONDITION 
FROM USER_CONSTRAINTS
WHERE UPPER(TABLE_NAME) IN('CIUDADANOS','PROVINCIAS');

--CAMBIA EL NOMBRE DE LA TABLA EN TABLE_NAME PERO EL NOMBRE DE LA CONSTRAINT SIGUE COMO LO HE DEJADO ANTES (NO SE MAS PORQUE ME LO HA CAMBIADO Y NO PUEDO VER EL ESTADO ANTERIOR)