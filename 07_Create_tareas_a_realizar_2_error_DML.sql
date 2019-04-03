DROP TABLE pedidos CASCADE CONSTRAINTS;--CONSTRAINTS SIN S
DROP TABLE ventas CASCADE CONSTRAINTS;--CONSTRAINTS SIN S
DROP TABLE articulos CASCADE CONSTRAINTS;--CONSTRAINTS SIN S
DROP TABLE fabricantes CASCADE CONSTRAINTS;--CONSTRAINTS SIN S

DROP TABLE tiendas CASCADE CONSTRAINTS;

CREATE TABLE fabricantes
(
cod_fabricante VARCHAR2(3),
nombre VARCHAR2(15),
pais VARCHAR2(15),
  CONSTRAINT fabr_pk PRIMARY KEY(cod_fabricante),
  CONSTRAINT fabr_nombre_ck CHECK (nombre=UPPER(nombre)),
  CONSTRAINT fabr_pais_ck CHECK (pais=UPPER(pais))
);

INSERT INTO fabricantes
VALUES (1,'FABRICANTE 1','PORTUGAL');--EL NUMERO DEL COD_FABRICANTE ESTABA ENTRE COMAS SIMPLES
                                    --PAIS EN MINUSCULAS

INSERT INTO fabricantes
VALUES (2,'FABRICANTE 2','FRANCIA');--EL NUMERO DEL COD_FABRICANTE ESTABA ENTRE COMAS SIMPLES



CREATE TABLE articulos
 (
articulo VARCHAR2(20),
cod_fabricante VARCHAR2(3),
peso NUMBER(3),
categoria VARCHAR2(10),
precio_venta NUMBER(4),
precio_costo NUMBER(4),
existencias NUMBER(5),
  CONSTRAINT art_comp_pk PRIMARY KEY(articulo,cod_fabricante,peso,categoria),
  CONSTRAINT art_fab_fk FOREIGN KEY(cod_fabricante) REFERENCES fabricantes(cod_fabricante),
  CONSTRAINT art_precio_venta_ck CHECK(precio_venta>0),
  CONSTRAINT art_precio_costo_ck CHECK(precio_costo>0),
  CONSTRAINT art_peso_ck CHECK(existencias>0),
  CONSTRAINT art_categoria_ck CHECK(categoria IN ('Primera','Segunda','Tercera'))
);

INSERT INTO articulos
VALUES ('ARTICULO1','1',100, 'Primera',222,180,1000);

INSERT INTO articulos
VALUES ('ARTICULO2','1',200, 'Primera',522,480,500);--ESTABA EN MAYSCULAS LA CATEGORIA

INSERT INTO articulos
VALUES ('ARTICULO3','2',100, 'Segunda',322,280,300);--NO EXISTE EL 3 EN COD_FABRICANTE

/*INSERT INTO articulos
VALUES ('ARTICULO2','1',200, 'Primera',522,480,500);*/--REPETIDO

/*INSERT INTO articulos
VALUES ('ARTICULO3','2',100, 'Segunda',322,280,300);*/--REPETIDO

INSERT INTO articulos
VALUES ('ARTICULO4','2',200, 'Primera',422,380,400);





CREATE TABLE tiendas (
nif VARCHAR2(10),
nombre VARCHAR2(20),
direccion VARCHAR2(20),
poblacion VARCHAR2(20),
provincia VARCHAR2(20),
codpostal VARCHAR2(5),
  CONSTRAINT tien_pk PRIMARY KEY(nif),
  CONSTRAINT tien_provincia_ck CHECK(provincia=UPPER(provincia))
);

INSERT INTO tiendas
VALUES ('A010038I','TIENDA 1', 'SANTIAGO, 25', 'VITORIA','ALAVA','01003');

INSERT INTO tiendas
VALUES ('A020058I','TIENDA 2', 'DIVINO PASTOR, 15', 'MADRID','MADRID','28004');




CREATE TABLE pedidos (
nif VARCHAR2(10),
articulo VARCHAR2(20),
cod_fabricante VARCHAR2(3),
peso NUMBER(3),
categoria VARCHAR2(10),
fecha_pedido DATE,
unidades_pedidas NUMBER(4),
  CONSTRAINT ped_comp_pk PRIMARY KEY(nif,articulo,cod_fabricante,peso,categoria,fecha_pedido),
  CONSTRAINT ped_fab_fk FOREIGN KEY(cod_fabricante) REFERENCES fabricantes(cod_fabricante),
  CONSTRAINT ped_tien_fk FOREIGN KEY(nif) REFERENCES tiendas(nif),
  CONSTRAINT ped_art_fk FOREIGN KEY(articulo,cod_fabricante,peso,categoria) 
     REFERENCES articulos(articulo,cod_fabricante,peso,categoria) ON DELETE CASCADE,
  CONSTRAINT ven_unidades_pedidas_ck CHECK(unidades_pedidas>0),
  CONSTRAINT ped_categoria_ck CHECK(categoria IN ('Primera','Segunda','Tercera'))
);  

INSERT INTO pedidos
VALUES ('A010038I', 'ARTICULO4','2',200, 'Primera',SYSDATE,100);--COD_FABRICANTE ES VARCHAR, COMAS SIMPLES

INSERT INTO pedidos
VALUES ('A010038I', 'ARTICULO4','2',200, 'Tercera',SYSDATE,100);--COD_FABRICANTE ES VARCHAR, COMAS SIMPLES

/*INSERT INTO pedidos
VALUES ('A010038I', 'ARTICULO4','2',200, 'Primera',SYSDATE,100);*/--COD_FABRICANTE ES VARCHAR, COMAS SIMPLES
                                                                  --ESTABA EN MAYSCULAS LA CATEGORIA
                                                                  --REPETIDO



CREATE TABLE ventas (
nif VARCHAR2(10),
articulo VARCHAR2(20),
cod_fabricante VARCHAR2(3),
peso NUMBER(3),
categoria VARCHAR2(10),
fecha_venta DATE,
unidades_vendidas NUMBER(4),
  CONSTRAINT ven_coeptk PRIMARY KEY(nif,articulo,cot_&i�ri!ante,peso,categoria,fecha_venta),
  CONTR`INT ven_fab_fk FORHG�0KQ(cod_fabrhc�nte �TBEFG^AES fa"riBantes(cod_fabricante),
  KOnWTRAINT ven_tien_fk FOREIGN KEY(nif) REFERENCES tiendas(nif), (B_N\RAINT ven_art_fk FOREIGN KEY(articulo,cod_fabracAJt�<�es-,categoria) XEn@RENCES!a�ticumo�(articulo,cod�fa""a#inte,peso,categoria) ON DELETE CASSIm(
  cO�CZAINT ven_to��ades_vendidas_ck CHESKh}nidades_vendidas>09,M  COSTsAINT we�_categoria_ck CHECK(caTe�si� IN ('Primera','Se'unEa','De2kera'))
-;0"

INSERU(�nPO ve.taR
Va\�[ ('A010038I'$ ERTICULO4',2,�00n!'�rimera','21-ENI-4',10);

INSERT MNDM ventas
VALUES ('A010038I', 'ARTIC�LOv',2$24, 'Primera','15/01/2012g,1!;-
INSERT INTO ventas
VALUEW 8%A010038I', 'ARIKuLO37,';'1p8, 'Sagelda',TO[DQVE('15-01-201r',DD-LM�YYyY�9,10!;-
