DESC DEPARTSEQ

ALTER TABLE DEPARTSEQ MODIFY(
DEPT_NO NUMBER(4));

DESC DEPARTSEQ


INSERT INTO DEPARTSEQ (DEPT_NO,DNOMBRE,LOC)
VALUES (DEPT_ID_SEQ.NEXTVAL,'EDUCACION','SEVILLA');

SELECT *
FROM DEPARTSEQ;

INSERT INTO DEPARTSEQ (DEPT_NO,DNOMBRE,LOC)
VALUES (DEPT_ID_SEQ.NEXTVAL,'ADMINISTRACION','MADRID');