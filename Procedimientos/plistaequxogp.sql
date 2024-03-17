/*
Crear una funcion plistaequxogp que liste codigo y nombres de todos los equipos y 
para cada uno de ellos, codigo, nombre y salario de sus jugadores
*/

create or replace procedure plistaequxogp() language plpgsql as $$

declare
r varchar='';
c record;
i record;
v integer; --alista los jugadores, es un contador
s varchar;
begin
for c in select * from equipo loop
r=r|| 'equipo '||c.codequ ||' ,nome ' ||c.nomequ||E'\n';
v=0;

 for i in select * from xogador where codequ=c.codequ loop
  v=1;
  
  if i.salario is null then
   s='nulo';
   else
   s=i.salario;
   end if;
   
    r=r||E'\t'|| 'xogador '||i.codx ||', nome ' ||i.nomx||' ,salario ' ||s||E'\n';
 end loop;
 
   if v=0 then
    r=r|| ' equipo sin jugadores'||E'\n';
    else
    v=v+1;
    r=r|| 'total de jugadores de este equipo es '||v||E'\n';
   end if;
 
end loop;
 
 raise notice '%',r;

end; $$



/*
order by nomequ  --podemos usarlo para order por el nombre del equipo
si quieres ordenarlo por el codigo hay que tener cuidado porque cuando
pasa de 10 el orden no funciona
*/
