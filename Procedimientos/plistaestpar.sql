/*
crear procedimiento plistaestpar que liste codigo e nome de todos os estadios 
e para cada un deles, codigo nome e data dos partidos que se celebren neles e o 
total dos mesmos.
se en algun estadio non se celebroou nengun partido imprimir a mensaxe ' neste estadio non se celebrou negun partido'
*/

create or replace procedure plistaestpar() language plpgsql as $$

declare
r varchar='';
c record;
i record;
v integer; 
a integer;
begin
a=0;
 for c in select * from estadio loop
  r=r|| 'equipo '||c.codest ||' ,nome ' ||c.nomest||E'\n';
  v=0;
  for i in select codpar,nompar,data from partido where codest=c.codest loop
   v=v+1;
   r=r||E'\t'|| 'partido '||i.codpar ||', nome ' ||i.nompar||' ,data ' ||i.data||E'\n';
  end loop;
a=a+v;
 
   if v=0 then
    r=r|| ' no se celebro partido'||E'\n';
    else
    r=r|| 'total de partidos que se xogaron '||v||E'\n';
   end if;

 end loop;
r=r|| 'total de partidos' ||a;
raise notice '%',r;

end; $$
