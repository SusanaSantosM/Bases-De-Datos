/*
Crear funcion fmasterjp tal que pasandole el nombre de un equipo devuelva un mensaje
siguiente:
si equipo tiene tres xogadores: 'ten tres xogadores'
si un equipo tiene mas de tres xogadores: 'ten mas de tres xogadores'
si equipo tiene menos de tres xogadores: 'ten menos de tres xogadores'
si equipo no existe: 'equipo inexistente'
*/
create or replace function fmastresjp(c varchar) returns varchar language plpgsql as $$

declare
r int;
vpepita varchar;
k varchar;

begin
select codequ into STRICT vpepita from equipo where nomequ=c;
select count(*) into r from xogador where codequ=vpepita; 
if r=3 then
k=' ten tres xogadores ';
elsif r>3 then
k=' ten mas de tres xogadores ';
else 
k=' ten menos de tres xogadores ';
end if; 

return k;

exception
when no_data_found then
return 'equipo inexistente';

end; $$
