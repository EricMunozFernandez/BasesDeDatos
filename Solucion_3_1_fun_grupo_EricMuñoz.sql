/* 1. Mostrar la media, salario mayor, menor y suma de
salarios mensuales de todos los comerciales.*/

SELECT AVG(SALARIO)"MEDIA",
SUM(SALARIO)"SUMA",
MAX(SALARIO)"MAX",
MIN(SALARIO)"MIN"
FROM EMPLE
WHERE UPPER(OFICIO)='COMERCIAL';

/* 2. Mostrar la fecha de mayor antigüedad y la de menor
antigüedad.*/

SELECT MAX(FECHA_ALTA)"MAYOR", MIN(FECHA_ALTA)"MENOR"
FROM EMPLE;

/* 3. Mostrar el primer apellido y el último de la lista
alfabética de todos los empleados.*/

SELECT MIN(APELLIDO)"PRIMERO",MAX(APELLIDO)"ULTIMO"
FROM EMPLE
ORDER BY APELLIDO;

/* 4. Mostrar el número de empleados del departamento 40.*/

SELECT DEPT_NO
FROM EMPLE;

SELECT COUNT(EMP_NO)"NUMERO EMPLEADOS"
FROM EMPLE
WHERE DEPT_NO=40;
--NO HAY DEPT_NO 40

/* 5. Mostrar el número de empleados del departamento 30
que pueden percibir comisión.*/

/*SELECT COUNT(EMP_NO)"NUMERO EMPLEADOS"
FROM EMPLE
WHERE DEPT_NO=30
AND COMISION_PCT IS NOT NULL;*/

/*CON SOLO UNA CONDICION, EN EL COUNT DE 
UNA NO PRIMARY LOS NULL NO LOS CUENTA*/

SELECT COUNT(COMISION_PCT)"NUMERO EMPLEADOS"
FROM EMPLE
WHERE DEPT_NO=30;

/* 6. Visualizar la cantidad de departamento distintos
que hay en la tabla empleados.*/

SELECT COUNT(DISTINCT DEPT_NO)"Nº DE DEPARTAMENTOS"
FROM EMPLE;

/* 7. Visualizar el número de empleados que hay en cada
departamento. Mostrar las columnas nº departamento y nº
de empleados -cantidad-.*/

SELECT DISTINCT DEPT_NO "Nº DEPARTAMENTO",
COUNT(EMP_NO)"Nº EMPLEADOS"
FROM EMPLE 
GROUP BY DEPT_NO;

/* 8. Visualizar ( nº departamento y nº de empleados
-cantidad-) sólo de los departamentos con más de 4 empleados.*/

SELECT DISTINCT DEPT_NO "Nº DEPARTAMENTO",
COUNT(EMP_NO)"Nº EMPLEADOS"
FROM EMPLE 
GROUP BY DEPT_NO
HAVING COUNT(EMP_NO)>4;
