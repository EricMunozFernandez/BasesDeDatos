/*Escribir un paquete completo para gestionar los 
departamentos. El paquete se llamará gest_depart y
deberá incluir, al menos, los siguientes bloques PL/SQL:

• insertar_depart: permite insertar un departamento nuevo.
El procedimiento recibe el nombre y la localidad del nuevo
departamento. Creará el nuevo departamento comprobando que
el nombre no se duplique y le asignará como número de 
departamento la decena siguiente al último número de 
departamento utilizado controlando si se excede de 100.
      
• borrar_depart: permite borrar un departamento. 
El procedimiento recibirá dos números de departamento
de los cuales el primero corresponde al departamento
que queremos borrar y el segundo al departamento al 
que pasarán los empleados del departamento que se va
eliminar. El procedimiento se encargará de realizar 
los cambios oportunos en los números de departamento
de los empleados correspondientes. 
      
• cambiar_localidad: modifica la localidad del departamento.
El procedimiento recibirá el número del departamento a
modificar y la nueva localidad, y realizará el cambio
solicitado.
      
• visualizar_lista_depart: devuelve los datos de 
todos los departamentos que hay en la tabla.
      
• visualizar_datos_depart: devuelve los datos de un
departamento cuyo número se pasará en la llamada. 
Además de los datos relativos al departamento, 
se devolverá el número de empleados que pertenecen
actualmente al departamento. 
      
• visualizar_datos_depart: versión sobrecargada del
procedimiento anterior que, en lugar del número del
departamento, recibirá el nombre del departamento.
Realizará una llamada a la función 
buscar_depart_por_nombre que se indica en el apartado
siguiente.  Devuelve todos los datos relativos al 
departamento, y el número de empleados que pertenecen
actualmente al departamento.
      
• buscar_depart_por_nombre: función local al paquete.
Recibe el nombre de un departamento y devuelve el número
del mismo.

Se realizará el control de los errores que 
estimes oportunos. Nuestra empresa tiene un listado
de errores.
Código
Texto
-20001
'Err. Nombre de departamento duplicado'
-20011
'Err Nombre Departamento no encontrado'
-20021
'Err Cod. Departamento no encontrado'
-20999
'Error desconocido'

Si te aparece alguno más añádelo a la lista.

Este paquete está pensado para usar desde una
aplicación Java.*/

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
