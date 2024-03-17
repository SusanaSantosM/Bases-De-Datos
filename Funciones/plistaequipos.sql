/*
Crear una funcion plistaequipos que liste codigo y nombres de todos los equipos
*/

create or replace procedure plistaequipos() language plpgsql as $$

declare
r varchar='';
c record;

begin
 for c in select codequ,nomequ from equipo loop
    r=r|| 'equipo '||c.codequ ||', nome ' ||c.nomequ||E'\n'; --lo que se ve
 end loop;
 raise notice '%',r;
end; $$


--tambien puedes poner select * from y te coge las tres tablas pero soo temuestra las que especificas(2).
--E'\n' es retorno de carro.
