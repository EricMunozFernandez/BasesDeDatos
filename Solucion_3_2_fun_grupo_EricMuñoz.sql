/*1-Visualizar ( n� departamento y n� de empleados) s�lo los departamentos
con m�s de 4 empleados, pero ordenar la salida en descendente por n�mero de
empleados.*/

SELECT DISTINCT DEPT_NO "N� DEPARTAMENTO",
COUNT(EMP_NO)"N� EMPLEADOS"
FROM EMPLE 
GROUP BY DEPT_NO
HAVING COUNT(EMP_NO)>4
ORDER BY COUNT(EMP_NO) DESC;

/*2-Partiendo de la tabla EMPLE, obtener la suma de salarios,
el salario m�ximo y el salario m�nimo por cada departamento (n� departamento).*/

SELECT DEPT_NO "N� DEPARTAMENTO",SUM(SALARIO),MIN(SALARIO)
FROM EMPLE
GROUP BY DEPT_NO;

/*3-Calcular el n�mero de empleados que realizan cada oficio por departamento.
Los datos que se visualizan son: departamento, oficio y n�mero de empleados.*/

SELECT DEPT_NO "N� DEPARTAMENTO",
COUNT(EMP_NO)"NUMERO DE EMPLEADOS",
OFICIO
FROM EMPLE
GROUP BY DEPT_NO, OFICIO
ORDER BY DEPT_NO;

/*4-Visualizar el valor num�rico que nos indique el n�mero de empleados que
hay en el departamento que m�s empleados hay.*/

SELECT COUNT(EMP_NO)"N� DE EMPLEADOS", DEPT_NO "N� DEPARTAMENTO"
FROM EMPLE
GROUP BY DEPT_NO
HAVING COUNT(EMP_NO)=MAX;

/*5-Mostrar los n�meros de departamento y el salario medio para los 
departamentos cuyos salarios m�ximos sean mayores de 250000.*/



/*6-Visualizar el salario medio m�ximo por  departamento.*/



/*7-Escribir una consulta para mostrar el n�mero de personas con el 
mismo oficio.*/



/*8-Mostrar el n�mero de director y el salario del empleado peor pagado
para ese director. Excluir los empleados de los que se desconozca el director.
Excluir los grupos en los que el salario m�nimo sea 200000 o menos.
Ordenar el resultado por salario de forma descendente.*/
