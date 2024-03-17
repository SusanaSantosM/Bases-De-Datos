/*
Crear una funcion plistaxogadores que liste codigos y nombres de todos los jugadores
*/

create or replace procedure plistaxogadores() language plpgsql as $$

declare
r varchar='';
c record;
s varchar;
begin
 for c in select codx,nomx,salario from xogador loop
   if c.salario is null then
   s='';
   else
   s=c.salario;
   end if; 
  r=r|| 'xogador '||c.codx ||', nome ' ||c.nomx||' , salario '||s||E'\n';  
 end loop;
 raise notice '%',r;
end; $$



