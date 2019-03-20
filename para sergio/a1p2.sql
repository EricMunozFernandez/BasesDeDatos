set serveroutput on

--Sentencias DML:

DECLARE
nombre depart.dnombre%type;
maxim number(2);
error varchar2(50):='Ya existe un departamento con el nombre educacion';
mensaje varchar2(50):='Insertado el departamento ';
begin
  select dnombre into nombre from depart where dept_no=10;
  select max(dept_no)+10 into maxim from depart;
  if (nombre =upper('educacion'))THEN
    dbms_output.put_line(error);
    else
  insert into depart (dept_no,dnombre,loc)values (maxim,'educacion',null);
  if sql%found then
  dbms_output.put_line(mensaje||maxim);
  end if;
  end if;
end;

--NO ANONIMO

CREATE PROCEDURE AÑADIR_DEPART
IS
nombre depart.dnombre%type;
maxim number(2);
error varchar2(50):='Ya existe un departamento con el nombre educacion';
mensaje varchar2(50):='Insertado el departamento ';
begin
  select dnombre into nombre from depart where dept_no=10;
  select max(dept_no)+10 into maxim from depart;
  if (nombre =upper('educacion'))THEN
    dbms_output.put_line(error);
    else
  insert into depart (dept_no,dnombre,loc)values (maxim,'educacion',null);
  if sql%found then
  dbms_output.put_line(mensaje||maxim);
  end if;
  end if;
end AÑADIR_DEPART;

/*
v_error varchar(250);

exception
v_error :='error oracle: ' ||to_char(sqlcode)||', '||sqlerrm;
raise_aplication_error('-2000', v_error);*/

/*DECLARE 
  V_NOM depart.dnombre%type;
  E_MAX EXCEPTION;
  PRAGMA EXCEPTION_INIT (E_MAX, -01438)--no predefinido
  V_ERROR VARCHAR2(250);
BEGIN 
  SELECT dnombre INTO V_NOM
  FROM depart
  WHERE UPPER(dnombre)='EDUCACION';
  IF sql%FOUND THEN
    dbms_output.put_line('ya existe un departamento con el nombre educacion');
  END IF;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      INSERT INTO depart (select nvl(max(dept_no),0)+10,upper('educacion'),null from depart;
    IF sql%FOUND THEN
      dbms_output.put_line('insertado el departamento educacion');
    END IF;
  WHEN E_MAX THEN 
    dbms_output.put_line('el codigo departamento excede la precision de la columna');
  WHEN OTHERS THEN
    V_ERROR:='error oracle: ' ||to_char(SQLCODE)||', '||SQLERRM;
    RAISE_APLICATION_ERROR('-2000', V_ERROR);
END;*/
