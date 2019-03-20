set serveroutput on

-- Select 1 fila con Función de Grupo:

DECLARE
P number(2);
v varchar2(50):='El ultimo identificador de departamiento es: ';
begin
  select max(dept_no) into p from depart;
  if p is null then
  dbms_otuput.put_line('tabla depart vacia');
  else
  dbms_output.put_line(v||p);
  end if;
end;

--opcion 2

DECLARE
P number(2);
e_vacia exception;
v varchar2(50):='El ultimo identificador de departamiento es: ';
begin
  select max(dept_no) into p from depart;
  if p is null then
  raise e_vacia;
  else
  dbms_output.put_line(v||p);
  end if;
exception 
when e_vacia then 
  dbms_otuput.put_line('tabla depart vacia');
end;


CREATE PROCEDURE BUSCAR_DEPART
IS
P number(2);
e_vacia exception;
begin
  select max(dept_no) into p from depart;
  if p is null then
  raise e_vacia;
  else
  dbms_output.put_line('El ultimo identificador de departamiento es: '||p);
  end if;
exception 
when e_vacia then 
  dbms_otuput.put_line('tabla depart vacia');
end BUSCAR_DEPART;


