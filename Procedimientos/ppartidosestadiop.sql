/*
Desenvolver un procedimiento llamado ppartidosestadiop tal que pasandole el 
codigo de un estadio (exemplo 'es1') me devuelve el codigo, nombre y fecha 
de los partidos que se jugaron en ese estadio
*/

create or replace procedure ppartidosestadiop(v varchar) language plpgsql as $$

declare
c record; --record: guarda registros
r varchar='';
begin
for c in select codpar,nompar,data from partido where codest=v loop
  r=r|| 'codigo partido '||c.codpar ||', nome ' ||c.nompar||' , data '||c.data||E'\n'; 
end loop;
raise notice '%',r;
 
end; $$



