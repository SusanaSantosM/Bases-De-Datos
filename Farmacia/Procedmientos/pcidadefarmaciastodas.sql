create or replace procedure pcidadesfarmaciastodas() language plpgsql as $$

declare
r varchar=E'\n';
c record;
f record;

begin
for c in select * from cidades loop
r=r||E'\n'||'La ciudad '||c.nomc||' tiene:'||E'\n';
    for f in select * from farmacias where codc=c.codc loop
    r=r||'Farmacia '||f.nomf||E'\n';
    end loop;
end loop;
    
raise notice '%',r;
end; $$

/*  call pcidadesfarmaciastodas();
procedimiento que liste el nombre de todas las ciudades y para cada un de ellas, los nombres de todas las farmacia que se encuentran en la ciudad.
*/
