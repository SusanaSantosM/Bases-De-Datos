/*procedimiento chamado pcolpartidos que amose para cada colexiado (codigo e nome ) o nome e as
datas dos partidos nos que interven. tamen amosar o total de partidos en que interven cda
colexiado , si non interven en nungun partido amosar a mensaxe -colexiado sen partidos arbitrados-
*/
create or replace procedure pcolpartidos() language plpgsql as $$

declare
r varchar= E'\n';
c record;
i record;
vnompar varchar;
vdata varchar;
conpar integer;

begin
for c in select codc,nomc from colexiado loop
r=r||c.codc||' ,'||c.nomc||E'\n';

conpar=0; --este es el contador de los partidos x eso va antes del bucle de partidos
 for i in select codpar from interven where codc=c.codc loop
 conpar=conpar+1;
    select nompar,data into vnompar,vdata from partido where codpar=i.codpar;
    r=r||E'\t'||vnompar||' , '||vdata||E'\n';
 end loop;
 
 if conpar=0 then
  r=r||E'\t'||'colexiado sen partidos'||E'\n';
 else
  r=r||E'\t'||'total: '||conpar||E'\n';
 end if;
 
end loop;
raise notice '%',r;

end; $$


/*
paso1,2,3
for c in select codc,nomc from colexiado loop
r=r||c.codc||' ,'||c.nomc||E'\n';
 for i in select codpar from interven where codc=c.codc loop
    select nompar,data into vnompar,vdata from partido where codpar=i.codpar;
    r=r||E'\t'||vnompar||' , '||vdata||E'\n';
 end loop;
end loop;
*/
