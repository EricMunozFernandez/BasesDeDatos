/*1.Sacar cuantos empleados hay en la empresa.*/
        
SELECT COUNT(CODIGOEMPLEADO) EMPLEADOS
FROM EMPLEADOS;
        
/*2.La compa��a desea saber, en una s�lo consulta,
cu�l fue el cliente que hizo el pago con mayor cuant�a,
as� como el que hizo el pago con menor cuant�a.*/
 
SELECT CODIGOCLIENTE, CANTIDAD
FROM PAGOS
WHERE CANTIDAD=(SELECT MAX(CANTIDAD)
                   FROM PAGOS);
       
/*3.Sacar el c�digo del cliente, el nombre del cliente,
el estado y cu�ntos pedidos tiene 
cada cliente en cada estado. 
Ordena la salida por c�digo  cliente y estado.*/
 
SELECT C.CODIGOCLIENTE, C.NOMBRECLIENTE,P.ESTADO, COUNT(P.CODIGOPEDIDO)
FROM PEDIDOS P, CLIENTES C 
GROUP BY P.ESTADO,C.CODIGOCLIENTE, C.NOMBRECLIENTE
ORDER BY CODIGOCLIENTE, ESTADO;
       
/*4.Obtener el c�digo de empleado y el n�mero de
clientes al que atiende cada empleado.
Si alg�n empleado no tiene clientes lo queremos saber.
La consulta saldr� ordenada por c�digo de empleado.*/
       
SELECT E.CODIGOEMPLEADO EMPLEADO,
COUNT(C.CODIGOCLIENTE) CLIENTES
FROM CLIENTES C, EMPLEADOS E
WHERE E.CODIGOEMPLEADO=C.CODIGOEMPLEADOREPVENTAS(+)
GROUP BY E.CODIGOEMPLEADO
ORDER BY E.CODIGOEMPLEADO;
       
/*5.Sacar cuantos clientes tiene cada pa�s.*/

SELECT COUNT(CODIGOCLIENTE) CLIENTES, PAIS
FROM CLIENTES
GROUP BY PAIS;
       
/*6.Listar las ventas totales de los productos
que hayan facturado mas de 3000 �. Se mostrara el
nombre, unidades vendidas, total facturado y total
facturado con impuestos(21% de IVA).*/


       
/*7.Sacar cual fue el pago medio en 2007.*/

SELECT FECHAPAGO 
FROM PAGOS;

SELECT AVG(CANTIDAD)
FROM PAGOS
WHERE FECHAPAGO=
       
/*8.Sacar para cada cliente cuantos pedidos est�n
en cada estado. Obt�n la consulta ordenada por cliente
y en descendente por la cantidad de pedidos.*/



/*9.Sacar el precio de venta y de compra del producto
mas caro y del mas barato.*/


       
/*10.Obtener el nombre del cliente con mayor limite
de cr�dito.*/


