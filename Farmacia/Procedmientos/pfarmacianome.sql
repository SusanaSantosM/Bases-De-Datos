create or replace procedure pfarmacianome(vcodf integer) language plpgsql as $$

declare
r varchar=E'\n';
v record; 

begin
for v in select * from farmacias where codf=vcodf loop
    r=r||'Famarcia '||v.nomf||E'\n';
end loop;

raise notice '%',r;
end; $$

/*  call pfarmacianome(1);
procedimiento tal que pasandole el codigo de una farmacia, muestre su nombre
*/
