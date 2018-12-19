/*
3. Utiliza las tablas depart y emple para:
    1. Añadir un nuevo departamento: 'Calidad', con localización Santander y código 11. 
    Añadir un empleado vinculado al departamento recién creado sus datos son:  7230, Aguirre, empleado.
*/    
    INSERT INTO DEPART (DEPT_NO,DNOMBRE,LOC)VALUES(11,'CALIDAD','SANTANDER');
    INSERT INTO EMPLE (EMP_NO,APELLIDO,OFICIO,ID_JEFE,FECHA_ALTA,SALARIO,COMISION_PCT,DEPT_NO)
    VALUES(7230,'AGUIRRE','EMPLEADO',NULL,SYSDATE,6000,NULL,11);
    SELECT * FROM DEPART;
    SELECT * FROM EMPLE;
    COMMIT;
/*   
    2. Aplicar un recorte presupuestario del 10% a todos los sueldos.
*/
    UPDATE EMPLE
    SET SALARIO=SALARIO-(SALARIO*10/100);
    COMMIT;
/*    
    3. Reasignar a los empleados del departamento de contabilidad (código 10)    
    al departamento de producción  (código 40).
*/
    UPDATE EMPLE 
    SET DEPT_NO=40
    WHERE DEPT_NO=10;
    COMMIT;
/*
    4. Modificar a todos los empleados cuyo director es el  7566, pasan a ser subordinados del jefe de tovar.
*/
    UPDATE EMPLE
    SET ID_JEFE=(SELECT ID_JEFE
                  FROM EMPLE
                  WHERE UPPER(APELLIDO)='TOVAR')
    WHERE ID_JEFE=7566;
    COMMIT;
/*    
    5. A los trabajadores cuyo oficio sea empleado se les adjudicara el mismo sueldo que tiene      MUÑOZ.
*/
    SELECT APELLIDO
    FROM EMPLE
    WHERE UPPER(APELLIDO)='MUÑOZ';
    --NO LO HAREMOS POR QUE NO HAY NINGUN EMPLEADO COMO MUÑOZ.
    UPDATE EMPLE
    SET SALARIO=(SELECT SALARIO
                FROM EMPLE
                WHERE UPPER(APPELLIDO)='MUÑOZ')
    WHERE UPPER(OFICIO)='EMPLEADO';
    
    SELECT EMP_NO
    FROM EMPLE
   WHERE UPPER(OFICIO)='EMPLEADO';
    COMMIT;
/*
    6. Todos los trabajadores cuyo departamento este localizado en Santander tendrán una comisión de 300€.
*/
    SELECT DEPT_NO
    FROM DEPART
    WHERE DEPT_NO=(SELECT DEPT_NO
                    FROM DEPART
                    WHERE UPPER(LOC)='SANTANDER');
                    
     SELECT *
    FROM EMPLE
    WHERE DEPT_NO=(SELECT DEPT_NO
                    FROM DEPART
                    WHERE UPPER(LOC)='SANTANDER');                
                    
    UPDATE EMPLE
    SET COMISION_PCT=300
    WHERE DEPT_NO=(SELECT DEPT_NO
                    FROM DEPART
                    WHERE UPPER(LOC)='SANTANDER');
    
    SELECT *
    FROM EMPLE
    WHERE DEPT_NO=(SELECT DEPT_NO
                    FROM DEPART
                    WHERE UPPER(LOC)='SANTANDER');  
    
    COMMIT;
/*
    7. Despedir a todos los empleados que trabajan para el departamento de ventas (código 30).
*/  
    SELECT EMP_NO
    FROM EMPLE
    WHERE DEPT_NO=30;
    
    DELETE FROM EMPLE
    WHERE DEPT_NO=30;
    
    SELECT EMP_NO
    FROM EMPLE
    WHERE DEPT_NO=30;
    
    