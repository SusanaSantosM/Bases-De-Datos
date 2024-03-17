/*
Desenvolver una funcion llamada fcontaxogadores2 tal que pasandole el codigo de un equipo 
que devuelve el numero de jugadores que tiene usando exception con no_data_found.
*/
create or replace function fcontaxogadoresp2(c varchar) returns varchar language plpgsql as $$


declare
r int;
vpepita varchar;
t varchar ='';

begin
select codequ into STRICT vpepita from equipo where nomequ=c;
select count(*) into r from xogador where codequ=vpepita; 
return t||r;

exception
when no_data_found then
return 'equipo inexistente';

end; $$




