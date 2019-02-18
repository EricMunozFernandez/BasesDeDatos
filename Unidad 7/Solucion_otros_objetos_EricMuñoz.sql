/*1 Crea una tabla que sea igual que la tabla DEPART denominada 
DEPARTSEQ*/

DROP TABLE DEPARTSEQ;

CREATE TABLE DEPARTSEQ
AS(SELECT *
    FROM DEPART);
    
ALTER TABLE DEPARTSEQ ADD
 CONSTRAINT DEPART_PK PRIMARY KEY (DEPT_NO);
 
DESC DEPARTSEQ;

/*2 Crea una secuencia para utilizarla con la columna de clave 
primaria de la tabla DEPARTSEQ. La secuencia debe comenzar en
200 y tener un valor máximo de 1000. Haz que la secuencia 
aumente en diez números cada vez. Asigna a la secuencia el
nombre DEPT_ID_SEQ. Comprueba en el diccionario de datos que
el objeto se ha creado correctamente.*/

CREATE SEQUENCE DEPT_ID_SEQ
INCREMENT BY 10
START WITH 200
MAXVALUE 1000;

SELECT *
FROM USER_SEQUENCES;

/*3 Consulta en el diccionario de datos acerca de tus secuencias.
Obtén la siguiente información: nombre de secuencia, valor máximo,
tamaño de aumento y último número. */

DESC USER_SEQUENCES

SELECT SEQUENCE_NAME,MAX_VALUE,INCREMENT_BY,LAST_NUMBER
FROM USER_SEQUENCES
WHERE UPPER(SEQUENCE_NAME)='DEPT_ID_SEQ';

/*4 Escribe un archivo de comandos para insertar dos filas en la
tabla DEPARTASEQ. Asigna al archivo de comandos el nombre 
lab9_4.sql. Asegúrate de utilizar la secuencia que creaste 
anteriormente para la columna ID. Agrega dos departamentos 
llamados Educacion y Administracion. Ejecuta el script. 
Confirma las inserciones. */

--lab9_4.sql

/*5 Comprueba cual será el siguiente número de departamento,
que dará la secuencia que has creado, al realizar la siguiente 
inserción.*/

SELECT DEPT_ID_SEQ.NEXTVAL
FROM DUAL;

/*Lee el artículo 
http://www.oracle.com/technetwork/es/articles/sql/oracle-database
-columna-identidad-2775883-esa.html*/



/*6 Crear la tabla CENTROS teniendo en cuenta este modelo y 
que el modelo físico se va a implementar en un SGBD Oracle 12c:
donde id será autoincremental  y  constituye la clave de la tabla 
(utiliza GENERATED ALWAYS).
NOTA: Un * delante del nombre de una columna indica que el 
obligatorio que tenga valor. */

CREATE TABLE CENTROS
(
ID NUMBER(2) GENERATED ALWAYS AS IDENTITY MINVALUE 10 MAXVALUE 90 INCREMENT BY 10 NOT NULL ENABLE,
NOMBRE VARCHAR(30) NOT NULL,
CALLE VARCHAR(30),
NUMERO NUMBER(2),
CP VARCHAR(5),
CIUDAD VARCHAR(15),
PROVINCIA VARCHAR(40),
TELEFONO VARCHAR(9),
CONSTRAINT CENT_ID_PK PRIMARY KEY (ID),
CONSTRAINT CENT_PROV_CK CHECK (PROVINCIA=UPPER(PROVINCIA)),
CONSTRAINT CENT_NUM_CK CHECK (NUMERO BETWEEN 0 AND 100)
);

/*7 Realiza la inserción de un centro.
Inventa los datos.*/



/*8 Crear un índice no único en la columna de claves ajenas 
(DEPT_NO)en la tabla EMPLE.*/

CREATE INDEX IND_EMP_FK
ON EMPLE (DEPT_NO);

SELECT * 
FROM USER_INDEXES
WHERE UPPER(INDEX_NAME)='IND_EMP_FK';

/*9 Mostrar los índices y la unicidad que existen en el diccionario
de datos para la tabla EMPLE.*/

SELECT * 
FROM USER_INDEXES E, USER_IND_COLUMNS D
WHERE E.INDEX_NAME=D.INDEX_NAME
AND UPPER(E.TABLE_NAME)='EMPLE';

/*10 Borra el indice creado anteriormente.*/

DROP INDEX IND_EMP_FK;

/*11 Crea un indice para las búsquedas por nombre de departamento
en mayusculas. Llama al indice IND_DEPT_DNOMBRE.*/

CREATE INDEX IND_DEPT_DNOMBRE ON DEPARTSEQ UPPER(DNOMBRE);

DROP INDEX IND_DEPT_DNOMBRE;

/*12 Lee el articulo
https://rocalla.wordpress.com/2015/04/29/como-saber-si-un-indice
-esta-siendo-usado-o-no-en-oracle/*/



/*13 Activa la monitorización del indice  IND_DEPT_DNOMBRE*/

ALTER INDEX IND_DEPT_DNOMBRE MONITORING USAGE;

/*14 Realiza dos consultas una en la Oracle use el indice  
IND_DEPT_DNOMBRE y otra que no la use, y compruébalo para ambos
casos. NOTA: Cuando termines el ejercicio desactiva la 
monitorización.*/

SELECT * FROM V$OBJECT_USAGE;
--USA
SELECT *
FROM DEPARTSEQ
WHERE DNOMBRE='VENTAS';
--NO USA
SELECT E.*
FROM EMPLE E
WHERE UPPER(LOC)='BARCELONA';

SELECT *
FORM V$OBJECT_USAGE;

ALTER INDEX IND_DEPT_DNOMBRE MONITORING USAGE;

/*15 Crear un sinónimo para la tabla DEPART llamado DEP.
Cambiar el nombre de la tabla DEPART a DEPARTAMENTOS.
Comprobar si es válido el sinónimo.*/

CREATE PUBLIC SYNONYM DEP FOR DEPARTSEQ;

DESC DEP;

SELECT *
FROM ALL_SYNONYMS
WHERE UPPER(SYNONYM_NAME)='DEP';

/*16 Comprueba los sinónimos que tienes creados. Una vez 
comprobado, borra el sinónimo.*/

SELECT *
FROM ALL_SYNONYMS
WHERE UPPER(SYNONYM_NAME)='DEP';

DROP PUBLIC SYNONYM DEP;
