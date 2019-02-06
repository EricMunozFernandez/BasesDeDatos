/*1. Crear un listado único con todos los oficios que haya en
el departamento 10. Incluir la localidad del departamento en el
resultado.*/

SELECT E.OFICIO, D.LOC
FROM EMPLE E, DEPART D
WHERE E.DEPT_NO=D.DEPT_NO
AND E.DEPT_NO=10;
       
/*2. Obtener la siguiente salida:*/

SELECT E.DEPT_NO, D.DNOMBRE, COUNT(E.EMP_NO)"NUMERO DE EMPLEADOS"
FROM EMPLE E, DEPART D
WHERE E.DEPT_NO=D.DEPT_NO
GROUP BY E.DEPT_NO,D.DNOMBRE, E.DEPT_NO;

/*3. Visualizar el número de departamento, el nombre del 
departamento, y la cantidad de empleados del departamento 
con más empleados.*/

SELECT E.DEPT_NO, D.DNOMBRE, COUNT(E.EMP_NO)"NUMERO DE EMPLEADOS"
FROM EMPLE E, DEPART D
WHERE E.DEPT_NO=D.DEPT_NO
GROUP BY E.DEPT_NO,D.DNOMBRE, E.DEPT_NO
HAVING COUNT(EMP_NO)>=ALL(SELECT (COUNT(EMP_NO))
                            FROM EMPLE
                            GROUP BY DEPT_NO);
       
/*4. Mostrar el apellido, el nombre del departamento y el 
salario de cualquier empleado cuyo salario y comisión coincidan
con los de cualquier empleado que trabaje en Barcelona, 
incluidos los que no tienen comisión.*/

SELECT E.APELLIDO, D.DNOMBRE, E.SALARIO
FROM EMPLE E, DEPART D
WHERE E.DEPT_NO=D.DEPT_NO
AND (NVL(E.COMISION_PCT,0), E.SALARIO) IN (SELECT NVL(COMISION_PCT,0), SALARIO
                                    FROM EMPLE
                                    WHERE DEPT_NO IN(SELECT DEPT_NO
                                                        FROM DEPART
                                                        WHERE UPPER(LOC)='BARCELONA'));
