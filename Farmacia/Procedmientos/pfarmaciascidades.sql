create or replace procedure pfarmaciascidades() language plpgsql as $$

declare
r varchar=E'\n';
v record;
cnomc varchar;

begin
for v in select * from farmacias loop
    select nomc into cnomc from cidades where codc=v.codc;
    r=r||'Farmacia '||v.nomf||' se encuentra en la ciudad de '||cnomc||E'\n';
end loop;

raise notice '%',r;
end; $$

/*  call pfarmaciascidades()
procedimiento que liste los nombres de todas las farmacias y los nombre de las ciudades doonde se encuentran
*/
