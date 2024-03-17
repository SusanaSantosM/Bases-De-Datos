/*
Crear una funcion pxogequip que liste codigos, nombres y salario de
 todos los jugadores de un equipo cuyo codigo se pasa por parametro.
*/

create or replace procedure pxogequip(vcodequ varchar) language plpgsql as $$

declare
vnomequ varchar;
r varchar='';
c record;
s varchar;
v int=0; --variable para el bucle for
begin
select nomequ into strict vnomequ from equipo where codequ=vcodequ;
raise notice 'equipo: %',vnomequ;
 for c in select * from xogador where codequ=vcodequ loop
 v=1;
   if c.salario is null then
    s='';
    else
    s=c.salario;
   end if; 
  r=r|| 'xogador '||c.codx ||', nome ' ||c.nomx||' , salario '||s||E'\n';  
 end loop;
 if v=0 then --bucle para la variable v
 raise notice ' equipo sen xogadores';
 else
 raise notice '%',r;
 end if;
 exception
 when no_data_found then
 raise notice 'equipo inexistente';
end; $$



