/*
Crear un procedimientos plistacolparp que liste codigo y nombre de todos los colegiados 
y para cada uno de ellos, codigo, nombre y fecha de los partidos en los que intervienen
y el total de lo mismos.
Si algun estadio no interviene en ningun partido imprimir un mensaje 'este colegiado no
intervino en ningun partido'.
*/
create or replace procedure plistacolparp() language plpgsql as $$

declare
r varchar='';
c record;
s record;
i record;
v integer; --contador de partidos de colegiados
a integer; --contador de partidos en total
vnompar varchar;
vdata date;
begin
a=0;
 for c in select * from colexiado loop
  r=r|| 'codigo de colexiado '||c.codc ||' y nome ' ||c.nomc||E'\n';
  v=0;
  for i in select codpar from interven where codc=c.codc loop
   v=v+1;
   --r=r||E'\t'|| 'codigo'||i.codc ||', nome ' ||i.codpar||E'\n';
   select nompar,data into vnompar,vdata from partido where codpar=i.codpar;
    r=r||E'\t'|| 'partido '||i.codpar ||', nome ' ||vnompar||' ,data ' ||vdata||E'\n';
    
  end loop;
a=a+v;
 
   if v=0 then
    r=r|| ' colexiado sen partido '||E'\n';
    else
    r=r|| ' partidos en los que intervino el colexiado '||v||E'\n';
  
   end if;
  end loop;

r=r|| 'total de partidos' ||a;
raise notice '%',r;

end; $$



--aqui trabajamos con 3 tablas: colexiado,interven,partido.

















