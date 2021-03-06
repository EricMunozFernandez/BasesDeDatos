/*SINONIMOS*/

CREATE PUBLIC SYNONYM "CONDUCTORES"
FOR "BLANCA"."CONDUCTORES";

CREATE PUBLIC SYNONYM "TRABAJOS"
FOR "BLANCA"."TRABAJOS";

DESC ALL_TABLES;

SELECT TABLE_NAME
FROM ALL_TABLES
WHERE UPPER(TABLE_NAME) IN('CONDUCTORES', 'TRABAJOS');

/*EJERCICIO*/

DROP PUBLIC synonym "ERIC";

DROP PUBLIC SYNONYM "EMPLEADOdaw07";

DROP PUBLIC SYNONYM "E7";

CREATE PUBLIC SYNONYM "ERIC"
FOR"DAW07"."EMPLE";

GRANT SELECT ON "DAW07"."EMPLE" TO "DAW08";

/*VER LA TABLA EMPLE DE DAW09 YA QUE ME HA DADO
PERMISOS Y LO HA LLAMAO MIKELIN*/

SELECT *
from MIKELIN;

/*VER LA TABLA EMPLE PASA VER EL OWNER QUE LO USA*/

SELECT *
FROM ALL_TABLES
WHERE UPPER(TABLE_NAME)='EMPLE';

/*O SINO BUSCAR EL OWNER EN SI*/

SELECT *
FROM ALL_TABLES
WHERE UPPER(OWNER)='DAW09';

DESC USER_SYNONYMS

SELECT *
FROM ALL_SYNONYMS
WHERE UPPER(TABLE_OWNER)LIKE'%DAW%'
ORDER BY TABLE_OWNER;
