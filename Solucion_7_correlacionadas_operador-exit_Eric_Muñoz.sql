/*1.Obtén los datos de los empleados cuyo salario supera
la media de los salarios de la empresa.*/

SELECT APELLIDO, SALARIO
FROM EMPLE
WHERE SALARIO>(SELECT AVG(SALARIO)
                  FROM EMPLE);

/*2. Realiza una consulta que muestre el nombre,
el salario y el código del departamento de los 
empleados cuyo salario supere la media de su departamento.*/

SELECT E.APELLIDO, E.SALARIO, E.DEPT_NO
FROM EMPLE E
WHERE SALARIO>ALL(SELECT AVG(EM.SALARIO)
                  FROM EMPLE EM
                  WHERE EM.DEPT_NO=E.DEPT_NO);

/*3. Listar las localidades donde existan departamentos 
con empleados cuya comisión supere el 10% del salario.
Realízala de dos formas.*/

SELECT SALARIO*10/100 "10% DEL SALARIO", COMISION_PCT 
FROM EMPLE;

/*OPCION 1*/

SELECT D.LOC 
FROM DEPART D
WHERE EXISTS(SELECT COMISION_PCT
            FROM EMPLE E
            WHERE COMISION_PCT>(SALARIO*10/100)
            AND D.DEPT_NO=E.DEPT_NO);

/*OPCION 2*/

SELECT DISTINCT D.LOC 
FROM EMPLE E,DEPART D
WHERE D.DEPT_NO=E.DEPT_NO
AND COMISION_PCT>(SALARIO*10/100);
       
/*4.Escribir una consulta para mostrar los apellidos
de los empleados que tengan uno o más compañeros
de trabajo en sus departamentos con fechas de 
contratación posteriores paro salarios más altos.*/ 

/*OPCION 1*/

SELECT E.APELLIDO
FROM EMPLE E
WHERE 1<=(SELECT COUNT(EM.EMP_NO)
                      FROM EMPLE EM
                      WHERE E.DEPT_NO=EM.DEPT_NO
                      AND E.FECHA_ALTA<EM.FECHA_ALTA
                      AND E.SALARIO<EM.SALARIO);

/*OPCION 2*/  

SELECT E.APELLIDO
FROM EMPLE E
WHERE EXISTS(SELECT EM.EMP_NO
                      FROM EMPLE EM
                      WHERE E.DEPT_NO=EM.DEPT_NO
                      AND E.FECHA_ALTA<EM.FECHA_ALTA
                      AND E.SALARIO<EM.SALARIO);

/*5. Buscar los departamentos que no tengan empleados.
Hazlo de dos formas.*/

/*OPCION 1*/

SELECT DEPT_NO
FROM DEPART
WHERE DEPT_NO NOT IN(SELECT DISTINCT DEPT_NO
                        FROM EMPLE);

/*OPCION 2*/

SELECT D.DEPT_NO
FROM DEPART D
WHERE NOT EXISTS (SELECT E.DEPT_NO
                    FROM EMPLE E
                    WHERE D.DEPT_NO=E.DEPT_NO);
