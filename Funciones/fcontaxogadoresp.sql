/*
Desenvolver una funcion llamada fcontaxogadores tal que pasandole el codigo de un equipo 
que devuelve el numero de jugadores que tiene.
*/
create or replace function fcontaxogadoresp(c varchar) returns varchar language plpgsql as $$


declare
r int;
vpepita varchar;
t varchar ='';

begin
select codequ into vpepita from equipo where nomequ=c;
 if not found then
    return 'no existe equipo';
 end if;
select count(*) into r from xogador where codequ=vpepita; --con el codigo de equipo
return t||r;

end; $$




/*
-- es mejor declarar t para que no anule el return
--select count(*) into r from xogador where codequ=(select codequ from equipo where nomequ=c); 
 Lo malo de este codigo es que no nos especifica si existe o no el equipo y si realmente tiene 0 jugadores
*/

--\d xogador; para ver los tipos de variables de una tabla */
