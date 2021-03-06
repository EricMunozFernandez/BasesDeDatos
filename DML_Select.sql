 /*    Averigua la estructura de la tabla EMPLE,  sus restricciones
 y las columnas que forman parte de cada restricci�n,
 ya que se pretende crear una tabla de trabajo a partir de ella. 
*/

DESC EMPLE;

SELECT * 
FROM USER_CONSTRAINTS
WHERE UPPER(TABLE_NAME)='EMPLE';

SELECT *
FROM USER_CONS_COLUMNS
WHERE UPPER(TABLE_NAME)='EMPLE';

SELECT USER_CONSTRAINTS.CONSTRAINT_TYPE,USER_CONS_COLUMNS.*
FROM USER_CONSTRAINTS, USER_CONS_COLUMNS
WHERE USER_CONSTRAINTS.TABLE_NAME=USER_CONS_COLUMS.TABLE_NAME
AND UPPER(USER_CONS_COLUMNS.TABLE_NAME)='EMPLE';

/*Crear la tabla denominada EMPLEADOS30 con la misma estructura de la
tabla EMPLE pero con los datos de los empleados del departamento 30
de la tabla EMPLE. 
Para ello utiliza CREATE TABLE � AS SELECT �.
�Se crean todas las restricciones?
lAS PRIMARY Y FOREING KEY NO*/

drop table EMPLEADOS30;

CREATE TABLE EMPLEADOS30 AS SELECT EMP_NO ,
APELLIDO ,
OFICIO ,
ID_JEFE ,
FECHA_ALTA ,
SALARIO ,
COMISION_PCT ,
DEPT_NO 
FROM EMPLE
WHERE DEPT_NO=30;

DESC EMPLEADOS30

SELECT * 
FROM USER_CONSTRAINTS
WHERE UPPER(TABLE_NAME)='EMPLEADOS30';

UPDATE EMPLEADOS30
SET ID_JEFE=NULL
WHERE ID_JEFE NOT LIKE 7698;

ROLLBACK;

ALTER TABLE EMPLEADOS30 ADD(
CONSTRAINT EMP30_EMP_NO_PK PRIMARY KEY(EMP_NO),
CONSTRAINT EMPLE30_DIR_FK FOREIGN KEY (ID_JEFE)
          REFERENCES EMPLEADOS30(EMP_NO)  ON DELETE SET NULL,
CONSTRAINT EMPLE30_DEP_FK FOREIGN KEY (DEPT_NO)
          REFERENCES DEPART(DEPT_NO) ON DELETE CASCADE);
                                      --DESPIDE TODOS LOS EMPLEADOS DE ESTE DEPARTAMENTO
     
/*1.  Insertar en la tabla EMPLE a un empleado de apellido
'SAAVEDRA' con n�mero de empleado 2000. La fecha de alta ser�
la fecha actual, el SALARIO ser� el mismo salario que el del 
empleado de apellido 'SALA' m�s el 20 por 100 y el resto de datos
ser�n los mismos que los datos del empleado de apellido 'SALA'.
Hazlo en un s�lo paso.*/

INSERT INTO EMPLE (APELLIDO,EMP_NO,FECHA_ALTA,SALARIO, COMISION_PCT,DEPT_NO, OFICIO, ID_JEFE)
            SELECT 'SAAVEDRA', 2000, SYSDATE, SALARIO+SALARIO*0.2, COMISION_PCT, DEPT_NO, OFICIO, ID_JEFE
            FROM EMPLE
            WHERE UPPER(APELLIDO)='SALA';
SELECT *
FROM EMPLE;

/*2. Actualiza la tabla EMPLE, cambiando el n�mero de departamento,
para todos los empleados que tenga el mismo oficio que el empleado
7566, por el n�mero de departamento actual del empleado 7499.*/

SELECT *
FROM EMPLE;

UPDATE EMPLE 
SET DEPT_NO=(SELECT DEPT_NO
            FROM EMPLE
            WHERE EMP_NO=7499)
WHERE OFICIO=(SELECT OFICIO
              FROM EMPLE 
              WHERE EMP_NO=7566);
              
SELECT *
FROM EMPLE;



/*3. Borrar todos los departamentos de la tabla DEPART 
para los cuales no existan empleados en EMPLE.*/

DELETE FROM DEPART 
WHERE DEPT_NO NOT IN(SELECT DISTINCT DEPT_NO
                      FROM EMPLE);
        
SELECT *
FROM DEPART;


/*4. Eliminar a todos los empleados que est�n en un departamento
cuyo nombre contiene una 'O'.*/

SELECT *
FROM EMPLE;

SELECT DEPT_NO
      FROM DEPART
      WHERE UPPER(DNOMBRE) LIKE '%O%';
      
DELETE FROM EMPLE
WHERE DEPT_NO IN(SELECT DEPT_NO
      FROM DEPART
      WHERE UPPER(DNOMBRE) LIKE '%O%');

SELECT *
FROM EMPLE;

/*  5. Incrementa el salario del empleado de apellido REY.
Su nuevo salario ser� el que ten�a antes m�s un importe que
corresponde con la comisi�n que tiene ARROYO.*/

SELECT *
FROM EMPLE
WHERE UPPER(APELLIDO)='REY';

SELECT NVL(COMISION_PCT,0)
FROM EMPLE
WHERE UPPER(APELLIDO)='ARROYO';

UPDATE EMPLE
SET SALARIO=SALARIO+(SELECT COMISION_PCT
                    FROM EMPLE
                    WHERE UPPER(APELLIDO)='ARROYO')
WHERE UPPER(APELLIDO)='REY';

SELECT *
FROM EMPLE
WHERE UPPER(APELLIDO)='REY';
