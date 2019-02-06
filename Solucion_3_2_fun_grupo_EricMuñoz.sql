/*1-Visualizar ( n� departamento y n� de empleados) s�lo los 
departamentos con m�s de 4 empleados, pero ordenar la salida
en descendente por n�mero de empleados.*/

SELECT DEPT_NO "N� DEPARTAMENTO",
COUNT(EMP_NO)"N� EMPLEADOS"
FROM EMPLE 
GROUP BY DEPT_NO
HAVING COUNT(EMP_NO)>4
ORDER BY COUNT(EMP_NO) DESC;

/*2-Partiendo de la tabla EMPLE, obtener la suma de salarios,
el salario m�ximo y el salario m�nimo por cada departamento 
(n� departamento). CON EL NOMBRE DEL DEPARTAMENTO*/

SELECT D.DNOMBRE "NOMBRE DEPARTAMENTO",
        E.DEPT_NO "N� DEPARTAMENTO",
        SUM(E.SALARIO)"SUMA SALARIO",
        MAX(E.SALARIO)"SALARIO MAX",
        MIN(E.SALARIO)"SALARIO MIN"
FROM EMPLE E, DEPART D
WHERE D.DEPT_NO=E.DEPT_NO
GROUP BY D.DNOMBRE, E.DEPT_NO;

/*ORA-00937: la funci�n de grupo no es de grupo �nico
00937. 00000 -  "not a single-group group function"
*Cause:    NO HAY GRUPO DEPT_NO DODE BUSCAR
*Action:    HACER GROUP BY DEPT_NO
Error en la l�nea: 16, columna: 8*/

/*3-Calcular el n�mero de empleados que realizan cada oficio
por departamento. Los datos que se visualizan son: 
departamento, oficio y n�mero de empleados. CON EL NOMBRE DEL
DEPARTAMENTO*/

SELECT E.DEPT_NO "N� DEPARTAMENTO",
        D.DNOMBRE "NOMBRE DEPARTAMENTO",
        COUNT(E.EMP_NO)"NUMERO DE EMPLEADOS",
        E.OFICIO
FROM EMPLE E, DEPART D
WHERE D.DEPT_NO=E.DEPT_NO
GROUP BY E.DEPT_NO,D.DNOMBRE, E.OFICIO
ORDER BY E.DEPT_NO;

/*4-Visualizar el valor num�rico que nos indique el n�mero
de empleados que hay en el departamento que m�s empleados hay.*/

SELECT MAX(COUNT(EMP_NO))"N� DE EMPLEADOS"
--DEPT_NO "N� DEPARTAMENTO" NO SE PUEDE BUSCAR EL DEPT_NO 
FROM EMPLE
GROUP BY DEPT_NO;

--VARIANTE CON EL DEPARTAMENTO

SELECT DEPT_NO, COUNT(EMP_NO)"N� EMPLEADOS"
FROM EMPLE
GROUP BY DEPT_NO
HAVING COUNT(EMP_NO)>=ALL(SELECT (COUNT(EMP_NO))
                            FROM EMPLE
                            GROUP BY DEPT_NO);
/*SOLUCION PARA SACAR EL DEPT_NO Y EL MAX DE EMPLEADOS POR
DEPARTAMENTO*/

/*5-Mostrar los n�meros de departamento y el salario 
medio para los departamentos cuyos salarios m�ximos sean
mayores de 250000.*/

SELECT DISTINCT DEPT_NO, ROUND(AVG(SALARIO),2)"SALARIO MEDIO"
FROM EMPLE
GROUP BY DEPT_NO
HAVING MAX(SALARIO)>2500 ;

/*6-Visualizar el salario medio m�ximo por  departamento.*/

SELECT MAX(ROUND(AVG(SALARIO),2))"SALARIO MEDIO"
FROM EMPLE 
GROUP BY DEPT_NO;

/*7-Escribir una consulta para mostrar el n�mero de personas 
con el mismo oficio.*/

SELECT COUNT(EMP_NO)"N� EMPLEADOS", OFICIO
FROM EMPLE
GROUP BY OFICIO;

/*8-Mostrar el n�mero de director y el salario del empleado
peor pagado para ese director. Excluir los empleados de los
que se desconozca el director.Excluir los grupos en los que
el salario m�nimo sea 200000 o menos.Ordenar el resultado 
por salario de forma descendente.*/

SELECT ID_JEFE, MIN(SALARIO)"SALARIO MINIMO"
FROM EMPLE
WHERE ID_JEFE IS NOT NULL
GROUP BY ID_JEFE
HAVING MIN(SALARIO)>2000
ORDER BY MIN(SALARIO) DESC;
