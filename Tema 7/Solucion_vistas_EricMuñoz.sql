/*1 Crear una vista EMP_30 que contenga de los empleados del
departamento 30 la siguiente información: código de empleado,
apellidos, salario y departamento. Comprueba que se ha creado
correctamente, y su contenido.*/

DROP VIEW EMP_30;

CREATE OR REPLACE VIEW EMP_30 AS
(SELECT EMP_NO, APELLIDO,SALARIO,DEPT_NO
FROM EMPLE
WHERE DEPT_NO=30);

DESC EMP_30;

SELECT *
FROM EMP_30;

SELECT *
FROM USER_VIEWS
WHERE UPPER(VIEW_NAME)='EMP_30';

/*2 Realiza la siguiente inserción*/
INSERT INTO EMPLE 
VALUES(9999,'URRUTIA','ANALISTA',7698,NULL,200000,NULL,30);
/*Comprueba el  contenido de la tabla. ¿Qué sucede en la vista?*/

--HAY PRIMARY KEYS QUE NO ENCUENTRA EN LA VIEW

/*3 Añade ahora un nuevo empleado en la vista, en el departamento 30.*/
INSERT INTO EMP_30 
VALUES(8888,'RUIZ',280000,30);
 /*¿Qué ocurre en la tabla base? ¿Y en la vista?
 
 LO INSERTA EN LAS 2
 
 ¿Añade otro empleado en la vista, pero en el 
 departamento 10?  
 
 LO INSERTA PERO NO LO VEMOS
 
 ¿Qué ocurre en la tabla base? 
 
 SE CREA
 
 ¿Y en la vista?
 
 NO LO VEMOS
 
 */
 
/*4 Modificar la vista creada en el ejercicio 1 de forma que 
nos aseguremos que las operaciones DML realizadas sobre la 
vista permanezca dentro del dominio de la misma. 
Comprobarlo haciendo alguna inserción:*/
INSERT INTO EMP_30 VALUES (1111, 'LOPEZ', 1200,30);  
INSERT INTO EMP_30 VALUES (2222, 'RUIZ', 2200,20);  

CREATE OR REPLACE VIEW EMP_30 AS
(SELECT EMP_NO, APELLIDO,SALARIO,DEPT_NO
FROM EMPLE
WHERE DEPT_NO=30)
WITH CHECK OPTION CONSTRAINT EMP_30_ERROR;

/*y alguna modificación: por ejemplo, modificar el 
departamento a 10 al empleado 7698.*/

 UPDATE EMP_30 SET DEPT_NO=10;
 
--DA ERROR PORQUE NO PODEMOS USAR LOS DEPT_NO 10

/*5 Crear una vista SAL_20 que contenga el código del empleado
con el alias ID_EMP, apellidos con el alias APE_EMP y salario
anual con el alias SAL_ANUAL para cada empleado del departamento 20.*/

CREATE VIEW SAL_20
AS (SELECT EMP_NO "ID_EMP", APELLIDO "APE_EMP",SALARIO*12 "SAL_ANUAL"
FROM EMPLE
WHERE EMP_NO = 20);

SELECT *
FROM USER_VIEWS
WHERE UPPER(VIEW_NAME)='SAL_20';

DESC SAL_20

CREATE PUBLIC SYNONYM "S20"
FOR "DAW07"."SAL_20";


/*6 Crear una vista de nombre DEPT_SUM con los nombres de
departamentos,salarios mínimos, salarios máximos y salarios
medios por departamento.Utiliza los alias DEPT_NOMBRE, SAL_MIN,
SAL_MAX, SAL_MED */

CREATE VIEW DEPT_SUM 
AS (SELECT D.DNOMBRE "DEPT_NOMBRE",
            MIN(E.SALARIO) "SAL_MIN",
            MAX(E.SALARIO) "SAL_MAX",
            AVG(E.SALARIO) "SAL_MED"
FROM EMPLE E, DEPART D
WHERE E.DEPT_NO = D.DEPT_NO
GROUP BY D.DNOMBRE );

/*¿Es una vista simple o compleja?*/

/*COMPLEJA PORQUE TIENE GROUP BY Y AVG*/

/*7 Eliminar la vista SAL_20.*/

DROP VIEW SAL_20;

SELECT *
FROM USER_VIEWS
WHERE UPPER(VIEW_NAME)='SAL_20';

/*8 El equipo de programadores se ha dado cuenta que realizan 
muchas consultas en las que intervienen el sueldo máximo de 
cada departamento, así que deciden crear una vista denominada
V_DEPT_SALMAX.*/

DROP VIEW V_DEPT_SALMAX;

CREATE VIEW V_DEPT_SALMAX 
AS (SELECT DEPT_NO, MAX(SALARIO) SALMAX
    FROM EMPLE
    GROUP BY DEPT_NO);

SELECT SALMAX, DEPT_NO
FROM V_DEPT_SALMAX;

SELECT *
FROM USER_VIEWS
WHERE UPPER(VIEW_NAME)='V_DEPT_SALMAX';

/*9 Realiza una consulta que muestre el nombre del empleado, 
el salario del empleado, el código del departamento y el 
salario medio del departamento, para aquellos empleados 
cuyo salario supere la media de su departamento.*/

SELECT E.APELLIDO, E.SALARIO, E.DEPT_NO, ROUND(D.SALMEDIA,2)"SALARIO MEDIO"
FROM EMPLE E, (SELECT DEPT_NO, AVG(SALARIO) SALMEDIA
                   FROM EMPLE
                    GROUP BY DEPT_NO) D
WHERE E.DEPT_NO=D.DEPT_NO
AND E.SALARIO>D.SALMEDIA;

CREATE VIEW V_DEPT_SALMAX_AVG 
AS (SELECT DEPT_NO, AVG(SALARIO) SALMEDIA
    FROM EMPLE
    GROUP BY DEPT_NO);
    

/*10 Crear la vista que muestre los apellidos de los empleados,
salarios,códigos de departamentos y salarios máximos para todos
los empleados que ganan menos que el salario máximo de su 
departamento. Utiliza una select en el FROM.*/
DROP VIEW PROP;

CREATE OR REPLACE VIEW PROP(APELLIDO,SALARIO,DEPT_NO,SALARIO_MAX)AS
(SELECT E.APELLIDO,E.SALARIO,E.DEPT_NO,D.SALMAX
FROM EMPLE E,(SELECT MAX(SALARIO) AS SALMAX, DEPT_NO
                    FROM EMPLE 
                    group by DEPT_NO ) D 
WHERE E.DEPT_NO=D.DEPT_NO
AND E.SALARIO<D.SALMAX);

SELECT *
FROM USER_VIEWS
WHERE UPPER(VIEW_NAME)='PROP';

DESC PROP

SELECT *
FROM PROP;

/*11 Acceder al diccionario de datos y mostrar las vistas que 
tenéis creadas y la consulta usada para su creación.*/

SELECT *
FROM USER_VIEWS
WHERE UPPER(VIEW_NAME)='PROP';

DESC PROP

SELECT *
FROM PROP;
