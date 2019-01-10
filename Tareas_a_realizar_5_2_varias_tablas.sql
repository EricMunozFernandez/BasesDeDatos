/*  1. Crear un listado único con todos los oficios que haya en el 
departamento 10. Incluir la localidad del departamento en el resultado.
*/ 
DESC DEPART

SELECT *
FROM EMPLE
WHERE DEPT_NO=10;

SELECT EMPLE.OFICIO,DEPART.LOC,DEPART.DNOMBRE
FROM EMPLE, DEPART
WHERE DEPART.DEPT_NO=EMPLE.DEPT_NO
AND DEPART.DEPT_NO=10;

SELECT *
FROM EMPLE
WHERE DEPT_NO=10;
/* 2. Obtener la siguiente salida:
*/


/*3. Visualizar el número de departamento, el nombre del departamento,
y la cantidad de empleados del departamento con más empleados.
*/  



/*4. Mostrar el apellido, el nombre del departamento y el salario de 
cualquier empleado cuyo salario y comisión coincidan con los de cualquier
empleado que trabaje en Barcelona, incluidos los que no tienen comisión.
*/   
DESC DEPART
SELECT EMPLE.APELLIDO, DEPART.DNOMBRE,EMPLE.SALARIO
FROM EMPLE, DEPART
WHERE DEPART.DEPT_NO=EMPLE.DEPT_NO
AND (EMPLE.SALARIO,NVL(EMPLE.COMISION_PCT,-1)) IN(SELECT EMPLE.SALARIO,NVL(EMPLE.COMISION_PCT,-1)
              FROM EMPLE
              WHERE DEPT_NO=(SELECT DEPART.DEPT_NO
                              FROM DEPART
                              WHERE UPPER(LOC)='BARCELONA'));
