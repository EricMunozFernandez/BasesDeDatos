/*2. Crea una tabla denominada ERRORES,
que contendr� 3 columnas:
    � id, num�rico de tres posiciones, 
    autoincremental. Adem�s esta columna
    identificar� los elementos de la tabla.
    � numero, num�rico de cuatro posiciones,
    que contendr� el c�digo del empleado err�neo
    � descripcion varchar2(60)*/
    
CREATE TABLE ERRORES
(
ID NUMBER(3) GENERATED ALWAYS AS IDENTITY,
NUMERO NUMBER(4),
DESCRIPCION VARCHAR2(60),
CONSTRAINT ERROR_ID_PK PRIMARY KEY(ID));


SELECT *
FROM USER_TABLES
WHERE UPPER(TABLE_NAME)='ERRORES';

DESC ERRORES

SELECT *
FROM USER_CONSTRAINTS C,USER_CONS_COLUMNS CC
WHERE C.TABLE_NAME=CC.TABLE_NAME
AND UPPER(C.TABLE_NAME)='ERRORES';