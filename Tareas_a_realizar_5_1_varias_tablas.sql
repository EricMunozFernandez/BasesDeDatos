
SELECT *
FROM EMPLE;

SELECT *
FROM DEPART;

--PARA JOIN

SELECT *
FROM EMPLE,DEPART
WHERE EMPLE.DEPT_NO=DEPART.DEPT_NO;

/*
1.  A partir de las tablas EMPLE y DEPART obtener los siguientes datos de los empleados: apellido,
oficio, número de empleado, nombre de departamento y localidad.
*/

SELECT EMPLE.APELLIDO,
EMPLE.OFICIO,
EMPLE.EMP_NO,
DEPART.DEPT_NO,
DEPART.LOC
FROM EMPLE, DEPART
WHERE EMPLE.DEPT_NO=DEPART.DEPT_NO;

/*
2. Queremos consultar los datos de los empleados y el nombre de la localidad de aquellos que  trabajan
en ‘MADRID’ o ‘BARCELONA’. 
*/

SELECT EMPLE.EMP_NO,
EMPLE.APELLIDO,
EMPLE.OFICIO,
EMPLE.ID_JEFE,
EMPLE.FECHA_ALTA,
EMPLE.SALARIO,
EMPLE.COMISION_PCT,
EMPLE.DEPT_NO,
DEPART.LOC
FROM EMPLE, DEPART
WHERE EMPLE.DEPT_NO=DEPART.DEPT_NO 
AND UPPER(LOC) IN ('MADRID','BARCELONA');

/*
3. Obtener para cada empleado (código y apellidos), así como los apellidos de su jefe. La columna
JEFE de un empleado indica el numero de empleado de su jefe.
*/

SELECT E.EMP_NO,
E.APELLIDO AS EMPLEADO,
J.APELLIDO AS JEFE
FROM EMPLE E, EMPLE J
WHERE E.ID_JEFE=J.EMP_NO;
--EL NUMERO DE JEFE DEL EMPLEADO ES EL NUMERO EMPLEADO DEL JEFE EN SI.



/*
4. Visualizar el apellido, el oficio y la localidad de los departamentos donde trabajan los ANALISTAS.
*/

SELECT APELLIDO,
OFICIO,
DEPART.LOC
FROM EMPLE,DEPART
WHERE EMPLE.DEPT_NO=DEPART.DEPT_NO 
AND UPPER(OFICIO)='ANALISTA';

/*
5. Mostrar para cada empleado quién es su jefe (apellido ). Si no tiene jefe,
mostrar ausencia de valor(NULL).
*/

SELECT E.EMP_NO,
E.APELLIDO AS EMPLEADO,
J.APELLIDO AS JEFE
FROM EMPLE E, EMPLE J
WHERE E.ID_JEFE=J.EMP_NO(+);
--EL (+) ES PARA MOSTRAR LOS NULL DE JEFE.
/*
EN VEZ DE J.APELLIDO AS JEFE 
NVL(J.APELLIDO,'NO TIENE JEFE') AS JEFE
SI QUEREMOS QUE SALGA COMO SIN JEFE EL NULL
*/
/*
6. Mostrar para todos los departamentos que tenemos en la empresa los apellidos de los 
empleados que pertenecen a cada uno de ellos. Si algún departamento está vacío, 
mostrar ausencia de valor NULL.
*/

SELECT APELLIDO,
DEPART.DEPT_NO
FROM EMPLE, DEPART
WHERE EMPLE.DEPT_NO(+)=DEPART.DEPT_NO;

/*