/*Escribir un paquete completo para gestionar los 
departamentos. El paquete se llamar� gest_depart y
deber� incluir, al menos, los siguientes bloques PL/SQL:

� insertar_depart: permite insertar un departamento nuevo.
El procedimiento recibe el nombre y la localidad del nuevo
departamento. Crear� el nuevo departamento comprobando que
el nombre no se duplique y le asignar� como n�mero de 
departamento la decena siguiente al �ltimo n�mero de 
departamento utilizado controlando si se excede de 100.
      
� borrar_depart: permite borrar un departamento. 
El procedimiento recibir� dos n�meros de departamento
de los cuales el primero corresponde al departamento
que queremos borrar y el segundo al departamento al 
que pasar�n los empleados del departamento que se va
eliminar. El procedimiento se encargar� de realizar 
los cambios oportunos en los n�meros de departamento
de los empleados correspondientes. 
      
� cambiar_localidad: modifica la localidad del departamento.
El procedimiento recibir� el n�mero del departamento a
modificar y la nueva localidad, y realizar� el cambio
solicitado.
      
� visualizar_lista_depart: devuelve los datos de 
todos los departamentos que hay en la tabla.
      
� visualizar_datos_depart: devuelve los datos de un
departamento cuyo n�mero se pasar� en la llamada. 
Adem�s de los datos relativos al departamento, 
se devolver� el n�mero de empleados que pertenecen
actualmente al departamento. 
      
� visualizar_datos_depart: versi�n sobrecargada del
procedimiento anterior que, en lugar del n�mero del
departamento, recibir� el nombre del departamento.
Realizar� una llamada a la funci�n 
buscar_depart_por_nombre que se indica en el apartado
siguiente.  Devuelve todos los datos relativos al 
departamento, y el n�mero de empleados que pertenecen
actualmente al departamento.
      
� buscar_depart_por_nombre: funci�n local al paquete.
Recibe el nombre de un departamento y devuelve el n�mero
del mismo.

Se realizar� el control de los errores que 
estimes oportunos. Nuestra empresa tiene un listado
de errores.
C�digo
Texto
-20001
'Err. Nombre de departamento duplicado'
-20011
'Err Nombre Departamento no encontrado'
-20021
'Err Cod. Departamento no encontrado'
-20999
'Error desconocido'

Si te aparece alguno m�s a��delo a la lista.

Este paquete est� pensado para usar desde una
aplicaci�n Java.*/

CREATE OR REPLACE PACKAGE GEST_DEPART IS
TYPE TCURSOR IS REF CURSOR;
PROCEDURE INSERTAR_DEPART
(P_DNOMBRE DEPART.DNOMBRE%TYPE,P_LOC DEPART.LOC%TYPE);
PROCEDURE BORRAR_DEPART
(P1_DEPT_NO DEPART.DEPT_NO%TYPE,P2_DEPT_NO DEPART.DEPT_NO%TYPE);
PROCEDURE CAMBIAR_LOCALIDAD
(P_DEPT_NO DEPART.DEPT_NO%TYPE,P_LOC IN DEPART.LOC%TYPE);
PROCEDURE VISUALIZAR_LISTA_DEPART(P_CURSOR_LISTA OUT TCURSOR);
PROCEDURE VISUALIZAR_DATOS_DEPART              /*SYS_REFCURSOR*/
(P_DEPT_NO OUT DEPART.DEPT_NO%TYPE,
 P_DNOMBRE OUT DEPART.DNOMBRE%TYPE,
 P_LOC OUT DEPART.LOC%TYPE,
 P_NUM_EMPLEADOS OUT NUMBER);
PROCEDURE VISUALIZAR_DATOS_DEPART
(P_DNOMBRE DEPART.DNOMBRE%TYPE,
 P_CURSOR_LISTA OUT TCURSOR,
 P_NUM_EMPLEADOS OUT NUMBER);
END GEST_DEPART;
