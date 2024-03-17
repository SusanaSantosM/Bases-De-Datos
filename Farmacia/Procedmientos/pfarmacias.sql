create or replace procedure pfarmacias() language plpgsql as $$

declare
r varchar=E'\n';
v record;

begin
for v in select * from farmacias loop
    r = r||'farmacia '||v.nomf||E'\n';
end loop;

raise notice '%', r;
end; $$

/*  call pfarmacias() 
Procedimiento que liste los nombres de todas las farmacias y los nombres de las ciudades donde se encuentran
*/
