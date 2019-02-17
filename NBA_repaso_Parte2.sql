/*1.¿Cuánto pesa en libras el jugador más pesado de la NBA?*/
DESC JUGADORES

SELECT MAX(PESO) "PESO MAXIMO EN LIBRAS"
FROM JUGADORES;


/*2.Modifica el ejercicio para sacar el nombre del jugador más 
pesado de la NBA y su peso con la cabecera libras.*/

SELECT NOMBRE, PESO LIBRAS
FROM JUGADORES
WHERE PESO=(SELECT MAX(PESO)
                    FROM JUGADORES);

/*3.¿Cuánto mide el jugador más bajito de la NBA?*/

SELECT MIN(ALTURA)
FROM JUGADORES;

/*4.¿Cuántos jugadores tienen los LAKERS?*/

SELECT COUNT(CODIGO) "JUGADOR LAKERS"
FROM JUGADORES
WHERE ID_EQUIPO=(SELECT ID
                        FROM EQUIPOS
                        WHERE UPPER(NOMBRE)='LAKERS');

/*5.¿Cuánto pesan de media los jugadores de los
BLAZERS (no conocemos el nombre completo del equipo)?*/

SELECT AVG(PESO) "PESO MEDIO"
FROM JUGADORES
WHERE ID_EQUIPO=(SELECT ID
                    FROM EQUIPOS 
                    WHERE UPPER(NOMBRE) LIKE '%BLAZERS%');

/*6.Indica el nombre del equipo y el peso en kilos del 
jugador más pesado de cada equipo . Saca el peso en Kilogramos 
teniendo en cuenta que una libra equivale a 0.4535 kilos.*/

SELECT ROUND(MAX(J.PESO*0.4535),2) "PESO EN KG", E.NOMBRE
FROM JUGADORES J, EQUIPOS E
WHERE E.ID=J.ID_EQUIPO
GROUP BY E.NOMBRE;

/*7. ¿Cuántos equipos tiene cada conferencia en la NBA?*/

SELECT CONFERENCIA,COUNT(ID) EQUIPOS
FROM EQUIPOS
GROUP BY CONFERENCIA;

/*8.Indica, para cada una de las siguientes nacionalidades 
España, Francia e Italia, cuánto pesan de media los jugadores
NOTA: Las nacionalidades están en inglés*/

SELECT ROUND(AVG(PESO),2),PROCEDENCIA
FROM JUGADORES
WHERE UPPER(PROCEDENCIA) IN('SPAIN','FRANCE','ITALY')
GROUP BY PROCEDENCIA;

/*9.Selecciona que equipos de la NBA tienen más de 1 jugador español.*/

SELECT E.NOMBRE EQUIPO ,COUNT(J.CODIGO) CANTIDAD
FROM EQUIPOS E, JUGADORES J
WHERE E.ID=J.ID_EQUIPO
AND UPPER(J.PROCEDENCIA)='SPAIN'
GROUP BY E.NOMBRE
HAVING COUNT(J.CODIGO)>=1;

--NO ME SALEN MAS JUGADORES PORQUE EN UN EJERCICIO ANTERIOR BORRAMOS UNO

/*10. Saca los nombres de los jugadores de la división SouthEast.*/

SELECT J.NOMBRE, E.DIVISION
FROM EQUIPOS E, JUGADORES J
WHERE E.ID=J.ID_EQUIPO
AND UPPER(E.DIVISION)='SOUTHEAST';

/*11.Obtén el nombre del jugador de mayor altura de la NBA*/

SELECT NOMBRE, ALTURA
FROM JUGADORES
WHERE ALTURA=(SELECT MAX(ALTURA)
                    FROM JUGADORES);

/*12.Extrae las divisiones de la NBA donde juegan jugadores españoles.*/

SELECT E.DIVISION 
FROM EQUIPOS E, JUGADORES J
WHERE E.ID=J.ID_EQUIPO
AND UPPER(J.PROCEDENCIA)='SPAIN';

/*13.Se desea conocer los jugadores de la NBA que pesan más que
todos los jugadores españoles.*/

SELECT NOMBRE
FROM JUGADORES
WHERE PESO>(SELECT MAX(PESO)
                    FROM JUGADORES
                    WHERE UPPER(PROCEDENCIA)='SPAIN');

/*14.Consulta cuales son los bases que pesan más que 
cualquier pivot de la NBA. */
--G = BASE.
--C = PIVOT.

SELECT NOMBRE
FROM JUGADORES
WHERE POSICION='G'
AND PESO>ANY(SELECT PESO
            FROM JUGADORES
            WHERE POSICION='C');
    
/*15.Obtén el nombre de la ciudad donde juega el 
jugador mas alto de la NBA.*/

SELECT E.NOMBRE, J.NOMBRE
FROM EQUIPOS E, JUGADORES J
WHERE E.ID=J.ID_EQUIPO
AND ALTURA=(SELECT MAX(ALTURA)
                FROM JUGADORES);
