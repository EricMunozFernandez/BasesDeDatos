/*1. Obtener el apellido de los empleados que tienen el
mismo oficio que �GIL�.*/

SELECT APELLIDO
FROM EMPLE
WHERE UPPER(OFICIO)=(SELECT OFICIO
                      FROM EMPLE
                      WHERE UPPER(APELLIDO)='GIL');

/*2. Queremos consultar los datos de los empleados que
trabajan en las localidades de �MADRID� o �BARCELONA�.*/

SELECT EMP_NO, APELLIDO
FROM EMPLE
WHERE DEPT_NO IN(SELECT DEPT_NO
                FROM DEPART
                WHERE UPPER(LOC) IN('BARCELONA','MADRID'))
;

/*3. Obtener el apellido de los empleados con el mismo
oficio y salario que �GIL�.*/

SELECT APELLIDO, SALARIO
FROM EMPLE
WHERE UPPER(OFICIO)=(SELECT OFICIO
                      FROM EMPLE
                      WHERE UPPER(APELLIDO)='GIL')
AND SALARIO=(SELECT SALARIO
              FROM EMPLE
              WHERE UPPER(APELLIDO)='GIL');

/*4. Mostrar los empleados (nombre, oficio, salario y 
fecha de alta) que desempe�en el mismo oficio que "JIMENEZ"
o que tengan un salario mayor o igual que "FERNANDEZ".
Nota: se supone que puede haber mas que un fernandez y un 
jimenez en la empresa*/

SELECT APELLIDO, OFICIO, SALARIO, FECHA_ALTA
FROM EMPLE
WHERE OFICIO IN(SELECT OFICIO
                FROM EMPLE 
                WHERE APELLIDO='JIMENEZ')
AND SALARIO IN (SELECT SALARIO
                FROM EMPLE
                WHERE APELLIDO='FERNANDEZ');

/*5. Visualizar el n�mero de departamento y la cantidad 
de empleados del departamento con m�s empleados.*/

SELECT DEPT_NO, COUNT(EMP_NO)"N� EMPLEADOS"
FROM EMPLE
GROUP BY DEPT_NO
HAVING COUNT(EMP_NO)=(SELECT MAX(COUNT(EMP_NO))
                            FROM EMPLE
                            GROUP BY DEPT_NO);

/*6. Buscar el oficio con el salario medio m�s bajo.*/

SELECT OFICIO, AVG(SALARIO) "SALARIO MEDIO MINIMO"
FROM EMPLE
GROUP BY OFICIO
HAVING AVG(SALARIO)=(SELECT MIN(AVG(SALARIO))
                            FROM EMPLE
                            GROUP BY OFICIO);

/*7. �Qu� es incorrecto en esta sentencia?*/

SELECT EMP_NO, APELLIDO
FROM EMPLE
WHERE SALARIO IN ( SELECT MIN(SALARIO)--SOBRA UN PARENTESIS ) Y EL = TIENE QUE SER IN
				FROM EMPLE
				GROUP BY DEPT_NO);

/*8.  �Qu� ocurre con la siguiente sentencia?*/

SELECT APELLIDO, OFICIO
FROM EMPLE
WHERE OFICIO = ( SELECT OFICIO
			FROM EMPLE
			WHERE APELLIDO = 'PEREZ');
            --BUSCA EMPLEADOS QUE TENGAN EL MISMO OFICIO QUE PEREZ
      -- �Qu� ocurrir�a si existiera un oficio con valor nulo?
       --NO SE MOSTRARIA
/*9. Mostrar los apellidos de los empleados que no tienen
subordinados.*/

SELECT ID_JEFE, COUNT(EMP_NO)"N� SUBORDINADOS"
FROM EMPLE
WHERE EMP_NO=ID_JEFE
GROUP BY ID_JEFE;

/*10. Mostrar los apellidos de los empleados que tienen
subordinados.*/



/*11. Escribir una consulta para mostrar los c�digos de
empleado y los apellidos de todos los empleados que trabajen
en un departamento con cualquier empleado cuyo apellido 
contenga una 'U'.*/



/*12. Modificar la consulta anterior para mostrar los
c�digos de empleado y los apellidos de todos los empleados
que ganan m�s del salario medio y que trabajen en un 
departamento con un empleado que tenga una 'U' en su 
apellido.*/



/*13. Escribir una consulta para mostrar el apellido,
n�mero de departamento y el salario de cualquier empleado
cuyo n�mero de departamento  y salario coincidan con el 
n�mero de departamento y salario de cualquier empleado que
ganen comisi�n.*/



/*14. Escribir una consulta para encontrar todos los 
empleados que ganan m�s que el salario medio de sus 
departamentos. Mostrar el apellido, el salario y el 
c�digo del departamento .*/



/*15. Modificar el ejercicio anterior para visualizar
el apellido, el salario, el c�digo del departamento y
el salario medio de los sueldos de ese departamento. 
Ordenar por salario medio.*/


