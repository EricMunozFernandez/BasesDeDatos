/*# Ejercicio 6 - Borrar la  tabla Provincias 

Modifica el script SQL anterior, a�adiendo al final la sentencia necesaria para borrar la tabla PROVINCIAS.

�Puedes? �Influye el que la tabla PERSONAS este relacionada con �sta mediante una clave for�nea?. Razona tu respuesta.
*/
DROP TABLE PROVINCIAS CASCADE CONSTRAINTS;

/*
SI, PUEDO ELIMINAR LA TABLA PROVINCIAS, PARA BORRAR TODAS LAS RESTRICCIONES RELACIONADAS CON PROVINCIAS COMO LAS FOREING KEY HE PUESTO CASCADE CONSTRAINTS HACIENDO QUE DONDE HAYA FOREING KEY EN OTRAS TABLAS REFERENCIANDO A PROVINCIAS SE ELIMINE.