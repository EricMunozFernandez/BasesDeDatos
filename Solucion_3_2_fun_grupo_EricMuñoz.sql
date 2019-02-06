/*1-Visualizar ( nº departamento y nº de empleados) sólo los 
departamentos con más de 4 empleados, pero ordenar la salida
en descendente por número de empleados.*/

SELECT DEPT_NO "Nº DEPARTAMENTO",
COUNT(EMP_NO)"Nº EMPLEADOS"
FROM EMPLE 
GROUP BY DEPT_NO
HAVING COUNT(EMP_NO)>4
ORDER BY COUNT(EMP_NO) DESC;

/*2-Partiendo de la tabla EMPLE, obtener la suma de salarios,
el salario máximo y el salario mínimo por cada departamento 
(nº departamento). CON EL NOMBRE DEL DEPARTAMENTO*/

SELECT D.DNOMBRE "NOMBRE DEPARTAMENTO",
        E.DEPT_NO "Nº DEPARTAMENTO",
        SUM(E.SALARIO)"SUMA SALARIO",
        MAX(E.SALARIO)"SALARIO MAX",
        MIN(E.SALARIO)"SALARIO MIN"
FROM EMPLE E, DEPART D
WHERE D.DEPT_NO=E.DEPT_NO
GROUP BY D.DNOMBRE, E.DEPT_NO;

/*ORA-00937: la función de grupo no es de grupo único
00937. 00000 -  "not a single-group group function"
*Cause:    NO HAY GRUPO DEPT_NO DODE BUSCAR
*Action:    HACER GROUP BY DEPT_NO
Error en la línea: 16, columna: 8*/

/*3-Calcular el número de empleados que realizan cada oficio
por departamento. Los datos que se visualizan son: 
departamento, oficio y número de empleados. CON EL NOMBRE DEL
DEPARTAMENTO*/

SELECT E.DEPT_NO "Nº DEPARTAMENTO",
        D.DNOMBRE "NOMBRE DEPARTAMENTO",
        COUNT(E.EMP_NO)"NUMERO DE EMPLEADOS",
        E.OFICIO
FROM EMPLE E, DEPART D
WHERE D.DEPT_NO=E.DEPT_NO
GROUP BY E.DEPT_NO,D.DNOMBRE, E.OFICIO
ORDER BY E.DEPT_NO;

/*4-Visualizar el valor numérico que nos indique el número
de empleados que hay en el departamento que más empleados hay.*/

SELECT MAX(COUNT(EMP_NO))"Nº DE EMPLEADOS"
--DEPT_NO "Nº DEPARTAMENTO" NO SE PUEDE BUSCAR EL DEPT_NO 
FROM EMPLE
GROUP BY DEPT_NO;

--VARIANTE CON EL DEPARTAMENTO

SELECT DEPT_NO, COUNT(EMP_NO)"Nº EMPLEADOS"
FROM EMPLE
GROUP BY DEPT_NO
HAVING COUNT(EMP_NO)>=ALL(SELECT (COUNT(EMP_NO))
                            FROM EMPLE
                            GROUP BY DEPT_NO);
/*SOLUCION PARA SACAR EL DEPT_NO Y EL MAX DE EMPLEADOS POR
DEPARTAMENTO*/

/*5-Mostrar los números de departamento y el salario 
medio para los departamentos cuyos salarios máximos sean
mayores de 250000.*/

SELECT DISTINCT DEPT_NO, ROUND(AVG(SALARIO),2)"SALARIO MEDIO"
FROM EMPLE
GROUP BY DEPT_NO
HAVING MAX(SALARIO)>2500 ;

/*6-Visualizar el salario medio máximo por  departamento.*/

SELECT MAX(ROUND(AVG(SALARIO),2))"SALARIO MEDIO"
FROM EMPLE 
GROUP BY DEPT_NO;

/*7-Escribir una consulta para mostrar el número de personas 
con el mismo oficio.*/

SELECT COUNT(EMP_NO)"Nº EMPLEADOS", OFICIO
FROM EMPLE
GROUP BY OFICIO;

/*8-Mostrar el número de director y el salario del empleado
peor pagado para ese director. Excluir los empleados de los
que se desconozca el director.Excluir los grupos en los que
el salario mínimo sea 200000 o menos.Ordenar el resultado 
por salario de forma descendente.*/

SELECT ID_JEFE, MIN(SALARIO)"SALARIO MINIMO"
FROM EMPLE
WHERE ID_JEFE IS NOT NULL
GROUP BY ID_JEFE
HAVING MIN(SALARIO)>2000
ORDER BY MIN(SALARIO) DESC;
