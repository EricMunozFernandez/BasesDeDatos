/*1-Visualizar ( nº departamento y nº de empleados) sólo los departamentos
con más de 4 empleados, pero ordenar la salida en descendente por número de
empleados.*/

SELECT DISTINCT DEPT_NO "Nº DEPARTAMENTO",
COUNT(EMP_NO)"Nº EMPLEADOS"
FROM EMPLE 
GROUP BY DEPT_NO
HAVING COUNT(EMP_NO)>4
ORDER BY COUNT(EMP_NO) DESC;

/*2-Partiendo de la tabla EMPLE, obtener la suma de salarios,
el salario máximo y el salario mínimo por cada departamento (nº departamento).*/

SELECT DEPT_NO "Nº DEPARTAMENTO",SUM(SALARIO),MIN(SALARIO)
FROM EMPLE
GROUP BY DEPT_NO;

/*3-Calcular el número de empleados que realizan cada oficio por departamento.
Los datos que se visualizan son: departamento, oficio y número de empleados.*/

SELECT DEPT_NO "Nº DEPARTAMENTO",
COUNT(EMP_NO)"NUMERO DE EMPLEADOS",
OFICIO
FROM EMPLE
GROUP BY DEPT_NO, OFICIO
ORDER BY DEPT_NO;

/*4-Visualizar el valor numérico que nos indique el número de empleados que
hay en el departamento que más empleados hay.*/

SELECT COUNT(EMP_NO)"Nº DE EMPLEADOS", DEPT_NO "Nº DEPARTAMENTO"
FROM EMPLE
GROUP BY DEPT_NO
HAVING COUNT(EMP_NO)=MAX;

/*5-Mostrar los números de departamento y el salario medio para los 
departamentos cuyos salarios máximos sean mayores de 250000.*/



/*6-Visualizar el salario medio máximo por  departamento.*/



/*7-Escribir una consulta para mostrar el número de personas con el 
mismo oficio.*/



/*8-Mostrar el número de director y el salario del empleado peor pagado
para ese director. Excluir los empleados de los que se desconozca el director.
Excluir los grupos en los que el salario mínimo sea 200000 o menos.
Ordenar el resultado por salario de forma descendente.*/
