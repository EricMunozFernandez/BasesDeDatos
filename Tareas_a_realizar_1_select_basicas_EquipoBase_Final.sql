/*       
    1. A partir de la tabla EMPLE, obtener el APELLIDO, SALARIO y DEPT_NO
    de los empleados cuyo salario sea mayor de 200000 de los departamentos 10 y 20.*/
    
    SELECT APELLIDO, SALARIO, DEPT_NO
    FROM EMPLE
    WHERE SALARIO > 2000
    AND DEPT_NO IN(10,20); 
    
    /*2.  A partir de la tabla EMPLE, obtener aquellos empleados cuyo apellido empiece por una �J�. */
    
    SELECT APELLIDO
    FROM EMPLE
    WHERE APELLIDO LIKE 'J%';
    
    /*3. Obtener aquellos empleados cuyo apellido tengan una �R� en la segunda posici�n. */
    
    SELECT APELLIDO
    FROM EMPLE
    WHERE APELLIDO LIKE '_R%'; 
    
    /*4. Obtener aquellos empleados cuyo apellido empiece por �A� y tengan una �O� en su interior.*/
    
    
       
    /*5. A partir de la tabla EMPLE, obtener el apellido y el salario
    de los empleados cuyo salario est� comprendido entre 150000 y 200000. */
       
    /*6. A partir de la tabla EMPLE, obtener el apellido y el salario
    de los empleados cuyo salario NO est� comprendido entre 150000 y 200000. */
       
    /*7. Consultar los apellidos de la tabla EMPLE cuyo oficio sea �VENDEDOR�, �ANALISTA� o �EMPLEADO�.*/
       
    /*8. Consultar los apellidos de la tabla EMPLE cuyo 
    oficio no sea ni �VENDEDOR�, ni �ANALISTA� ni �EMPLEADO�.*/
       
    /*9.  A partir de la tabla EMPLE, obtener el apellido de los empleados cuyo departamento sea 10 o 30.*/
    
    /*10. Consultar los empleados cuyo departamento no sea ni 10 ni 30. */
       
    /*11. Consultar los apellidos de los empleados cuya comisi�n es nula. */
       
    /*12. Consultar los apellidos de los empleados cuya comisi�n no es nula.*/
       
    /*13. Mostrar el apellido y el oficio de los empleados que no tienen director.*/ 
       
    /*14. Consultar los oficios de la empresa pero sin que aparezcan repeticiones.*/
       
    /*15. Seleccionar de la tabla EMPLE a todos los empleados 
    del departamento 20. Adem�s, la consulta debe aparecer ordenada 
    por APELLIDO. En el caso de que dos empleados tengan el mismo apellido, 
    ordenarlos de mayor a menor salario. Los campos que hay que consultar son: 
    n�mero de empleado, apellido, oficio y n�mero de departamento. */
       
    /*16. Consulta de los empleados cuyo oficio sea �ANALISTA� ordenado por n�mero de empleado. */    