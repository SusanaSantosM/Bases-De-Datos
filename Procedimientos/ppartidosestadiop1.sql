/*
Desenvolver un procedimiento llamado ppartidosestadiop1 tal que pasandole el 
nombre de un estadio (exemplo 'playero') me devuelve el nombre, codigo y fecha 
de los partidos que se jugaron en ese estadio.
*/

create or replace procedure ppartidosestadiop1(nnomest varchar) language plpgsql as $$

declare
c record; 
r varchar='';
vcodest varchar;
z integer;

begin
select codest into strict vcodest from estadio where nomest=nnomest;
z=0;
 for c in select codpar,nompar,data from partido where codest=vcodest loop
  z=z+1;
  r=r||E'\n'|| 'codigo partido '||c.codpar ||', nome ' ||c.nompar||' , data '||c.data; 
 end loop;
 if z=0 then
 raise notice 'en este estadio no se jugo ningun partido';
 else
 r=r||E'\n'||'numero de partidos en ese estadio: '||z;
 raise notice '%',r;
 end if; 
exception 
when no_data_found then
raise notice 'este estadio no existe';
end; $$

/* --forma de Lucia
if c.codpar is null then 
 raise notice 'en este estadio no se jugaron partidos';
end if;
*/
